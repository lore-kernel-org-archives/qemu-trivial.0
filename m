Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkLMv-00073K-DF
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 20:17:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLLp-0006Qx-2M
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLLQ-0007GI-NH
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:15:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEQs-0000kW-T0; Thu, 08 Oct 2015 12:52:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 63CC940A5A;
	Thu,  8 Oct 2015 19:52:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 47D61A85;
	Thu,  8 Oct 2015 19:52:30 +0300 (MSK)
Received: (nullmailer pid 11980 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:11 +0300
Message-Id: <be9c5ddeabb73e9dee2d6922c03ffee4e1f4c8ec.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-trivial@nongnu.org,
	Sai Pavan Boddu <saipava@xilinx.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/19] sdhci: use PRIx64 for uint64_t type
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
X-List-Received-Date: Fri, 09 Oct 2015 00:17:03 -0000

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fix compile time warnings, because of type mismatch for unsigned long
long type.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sd/sdhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 65304cf..436448c 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -22,6 +22,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <inttypes.h>
 #include "hw/hw.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
@@ -719,7 +720,8 @@ static void sdhci_do_adma(SDHCIState *s)
             break;
         case SDHC_ADMA_ATTR_ACT_LINK:   /* link to next descriptor table */
             s->admasysaddr = dscr.addr;
-            DPRINT_L1("ADMA link: admasysaddr=0x%lx\n", s->admasysaddr);
+            DPRINT_L1("ADMA link: admasysaddr=0x%" PRIx64 "\n",
+                      s->admasysaddr);
             break;
         default:
             s->admasysaddr += dscr.incr;
@@ -727,7 +729,8 @@ static void sdhci_do_adma(SDHCIState *s)
         }
 
         if (dscr.attr & SDHC_ADMA_ATTR_INT) {
-            DPRINT_L1("ADMA interrupt: admasysaddr=0x%lx\n", s->admasysaddr);
+            DPRINT_L1("ADMA interrupt: admasysaddr=0x%" PRIx64 "\n",
+                      s->admasysaddr);
             if (s->norintstsen & SDHC_NISEN_DMA) {
                 s->norintsts |= SDHC_NIS_DMA;
             }
-- 
2.1.4


