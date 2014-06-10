Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuI-0007VE-0R
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOuA-0007HC-7e
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu5-0007bD-OM
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtt-0007XR-Nz; Tue, 10 Jun 2014 12:27:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32985412C8;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 02A06674;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13292 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:19 +0400
Message-Id: <1402416523-13212-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/25] net: cadence_gem: Fix Tx descriptor
	update
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:14 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

The local variable "desc" was being used to read-modify-write the
first descriptor (of a multi-desc packet) upon packet completion.
desc however continues to be used by the code as the current
descriptor. Give this first desc RMW it's own local variable to
avoid trampling.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index a26861e..5335db8 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -911,14 +911,16 @@ static void gem_transmit(GemState *s)
 
         /* Last descriptor for this packet; hand the whole thing off */
         if (tx_desc_get_last(desc)) {
+            unsigned    desc_first[2];
+
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr,
-                                     (uint8_t *)&desc[0], sizeof(desc));
-            tx_desc_set_used(desc);
-            cpu_physical_memory_write(s->tx_desc_addr,
-                                      (uint8_t *)&desc[0], sizeof(desc));
+            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+                                     sizeof(desc_first));
+            tx_desc_set_used(desc_first);
+            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+                                      sizeof(desc_first));
             /* Advance the hardare current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
                 s->tx_desc_addr = s->regs[GEM_TXQBASE];
-- 
1.7.10.4


