Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBeoo-0008Py-8b
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2019 08:16:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hBeol-0008PV-0u
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hBeok-0001ES-2b
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:16:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hBeoh-0001AQ-Li; Wed, 03 Apr 2019 08:16:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71737307D984;
	Wed,  3 Apr 2019 12:16:30 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.182])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B09D6014E;
	Wed,  3 Apr 2019 12:16:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed,  3 Apr 2019 14:16:20 +0200
Message-Id: <20190403121620.5228-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 03 Apr 2019 12:16:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] sockets: Fix stringop-truncation warning
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
X-List-Received-Date: Wed, 03 Apr 2019 12:16:37 -0000

Compiling with clang-8 fails with:

    CC      util/qemu-sockets.o
  util/qemu-sockets.c: In function 'unix_connect_saddr':
  util/qemu-sockets.c:925:5: error: 'strncpy' specified bound 108 equals =
destination size [-Werror=3Dstringop-truncation]
       strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  util/qemu-sockets.c: In function 'unix_listen_saddr':
  util/qemu-sockets.c:880:5: error: 'strncpy' specified bound 108 equals =
destination size [-Werror=3Dstringop-truncation]
       strncpy(un.sun_path, path, sizeof(un.sun_path));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Per the unix socket manpage:

  UNIX(7)

  Pathname sockets
  When binding a socket to a pathname, a few rules should be observed for=
 maximum portability and ease of coding:
  *  The pathname in sun_path should be null-terminated.
  *  The length of the pathname, including the terminating null byte, sho=
uld not exceed the size of sun_path.

Reduce the length of the unix socket path by 1 to hold the NUL byte.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/qemu-sockets.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 97050516900..935271d58c0 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -845,10 +845,10 @@ static int unix_listen_saddr(UnixSocketAddress *sad=
dr,
         path =3D pathbuf =3D g_strdup_printf("%s/qemu-socket-XXXXXX", tm=
pdir);
     }
=20
-    if (strlen(path) > sizeof(un.sun_path)) {
+    if (strlen(path) > sizeof(un.sun_path) - 1) {
         error_setg(errp, "UNIX socket path '%s' is too long", path);
         error_append_hint(errp, "Path must be less than %zu bytes\n",
-                          sizeof(un.sun_path));
+                          sizeof(un.sun_path) - 1);
         goto err;
     }
=20
@@ -877,7 +877,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr=
,
=20
     memset(&un, 0, sizeof(un));
     un.sun_family =3D AF_UNIX;
-    strncpy(un.sun_path, path, sizeof(un.sun_path));
+    strncpy(un.sun_path, path, sizeof(un.sun_path) - 1);
=20
     if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
         error_setg_errno(errp, errno, "Failed to bind socket to %s", pat=
h);
@@ -913,16 +913,16 @@ static int unix_connect_saddr(UnixSocketAddress *sa=
ddr, Error **errp)
         return -1;
     }
=20
-    if (strlen(saddr->path) > sizeof(un.sun_path)) {
+    if (strlen(saddr->path) > sizeof(un.sun_path) - 1) {
         error_setg(errp, "UNIX socket path '%s' is too long", saddr->pat=
h);
         error_append_hint(errp, "Path must be less than %zu bytes\n",
-                          sizeof(un.sun_path));
+                          sizeof(un.sun_path) - 1);
         goto err;
     }
=20
     memset(&un, 0, sizeof(un));
     un.sun_family =3D AF_UNIX;
-    strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
+    strncpy(un.sun_path, saddr->path, sizeof(un.sun_path) - 1);
=20
     /* connect to peer */
     do {
--=20
2.20.1


