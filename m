Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nCs-0007ex-IA
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:49:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCp-0007eZ-ED
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCo-0006VQ-4x
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:30613)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCn-0006TI-Pm; Fri, 29 Mar 2019 04:49:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706905"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:34 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:37 +0800
Message-Id: <1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] cpu/topology: add struct
 CpuTopology to MachineState
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
X-List-Received-Date: Fri, 29 Mar 2019 08:49:44 -0000

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 include/hw/arm/virt.h   | 2 +-
 include/hw/boards.h     | 8 ++++++++
 include/sysemu/sysemu.h | 2 +-
 vl.c                    | 7 ++++++-
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 507517c..724da0c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -123,7 +123,7 @@ typedef struct {
     struct arm_boot_info bootinfo;
     MemMapEntry *memmap;
     const int *irqmap;
-    int smp_cpus;
+    unsigned int smp_cpus;
     void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index e231860..cbde276 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -231,6 +231,13 @@ typedef struct DeviceMemoryState {
     MemoryRegion mr;
 } DeviceMemoryState;
 
+typedef struct CpuTopology {
+    unsigned int smp_cpus;
+    unsigned int smp_cores;
+    unsigned int smp_threads;
+    unsigned int max_cpus;
+} CpuTopology;
+
 /**
  * MachineState:
  */
@@ -273,6 +280,7 @@ struct MachineState {
     const char *cpu_type;
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
+    CpuTopology topo;
     struct NVDIMMState *nvdimms_state;
 };
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6065d9e..c0d7d7c 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -100,7 +100,7 @@ extern const char *keyboard_layout;
 extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
-extern int smp_cpus;
+extern unsigned int smp_cpus;
 extern unsigned int max_cpus;
 extern int cursor_hide;
 extern int graphic_rotate;
diff --git a/vl.c b/vl.c
index d61d560..9089253 100644
--- a/vl.c
+++ b/vl.c
@@ -162,7 +162,7 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
-int smp_cpus;
+unsigned int smp_cpus;
 unsigned int max_cpus;
 int smp_cores = 1;
 int smp_threads = 1;
@@ -4116,6 +4116,11 @@ int main(int argc, char **argv, char **envp)
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
+    current_machine->topo.smp_cpus = smp_cpus;
+    current_machine->topo.max_cpus = max_cpus;
+    current_machine->topo.smp_cores = smp_cores;
+    current_machine->topo.smp_threads = smp_threads;
+
     /* sanity-check smp_cpus and max_cpus against machine_class */
     if (smp_cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
-- 
1.8.3.1


