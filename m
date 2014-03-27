Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTDTi-00083j-TD
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 12:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTc-0007t9-3D
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTDTW-0006aO-Ua
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 12:48:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTDTH-0006TP-Hy; Thu, 27 Mar 2014 12:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 377FC4373D;
	Thu, 27 Mar 2014 20:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 26D3B691;
	Thu, 27 Mar 2014 19:28:36 +0400 (MSK)
Received: (nullmailer pid 1812 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:24 +0400
Message-Id: <1395934108-1694-20-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/23] hw/intc/slavio_intctl: Avoid shifting
	left into sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 16:48:28 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add 'U' suffix to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/slavio_intctl.c |    2 +-
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
1.7.10.4


