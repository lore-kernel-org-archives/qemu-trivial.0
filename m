Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnMnY-0004nr-E3
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 03:52:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YnMnV-0004j4-8V
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 03:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YnMnU-0000fM-A9
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 03:52:45 -0400
Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d]:33538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YnMnO-0000dT-0a; Wed, 29 Apr 2015 03:52:38 -0400
Received: by iecrt8 with SMTP id rt8so36502976iec.0;
	Wed, 29 Apr 2015 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mypil7sPEigLsbIREuWPQ7PcpZltbHTfmM3OZjSGhsU=;
	b=ghd+Hc1BLNiF3EDbkl4fOi53s6CcRJq5yHMZyl5Ez8C+RKaZPER9a7AmXNG5zsV3Hj
	gnAMkxq9qiI9VzqkebsrUNlCqcWIbKX0LsY78oDlrRdQfNwyqztsJjpCuWUrY/LKubng
	ibmf7TII7R2MfQ8vxsQSxipC+9ucCrdWrkUZoXWksIqxKbSN7qCbSgreZZM/+Fz8V0iL
	UK+DgFpVjjtqMgJ9JIYqm0Vcy3jQ0U1bHUUVidV2RHn5GHSMP31dToMbI5Lj4DCK5aWl
	cOmvtHycD9lPiWzMMfGhSO1PMzN69ofJJmGBrmWgNYy+QCHyViR4Td2wFs7xO2mnRCIm
	HBPg==
X-Received: by 10.107.169.74 with SMTP id s71mr26503852ioe.46.1430293956696;
	Wed, 29 Apr 2015 00:52:36 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id m9sm8833155igv.4.2015.04.29.00.52.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Apr 2015 00:52:35 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 Apr 2015 00:52:21 -0700
Message-Id: <1430293941-3214-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::22d
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	kbastian@mail.uni-paderborn.de
Subject: [Qemu-trivial] [PATCH] tcg: Delete unused cpu_pc_from_tb()
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
X-List-Received-Date: Wed, 29 Apr 2015 07:52:46 -0000

No code uses the cpu_pc_from_tb() function. Delete from tricore and
arm which each provide an unused implementation. Update the comment
in tcg.h to reflect that this is obsoleted by synchronize_from_tb.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-arm/cpu.h     | 9 ---------
 target-tricore/cpu.h | 5 -----
 tcg/tcg.h            | 6 ++++--
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 7069103..c9c5d30 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1874,15 +1874,6 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
 #include "exec/exec-all.h"
 
-static inline void cpu_pc_from_tb(CPUARMState *env, TranslationBlock *tb)
-{
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        env->pc = tb->pc;
-    } else {
-        env->regs[15] = tb->pc;
-    }
-}
-
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
diff --git a/target-tricore/cpu.h b/target-tricore/cpu.h
index 90bf006..c14b5f9 100644
--- a/target-tricore/cpu.h
+++ b/target-tricore/cpu.h
@@ -395,9 +395,4 @@ int cpu_tricore_handle_mmu_fault(CPUState *cpu, target_ulong address,
 
 #include "exec/exec-all.h"
 
-static inline void cpu_pc_from_tb(CPUTriCoreState *env, TranslationBlock *tb)
-{
-    env->PC = tb->pc;
-}
-
 #endif /*__TRICORE_CPU_H__ */
diff --git a/tcg/tcg.h b/tcg/tcg.h
index add7f75..3d004ba 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -859,8 +859,10 @@ static inline size_t tcg_current_code_size(TCGContext *s)
  * state is correctly synchronised and ready for execution of the next
  * TB (and in particular the guest PC is the address to execute next).
  * Otherwise, we gave up on execution of this TB before it started, and
- * the caller must fix up the CPU state by calling cpu_pc_from_tb()
- * with the next-TB pointer we return.
+ * the caller must fix up the CPU state by calling the CPU's
+ * synchronize_from_tb() method with the next-TB pointer we return (falling
+ * back to calling the CPU's set_pc method with tb->pb if no
+ * synchronize_from_tb() method exists).
  *
  * Note that TCG targets may use a different definition of tcg_qemu_tb_exec
  * to this default (which just calls the prologue.code emitted by
-- 
1.9.1


