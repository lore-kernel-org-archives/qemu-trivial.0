Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPZyI-0005oJ-R3
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:01:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy6-0005M9-Is
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WPZy4-0007kS-RF
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:00:50 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZy0-0007gB-VT; Mon, 17 Mar 2014 12:00:45 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WPZxx-0004wP-JM; Mon, 17 Mar 2014 16:00:41 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Mar 2014 16:00:39 +0000
Message-Id: <1395072041-18911-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
References: <1395072041-18911-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2 10/12] hw/intc/slavio_intctl: Avoid
	shifting left into sign bit
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
X-List-Received-Date: Mon, 17 Mar 2014 16:00:52 -0000

Add 'U' suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/slavio_intctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/slavio_intctl.c b/hw/intc/slavio_intctl.c
index 41a1672..b10fb66 100644
--- a/hw/intc/slavio_intctl.c
+++ b/hw/intc/slavio_intctl.c
@@ -272,7 +272,7 @@ static void slavio_check_interrupts(SLAVIO_INTCTLState *s, int set_irqs)
             CPU_IRQ_TIMER_IN;
         if (i == s->target_cpu) {
             for (j = 0; j < 32; j++) {
-                if ((s->intregm_pending & (1 << j)) && intbit_to_level[j]) {
+                if ((s->intregm_pending & (1U << j)) && intbit_to_level[j]) {
                     s->slaves[i].intreg_pending |= 1 << intbit_to_level[j];
                 }
             }
-- 
1.9.0


