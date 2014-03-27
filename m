Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCNu-0000Y1-Is
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:38:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNo-0000Mx-Vu
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNk-0006JB-Lg
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCNX-0006G5-F5; Thu, 27 Mar 2014 11:38:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5318543728;
	Thu, 27 Mar 2014 19:38:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5B31B687;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1815 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:25 +0400
Message-Id: <1395934108-1694-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/23] hw/intc/xilinx_intc: Avoid shifting
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
X-List-Received-Date: Thu, 27 Mar 2014 15:38:25 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Avoid undefined behaviour shifting left into the sign bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/intc/xilinx_intc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 4a10398..1b228ff 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -71,8 +71,9 @@ static void update_irq(struct xlx_pic *p)
 
     /* Update the vector register.  */
     for (i = 0; i < 32; i++) {
-        if (p->regs[R_IPR] & (1 << i))
+        if (p->regs[R_IPR] & (1U << i)) {
             break;
+        }
     }
     if (i == 32)
         i = ~0;
-- 
1.7.10.4


