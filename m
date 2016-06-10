Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBP0y-0001wq-Qz
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 12:10:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bBP0w-0001u3-1t
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 12:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bBP0v-0003JV-5h
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 12:10:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bBP0o-0003I5-UO; Fri, 10 Jun 2016 12:10:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bBP0o-0002ED-Am; Fri, 10 Jun 2016 17:10:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Aurelien Jarno <aurelien@aurel32.net>
Date: Fri, 10 Jun 2016 17:10:21 +0100
Message-Id: <1465575021-3774-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] hw/sh4/sh_pci.c: Use ldl_le_p() and
 stl_le_p()
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
X-List-Received-Date: Fri, 10 Jun 2016 16:10:31 -0000

Use ldl_le_p() and stl_le_p() instead of le32_to_cpup() and
cpu_to_le32w(); the former handle misaligned addresses and don't
need casts, and the latter are deprecated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sh4/sh_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index e820a32..1747628 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -55,7 +55,7 @@ static void sh_pci_reg_write (void *p, hwaddr addr, uint64_t val,
 
     switch(addr) {
     case 0 ... 0xfc:
-        cpu_to_le32w((uint32_t*)(pcic->dev->config + addr), val);
+        stl_le_p(pcic->dev->config + addr, val);
         break;
     case 0x1c0:
         pcic->par = val;
@@ -85,7 +85,7 @@ static uint64_t sh_pci_reg_read (void *p, hwaddr addr,
 
     switch(addr) {
     case 0 ... 0xfc:
-        return le32_to_cpup((uint32_t*)(pcic->dev->config + addr));
+        return ldl_le_p(pcic->dev->config + addr);
     case 0x1c0:
         return pcic->par;
     case 0x1c4:
-- 
1.9.1


