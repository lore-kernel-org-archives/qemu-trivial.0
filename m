Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFV8z-0007lQ-Gg
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 15:13:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFV8x-0007ek-ER
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 15:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFV8w-0006eU-BT
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 15:13:35 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:50500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TFV8t-0006dG-QN; Sat, 22 Sep 2012 15:13:31 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0D0147280032; Sat, 22 Sep 2012 21:13:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QXJBjyH5P9mo; Sat, 22 Sep 2012 21:13:29 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 72BE17280033; Sat, 22 Sep 2012 21:13:29 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 22 Sep 2012 21:13:28 +0200
Message-Id: <1348341208-23260-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] net/socket: Fix compiler warning (regression
	for MinGW)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 19:13:36 -0000

Commit 213fd5087e2e4e2da10ad266df0ba950cf7618bf removed a type cast
which is needed for MinGW:

net/socket.c:136: warning:
 pointer targets in passing argument 2 of =E2=80=98sendto=E2=80=99 differ=
 in signedness
/usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/includ=
e/winsock2.h:1313: note:
 expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=80=98=
const uint8_t *=E2=80=99

Add a 'qemu_sendto' macro which provides that type cast where needed
and use the new macro instead of 'sendto'.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I hope the modifications are trivial enough to justify that I did not
split this in two patches.
=20
Regards

Stefan W.

 net/socket.c  |    6 +++---
 qemu-common.h |    5 +++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index 69aad03..ce4f980 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -131,9 +131,9 @@ static ssize_t net_socket_receive_dgram(NetClientStat=
e *nc, const uint8_t *buf,
     ssize_t ret;
=20
     do {
-        ret =3D sendto(s->fd, buf, size, 0,
-                     (struct sockaddr *)&s->dgram_dst,
-                     sizeof(s->dgram_dst));
+        ret =3D qemu_sendto(s->fd, buf, size, 0,
+                          (struct sockaddr *)&s->dgram_dst,
+                          sizeof(s->dgram_dst));
     } while (ret =3D=3D -1 && errno =3D=3D EINTR);
=20
     if (ret =3D=3D -1 && errno =3D=3D EAGAIN) {
diff --git a/qemu-common.h b/qemu-common.h
index 2f00c15..4f0ed9e 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -225,9 +225,14 @@ int qemu_pipe(int pipefd[2]);
 #endif
=20
 #ifdef _WIN32
+/* MinGW needs a type cast for the 'buf' argument. */
 #define qemu_recv(sockfd, buf, len, flags) recv(sockfd, (void *)buf, len=
, flags)
+#define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
+    sendto(sockfd, (const void *)buf, len, flags, destaddr, addrlen)
 #else
 #define qemu_recv(sockfd, buf, len, flags) recv(sockfd, buf, len, flags)
+#define qemu_sendto(sockfd, buf, len, flags, destaddr, addrlen) \
+    sendto(sockfd, buf, len, flags, destaddr, addrlen)
 #endif
=20
 /* Error handling.  */
--=20
1.7.10


