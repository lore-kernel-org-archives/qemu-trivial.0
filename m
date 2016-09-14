Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5BY-0001eI-N4
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:04:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BU-0001b2-VZ
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BS-00063N-Ss
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5BL-0005zX-GB; Wed, 14 Sep 2016 04:04:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A09364183E;
	Wed, 14 Sep 2016 11:04:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5B061AFE;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17347 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:44 +0300
Message-Id: <73e37a96a0485d8f5f2edb4ff86ebae6bd7b8135.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/27] curl: Operate on zero-length file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:04:47 -0000

From: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>

Another attempt to fix the bug 1596870.

When creating new disk backed by remote file accessed via HTTPS and the
backing file has zero length, qemu-img terminates with uniformative
error message:

    qemu-img: disk.qcow2: CURL: Error opening file:

While it may not make much sense to operate on empty file, other block
backends (e.g. raw backend for regular files) seem to allow it. This
patch fixes it for the curl backend and improves the reported error.

Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/curl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 426fb4d..571f24c 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -675,11 +675,28 @@ static int curl_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
     curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
     if (curl_easy_perform(state->curl))
         goto out;
-    curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)=
;
-    if (d)
-        s->len =3D (size_t)d;
-    else if(!s->len)
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD,=
 &d)) {
         goto out;
+    }
+    /* Prior CURL 7.19.4 return value of 0 could mean that the file size=
 is not
+     * know or the size is zero. From 7.19.4 CURL returns -1 if size is =
not
+     * known and zero if it is realy zero-length file. */
+#if LIBCURL_VERSION_NUM >=3D 0x071304
+    if (d < 0) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "Server didn't report file size.");
+        goto out;
+    }
+#else
+    if (d <=3D 0) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "Unknown file size or zero-length file.");
+        goto out;
+    }
+#endif
+
+    s->len =3D (size_t)d;
+
     if ((!strncasecmp(s->url, "http://", strlen("http://"))
         || !strncasecmp(s->url, "https://", strlen("https://")))
         && !s->accept_range) {
--=20
2.1.4


