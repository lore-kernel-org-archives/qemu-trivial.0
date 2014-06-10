Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuI-0007W0-Id
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOuB-0007J7-5L
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu6-0007bU-LZ
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtt-0007XM-O3; Tue, 10 Jun 2014 12:27:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 11584412A5;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B2B0F66A;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13296 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:21 +0400
Message-Id: <1402416523-13212-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/25] net: cadence_gem: Comment spelling sweep
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:16 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Fix some typos in comments.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index cfb696a..fe40b4e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -50,7 +50,7 @@
 #define GEM_IER           (0x00000028/4) /* Interrupt Enable reg */
 #define GEM_IDR           (0x0000002C/4) /* Interrupt Disable reg */
 #define GEM_IMR           (0x00000030/4) /* Interrupt Mask reg */
-#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintaince reg */
+#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintenance reg */
 #define GEM_RXPAUSE       (0x00000038/4) /* RX Pause Time reg */
 #define GEM_TXPAUSE       (0x0000003C/4) /* TX Pause Time reg */
 #define GEM_TXPARTIALSF   (0x00000040/4) /* TX Partial Store and Forward */
@@ -150,7 +150,7 @@
 #define GEM_NWCTRL_LOCALLOOP   0x00000002 /* Local Loopback */
 
 #define GEM_NWCFG_STRIP_FCS    0x00020000 /* Strip FCS field */
-#define GEM_NWCFG_LERR_DISC    0x00010000 /* Discard RX frames with lenth err */
+#define GEM_NWCFG_LERR_DISC    0x00010000 /* Discard RX frames with len err */
 #define GEM_NWCFG_BUFF_OFST_M  0x0000C000 /* Receive buffer offset mask */
 #define GEM_NWCFG_BUFF_OFST_S  14         /* Receive buffer offset shift */
 #define GEM_NWCFG_UCAST_HASH   0x00000080 /* accept unicast if hash match */
@@ -397,7 +397,7 @@ static const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
  */
 static void gem_init_register_masks(GemState *s)
 {
-    /* Mask of register bits which are read only*/
+    /* Mask of register bits which are read only */
     memset(&s->regs_ro[0], 0, sizeof(s->regs_ro));
     s->regs_ro[GEM_NWCTRL]   = 0xFFF80000;
     s->regs_ro[GEM_NWSTATUS] = 0xFFFFFFFF;
@@ -719,7 +719,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         unsigned crc_val;
 
         /* The application wants the FCS field, which QEMU does not provide.
-         * We must try and caclculate one.
+         * We must try and calculate one.
          */
 
         memcpy(rxbuf, buf, size);
@@ -871,7 +871,7 @@ static void gem_transmit(GemState *s)
 
     DB_PRINT("\n");
 
-    /* The packet we will hand off to qemu.
+    /* The packet we will hand off to QEMU.
      * Packets scattered across multiple descriptors are gathered to this
      * one contiguous buffer first.
      */
@@ -923,7 +923,7 @@ static void gem_transmit(GemState *s)
             tx_desc_set_used(desc_first);
             cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
                                       sizeof(desc_first));
-            /* Advance the hardare current descriptor past this packet */
+            /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
                 s->tx_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-- 
1.7.10.4


