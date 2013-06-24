Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur4bz-0005jW-Gf
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 07:07:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur4bw-0005fR-Gr
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 07:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ur4bu-0006ki-1P
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 07:07:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ur4bp-0006jI-1O; Mon, 24 Jun 2013 07:06:57 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 88C0E42612;
	Mon, 24 Jun 2013 15:06:55 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 6AC60562; Mon, 24 Jun 2013 15:06:53 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@us.ibm.com>
Date: Mon, 24 Jun 2013 15:06:52 +0400
Message-Id: <1372072012-30305-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] vl: convert -smp to qemu_opts_parse()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2013 11:07:06 -0000

This also introduces a new suboption, "cpus=",
which is the default.  So after this patch,

 -smp n,sockets=y

is the same as

  -smp cpus=n,sockets=y

(with "cpu" being some generic thing, referring to
either cores, or threads, or sockets, as before).

We still don't validate relations between different
numbers, for example it is still possible to say

  -smp 1,sockets=10

and it will be accepted to mean sockets=1.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx |    4 +-
 vl.c            |  122 +++++++++++++++++++++++++++++++------------------------
 2 files changed, 71 insertions(+), 55 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8355f9b..982e312 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -73,7 +73,7 @@ Select CPU model (@code{-cpu help} for list and additional feature selection)
 ETEXI
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total cpus, including\n"
     "                offline CPUs for hotplug, etc\n"
@@ -82,7 +82,7 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
     "                sockets= number of discrete sockets in the system\n",
         QEMU_ARCH_ALL)
 STEXI
-@item -smp @var{n}[,cores=@var{cores}][,threads=@var{threads}][,sockets=@var{sockets}][,maxcpus=@var{maxcpus}]
+@item -smp [cpus=]@var{n}[,cores=@var{cores}][,threads=@var{threads}][,sockets=@var{sockets}][,maxcpus=@var{maxcpus}]
 @findex -smp
 Simulate an SMP system with @var{n} CPUs. On the PC target, up to 255
 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
diff --git a/vl.c b/vl.c
index 767e020..c0c842c 100644
--- a/vl.c
+++ b/vl.c
@@ -1401,48 +1401,79 @@ static void numa_add(const char *optarg)
     }
 }
 
-static void smp_parse(const char *optarg)
+static QemuOptsList qemu_smp_opts = {
+    .name = "smp-opts",
+    .implied_opt_name = "cpus",
+    .merge_lists = true,
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_smp_opts.head),
+    .desc = {
+        {
+            .name = "cpus",
+            .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "sockets",
+            .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "cores",
+            .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "threads",
+            .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "maxcpus",
+            .type = QEMU_OPT_NUMBER,
+        },
+        { /*End of list */ }
+    },
+};
+
+static void smp_parse(QemuOpts *opts)
 {
-    int smp, sockets = 0, threads = 0, cores = 0;
-    char *endptr;
-    char option[128];
+    if (opts) {
 
-    smp = strtoul(optarg, &endptr, 10);
-    if (endptr != optarg) {
-        if (*endptr == ',') {
-            endptr++;
-        }
-    }
-    if (get_param_value(option, 128, "sockets", endptr) != 0)
-        sockets = strtoull(option, NULL, 10);
-    if (get_param_value(option, 128, "cores", endptr) != 0)
-        cores = strtoull(option, NULL, 10);
-    if (get_param_value(option, 128, "threads", endptr) != 0)
-        threads = strtoull(option, NULL, 10);
-    if (get_param_value(option, 128, "maxcpus", endptr) != 0)
-        max_cpus = strtoull(option, NULL, 10);
-
-    /* compute missing values, prefer sockets over cores over threads */
-    if (smp == 0 || sockets == 0) {
-        sockets = sockets > 0 ? sockets : 1;
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        if (smp == 0) {
-            smp = cores * threads * sockets;
-        }
-    } else {
-        if (cores == 0) {
+        unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
+        unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
+        unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+
+        /* compute missing values, prefer sockets over cores over threads */
+        if (cpus == 0 || sockets == 0) {
+            sockets = sockets > 0 ? sockets : 1;
+            cores = cores > 0 ? cores : 1;
             threads = threads > 0 ? threads : 1;
-            cores = smp / (sockets * threads);
+            if (cpus == 0) {
+                cpus = cores * threads * sockets;
+            }
         } else {
-            threads = smp / (cores * sockets);
+            if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = cpus / (sockets * threads);
+            } else {
+                threads = cpus / (cores * sockets);
+            }
         }
+
+        max_cpus = qemu_opt_get_number(opts, "maxcpus", 0);
+
+        smp_cpus = cpus;
+        smp_cores = cores > 0 ? cores : 1;
+        smp_threads = threads > 0 ? threads : 1;
+
     }
-    smp_cpus = smp;
-    smp_cores = cores > 0 ? cores : 1;
-    smp_threads = threads > 0 ? threads : 1;
-    if (max_cpus == 0)
+
+    if (max_cpus == 0) {
         max_cpus = smp_cpus;
+    }
+
+    if (max_cpus > 255) {
+        fprintf(stderr, "Unsupported number of maxcpus\n");
+        exit(1);
+    }
+    if (max_cpus < smp_cpus) {
+        fprintf(stderr, "maxcpus must be equal to or greater than smp\n");
+        exit(1);
+    }
+
 }
 
 static void configure_realtime(QemuOpts *opts)
@@ -2895,6 +2926,7 @@ int main(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_machine_opts);
+    qemu_add_opts(&qemu_smp_opts);
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_sandbox_opts);
     qemu_add_opts(&qemu_add_fd_opts);
@@ -3562,18 +3594,7 @@ int main(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_smp:
-                smp_parse(optarg);
-                if (smp_cpus < 1) {
-                    fprintf(stderr, "Invalid number of CPUs\n");
-                    exit(1);
-                }
-                if (max_cpus < smp_cpus) {
-                    fprintf(stderr, "maxcpus must be equal to or greater than "
-                            "smp\n");
-                    exit(1);
-                }
-                if (max_cpus > 255) {
-                    fprintf(stderr, "Unsupported number of maxcpus\n");
+                if (!qemu_opts_parse(qemu_find_opts("smp-opts"), optarg, 1)) {
                     exit(1);
                 }
                 break;
@@ -3897,12 +3918,7 @@ int main(int argc, char **argv, char **envp)
         data_dir[data_dir_idx++] = CONFIG_QEMU_DATADIR;
     }
 
-    /*
-     * Default to max_cpus = smp_cpus, in case the user doesn't
-     * specify a max_cpus value.
-     */
-    if (!max_cpus)
-        max_cpus = smp_cpus;
+    smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
     machine->max_cpus = machine->max_cpus ?: 1; /* Default to UP */
     if (smp_cpus > machine->max_cpus) {
-- 
1.7.10.4


