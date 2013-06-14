Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRb0-00058d-5E
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:51:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRas-0004vi-Sn
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRaq-0004Jo-1r
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRak-0004GQ-9A; Fri, 14 Jun 2013 06:50:50 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 632F741664;
	Fri, 14 Jun 2013 14:50:49 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 4389750A; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:21 +0400
Message-Id: <1371207042-17980-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 05/26] intc/xilinx_intc: Use qemu_set_irq
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
X-List-Received-Date: Fri, 14 Jun 2013 10:51:05 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Use qemu_set_irq rather than if-elsing qemu_irq_(lower|raise). No
functional change, just reduces verbosity.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/xilinx_intc.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index b106e72..5df7008 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -66,11 +66,7 @@ static void update_irq(struct xlx_pic *p)
         i = ~0;
 
     p->regs[R_IVR] = i;
-    if ((p->regs[R_MER] & 1) && p->regs[R_IPR]) {
-        qemu_irq_raise(p->parent_irq);
-    } else {
-        qemu_irq_lower(p->parent_irq);
-    }
+    qemu_set_irq(p->parent_irq, (p->regs[R_MER] & 1) && p->regs[R_IPR]);
 }
 
 static uint64_t
-- 
1.7.10.4


