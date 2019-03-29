Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nCv-0007kG-Rh
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:49:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCs-0007fI-T8
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCp-0006WU-UG
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:30613)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCp-0006TI-5W; Fri, 29 Mar 2019 04:49:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706927"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:40 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:41 +0800
Message-Id: <1553849325-44201-6-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 5/9] cpu/topology: add i386
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
X-List-Received-Date: Fri, 29 Mar 2019 08:49:48 -0000

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/i386/acpi-build.c |  3 +++
 hw/i386/kvmvapic.c   |  5 +++++
 hw/i386/pc.c         | 12 ++++++++++++
 target/i386/cpu.c    |  4 ++++
 4 files changed, 24 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 416da31..3813c28 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -44,6 +44,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/boards.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/timer/mc146818rtc_regs.h"
 #include "hw/mem/memory-device.h"
@@ -127,6 +128,8 @@ typedef struct FwCfgTPMConfig {
 
 static void init_common_fadt_data(Object *o, AcpiFadtData *data)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->topo.max_cpus;
     uint32_t io = object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE, NULL);
     AmlAddressSpace as = AML_AS_SYSTEM_IO;
     AcpiFadtData fadt = {
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 70f6f26..2463f8a 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -17,6 +17,7 @@
 #include "sysemu/kvm.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/sysbus.h"
+#include "hw/boards.h"
 #include "tcg/tcg.h"
 
 #define VAPIC_IO_PORT           0x7e
@@ -441,6 +442,8 @@ static void do_patch_instruction(CPUState *cs, run_on_cpu_data data)
 
 static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     CPUState *cs = CPU(cpu);
     VAPICHandlers *handlers;
     PatchInfo *info;
@@ -746,6 +749,8 @@ static void do_vapic_enable(CPUState *cs, run_on_cpu_data data)
 static void kvmvapic_vm_state_change(void *opaque, int running,
                                      RunState state)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     VAPICROMState *s = opaque;
     uint8_t *zero;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6077d27..2816bfd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -931,6 +931,9 @@ void enable_compat_apic_id_mode(void)
  */
 static uint32_t x86_cpu_apic_id_from_index(unsigned int cpu_index)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cores = ms->topo.smp_cores;
+    unsigned int smp_threads = ms->topo.smp_threads;
     uint32_t correct_id;
     static bool warned;
 
@@ -1562,6 +1565,7 @@ void pc_cpus_init(PCMachineState *pcms)
     const CPUArchIdList *possible_cpus;
     MachineState *ms = MACHINE(pcms);
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
+    unsigned int smp_cpus = ms->topo.smp_cpus, max_cpus = ms->topo.max_cpus;
 
     /* Calculates the limit to CPU APIC ID values
      *
@@ -2291,6 +2295,9 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
     X86CPU *cpu = X86_CPU(dev);
     MachineState *ms = MACHINE(hotplug_dev);
     PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+    unsigned int smp_cores = ms->topo.smp_cores;
+    unsigned int smp_threads = ms->topo.smp_threads;
+    unsigned int max_cpus = ms->topo.max_cpus;
 
     if(!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -2646,6 +2653,8 @@ pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 static int64_t pc_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
    X86CPUTopoInfo topo;
+   unsigned int smp_cores = ms->topo.smp_cores;
+   unsigned int smp_threads = ms->topo.smp_threads;
 
    assert(idx < ms->possible_cpus->len);
    x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
@@ -2656,6 +2665,9 @@ static int64_t pc_get_default_cpu_node_id(const MachineState *ms, int idx)
 static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
+    unsigned int max_cpus = ms->topo.max_cpus;
+    unsigned int smp_cores = ms->topo.smp_cores;
+    unsigned int smp_threads = ms->topo.smp_threads;
 
     if (ms->possible_cpus) {
         /*
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d6bb57d..6dcdad4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -53,6 +53,7 @@
 #include "hw/hw.h"
 #include "hw/xen/xen.h"
 #include "hw/i386/apic_internal.h"
+#include "hw/boards.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5291,6 +5292,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
+
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
 
     if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || smp_cpus > 1) {
-- 
1.8.3.1


