Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfUD9-00020q-NB
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 10:42:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZfUD7-0001vO-4p
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1ZfUD3-0002We-U9
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 10:42:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1ZfUCk-0002PX-FJ; Fri, 25 Sep 2015 10:42:30 -0400
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id B26B9140DC8;
	Fri, 25 Sep 2015 14:42:29 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 486)
	id 9C992140E1D; Fri, 25 Sep 2015 14:42:29 +0000 (UTC)
Received: from keeshans.qualcomm.com (rrcs-67-52-130-30.west.biz.rr.com
	[67.52.130.30])
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id DCBF1140E1A;
	Fri, 25 Sep 2015 14:42:27 +0000 (UTC)
From: Christopher Covington <cov@codeaurora.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 25 Sep 2015 10:42:21 -0400
Message-Id: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
X-Mailer: git-send-email 1.8.1.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Cc: Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, qemu-ppc@nongnu.org,
	Christopher Covington <cov@codeaurora.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] s/cpu_get_real_ticks/cpu_get_host_ticks/
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
X-List-Received-Date: Fri, 25 Sep 2015 14:42:54 -0000

This should help clarify the purpose of the function that returns
the host system's CPU cycle count.

Signed-off-by: Christopher Covington <cov@codeaurora.org>
---
 bsd-user/main.c           |  2 +-
 cpus.c                    |  6 +++---
 hw/intc/xics.c            |  2 +-
 hw/ppc/ppc.c              |  4 ++--
 include/qemu/timer.h      | 20 ++++++++++----------
 linux-user/main.c         |  4 ++--
 target-alpha/sys_helper.c |  2 +-
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index f0a1268..adf2de0 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -108,7 +108,7 @@ void cpu_list_unlock(void)
 
 uint64_t cpu_get_tsc(CPUX86State *env)
 {
-    return cpu_get_real_ticks();
+    return cpu_get_host_ticks();
 }
 
 static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
diff --git a/cpus.c b/cpus.c
index dddd056..eba7d5b 100644
--- a/cpus.c
+++ b/cpus.c
@@ -191,7 +191,7 @@ int64_t cpu_get_ticks(void)
 
     ticks = timers_state.cpu_ticks_offset;
     if (timers_state.cpu_ticks_enabled) {
-        ticks += cpu_get_real_ticks();
+        ticks += cpu_get_host_ticks();
     }
 
     if (timers_state.cpu_ticks_prev > ticks) {
@@ -239,7 +239,7 @@ void cpu_enable_ticks(void)
     /* Here, the really thing protected by seqlock is cpu_clock_offset. */
     seqlock_write_lock(&timers_state.vm_clock_seqlock);
     if (!timers_state.cpu_ticks_enabled) {
-        timers_state.cpu_ticks_offset -= cpu_get_real_ticks();
+        timers_state.cpu_ticks_offset -= cpu_get_host_ticks();
         timers_state.cpu_clock_offset -= get_clock();
         timers_state.cpu_ticks_enabled = 1;
     }
@@ -255,7 +255,7 @@ void cpu_disable_ticks(void)
     /* Here, the really thing protected by seqlock is cpu_clock_offset. */
     seqlock_write_lock(&timers_state.vm_clock_seqlock);
     if (timers_state.cpu_ticks_enabled) {
-        timers_state.cpu_ticks_offset += cpu_get_real_ticks();
+        timers_state.cpu_ticks_offset += cpu_get_host_ticks();
         timers_state.cpu_clock_offset = cpu_get_clock_locked();
         timers_state.cpu_ticks_enabled = 0;
     }
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 67881c7..9ff5796 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -848,7 +848,7 @@ static target_ulong h_xirr_x(PowerPCCPU *cpu, sPAPRMachineState *spapr,
     uint32_t xirr = icp_accept(ss);
 
     args[0] = xirr;
-    args[1] = cpu_get_real_ticks();
+    args[1] = cpu_get_host_ticks();
     return H_SUCCESS;
 }
 
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index b77e303..2c604ef 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -834,7 +834,7 @@ static void cpu_ppc_set_tb_clk (void *opaque, uint32_t freq)
 static void timebase_pre_save(void *opaque)
 {
     PPCTimebase *tb = opaque;
-    uint64_t ticks = cpu_get_real_ticks();
+    uint64_t ticks = cpu_get_host_ticks();
     PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
 
     if (!first_ppc_cpu->env.tb_env) {
@@ -878,7 +878,7 @@ static int timebase_post_load(void *opaque, int version_id)
                                      NANOSECONDS_PER_SECOND);
     guest_tb = tb_remote->guest_timebase + MIN(0, migration_duration_tb);
 
-    tb_off_adj = guest_tb - cpu_get_real_ticks();
+    tb_off_adj = guest_tb - cpu_get_host_ticks();
 
     tb_off = first_ppc_cpu->env.tb_env->tb_offset;
     trace_ppc_tb_adjust(tb_off, tb_off_adj, tb_off_adj - tb_off,
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 9939246..d0946cb 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -857,7 +857,7 @@ int64_t cpu_icount_to_ns(int64_t icount);
 
 #if defined(_ARCH_PPC)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     int64_t retval;
 #ifdef _ARCH_PPC64
@@ -883,7 +883,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__i386__)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     int64_t val;
     asm volatile ("rdtsc" : "=A" (val));
@@ -892,7 +892,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__x86_64__)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     uint32_t low,high;
     int64_t val;
@@ -905,7 +905,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__hppa__)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     int val;
     asm volatile ("mfctl %%cr16, %0" : "=r"(val));
