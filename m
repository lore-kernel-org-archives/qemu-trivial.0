Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHtUx-0001UL-Io
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 09:56:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>) id 1bHqP0-0008Rb-P2
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 06:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>) id 1bHqOy-0000Gr-PQ
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 06:37:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tgolembi@redhat.com>)
	id 1bHqOm-0000Bv-P0; Tue, 28 Jun 2016 06:37:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 772E9C05B1EF;
	Tue, 28 Jun 2016 10:37:43 +0000 (UTC)
Received: from fiorina (dhcp131-20.brq.redhat.com [10.34.131.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5SAbfHd004917
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 28 Jun 2016 06:37:42 -0400
Date: Tue, 28 Jun 2016 12:37:34 +0200
From: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160628123734.500a3114@fiorina>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 Jun 2016 10:37:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 28 Jun 2016 09:56:18 -0400
Subject: [Qemu-trivial] [PATCH] curl: Operate on zero-length file
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
X-List-Received-Date: Tue, 28 Jun 2016 10:38:02 -0000

This is an attempt to fix small bug 1596870.

When creating new disk backed by remote file accessed via HTTPS and the
backing file has zero length, qemu-img terminates with uniformative
error message:

    qemu-img: disk.qcow2: CURL: Error opening file:

While it may not make much sense to operate on empty file, other block
backends (e.g. raw backend for regular files) seem to allow it. This
patch fixes it for the curl backend.

Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
---
 block/curl.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index da9f5e8..ee6c5ea 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -675,11 +675,17 @@ static int curl_open(BlockDriverState *bs, QDict *opt=
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
+    if (d < 0) {
+        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
+                "Received invalid file length.");
+        goto out;
+    }
+
+    s->len =3D (size_t)d;
+
     if ((!strncasecmp(s->url, "http://", strlen("http://"))
         || !strncasecmp(s->url, "https://", strlen("https://")))
         && !s->accept_range) {
--=20
2.9.0


