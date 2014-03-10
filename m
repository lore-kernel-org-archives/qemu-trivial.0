Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bb-0005O7-75
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bR-000551-9H
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bQ-0003Qp-Km
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:09 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b9-0003JG-S3; Mon, 10 Mar 2014 15:10:52 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002Td-Fx; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:47 +0000
Message-Id: <1394478649-9453-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 11/12] hw/intc/xilinx_intc: Avoid shifting
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
X-List-Received-Date: Mon, 10 Mar 2014 19:11:10 -0000

Avoid undefined behaviour shifting left into the sign bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/xilinx_intc.c | 3 ++-
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
1.9.0


