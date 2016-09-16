Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkteo-0004TJ-Ut
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktek-0004Oz-WB
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktei-00083h-Ku
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktea-00079l-Mf; Fri, 16 Sep 2016 09:58:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BD1F80501;
	Fri, 16 Sep 2016 13:57:03 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkN024127; Fri, 16 Sep 2016 09:57:01 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:56:12 +0200
Message-Id: <1474034177-17663-22-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Sep 2016 13:57:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 21/26] misc machine: use exit(EXIT_SUCCESS)
 and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:20 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/cris/axis_dev88.c           | 2 +-
 hw/lm32/lm32_boards.c          | 8 ++++----
 hw/lm32/milkymist.c            | 6 +++---
 hw/openrisc/openrisc_sim.c     | 4 ++--
 hw/tricore/tricore_testboard.c | 4 ++--
 hw/unicore32/puv3.c            | 6 +++---
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 60df887..fb022dd 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -351,7 +351,7 @@ void axisdev88_init(MachineState *machine)
         cris_load_image(cpu, &li);
     } else if (!qtest_enabled()) {
         fprintf(stderr, "Kernel image must be specified\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 8f0c307..7e4ccc3 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -107,7 +107,7 @@ static void lm32_evr_init(MachineState *machine)
     cpu = cpu_lm32_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "qemu: unable to find CPU '%s'\n", cpu_model);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     env = &cpu->env;
@@ -158,7 +158,7 @@ static void lm32_evr_init(MachineState *machine)
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -208,7 +208,7 @@ static void lm32_uclinux_init(MachineState *machine)
     cpu = cpu_lm32_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "qemu: unable to find CPU '%s'\n", cpu_model);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     env = &cpu->env;
@@ -260,7 +260,7 @@ static void lm32_uclinux_init(MachineState *machine)
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 5cae0f1..de1147e 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -114,7 +114,7 @@ milkymist_init(MachineState *machine)
     cpu = cpu_lm32_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "qemu: unable to find CPU '%s'\n", cpu_model);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     env = &cpu->env;
@@ -155,7 +155,7 @@ milkymist_init(MachineState *machine)
     if (!kernel_filename && !dinfo && !bios_filename && !qtest_enabled()) {
         fprintf(stderr, "qemu: could not load Milkymist One bios '%s'\n",
                 bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     g_free(bios_filename);
 
@@ -194,7 +194,7 @@ milkymist_init(MachineState *machine)
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 6d06d5b..48764b6 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -89,7 +89,7 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
         if (kernel_size < 0) {
             fprintf(stderr, "QEMU: couldn't load the kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         cpu->env.pc = entry;
     }
@@ -112,7 +112,7 @@ static void openrisc_sim_init(MachineState *machine)
         cpu = cpu_openrisc_init(cpu_model);
         if (cpu == NULL) {
             fprintf(stderr, "Unable to find CPU definition!\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         qemu_register_reset(main_cpu_reset, cpu);
         main_cpu_reset(cpu);
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 19dd587..ccc0703 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -52,7 +52,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
     if (kernel_size <= 0) {
         error_report("qemu: no kernel file '%s'",
                 tricoretb_binfo.kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env->PC = entry;
 
@@ -77,7 +77,7 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
     cpu = cpu_tricore_init(machine->cpu_model);
     if (!cpu) {
         error_report("Unable to find CPU definition");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
     memory_region_init_ram(ext_cram, NULL, "powerlink_ext_c.ram", 2*1024*1024,
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 31cd171..f9c65be 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -101,7 +101,7 @@ static void puv3_load_kernel(const char *kernel_filename)
             KERNEL_MAX_SIZE);
     if (size < 0) {
         error_report("Load kernel error: '%s'", kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* cheat curses that we have a graphic console, only under ocd console */
@@ -119,7 +119,7 @@ static void puv3_init(MachineState *machine)
 
     if (initrd_filename) {
         error_report("Please use kernel built-in initramdisk");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (!cpu_model) {
@@ -129,7 +129,7 @@ static void puv3_init(MachineState *machine)
     cpu = uc32_cpu_init(cpu_model);
     if (!cpu) {
         error_report("Unable to find CPU definition");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
-- 
2.5.5


