Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nD6-0007r7-Pp
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:50:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nD1-0007oc-0W
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCy-0006br-V0
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:30619)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCw-0006Wc-Vd; Fri, 29 Mar 2019 04:49:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706947"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:45 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:44 +0800
Message-Id: <1553849325-44201-9-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 8/9] cpu/topology: add s390x
 support for smp machine properties
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2019 08:49:56 -0000

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/s390x/s390-virtio-ccw.c   | 2 ++
 hw/s390x/sclp.c              | 1 +
 target/openrisc/sys_helper.c | 5 +++++
 target/s390x/cpu.c           | 3 +++
 target/s390x/excp_helper.c   | 6 ++++++
 5 files changed, 17 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d11069b..8cb71e0 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -77,6 +77,7 @@ out:
 static void s390_init_cpus(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     int i;
 
     /* initialize possible_cpus */
@@ -398,6 +399,7 @@ static CpuInstanceProperties s390_cpu_index_to_props(MachineState *ms,
 static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
+    unsigned int max_cpus = ms->topo.max_cpus;
 
     if (ms->possible_cpus) {
         g_assert(ms->possible_cpus && ms->possible_cpus->len == max_cpus);
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 4510a80..1de3fb6 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -56,6 +56,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
 {
     ReadInfo *read_info = (ReadInfo *) sccb;
     MachineState *machine = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = machine->topo.max_cpus;
     int cpu_count;
     int rnsize, rnmax;
     IplParameterBlock *ipib = s390_ipl_get_iplb();
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 05f66c4..a8b03c6 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -24,6 +24,9 @@
 #include "exec/helper-proto.h"
 #include "exception.h"
 #include "sysemu/sysemu.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
 
 #define TO_SPR(group, number) (((group) << 11) + (number))
 
@@ -194,6 +197,8 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
                            target_ulong spr)
 {
 #ifndef CONFIG_USER_ONLY
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->topo.max_cpus;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
     int idx;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 698dd9c..4b614c5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -37,6 +37,7 @@
 #include "hw/qdev-properties.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/hw.h"
+#include "hw/boards.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #endif
@@ -193,6 +194,8 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #if !defined(CONFIG_USER_ONLY)
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->topo.max_cpus;
     if (cpu->env.core_id >= max_cpus) {
         error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
                    ", maximum core-id: %d", cpu->env.core_id,
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index f84bfb1..d3eec86 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -31,6 +31,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
 #include "hw/s390x/s390_flic.h"
+#include "hw/boards.h"
 #endif
 
 void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env, uint32_t code,
@@ -279,7 +280,12 @@ static void do_ext_interrupt(CPUS390XState *env)
         g_assert(cpu_addr < S390_MAX_CPUS);
         lowcore->cpu_addr = cpu_to_be16(cpu_addr);
         clear_bit(cpu_addr, env->emergency_signals);
+#ifndef CONFIG_USER_ONLY
+        MachineState *ms = MACHINE(qdev_get_machine());
+        if (bitmap_empty(env->emergency_signals, ms->topo.max_cpus)) {
+#elif
         if (bitmap_empty(env->emergency_signals, max_cpus)) {
+#endif
             env->pending_int &= ~INTERRUPT_EMERGENCY_SIGNAL;
         }
     } else if ((env->pending_int & INTERRUPT_EXTERNAL_CALL) &&
-- 
1.8.3.1


