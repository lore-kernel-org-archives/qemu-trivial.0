Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nD3-0007pz-Bs
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 04:49:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nD1-0007ob-0I
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1h9nCz-0006cH-3F
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 04:49:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:30620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1h9nCx-0006Wd-8v; Fri, 29 Mar 2019 04:49:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2019 01:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129706952"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by orsmga008.jf.intel.com with ESMTP; 29 Mar 2019 01:49:47 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Date: Fri, 29 Mar 2019 16:48:45 +0800
Message-Id: <1553849325-44201-10-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-trivial] [Qemu-devel] [PATCH 9/9] cpu/topology: replace smp
 global variables with machine propertie
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
 vl.c | 53 ++++++++++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/vl.c b/vl.c
index 9089253..0c5a384 100644
--- a/vl.c
+++ b/vl.c
@@ -162,10 +162,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
-unsigned int smp_cpus;
-unsigned int max_cpus;
-int smp_cores = 1;
-int smp_threads = 1;
 int acpi_enabled = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
@@ -1281,8 +1277,9 @@ static void smp_parse(QemuOpts *opts)
                 sockets = sockets > 0 ? sockets : 1;
                 cpus = cores * threads * sockets;
             } else {
-                max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = max_cpus / (cores * threads);
+                current_machine->topo.max_cpus =
+                                qemu_opt_get_number(opts, "maxcpus", cpus);
+                sockets = current_machine->topo.max_cpus / (cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
@@ -1299,34 +1296,37 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
-        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+        current_machine->topo.max_cpus =
+                                qemu_opt_get_number(opts, "maxcpus", cpus);
 
-        if (max_cpus < cpus) {
+        if (current_machine->topo.max_cpus < cpus) {
             error_report("maxcpus must be equal to or greater than smp");
             exit(1);
         }
 
-        if (sockets * cores * threads > max_cpus) {
+        if (sockets * cores * threads > current_machine->topo.max_cpus) {
             error_report("cpu topology: "
                          "sockets (%u) * cores (%u) * threads (%u) > "
                          "maxcpus (%u)",
-                         sockets, cores, threads, max_cpus);
+                         sockets, cores, threads,
+                         current_machine->topo.max_cpus);
             exit(1);
         }
 
-        if (sockets * cores * threads != max_cpus) {
+        if (sockets * cores * threads != current_machine->topo.max_cpus) {
             warn_report("Invalid CPU topology deprecated: "
                         "sockets (%u) * cores (%u) * threads (%u) "
                         "!= maxcpus (%u)",
-                        sockets, cores, threads, max_cpus);
+                        sockets, cores, threads,
+                        current_machine->topo.max_cpus);
         }
 
-        smp_cpus = cpus;
-        smp_cores = cores;
-        smp_threads = threads;
+        current_machine->topo.smp_cpus = cpus;
+        current_machine->topo.smp_cores = cores;
+        current_machine->topo.smp_threads = threads;
     }
 
-    if (smp_cpus > 1) {
+    if (current_machine->topo.smp_cpus > 1) {
         Error *blocker = NULL;
         error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
         replay_add_blocker(blocker);
@@ -4111,26 +4111,25 @@ int main(int argc, char **argv, char **envp)
     machine_class->default_cpus = machine_class->default_cpus ?: 1;
 
     /* default to machine_class->default_cpus */
-    smp_cpus = machine_class->default_cpus;
-    max_cpus = machine_class->default_cpus;
+    current_machine->topo.smp_cpus = machine_class->default_cpus;
+    current_machine->topo.max_cpus = machine_class->max_cpus;
+    current_machine->topo.smp_cores = 1;
+    current_machine->topo.smp_threads = 1;
 
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
-    current_machine->topo.smp_cpus = smp_cpus;
-    current_machine->topo.max_cpus = max_cpus;
-    current_machine->topo.smp_cores = smp_cores;
-    current_machine->topo.smp_threads = smp_threads;
-
     /* sanity-check smp_cpus and max_cpus against machine_class */
-    if (smp_cpus < machine_class->min_cpus) {
+    if (current_machine->topo.smp_cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
-                     "supported by machine '%s' is %d", smp_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->topo.smp_cpus,
                      machine_class->name, machine_class->min_cpus);
         exit(1);
     }
-    if (max_cpus > machine_class->max_cpus) {
+    if (current_machine->topo.max_cpus > machine_class->max_cpus) {
         error_report("Invalid SMP CPUs %d. The max CPUs "
-                     "supported by machine '%s' is %d", max_cpus,
+                     "supported by machine '%s' is %d",
+                     current_machine->topo.max_cpus,
                      machine_class->name, machine_class->max_cpus);
         exit(1);
     }
-- 
1.8.3.1


