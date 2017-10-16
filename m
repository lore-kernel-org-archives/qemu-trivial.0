Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C5F-000101-LX
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C59-0000rK-C8
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C58-00021I-Jg
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4C53-0001w0-R0; Mon, 16 Oct 2017 16:33:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DF57540D2B;
	Mon, 16 Oct 2017 23:33:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F0E31B0F;
	Mon, 16 Oct 2017 23:33:42 +0300 (MSK)
Received: (nullmailer pid 12313 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:29 +0300
Message-Id: <2de123a1ecbc3d364a808a5c2de1301a2c43338c.1508185933.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 02/14] linux-user: remove duplicate break in
 syscall
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
X-List-Received-Date: Mon, 16 Oct 2017 20:33:52 -0000

From: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>

likely introduced in 3532fa7402cda16f7b95261b0339c58630051f0b

Signed-off-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9b6364a266..3ef4d1c568 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3131,7 +3131,6 @@ set_timeout:
         case TARGET_SO_RCVLOWAT:
 		optname =3D SO_RCVLOWAT;
 		break;
-            break;
         default:
             goto unimplemented;
         }
--=20
2.11.0


