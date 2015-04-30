Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhOq-00025G-HE
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOm-0001sx-4L
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOl-0008CZ-5R
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhOf-00088m-KQ; Thu, 30 Apr 2015 01:52:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 212E542B97;
	Thu, 30 Apr 2015 08:46:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 76A7096F;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4376 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:54 +0300
Message-Id: <1e50525356c86ab31abe3b1abdc79ba0fddc9c80.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 41/42] tcg: Delete unused cpu_pc_from_tb()
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
X-List-Received-Date: Thu, 30 Apr 2015 05:52:37 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

No code uses the cpu_pc_from_tb() function. Delete from tricore and
arm which each provide an unused implementation. Update the comment
in tcg.h to reflect that this is obsoleted by synchronize_from_tb.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/cpu.h     | 9 ---------
 target-tricore/cpu.h | 5 -----
 tcg/tcg.h            | 6 ++++--
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 8df0b6a..d4a5899 100644
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
2.1.4


