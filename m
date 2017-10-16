Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C5D-0000xy-Ud
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:33:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C59-0000rI-BL
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C58-00021N-KM
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4C53-0001vx-Qz; Mon, 16 Oct 2017 16:33:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 252EA40D2C;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2A462B31;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: (nullmailer pid 12325 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:35 +0300
Message-Id: <52aa5644e8e89ebfc3b1d0abdb7cc502ce9db599.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/14] io: Add missing GCC_FMT_ATTR (fix
 -Werror=suggest-attribute=format)
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
X-List-Received-Date: Mon, 16 Oct 2017 20:33:53 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a compiler warning:

/qemu/io/channel-websock.c:163:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute
 [-Werror=3Dsuggest-attribute=3Dformat]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 io/channel-websock.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index d1d471f86e..7bf1340958 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -151,9 +151,10 @@ enum {
     QIO_CHANNEL_WEBSOCK_OPCODE_PONG =3D 0xA
 };
=20
-static void qio_channel_websock_handshake_send_res(QIOChannelWebsock *io=
c,
-                                                   const char *resmsg,
-                                                   ...)
+static void GCC_FMT_ATTR(2, 3)
+qio_channel_websock_handshake_send_res(QIOChannelWebsock *ioc,
+                                       const char *resmsg,
+                                       ...)
 {
     va_list vargs;
     char *response;
--=20
2.11.0


