Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0qWl-0006Vh-4g
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 10:56:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1e0qWj-0006Uz-Ko
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 10:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1e0qWi-0000BQ-WF
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 10:56:29 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58246
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1e0qWd-000083-4i; Sat, 07 Oct 2017 10:56:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id C5AF2DA7B0B;
	Sat,  7 Oct 2017 16:56:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nBinun8pvRyc; Sat,  7 Oct 2017 16:56:20 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 51E4ADA02FC;
	Sat,  7 Oct 2017 16:56:20 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0148446183E; Sat,  7 Oct 2017 16:56:19 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: "Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Sat,  7 Oct 2017 16:56:09 +0200
Message-Id: <20171007145609.16722-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] io: Add missing GCC_FMT_ATTR (fix
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
X-List-Received-Date: Sat, 07 Oct 2017 14:56:30 -0000

This fixes a compiler warning:

/qemu/io/channel-websock.c:163:5: error:
 function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 fo=
rmat attribute
 [-Werror=3Dsuggest-attribute=3Dformat]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


