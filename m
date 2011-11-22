Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnHd-0008TO-PY
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:08:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHO-0007Us-KI
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHC-0006Ls-Jn
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:35 -0500
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:49425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnHB-00061U-AA
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:30 -0500
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:30 +0530
Received: from d28relay05.in.ibm.com ([9.184.220.62])
	by e28smtp03.in.ibm.com ([192.168.1.133]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:26 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7Nhv2994292; Tue, 22 Nov 2011 15:37:24 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7N4s028075; Tue, 22 Nov 2011 21:07:23 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0O026400; Tue, 22 Nov 2011 21:07:21 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:21 +0800
Message-Id: <1321956386-12004-6-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-3864-0000-0000-0000003185C3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.3
Cc: stefanha@linux.vnet.ibm.com, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 06/11] fix spelling in target sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:08:55 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Cc: Richard Henderson <rth@twiddle.net>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Alexander Graf <agraf@suse.de>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Blue Swirl <blauwirbel@gmail.com> 
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 target-alpha/STATUS           |    2 +-
 target-microblaze/cpu.h       |    2 +-
 target-microblaze/translate.c |    4 ++--
 target-mips/cpu.h             |    2 +-
 target-mips/machine.c         |    2 +-
 target-ppc/cpu.h              |    4 ++--
 target-ppc/mfrom_table_gen.c  |    2 +-
 target-ppc/op_helper.c        |    4 ++--
 target-sh4/helper.c           |    2 +-
 target-sparc/TODO             |    2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target-alpha/STATUS b/target-alpha/STATUS
index 353d543..742e370 100644
--- a/target-alpha/STATUS
+++ b/target-alpha/STATUS
@@ -18,7 +18,7 @@ Linux user mode emulation status:
 a few programs start to run. Most crash at a certain point, dereferencing a
 NULL pointer. It seems that the UNIQUE register is not initialized properly.
 It may appear that old executables, not relying on TLS support, run but
-this is to be prooved...
+this is to be proved...
 
 Full system emulation status:
 * Alpha PALCode emulation is in a very early stage and is not sufficient
diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 3530286..1a307e3 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -243,7 +243,7 @@ typedef struct CPUMBState {
 #define DRTE_FLAG	(1 << 17)
 #define DRTB_FLAG	(1 << 18)
 #define D_FLAG		(1 << 19)  /* Bit in ESR.  */
-/* TB dependant CPUState.  */
+/* TB dependent CPUState.  */
 #define IFLAGS_TB_MASK  (D_FLAG | IMM_FLAG | DRTI_FLAG | DRTE_FLAG | DRTB_FLAG)
     uint32_t iflags;
 
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index 366fd3e..d7f513d 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -120,7 +120,7 @@ static inline int sign_extend(unsigned int val, unsigned int width)
 
 static inline void t_sync_flags(DisasContext *dc)
 {
-    /* Synch the tb dependant flags between translator and runtime.  */
+    /* Synch the tb dependent flags between translator and runtime.  */
     if (dc->tb_flags != dc->synced_flags) {
         tcg_gen_movi_tl(env_iflags, dc->tb_flags);
         dc->synced_flags = dc->tb_flags;
@@ -1122,7 +1122,7 @@ static void dec_store(DisasContext *dc)
     if ((dc->env->pvr.regs[2] & PVR2_UNALIGNED_EXC_MASK) && size > 1) {
         tcg_gen_movi_tl(cpu_SR[SR_PC], dc->pc);
         /* FIXME: if the alignment is wrong, we should restore the value
-         *        in memory. One possible way to acheive this is to probe
+         *        in memory. One possible way to achieve this is to probe
          *        the MMU prior to the memaccess, thay way we could put
          *        the alignment checks in between the probe and the mem
          *        access.
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 79e2558..71cb4e8 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -678,7 +678,7 @@ static inline int mips_vpe_active(CPUState *env)
     if (!(env->mvp->CP0_MVPControl & (1 << CP0MVPCo_EVP))) {
         active = 0;
     }
-    /* Check that the VPE is actived.  */
+    /* Check that the VPE is activated.  */
     if (!(env->CP0_VPEConf0 & (1 << CP0VPEC0_VPA))) {
         active = 0;
     }
diff --git a/target-mips/machine.c b/target-mips/machine.c
index be72b36..a506ee0 100644
--- a/target-mips/machine.c
+++ b/target-mips/machine.c
@@ -302,7 +302,7 @@ int cpu_load(QEMUFile *f, void *opaque, int version_id)
     for (i = 0; i < MIPS_FPU_MAX; i++)
         load_fpu(f, &env->fpus[i]);
 
-    /* XXX: ensure compatiblity for halted bit ? */
+    /* XXX: ensure compatibility for halted bit ? */
     tlb_flush(env, 1);
     return 0;
 }
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index e84108c..2d67d1f 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -1004,7 +1004,7 @@ struct CPUPPCState {
     int error_code;
     uint32_t pending_interrupts;
 #if !defined(CONFIG_USER_ONLY)
-    /* This is the IRQ controller, which is implementation dependant
+    /* This is the IRQ controller, which is implementation dependent
      * and only relevant when emulating a complete machine.
      */
     uint32_t irq_input_state;
@@ -1024,7 +1024,7 @@ struct CPUPPCState {
 
     /* Those resources are used only in Qemu core */
     target_ulong hflags;      /* hflags is a MSR & HFLAGS_MASK         */
-    target_ulong hflags_nmsr; /* specific hflags, not comming from MSR */
+    target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
     int mmu_idx;         /* precomputed MMU index to speed up mem accesses */
 
     /* Power management */
diff --git a/target-ppc/mfrom_table_gen.c b/target-ppc/mfrom_table_gen.c
index 4c06aa4..a140ded 100644
--- a/target-ppc/mfrom_table_gen.c
+++ b/target-ppc/mfrom_table_gen.c
@@ -11,7 +11,7 @@ int main (void)
 
     printf("static const uint8_t mfrom_ROM_table[602] =\n{\n    ");
     for (i = 0; i < 602; i++) {
-        /* Extremly decomposed:
+        /* Extremely decomposed:
          *                    -T0 / 256
          * T0 = 256 * log10(10          + 1.0) + 0.5
          */
diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
index 134b0c6..6339c95 100644
--- a/target-ppc/op_helper.c
+++ b/target-ppc/op_helper.c
@@ -1795,7 +1795,7 @@ void helper_rfsvc (void)
 /* 602 specific instructions */
 /* mfrom is the most crazy instruction ever seen, imho ! */
 /* Real implementation uses a ROM table. Do the same */
-/* Extremly decomposed:
+/* Extremely decomposed:
  *                      -arg / 256
  * return 256 * log10(10           + 1.0) + 0.5
  */
@@ -3070,7 +3070,7 @@ static inline uint32_t word_reverse(uint32_t val)
         (byte_reverse(val >> 8) << 16) | (byte_reverse(val) << 24);
 }
 
-#define MASKBITS 16 // Random value - to be fixed (implementation dependant)
+#define MASKBITS 16 // Random value - to be fixed (implementation dependent)
 target_ulong helper_brinc (target_ulong arg1, target_ulong arg2)
 {
     uint32_t a, b, d, mask;
diff --git a/target-sh4/helper.c b/target-sh4/helper.c
index 5a1e15e..9df0719 100644
--- a/target-sh4/helper.c
+++ b/target-sh4/helper.c
@@ -814,7 +814,7 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
     /*
      * TODO : Evaluate CCR and check if the cache is on or off.
      *        Now CCR is not in CPUSH4State, but in SH7750State.
-     *        When you move the ccr inot CPUSH4State, the code will be
+     *        When you move the ccr into CPUSH4State, the code will be
      *        as follows.
      */
 #if 0
diff --git a/target-sparc/TODO b/target-sparc/TODO
index c87459f..b8c727e 100644
--- a/target-sparc/TODO
+++ b/target-sparc/TODO
@@ -15,7 +15,7 @@ CPU common:
  - NPC/PC static optimisations (use JUMP_TB when possible)? (Is this
  obsolete?)
  - Synthetic instructions
- - MMU model dependant on CPU model
+ - MMU model dependent on CPU model
  - Select ASI helper at translation time (on V9 only if known)
  - KQemu/KVM support for VM only
  - Hardware breakpoint/watchpoint support
-- 
1.7.5.4


