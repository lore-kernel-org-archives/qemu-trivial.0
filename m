Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nDA-0007uw-6D
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:50:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCy-0007ni-Uk
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCw-0006a3-SF
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:52 -0400
Received: from mga06.intel.com ([134.134.136.31]:30620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCs-0006Wd-W3; Fri, 29 Mar 2019 04:49:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706939"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:44 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:43 +0800
Message-Id: <1553849325-44201-8-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 7/9] cpu/topology: add riscv
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
 hw/openrisc/openrisc_sim.c | 1 +
 hw/riscv/sifive_e.c        | 4 ++++
 hw/riscv/sifive_plic.c     | 3 +++
 hw/riscv/sifive_u.c        | 4 ++++
 hw/riscv/spike.c           | 2 ++
 hw/riscv/virt.c            | 1 +
 6 files changed, 15 insertions(+)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 7d3b734..ecfc973 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -131,6 +131,7 @@ static void openrisc_sim_init(MachineState *machine)
     qemu_irq *cpu_irqs[2];
     qemu_irq serial_irq;
     int n;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     for (n = 0; n < smp_cpus; n++) {
         cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index b1cd113..c65c7b5 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -137,6 +137,8 @@ static void riscv_sifive_e_init(MachineState *machine)
 
 static void riscv_sifive_e_soc_init(Object *obj)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus,
@@ -150,6 +152,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
 
 static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     const struct MemmapEntry *memmap = sifive_e_memmap;
 
     SiFiveESoCState *s = RISCV_E_SOC(dev);
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index ac768e6..161fbd9 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -23,6 +23,7 @@
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "hw/pci/msi.h"
+#include "hw/boards.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "hw/riscv/sifive_plic.h"
@@ -432,6 +433,8 @@ static void sifive_plic_irq_request(void *opaque, int irq, int level)
 
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     SiFivePLICState *plic = SIFIVE_PLIC(dev);
     int i;
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ecc47c..b4a8d66 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -321,6 +321,8 @@ static void riscv_sifive_u_init(MachineState *machine)
 
 static void riscv_sifive_u_soc_init(Object *obj)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     SiFiveUSoCState *s = RISCV_U_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus, sizeof(s->cpus),
@@ -336,6 +338,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
 
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->topo.smp_cpus;
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
     const struct MemmapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2a000a5..5fe441c 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -171,6 +171,7 @@ static void spike_v1_10_0_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
@@ -253,6 +254,7 @@ static void spike_v1_09_1_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b3..9d4d305 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -395,6 +395,7 @@ static void riscv_virt_board_init(MachineState *machine)
     char *plic_hart_config;
     size_t plic_hart_config_len;
     int i;
+    unsigned int smp_cpus = machine->topo.smp_cpus;
     void *fdt;
 
     /* Initialize SOC */
-- 
1.8.3.1