@@ -914,7 +914,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__ia64)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     int64_t val;
     asm volatile ("mov %0 = ar.itc" : "=r"(val) :: "memory");
@@ -923,7 +923,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__s390__)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     int64_t val;
     asm volatile("stck 0(%1)" : "=m" (val) : "a" (&val) : "cc");
@@ -932,7 +932,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__sparc__)
 
-static inline int64_t cpu_get_real_ticks (void)
+static inline int64_t cpu_get_host_ticks (void)
 {
 #if defined(_LP64)
     uint64_t        rval;
@@ -970,7 +970,7 @@ static inline int64_t cpu_get_real_ticks (void)
                               : "=r" (value));          \
     }
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     /* On kernels >= 2.6.25 rdhwr <reg>, $2 and $3 are emulated */
     uint32_t count;
@@ -986,7 +986,7 @@ static inline int64_t cpu_get_real_ticks(void)
 
 #elif defined(__alpha__)
 
-static inline int64_t cpu_get_real_ticks(void)
+static inline int64_t cpu_get_host_ticks(void)
 {
     uint64_t cc;
     uint32_t cur, ofs;
@@ -1001,7 +1001,7 @@ static inline int64_t cpu_get_real_ticks(void)
 /* The host CPU doesn't have an easily accessible cycle counter.
    Just return a monotonically increasing value.  This will be
    totally wrong, but hopefully better than nothing.  */
-static inline int64_t cpu_get_real_ticks (void)
+static inline int64_t cpu_get_host_ticks (void)
 {
     static int64_t ticks = 0;
     return ticks++;
diff --git a/linux-user/main.c b/linux-user/main.c
index 782037d..953c8d2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -215,7 +215,7 @@ void cpu_list_unlock(void)
 
 uint64_t cpu_get_tsc(CPUX86State *env)
 {
-    return cpu_get_real_ticks();
+    return cpu_get_host_ticks();
 }
 
 static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
@@ -1425,7 +1425,7 @@ void cpu_loop (CPUSPARCState *env)
 #ifdef TARGET_PPC
 static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
 {
-    return cpu_get_real_ticks();
+    return cpu_get_host_ticks();
 }
 
 uint64_t cpu_ppc_load_tbl(CPUPPCState *env)
diff --git a/target-alpha/sys_helper.c b/target-alpha/sys_helper.c
index 1f0e1a9..75c96c1 100644
--- a/target-alpha/sys_helper.c
+++ b/target-alpha/sys_helper.c
@@ -34,7 +34,7 @@ uint64_t helper_load_pcc(CPUAlphaState *env)
 #else
     /* In user-mode, QEMU_CLOCK_VIRTUAL doesn't exist.  Just pass through the host cpu
        clock ticks.  Also, don't bother taking PCC_OFS into account.  */
-    return (uint32_t)cpu_get_real_ticks();
+    return (uint32_t)cpu_get_host_ticks();
 #endif
 }
 
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


