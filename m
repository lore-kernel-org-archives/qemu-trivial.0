Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkxv-0006uW-Kv
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:49:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxp-0006gZ-Cw
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxk-0006TE-PF
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkxa-0006PU-6U; Sun, 06 Oct 2013 05:49:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 59DFE40D04;
	Sun,  6 Oct 2013 13:49:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 15AED50F;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25813 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:52 +0400
Message-Id: <1381051979-25742-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/14] hw/alpha: Fix compiler warning (integer
	constant is too large)
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
X-List-Received-Date: Sun, 06 Oct 2013 09:49:29 -0000

From: Stefan Weil <sw@weilnetz.de>

From buildbot default_i386_rhel61:

  CC    alpha-softmmu/hw/alpha/typhoon.o
hw/alpha/typhoon.c: In function 'typhoon_translate_iommu':
hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type
hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/alpha/typhoon.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index aac9a32..59e1bb8 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -700,7 +700,7 @@ static IOMMUTLBEntry typhoon_translate_iommu(MemoryRegion *iommu, hwaddr addr)
             }
         }
 
-        if (addr >= 0x80000000000 && addr <= 0xfffffffffff) {
+        if (addr >= 0x80000000000ull && addr <= 0xfffffffffffull) {
             /* Check the fourth window for DAC enable and window enable.  */
             if ((pchip->win[3].wba & 0x80000000001ull) == 0x80000000001ull) {
                 uint64_t pte_addr;
-- 
1.7.10.4


