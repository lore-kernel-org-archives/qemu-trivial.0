Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJp7-0001Te-Gw
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:50:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJp4-0001R3-4y
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJp3-0001Fd-8B
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:50:26 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJp1-0001EF-6U; Sat, 07 Jun 2014 12:50:23 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJp0-0003a0-Jc; Sat, 07 Jun 2014 17:50:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:50:22 +0100
Message-Id: <1402159822-13735-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/intc/openpic: Remove unused function
	IRQ_testbit()
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
X-List-Received-Date: Sat, 07 Jun 2014 16:50:27 -0000

The IRQ_testbit() function is never used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/openpic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 17136c9..08e0e19 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -311,11 +311,6 @@ static inline void IRQ_resetbit(IRQQueue *q, int n_IRQ)
     clear_bit(n_IRQ, q->queue);
 }
 
-static inline int IRQ_testbit(IRQQueue *q, int n_IRQ)
-{
-    return test_bit(n_IRQ, q->queue);
-}
-
 static void IRQ_check(OpenPICState *opp, IRQQueue *q)
 {
     int irq = -1;
-- 
1.8.5.4


