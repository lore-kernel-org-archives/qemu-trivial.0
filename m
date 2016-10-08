Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnav-0008Ff-Rl
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008Ak-Lm
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-00042Z-JT
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnak-0003ti-S9; Sat, 08 Oct 2016 05:06:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3493D40ED6;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5E71FB38;
	Sat,  8 Oct 2016 11:58:16 +0300 (MSK)
Received: (nullmailer pid 19260 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Greg Ungerer <gerg@uclinux.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:05 +0300
Message-Id: <cbf061bd1fdb5017bfadde2164bdd6183d53a43d.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/26] m68k: change default system clock for
 m5208evb
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
X-List-Received-Date: Sat, 08 Oct 2016 09:07:00 -0000

From: Greg Ungerer <gerg@uclinux.org>

The shipping default setting for the Freescale M5208EVB board is to run
the CPU at 166.67MHz. The current qemu emulation code for this board is
defaulting to 66MHz. This results in time appearing to run way to slowly.
So a "sleep 5" in a standard ColdFire Linux build takes almost 15
seconds in real time to actually complete.

Change the hard coded default to match the default hardware setting.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/m68k/mcf5208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 9240ebf..3438314 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -21,7 +21,7 @@
 #include "elf.h"
 #include "exec/address-spaces.h"
 
-#define SYS_FREQ 66000000
+#define SYS_FREQ 166666666
 
 #define PCSR_EN         0x0001
 #define PCSR_RLD        0x0002
-- 
2.1.4


