Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEmUH-0006UL-T8
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2012 15:32:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TEmUG-0006OV-0s
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 15:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TEmUD-0007is-OY
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 15:32:35 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TEmU6-0007gm-AX; Thu, 20 Sep 2012 15:32:26 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0EDFA7280032; Thu, 20 Sep 2012 21:32:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PXMAFTypbkJZ; Thu, 20 Sep 2012 21:32:20 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1497F7280033; Thu, 20 Sep 2012 21:32:20 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 20 Sep 2012 21:32:19 +0200
Message-Id: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 20 Sep 2012 19:32:37 -0000

Add a type cast which was removed by commit
213fd5087e2e4e2da10ad266df0ba950cf7618bf again.

Without it, MinGW compilers complain:

net/socket.c:136: warning:
 pointer targets in passing argument 2 of =E2=80=98sendto=E2=80=99 differ=
 in signedness
/usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/includ=
e/winsock2.h:1313: note:
 expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=80=98=
const uint8_t *=E2=80=99

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 net/socket.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/socket.c b/net/socket.c
index 69aad03..833f79f 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -131,7 +131,7 @@ static ssize_t net_socket_receive_dgram(NetClientStat=
e *nc, const uint8_t *buf,
     ssize_t ret;
=20
     do {
-        ret =3D sendto(s->fd, buf, size, 0,
+        ret =3D sendto(s->fd, (const void *)buf, size, 0,
                      (struct sockaddr *)&s->dgram_dst,
                      sizeof(s->dgram_dst));
     } while (ret =3D=3D -1 && errno =3D=3D EINTR);
--=20
1.7.10


