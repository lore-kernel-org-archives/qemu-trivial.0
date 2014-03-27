Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCXc-00021t-Jc
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXU-0001nW-G7
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXP-0001Z9-JW
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCXD-0001U6-HM; Thu, 27 Mar 2014 11:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 54C294372C;
	Thu, 27 Mar 2014 19:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B87BE67F;
	Thu, 27 Mar 2014 19:28:34 +0400 (MSK)
Received: (nullmailer pid 1795 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:19 +0400
Message-Id: <1395934108-1694-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/23] target-mips: Avoid shifting left into
	sign bit
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
X-List-Received-Date: Thu, 27 Mar 2014 15:48:25 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to various places where we shift a 1 left by 31,
to avoid undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-mips/cpu.h            |    2 +-
 target-mips/helper.c         |    8 ++++----
 target-mips/op_helper.c      |    2 +-
 target-mips/translate_init.c |   22 +++++++++++-----------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 3ba3229..6c2014e 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -775,7 +775,7 @@ static inline void compute_hflags(CPUMIPSState *env)
            and disable the MIPS IV extensions to the MIPS III ISA.
            Some other MIPS IV CPUs ignore the bit, so the check here
            would be too restrictive for them.  */
-        if (env->CP0_Status & (1 << CP0St_CU3)) {
+        if (env->CP0_Status & (1U << CP0St_CU3)) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
     }
diff --git a/target-mips/helper.c b/target-mips/helper.c
index b28ae9b..064622c 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -458,7 +458,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
         env->hflags &= ~(MIPS_HFLAG_KSU);
         /* EJTAG probe trap enable is not implemented... */
         if (!(env->CP0_Status & (1 << CP0St_EXL)))
-            env->CP0_Cause &= ~(1 << CP0Ca_BD);
+            env->CP0_Cause &= ~(1U << CP0Ca_BD);
         env->active_tc.PC = (int32_t)0xBFC00480;
         set_hflags_for_handler(env);
         break;
@@ -478,7 +478,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
         env->hflags |= MIPS_HFLAG_64 | MIPS_HFLAG_CP0;
         env->hflags &= ~(MIPS_HFLAG_KSU);
         if (!(env->CP0_Status & (1 << CP0St_EXL)))
-            env->CP0_Cause &= ~(1 << CP0Ca_BD);
+            env->CP0_Cause &= ~(1U << CP0Ca_BD);
         env->active_tc.PC = (int32_t)0xBFC00000;
         set_hflags_for_handler(env);
         break;
@@ -616,9 +616,9 @@ void mips_cpu_do_interrupt(CPUState *cs)
         if (!(env->CP0_Status & (1 << CP0St_EXL))) {
             env->CP0_EPC = exception_resume_pc(env);
             if (env->hflags & MIPS_HFLAG_BMASK) {
-                env->CP0_Cause |= (1 << CP0Ca_BD);
+                env->CP0_Cause |= (1U << CP0Ca_BD);
             } else {
-                env->CP0_Cause &= ~(1 << CP0Ca_BD);
+                env->CP0_Cause &= ~(1U << CP0Ca_BD);
             }
             env->CP0_Status |= (1 << CP0St_EXL);
             env->hflags |= MIPS_HFLAG_64 | MIPS_HFLAG_CP0;
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index e56f038..4edec6c 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -648,7 +648,7 @@ static void sync_c0_tcstatus(CPUMIPSState *cpu, int tc,
 {
     uint32_t status;
     uint32_t tcu, tmx, tasid, tksu;
-    uint32_t mask = ((1 << CP0St_CU3)
+    uint32_t mask = ((1U << CP0St_CU3)
                        | (1 << CP0St_CU2)
                        | (1 << CP0St_CU1)
                        | (1 << CP0St_CU0)
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index a64fd2b..29dc2ef 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -22,20 +22,20 @@
 
 /* Have config1, uncached coherency */
 #define MIPS_CONFIG0                                              \
-  ((1 << CP0C0_M) | (0x2 << CP0C0_K0))
+  ((1U << CP0C0_M) | (0x2 << CP0C0_K0))
 
 /* Have config2, no coprocessor2 attached, no MDMX support attached,
    no performance counters, watch registers present,
    no code compression, EJTAG present, no FPU */
 #define MIPS_CONFIG1                                              \
-((1 << CP0C1_M) |                                                 \
+((1U << CP0C1_M) |                                                \
  (0 << CP0C1_C2) | (0 << CP0C1_MD) | (0 << CP0C1_PC) |            \
  (1 << CP0C1_WR) | (0 << CP0C1_CA) | (1 << CP0C1_EP) |            \
  (0 << CP0C1_FP))
 
 /* Have config3, no tertiary/secondary caches implemented */
 #define MIPS_CONFIG2                                              \
-((1 << CP0C2_M))
+((1U << CP0C2_M))
 
 /* No config4, no DSP ASE, no large physaddr (PABITS),
    no external interrupt controller, no vectored interrupts,
@@ -301,16 +301,16 @@ static const mips_def_t mips_defs[] =
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
         .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
         .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
-        .CP0_SRSConf0 = (1 << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
+        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
                     (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1),
         .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
-        .CP0_SRSConf1 = (1 << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
+        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
                     (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4),
         .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
-        .CP0_SRSConf2 = (1 << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
+        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
                     (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7),
         .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
-        .CP0_SRSConf3 = (1 << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
+        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
                     (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS10),
         .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
         .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
@@ -355,8 +355,8 @@ static const mips_def_t mips_defs[] =
                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
                        (1 << CP0C1_CA),
         .CP0_Config2 = MIPS_CONFIG2,
-        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_M),
-        .CP0_Config4 = MIPS_CONFIG4 | (1 << CP0C4_M),
+        .CP0_Config3 = MIPS_CONFIG3 | (1U << CP0C3_M),
+        .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M),
         .CP0_Config4_rw_bitmask = 0,
         .CP0_Config5 = MIPS_CONFIG5 | (1 << CP0C5_UFR),
         .CP0_Config5_rw_bitmask = (0 << CP0C5_M) | (1 << CP0C5_K) |
@@ -670,7 +670,7 @@ static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
        programmable cache partitioning implemented, number of allocatable
        and sharable TLB entries, MVP has allocatable TCs, 2 VPEs
        implemented, 5 TCs implemented. */
-    env->mvp->CP0_MVPConf0 = (1 << CP0MVPC0_M) | (1 << CP0MVPC0_TLBS) |
+    env->mvp->CP0_MVPConf0 = (1U << CP0MVPC0_M) | (1 << CP0MVPC0_TLBS) |
                              (0 << CP0MVPC0_GS) | (1 << CP0MVPC0_PCP) |
 // TODO: actually do 2 VPEs.
 //                             (1 << CP0MVPC0_TCA) | (0x1 << CP0MVPC0_PVPE) |
@@ -684,7 +684,7 @@ static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
 
     /* Allocatable CP1 have media extensions, allocatable CP1 have FP support,
        no UDI implemented, no CP2 implemented, 1 CP1 implemented. */
-    env->mvp->CP0_MVPConf1 = (1 << CP0MVPC1_CIM) | (1 << CP0MVPC1_CIF) |
+    env->mvp->CP0_MVPConf1 = (1U << CP0MVPC1_CIM) | (1 << CP0MVPC1_CIF) |
                              (0x0 << CP0MVPC1_PCX) | (0x0 << CP0MVPC1_PCP2) |
                              (0x1 << CP0MVPC1_PCP1);
 }
-- 
1.7.10.4


