Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOkZ-0002Kf-UA
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkS-00027a-Uq
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkN-0003hW-Po
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkE-0003fB-JE; Tue, 10 Jun 2014 12:17:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7FAEF412A5;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D73F7672;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13298 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:22 +0400
Message-Id: <1402416523-13212-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/25] net: cadence_gem: Remove &desc[0] usages
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:14 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Just use desc instead.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index fe40b4e..de26609 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -883,7 +883,7 @@ static void gem_transmit(GemState *s)
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
-                             (uint8_t *)&desc[0], sizeof(desc));
+                             (uint8_t *)desc, sizeof(desc));
     /* Handle all descriptors owned by hardware */
     while (tx_desc_get_used(desc) == 0) {
 
@@ -966,7 +966,7 @@ static void gem_transmit(GemState *s)
         }
         DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
         cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)&desc[0], sizeof(desc));
+                                 (uint8_t *)desc, sizeof(desc));
     }
 
     if (tx_desc_get_used(desc)) {
-- 
1.7.10.4


