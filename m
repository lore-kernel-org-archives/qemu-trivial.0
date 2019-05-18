Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSLMc-0007qw-Qs
	for mharc-qemu-trivial@gnu.org; Sun, 19 May 2019 08:56:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMZ-0007qM-O3
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMY-0002FC-JO
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:2556)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hSLMY-0002DS-Ak; Sun, 19 May 2019 08:56:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 05:56:18 -0700
X-ExtLoop1: 1
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.98])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2019 05:56:17 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Date: Sun, 19 May 2019 04:54:19 +0800
Message-Id: <20190518205428.90532-2-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518205428.90532-1-like.xu@linux.intel.com>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 01/10] hw/boards: Add struct
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
X-List-Received-Date: Sun, 19 May 2019 12:56:29 -0000

The cpu topology property CpuTopology is added to the MachineState
and its members are initialized with the leagcy global smp variables.

From this commit, the code in the system emulation mode is supposed to
use cpu topology variables from MachineState instead of the global ones
defined in vl.c and there is no semantic change.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/boards.h | 15 +++++++++++++++
 vl.c                |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6f7916f88f..bc23b5db1d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -230,6 +230,20 @@ typedef struct DeviceMemoryState {
     MemoryRegion mr;
 } DeviceMemoryState;
 
+/**
+ * CpuTopology:
+ * @cpus: the number of present logical processors on the machine
+ * @cores: the number of cores in one package
+ * @threads: the number of threads in one core
+ * @max_cpus: the maximum number of logical processors on the machine
+ */
+typedef struct CpuTopology {
+    unsigned int cpus;
+    unsigned int cores;
+    unsigned int threads;
+    unsigned int max_cpus;
+} CpuTopology;
+
 /**
  * MachineState:
  */
@@ -272,6 +286,7 @@ struct MachineState {
     const char *cpu_type;
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
+    CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
 };
 
diff --git a/vl.c b/vl.c
index c8ca9ff6ff..40b006577b 100644
--- a/vl.c
+++ b/vl.c
@@ -4133,6 +4133,11 @@ int main(int argc, char **argv, char **envp)
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
+    current_machine->smp.cpus = smp_cpus;
+    current_machine->smp.max_cpus = max_cpus;
+    current_machine->smp.cores = smp_cores;
+    current_machine->smp.threads = smp_threads;
+
     /* sanity-check smp_cpus and max_cpus against machine_class */
     if (smp_cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
-- 
2.21.0


