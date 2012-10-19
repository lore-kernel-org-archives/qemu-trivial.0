Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TPDU2-0001Vv-HI
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 10:23:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TPDU0-0001OK-74
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 10:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TPDTw-0005nI-BR
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 10:23:28 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:46758
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TPDTf-0005io-LY; Fri, 19 Oct 2012 10:23:07 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TPDTd-0006nt-VT; Fri, 19 Oct 2012 15:23:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Oct 2012 15:23:05 +0100
Message-Id: <1350656585-26130-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-arm: Remove out of date FIXME
	regarding saturating arithmetic
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
X-List-Received-Date: Fri, 19 Oct 2012 14:23:29 -0000

Remove an out of date FIXME regarding the saturating arithmetic helpers:
we now do pass a pointer to CPUARMState to these helpers, and since
the AREG0 changes went in there is no difference between helper.c
and op_helper.c and therefore no point in moving the functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index aef592a..6e3ab90 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -93,8 +93,6 @@ void tlb_fill(CPUARMState *env, target_ulong addr, int is_write, int mmu_idx,
 }
 #endif
 
-/* FIXME: Pass an explicit pointer to QF to CPUARMState, and move saturating
-   instructions into helper.c  */
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
-- 
1.7.9.5


