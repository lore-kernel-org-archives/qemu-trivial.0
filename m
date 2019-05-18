Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSLMj-0007yx-Fc
	for mharc-qemu-trivial@gnu.org; Sun, 19 May 2019 08:56:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMd-0007sE-Sw
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMc-0002Ht-8C
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:2557)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hSLMb-0002Di-Sc; Sun, 19 May 2019 08:56:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 05:56:29 -0700
X-ExtLoop1: 1
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.98])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2019 05:56:28 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Date: Sun, 19 May 2019 04:54:27 +0800
Message-Id: <20190518205428.90532-10-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518205428.90532-1-like.xu@linux.intel.com>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 09/10] hw: Replace global smp
 variables with MachineState for all remaining archs
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
X-List-Received-Date: Sun, 19 May 2019 12:56:33 -0000

The global smp variables in alpha/hppa/mips/openrisc/sparc*/xtensa codes
are replaced with smp properties from MachineState.

A local variable of the same name would be introduced in the declaration
phase if it's used widely in the context OR replace it on the spot if it's
only used once. No semantic changes.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/alpha/dp264.c           | 1 +
 hw/hppa/machine.c          | 2 ++
 hw/mips/boston.c           | 2 +-
 hw/mips/mips_malta.c       | 2 ++
 hw/openrisc/openrisc_sim.c | 1 +
 hw/sparc/sun4m.c           | 2 ++
 hw/sparc64/sun4u.c         | 4 ++--
 hw/xtensa/sim.c            | 2 +-
 hw/xtensa/xtfpga.c         | 1 +
 9 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 0347eb897c..9dfb835013 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -63,6 +63,7 @@ static void clipper_init(MachineState *machine)
     char *palcode_filename;
     uint64_t palcode_entry, palcode_low, palcode_high;
     uint64_t kernel_entry, kernel_low, kernel_high;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     /* Create up to 4 cpus.  */
     memset(cpus, 0, sizeof(cpus));
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 416e67bab1..662838d83b 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -72,6 +72,7 @@ static void machine_hppa_init(MachineState *machine)
     MemoryRegion *ram_region;
     MemoryRegion *cpu_region;
     long i;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     ram_size = machine->ram_size;
 
@@ -242,6 +243,7 @@ static void machine_hppa_init(MachineState *machine)
 
 static void hppa_machine_reset(MachineState *ms)
 {
+    unsigned int smp_cpus = ms->smp.cpus;
     int i;
 
     qemu_devices_reset();
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a8b29f62f5..ccbfac54ef 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -460,7 +460,7 @@ static void boston_mach_init(MachineState *machine)
 
     object_property_set_str(OBJECT(s->cps), machine->cpu_type, "cpu-type",
                             &err);
-    object_property_set_int(OBJECT(s->cps), smp_cpus, "num-vp", &err);
+    object_property_set_int(OBJECT(s->cps), machine->smp.cpus, "num-vp", &err);
     object_property_set_bool(OBJECT(s->cps), true, "realized", &err);
 
     if (err != NULL) {
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 5fe9512c24..ead5976d1a 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1095,6 +1095,8 @@ static int64_t load_kernel (void)
 
 static void malta_mips_config(MIPSCPU *cpu)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->smp.cpus;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 0a906d815e..8d828e78ee 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -131,6 +131,7 @@ static void openrisc_sim_init(MachineState *machine)
     qemu_irq *cpu_irqs[2];
     qemu_irq serial_irq;
     int n;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     for (n = 0; n < smp_cpus; n++) {
         cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 07d126aea8..5c3739f2ef 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -852,6 +852,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
     FWCfgState *fw_cfg;
     DeviceState *dev;
     SysBusDevice *s;
+    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int max_cpus = machine->smp.max_cpus;
 
     /* init CPUs */
     for(i = 0; i < smp_cpus; i++) {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 399f2d73c8..0807f274bf 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -678,8 +678,8 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                                 &FW_CFG_IO(dev)->comb_iomem);
 
     fw_cfg = FW_CFG(dev);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, hwdef->machine_id);
     fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_entry);
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 12c7437398..a4eef76fbc 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -60,7 +60,7 @@ static void xtensa_sim_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     int n;
 
-    for (n = 0; n < smp_cpus; n++) {
+    for (n = 0; n < machine->smp.cpus; n++) {
         cpu = XTENSA_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index e05ef75a75..f7f3e11e93 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -238,6 +238,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const unsigned system_io_size = 224 * MiB;
     uint32_t freq = 10000000;
     int n;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     if (smp_cpus > 1) {
         mx_pic = xtensa_mx_pic_init(31);
-- 
2.21.0


