Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nCu-0007j2-LG
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:49:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCq-0007eg-Kh
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCo-0006Vh-RX
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:30613)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCo-0006TI-EZ; Fri, 29 Mar 2019 04:49:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706914"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:37 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:39 +0800
Message-Id: <1553849325-44201-4-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 3/9] cpu/topology: add uncommon
 arch support for smp machine properties
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
X-List-Received-Date: Fri, 29 Mar 2019 08:49:46 -0000

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/alpha/dp264.c     | 1 +
 hw/hppa/machine.c    | 4 ++++
 hw/mips/boston.c     | 1 +
 hw/mips/mips_malta.c | 9 +++++++++
 hw/sparc/sun4m.c     | 2 ++
 hw/sparc64/sun4u.c   | 2 ++
 hw/xtensa/sim.c      | 1 +
 hw/xtensa/xtfpga.c   | 1 +
 8 files changed, 21 insertions(+)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 0347eb8..ee5d432 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -63,6 +63,7 @@ static void clipper_init(MachineState *machine)
     char *palcode_filename;
     uint64_t palcode_entry, palcode_low, palcode_high;
     uint64_t kernel_entry, kernel_low, kernel_high;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     /* Create up to 4 cpus.  */
     memset(cpus, 0, sizeof(cpus));
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d1b1d3c..f652891 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -16,6 +16,7 @@
 #include "hw/ide.h"
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
+#include "hw/boards.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -72,6 +73,7 @@ static void machine_hppa_init(MachineState *machine)
     MemoryRegion *ram_region;
     MemoryRegion *cpu_region;
     long i;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     ram_size = machine->ram_size;
 
@@ -242,7 +244,9 @@ static void machine_hppa_init(MachineState *machine)
 
 static void hppa_machine_reset(void)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     int i;
+    unsigned int smp_cpus = ms->topo.smp_cpus;
 
     qemu_devices_reset();
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index e5bab3c..7752c10 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -434,6 +434,7 @@ static void boston_mach_init(MachineState *machine)
     DriveInfo *hd[6];
     Chardev *chr;
     int fw_size, fit_err;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     bool is_64b;
 
     if ((machine->ram_size % GiB) ||
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 439665a..d595375 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1095,6 +1095,8 @@ static int64_t load_kernel (void)
 
 static void malta_mips_config(MIPSCPU *cpu)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
@@ -1127,9 +1129,11 @@ static void main_cpu_reset(void *opaque)
 static void create_cpu_without_cps(const char *cpu_type,
                                    qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     CPUMIPSState *env;
     MIPSCPU *cpu;
     int i;
+    unsigned int smp_cpus = ms->topo.smp_cpus;
 
     for (i = 0; i < smp_cpus; i++) {
         cpu = MIPS_CPU(cpu_create(cpu_type));
@@ -1149,7 +1153,9 @@ static void create_cpu_without_cps(const char *cpu_type,
 static void create_cps(MaltaState *s, const char *cpu_type,
                        qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     Error *err = NULL;
+    unsigned int smp_cpus = ms->topo.smp_cpus;
 
     s->cps = MIPS_CPS(object_new(TYPE_MIPS_CPS));
     qdev_set_parent_bus(DEVICE(s->cps), sysbus_get_default());
@@ -1171,6 +1177,9 @@ static void create_cps(MaltaState *s, const char *cpu_type,
 static void mips_create_cpu(MaltaState *s, const char *cpu_type,
                             qemu_irq *cbus_irq, qemu_irq *i8259_irq)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
+
     if ((smp_cpus > 1) && cpu_supports_cps_smp(cpu_type)) {
         create_cps(s, cpu_type, cbus_irq, i8259_irq);
     } else {
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index ca1e382..2321cfb 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -853,6 +853,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
     unsigned int num_vsimms;
     DeviceState *dev;
     SysBusDevice *s;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
+    unsigned int max_cpus = machine->topo.max_cpus;
 
     /* init CPUs */
     for(i = 0; i < smp_cpus; i++) {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 399f2d7..d089c4d 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -546,6 +546,8 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     NICInfo *nd;
     MACAddr macaddr;
     bool onboard_nic;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
+    unsigned int max_cpus = machine->topo.max_cpus;
 
     /* init CPUs */
     cpu = sparc64_cpu_devinit(machine->cpu_type, hwdef->prom_addr);
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 12c7437..cc0396b 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -59,6 +59,7 @@ static void xtensa_sim_init(MachineState *machine)
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     int n;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     for (n = 0; n < smp_cpus; n++) {
         cpu = XTENSA_CPU(cpu_create(machine->cpu_type));
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index e05ef75..f71a15e 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -238,6 +238,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const unsigned system_io_size = 224 * MiB;
     uint32_t freq = 10000000;
     int n;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     if (smp_cpus > 1) {
         mx_pic = xtensa_mx_pic_init(31);
-- 
1.8.3.1


