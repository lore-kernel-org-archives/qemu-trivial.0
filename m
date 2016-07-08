Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLTnk-00006p-86
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jul 2016 07:18:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>) id 1bLTng-000053-Eb
	for qemu-trivial@nongnu.org; Fri, 08 Jul 2016 07:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>) id 1bLTnf-0005il-C8
	for qemu-trivial@nongnu.org; Fri, 08 Jul 2016 07:18:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>)
	id 1bLTnW-0005ep-RU; Fri, 08 Jul 2016 07:18:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F14D8C04B306;
	Fri,  8 Jul 2016 11:18:17 +0000 (UTC)
Received: from fiorina (dhcp131-20.brq.redhat.com [10.34.131.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u68BIGNk022218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 8 Jul 2016 07:18:17 -0400
Date: Fri, 8 Jul 2016 13:18:09 +0200
From: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20160708131809.07a8e7dc@fiorina>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 08 Jul 2016 11:18:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] curl: Operate on zero-length file
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
X-List-Received-Date: Fri, 08 Jul 2016 11:18:31 -0000

Another attempt to fix the bug 1596870.

When creating new disk backed by remote file accessed via HTTPS and the
backing file has zero length, qemu-img terminates with uniformative
error message:

    qemu-img: disk.qcow2: CURL: Error opening file:

While it may not make much sense to operate on empty file, other block
backends (e.g. raw backend for regular files) seem to allow it. This
patch fixes it for the curl backend and improves the reported error.

Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
---
 block/curl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index da9f5e8..a8cdb44 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -675,11 +675,28 @@ static int curl_open(BlockDriverState *bs, QDict *opt=
ions, int flags,
     curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
     if (curl_easy_perform(state->curl))
         goto out;
-    curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d);
-    if (d)
-        s->len =3D (size_t)d;
-    else if(!s->len)
+    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &=
d)) {
         goto out;
+    }
+    /* Prior CURL 7.19.4 return value of 0 could mean that the file size i=
s not
+     * know or the size is zero. From 7.19.4 CURL returns -1 if size is not
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
2.9.0


--=20
Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>

