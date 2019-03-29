Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nCz-0007oN-F8
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:49:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCw-0007lb-U5
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCu-0006YW-TB
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:30619)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCr-0006Wc-3c; Fri, 29 Mar 2019 04:49:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706933"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:42 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:42 +0800
Message-Id: <1553849325-44201-7-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 6/9] cpu/topology: add PPC
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
X-List-Received-Date: Fri, 29 Mar 2019 08:49:52 -0000

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/ppc/e500.c         |  3 +++
 hw/ppc/mac_newworld.c |  2 ++
 hw/ppc/mac_oldworld.c |  2 ++
 hw/ppc/pnv.c          |  3 +++
 hw/ppc/prep.c         |  2 ++
 hw/ppc/spapr.c        | 29 +++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c   |  3 +++
 7 files changed, 44 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index beb2efd..c854cb5 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -307,6 +307,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
                                     bool dry_run)
 {
     MachineState *machine = MACHINE(pms);
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
     CPUPPCState *env = first_cpu->env_ptr;
     int ret = -1;
@@ -734,6 +735,7 @@ static DeviceState *ppce500_init_mpic_qemu(PPCE500MachineState *pms,
     SysBusDevice *s;
     int i, j, k;
     MachineState *machine = MACHINE(pms);
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
 
     dev = qdev_create(NULL, TYPE_OPENPIC);
@@ -846,6 +848,7 @@ void ppce500_init(MachineState *machine)
     struct boot_info *boot_info;
     int dt_size;
     int i;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     /* irq num for pin INTA, INTB, INTC and INTD is 1, 2, 3 and
      * 4 respectively */
     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 02d8559..ce236ee 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -131,10 +131,12 @@ static void ppc_core99_init(MachineState *machine)
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     int machine_arch;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq;
+    unsigned int max_cpus = machine->topo.max_cpus;
 
     linux_boot = (kernel_filename != NULL);
 
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 460cbc7..cde20c9 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -99,6 +99,8 @@ static void ppc_heathrow_init(MachineState *machine)
     DeviceState *dev, *pic_dev;
     BusState *adb_bus;
     int bios_size;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
+    unsigned int max_cpus = machine->topo.max_cpus;
     uint16_t ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index dfb4ea5..c99c0b2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -596,6 +596,7 @@ static void pnv_init(MachineState *machine)
     long fw_size;
     int i;
     char *chip_typename;
+    unsigned int smp_cores = machine->topo.smp_cores;
 
     /* allocate RAM */
     if (machine->ram_size < (1 * GiB)) {
@@ -1135,6 +1136,8 @@ static void pnv_chip_instance_init(Object *obj)
 
 static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_threads = ms->topo.smp_threads;
     Error *error = NULL;
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(chip);
     const char *typename = pnv_chip_core_typename(chip);
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 847d320..86aa021 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -423,6 +423,7 @@ static void ppc_prep_init(MachineState *machine)
     ISADevice *isa;
     int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     sysctrl = g_malloc0(sizeof(sysctrl_t));
 
@@ -630,6 +631,7 @@ static void ibm_40p_init(MachineState *machine)
     uint32_t kernel_base = 0, initrd_base = 0;
     long kernel_size = 0, initrd_size = 0;
     char boot_device;
+    unsigned int max_cpus = machine->topo.max_cpus;
 
     /* init CPU */
     cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6c16d6c..bf70121 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -105,6 +105,9 @@
  */
 static int spapr_vcpu_id(SpaprMachineState *spapr, int cpu_index)
 {
+    MachineState *ms = MACHINE(spapr);
+    unsigned int smp_threads = ms->topo.smp_threads;
+
     assert(spapr->vsmt);
     return
         (cpu_index / smp_threads) * spapr->vsmt + cpu_index % smp_threads;
@@ -152,6 +155,10 @@ static void pre_2_10_vmstate_unregister_dummy_icp(int i)
 
 int spapr_max_server_number(SpaprMachineState *spapr)
 {
+    MachineState *ms = MACHINE(spapr);
+    unsigned int smp_threads = ms->topo.smp_threads;
+    unsigned int max_cpus = ms->topo.max_cpus;
+
     assert(spapr->vsmt);
     return DIV_ROUND_UP(max_cpus * spapr->vsmt, smp_threads);
 }
@@ -286,10 +293,12 @@ static void spapr_populate_pa_features(SpaprMachineState *spapr,
 
 static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
 {
+    MachineState *ms = MACHINE(spapr);
     int ret = 0, offset, cpus_offset;
     CPUState *cs;
     char cpu_model[32];
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
+    unsigned int smp_threads = ms->topo.smp_threads;
 
     CPU_FOREACH(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -441,6 +450,7 @@ static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
 static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
                                   SpaprMachineState *spapr)
 {
+    MachineState *ms = MACHINE(spapr);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
@@ -452,6 +462,8 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
     uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
+    unsigned int smp_threads = ms->topo.smp_threads;
+    unsigned int smp_cores = ms->topo.smp_cores;
     uint32_t vcpus_per_socket = smp_threads * smp_cores;
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
     int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
@@ -1022,6 +1034,9 @@ int spapr_h_cas_compose_response(SpaprMachineState *spapr,
 
 static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
 {
+    MachineState *ms = MACHINE(spapr);
+    unsigned int max_cpus = ms->topo.max_cpus;
+    unsigned int smp_threads = ms->topo.smp_threads;
     int rtas;
     GString *hypertas = g_string_sized_new(256);
     GString *qemu_hypertas = g_string_sized_new(256);
@@ -2513,6 +2528,7 @@ static void spapr_validate_node_memory(MachineState *machine, Error **errp)
 /* find cpu slot in machine->possible_cpus by core_id */
 static CPUArchId *spapr_find_cpu_slot(MachineState *ms, uint32_t id, int *idx)
 {
+    unsigned int smp_threads = ms->topo.smp_threads;
     int index = id / smp_threads;
 
     if (index >= ms->possible_cpus->len) {
@@ -2526,10 +2542,12 @@ static CPUArchId *spapr_find_cpu_slot(MachineState *ms, uint32_t id, int *idx)
 
 static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
 {
+    MachineState *ms = MACHINE(spapr);
     Error *local_err = NULL;
     bool vsmt_user = !!spapr->vsmt;
     int kvm_smt = kvmppc_smt_threads();
     int ret;
+    unsigned int smp_threads = ms->topo.smp_threads;
 
     if (!kvm_enabled() && (smp_threads > 1)) {
         error_setg(&local_err, "TCG cannot support more than 1 thread/core "
@@ -2603,6 +2621,9 @@ static void spapr_init_cpus(SpaprMachineState *spapr)
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     const char *type = spapr_get_cpu_core_type(machine->cpu_type);
     const CPUArchIdList *possible_cpus;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
+    unsigned int smp_threads = machine->topo.smp_threads;
+    unsigned int max_cpus = machine->topo.max_cpus;
     int boot_cores_nr = smp_cpus / smp_threads;
     int i;
 
@@ -3835,6 +3856,7 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     const char *type = object_get_typename(OBJECT(dev));
     CPUArchId *core_slot;
     int index;
+    unsigned int smp_threads = machine->topo.smp_threads;
 
     if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
         error_setg(&local_err, "CPU hotplug not supported for this machine");
@@ -4087,12 +4109,17 @@ spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
 
 static int64_t spapr_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
+    unsigned int smp_cores = ms->topo.smp_cores;
+
     return idx / smp_cores % nb_numa_nodes;
 }
 
 static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
 {
     int i;
+    unsigned int max_cpus = machine->topo.max_cpus;
+    unsigned int smp_threads = machine->topo.smp_threads;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     const char *core_type;
     int spapr_max_cores = max_cpus / smp_threads;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
@@ -4213,6 +4240,8 @@ int spapr_get_vcpu_id(PowerPCCPU *cpu)
 void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+    MachineState *ms = MACHINE(spapr);
+    unsigned int smp_threads = ms->topo.smp_threads;
     int vcpu_id;
 
     vcpu_id = spapr_vcpu_id(spapr, cpu_index);
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 24c45b1..658f3f9 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -231,6 +231,9 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
                                           target_ulong args,
                                           uint32_t nret, target_ulong rets)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->topo.max_cpus;
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     target_ulong parameter = rtas_ld(args, 0);
     target_ulong buffer = rtas_ld(args, 1);
     target_ulong length = rtas_ld(args, 2);
-- 
1.8.3.1


