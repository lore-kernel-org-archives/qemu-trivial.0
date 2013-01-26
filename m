Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzDFA-0002er-Ms
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 16:24:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzDF8-0002eD-W5
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzDF7-0001XO-W2
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:24:54 -0500
Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:21486
	helo=co9outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1TzDF7-0001XB-NO; Sat, 26 Jan 2013 16:24:53 -0500
Received: from mail10-co9-R.bigfish.com (10.236.132.253) by
	CO9EHSOBE038.bigfish.com (10.236.130.101) with Microsoft SMTP Server id
	14.1.225.23; Sat, 26 Jan 2013 20:54:44 +0000
Received: from mail10-co9 (localhost [127.0.0.1])	by mail10-co9-R.bigfish.com
	(Postfix) with ESMTP id ABCE8E0377;
	Sat, 26 Jan 2013 20:54:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h906i1155h)
Received-SPF: pass (mail10-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail10-co9 (localhost.localdomain [127.0.0.1]) by mail10-co9
	(MessageSwitch) id 135923368340811_24135;
	Sat, 26 Jan 2013 20:54:43 +0000 (UTC)
Received: from CO9EHSMHS029.bigfish.com (unknown [10.236.132.231])	by
	mail10-co9.bigfish.com (Postfix) with ESMTP id F1D2C40265;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS029.bigfish.com
	(10.236.130.39) with Microsoft SMTP Server id 14.1.225.23;
	Sat, 26 Jan 2013 20:54:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1TzClu-0004vi-Jr; Sat, 26 Jan 2013
	12:54:42 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 26 Jan 2013 12:54:34 -0800
X-Mailer: git-send-email 1.7.12.1.396.g16eed7c
In-Reply-To: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
References: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <16b0ea75-d82f-454c-9f4e-66d1c9261621@CO9EHSMHS029.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.163.25
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH 2/4] cadence_gem: Debug mode compile fixes
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
X-List-Received-Date: Sat, 26 Jan 2013 21:24:56 -0000

Some printfs are throwing warnings when debug mode is enabled. Fixed.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/cadence_gem.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/cadence_gem.c b/hw/cadence_gem.c
index 0d83442..b77423d 100644
--- a/hw/cadence_gem.c
+++ b/hw/cadence_gem.c
@@ -687,14 +687,15 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
     packet_desc_addr = s->rx_desc_addr;
     while (1) {
-        DB_PRINT("read descriptor 0x%x\n", packet_desc_addr);
+        DB_PRINT("read descriptor 0x%x\n", (unsigned)packet_desc_addr);
         /* read current descriptor */
         cpu_physical_memory_read(packet_desc_addr,
                                  (uint8_t *)&desc[0], sizeof(desc));
 
         /* Descriptor owned by software ? */
         if (rx_desc_get_ownership(desc) == 1) {
-            DB_PRINT("descriptor 0x%x owned by sw.\n", packet_desc_addr);
+            DB_PRINT("descriptor 0x%x owned by sw.\n",
+                     (unsigned)packet_desc_addr);
             s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
             /* Handle interrupt consequences */
             gem_update_int_status(s);
@@ -709,7 +710,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
          */
         if (rx_desc_get_buffer(desc) == 0) {
             DB_PRINT("Invalid RX buffer (NULL) for descriptor 0x%x\n",
-                       packet_desc_addr);
+                     (unsigned)packet_desc_addr);
             break;
         }
 
@@ -749,7 +750,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         s->rx_desc_addr += 8;
     }
 
-    DB_PRINT("set SOF, OWN on descriptor 0x%08x\n", packet_desc_addr);
+    DB_PRINT("set SOF, OWN on descriptor 0x%08x\n", (unsigned)packet_desc_addr);
 
     /* Count it */
     gem_receive_updatestats(s, buf, size);
@@ -861,7 +862,8 @@ static void gem_transmit(GemState *s)
          */
         if ((tx_desc_get_buffer(desc) == 0) ||
             (tx_desc_get_length(desc) == 0)) {
-            DB_PRINT("Invalid TX descriptor @ 0x%x\n", packet_desc_addr);
+            DB_PRINT("Invalid TX descriptor @ 0x%x\n",
+                     (unsigned)packet_desc_addr);
             break;
         }
 
@@ -1031,10 +1033,11 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     offset >>= 2;
     retval = s->regs[offset];
 
-    DB_PRINT("offset: 0x%04x read: 0x%08x\n", offset*4, retval);
+    DB_PRINT("offset: 0x%04x read: 0x%08x\n", (unsigned)offset*4, retval);
 
     switch (offset) {
     case GEM_ISR:
+        DB_PRINT("lowering irq on ISR read\n");
         qemu_set_irq(s->irq, 0);
         break;
     case GEM_PHYMNTNC:
@@ -1073,7 +1076,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
     GemState *s = (GemState *)opaque;
     uint32_t readonly;
 
-    DB_PRINT("offset: 0x%04x write: 0x%08x ", offset, (unsigned)val);
+    DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
     offset >>= 2;
 
     /* Squash bits which are read only in write value */
-- 
1.7.12.1.396.g16eed7c



