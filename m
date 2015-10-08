Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkdcu-0003rN-V1
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:46:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkF4F-0004Uz-6r
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkF3e-0000Hv-Pb
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:33:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkF2k-0007G3-Ns; Thu, 08 Oct 2015 13:31:50 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4C4D340A61;
	Thu,  8 Oct 2015 20:31:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1B9EBA88;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 11984 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:13 +0300
Message-Id: <dc1442204a2235b1ad0c4bdceb3580c97f71f1b5.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [Qemu-trivial] [PULL 04/19] imx_serial: Generate interrupt on tx
	empty if enabled
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
X-List-Received-Date: Thu, 08 Oct 2015 17:35:23 -0000

From: Guenter Roeck <linux@roeck-us.net>

Generate an interrupt if the tx buffer is empty and the tx empty interrupt
is enabled. This fixes a problem seen when running a Linux image since
Linux commit 55c3cb1358e ("serial: imx: remove unneeded imx_transmit_buffer()
from imx_start_tx()"). Linux now waits for the tx empty interrupt before
starting to send data, causing transmit stalls until there is an interrupt
for another reason.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/imx_serial.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index e8f32c4..f0c4c72 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -66,7 +66,9 @@ static void imx_update(IMXSerialState *s)
     uint32_t flags;
 
     flags = (s->usr1 & s->ucr1) & (USR1_TRDY|USR1_RRDY);
-    if (!(s->ucr1 & UCR1_TXMPTYEN)) {
+    if (s->ucr1 & UCR1_TXMPTYEN) {
+        flags |= (s->uts1 & UTS1_TXEMPTY);
+    } else {
         flags &= ~USR1_TRDY;
     }
 
-- 
2.1.4


