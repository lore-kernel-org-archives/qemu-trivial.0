Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hSLMm-000815-O5
	for mharc-qemu-trivial@gnu.org; Sun, 19 May 2019 08:56:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMe-0007t9-On
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hSLMd-0002IM-E8
	for qemu-trivial@nongnu.org; Sun, 19 May 2019 08:56:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:2557)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hSLMd-0002Di-5b; Sun, 19 May 2019 08:56:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 05:56:30 -0700
X-ExtLoop1: 1
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.98])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2019 05:56:29 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Date: Sun, 19 May 2019 04:54:28 +0800
Message-Id: <20190518205428.90532-11-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190518205428.90532-1-like.xu@linux.intel.com>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 10/10] vl.c: Replace smp
 global variables with smp machine properties
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
X-List-Received-Date: Sun, 19 May 2019 12:56:34 -0000

The global smp variables in vl.c are completely replaced with machine properties.

Form this commit, the smp_cpus/smp_cores/smp_threads/max_cpus are deprecated
and only machine properties within MachineState are fully applied and enabled.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 vl.c | 53 ++++++++++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/vl.c b/vl.c
index 15d519e371..a700c93c77 100644
--- a/vl.c
+++ b/vl.c
@@ -162,10 +162,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
-int smp_cpus;
-unsigned int max_cpus;
-int smp_cores = 1;
-int smp_threads = 1;
 int acpi_enabled = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
@@ -1282,8 +1278,9 @@ static void smp_parse(QemuOpts *opts)
                 sockets = sockets > 0 ? sockets : 1;
                 cpus = cores * threads * sockets;
             } else {
-                max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = max_cpus / (cores * threads);
+                current_machine->smp.max_cpus =
+                        qemu_opt_get_number(opts, "maxcpus", cpus);
+                sockets = current_machine->smp.max_cpus / (cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
@@ -1300,34 +1297,37 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
-        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+        current_machine->smp.max_cpus =
+                qemu_opt_get_number(opts, "maxcpus", cpus);
 
-        if (max_cpus < cpus) {
+        if (current_machine->smp.max_cpus < cpus) {
             error_report("maxcpus must be equal to or greater than smp");
             exit(1);
         }
 
-        if (sockets * cores * threads > max_cpus) {
+        if (sockets * cores * threads > current_machine->smp.max_cpus) {
             error_report("cpu topology: "
                          "sockets (%u) * cores (%u) * threads (%u) > "
                          "maxcpus (%u)",
-                         sockets, cores, threads, max_cpus);
+                         sockets, cores, threads,
+                         current_machine->smp.max_cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != max_cpus) {
+        if (sockets * cores * threads != current_machine->smp.max_cpus) {
             warn_report("Invalid CPU topology deprecated: "
                         "sockets (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
-                        sockets, cores, threads, max_cpus);
+                        sockets, cores, threads,
+                        current_machine->smp.max_cpus);
         }
 
-        smp_cpus = cpus;
-        smp_cores = cores;
-        smp_threads = threads;
+        current_machine->smp.cpus = cpus;
+        current_machine->smp.cores = cores;
+        current_machine->smp.threads = threads;
     }
 
-    if (smp_cpus > 1) {
+    if (current_machine->smp.cpus > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
         replay_add_blocker(blocker);
@@ -4128,26 +4128,25 @@ int main(int argc, char **argv, char **envp)
     machine_class->default_cpus = machine_class->default_cpus ?: 1;
 
     /* default to machine_class->default_cpus */
-    smp_cpus = machine_class->default_cpus;
-    max_cpus = machine_class->default_cpus;
+    current_machine->smp.cpus = machine_class->default_cpus;
+    current_machine->smp.max_cpus = machine_class->default_cpus;
+    current_machine->smp.cores = 1;
+    current_machine->smp.threads = 1;
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
-    current_machine->smp.cpus = smp_cpus;
-    current_machine->smp.max_cpus = max_cpus;
-    current_machine->smp.cores = smp_cores;
-    current_machine->smp.threads = smp_threads;
-
     /* sanity-check smp_cpus and max_cpus against machine_class */
-    if (smp_cpus < machine_class->min_cpus) {
+    if (current_machine->smp.cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
-                     "supported by machine '%s' is %d", smp_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->smp.cpus,
                      machine_class->name, machine_class->min_cpus);
         exit(1);
     }
-    if (max_cpus > machine_class->max_cpus) {
+    if (current_machine->smp.max_cpus > machine_class->max_cpus) {
         error_report("Invalid SMP CPUs %d. The max CPUs "
-                     "supported by machine '%s' is %d", max_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->smp.max_cpus,
                      machine_class->name, machine_class->max_cpus);
         exit(1);
     }
-- 
2.21.0


