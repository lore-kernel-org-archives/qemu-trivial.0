Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDd-0002Oj-Jv
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDW-0002Aq-M8
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDR-0007Wl-6R
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDG-0007Ts-Va; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E29F412CE;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 471636BB;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13313 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:29 +0400
Message-Id: <1402416523-13212-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/25] hw/intc/openpic: Remove unused function
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:16 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The IRQ_testbit() function is never used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/openpic.c |    5 -----
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
1.7.10.4


