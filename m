Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQJHe-0008Gl-Ke
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 11:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJHX-00087A-VE
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJHT-00058q-3N
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:51:39 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38885
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJHI-0004uL-Jd; Sun, 29 Sep 2013 11:51:24 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 5E5B3180651; Sun, 29 Sep 2013 17:51:21 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 29 Sep 2013 17:51:20 +0200
Message-Id: <1380469880-19448-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] hw/alpha: Fix compiler warning (integer
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
X-List-Received-Date: Sun, 29 Sep 2013 15:51:45 -0000

From buildbot default_i386_rhel61:

  CC    alpha-softmmu/hw/alpha/typhoon.o
hw/alpha/typhoon.c: In function 'typhoon_translate_iommu':
hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type
hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I used lower case 'ull' because the rest of the code writes it that way
although I personally prefer 0xfffffffffffULL to 0xfffffffffffull.

Stefan

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


