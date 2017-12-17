Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQilv-0005Iv-9n
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 18:55:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQilt-0005GW-KA
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQils-00060E-Op
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQilm-0005pa-Tb; Sun, 17 Dec 2017 18:54:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 57B4141180;
	Mon, 18 Dec 2017 02:54:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A23ED37;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30920 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:23 +0300
Message-Id: <ebff8f4d7aadd8a6d3e575fa0340056f29afe5b6.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/61] hw/registerfields: add missing include
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
X-List-Received-Date: Sun, 17 Dec 2017 23:55:06 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This allows to use this header in qtests.

This fixes:
    CC      tests/test.o
  include/hw/registerfields.h:32:41: error: implicit declaration of funct=
ion =E2=80=98MAKE_64BIT_MASK=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
              MAKE_64BIT_MASK(shift, length)};
              ^
  include/hw/registerfields.h:39:5: error: implicit declaration of functi=
on =E2=80=98extract64=E2=80=99; [-Werror=3Dimplicit-function-declaration]
       extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,
       ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/registerfields.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f59e7f47bd..44e0b94edf 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -11,6 +11,8 @@
 #ifndef REGISTERFIELDS_H
 #define REGISTERFIELDS_H
=20
+#include <qemu/bitops.h>
+
 /* Define constants for a 32 bit register */
=20
 /* This macro will define A_FOO, for the byte address of a register
--=20
2.11.0


