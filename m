Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuObq-0002Q9-27
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:09:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObj-0002DA-DQ
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObe-00086g-VY
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuObR-0007jH-Jl; Tue, 10 Jun 2014 12:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8783C412A5;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6670A66A;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13294 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:20 +0400
Message-Id: <1402416523-13212-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/25] net: cadence_gem: Add Tx descriptor
	fetch printf
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
X-List-Received-Date: Tue, 10 Jun 2014 16:09:12 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Add a debug printf for TX descriptor fetching. This is helpful to anyone
needing to debug TX ring buffer traversal. It is also now consistent with
the RX code which has a similar printf.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 5335db8..cfb696a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -880,6 +880,8 @@ static void gem_transmit(GemState *s)
 
     /* read current descriptor */
     packet_desc_addr = s->tx_desc_addr;
+
+    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
                              (uint8_t *)&desc[0], sizeof(desc));
     /* Handle all descriptors owned by hardware */
@@ -962,6 +964,7 @@ static void gem_transmit(GemState *s)
         } else {
             packet_desc_addr += 8;
         }
+        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         cpu_physical_memory_read(packet_desc_addr,
                                  (uint8_t *)&desc[0], sizeof(desc));
     }
-- 
1.7.10.4


