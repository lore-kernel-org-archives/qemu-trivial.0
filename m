Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktev-0004Ze-LN
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteo-0004Qv-3n
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktei-00083r-M9
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteW-00076A-Kd; Fri, 16 Sep 2016 09:58:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7ABF4C056793;
	Fri, 16 Sep 2016 13:56:44 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkE024127; Fri, 16 Sep 2016 09:56:42 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 16 Sep 2016 15:56:03 +0200
Message-Id: <1474034177-17663-13-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 16 Sep 2016 13:56:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 12/26] sparc: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:27 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/leon3.c   | 12 ++++++------
 hw/sparc/sun4m.c   | 22 +++++++++++-----------
 hw/sparc64/sun4u.c |  8 ++++----
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 6e16478..9cc5b94 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -130,7 +130,7 @@ static void leon3_generic_hw_init(MachineState *machine)
     cpu = cpu_sparc_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "qemu: Unable to find Sparc CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -152,7 +152,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         fprintf(stderr,
                 "qemu: Too much memory for this machine: %d, maximum 1G\n",
                 (unsigned int)(ram_size / (1024 * 1024)));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_allocate_system_memory(ram, NULL, "leon3.ram", ram_size);
@@ -180,18 +180,18 @@ static void leon3_generic_hw_init(MachineState *machine)
     if (bios_size > prom_size) {
         fprintf(stderr, "qemu: could not load prom '%s': file too big\n",
                 filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (bios_size > 0) {
         ret = load_image_targphys(filename, 0x00000000, bios_size);
         if (ret < 0 || ret > prom_size) {
             fprintf(stderr, "qemu: could not load prom '%s'\n", filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else if (kernel_filename == NULL && !qtest_enabled()) {
         fprintf(stderr, "Can't read bios image %s\n", filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     g_free(filename);
 
@@ -205,7 +205,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (bios_size <= 0) {
             /* If there is no bios/monitor, start the application.  */
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 478fda8..d3d6bd5 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -295,7 +295,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /* load initrd */
@@ -307,7 +307,7 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
             if (initrd_size < 0) {
                 fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                         initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
         if (initrd_size > 0) {
@@ -737,7 +737,7 @@ static void prom_init(hwaddr addr, const char *bios_name)
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
         fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -807,7 +807,7 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
                 "qemu: Too much memory for this machine: %d, maximum %d\n",
                 (unsigned int)(RAM_size / (1024 * 1024)),
                 (unsigned int)(max_mem / (1024 * 1024)));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     dev = qdev_create(NULL, "memory");
     s = SYS_BUS_DEVICE(dev);
@@ -850,7 +850,7 @@ static void cpu_devinit(const char *cpu_model, unsigned int id,
     cpu = cpu_sparc_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "qemu: Unable to find Sparc CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -944,21 +944,21 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
 
     if (graphic_depth != 8 && graphic_depth != 24) {
         error_report("Unsupported depth: %d", graphic_depth);
-        exit (1);
+        exit(EXIT_FAILURE);
     }
     num_vsimms = 0;
     if (num_vsimms == 0) {
         if (vga_interface_type == VGA_CG3) {
             if (graphic_depth != 8) {
                 error_report("Unsupported depth: %d", graphic_depth);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             if (!(graphic_width == 1024 && graphic_height == 768) &&
                 !(graphic_width == 1152 && graphic_height == 900)) {
                 error_report("Unsupported resolution: %d x %d", graphic_width,
                              graphic_height);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             /* sbus irq 5 */
@@ -968,13 +968,13 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
             /* If no display specified, default to TCX */
             if (graphic_depth != 8 && graphic_depth != 24) {
                 error_report("Unsupported depth: %d", graphic_depth);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             if (!(graphic_width == 1024 && graphic_height == 768)) {
                 error_report("Unsupported resolution: %d x %d",
                              graphic_width, graphic_height);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
@@ -1025,7 +1025,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
 
     if (drive_get_max_bus(IF_SCSI) > 0) {
         fprintf(stderr, "qemu: too many SCSI bus\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     esp_init(hwdef->esp_base, 2,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 3165e18..5ed72e5 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -207,7 +207,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load kernel '%s'\n",
                     kernel_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         /* load initrd above kernel */
         *initrd_size = 0;
@@ -220,7 +220,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
             if ((int)*initrd_size < 0) {
                 fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                         initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
         if (*initrd_size > 0) {
@@ -647,7 +647,7 @@ static void prom_init(hwaddr addr, const char *bios_name)
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
         fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -760,7 +760,7 @@ static SPARCCPU *cpu_devinit(const char *cpu_model, const struct hwdef *hwdef)
     cpu = cpu_sparc_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find Sparc CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
-- 
2.5.5


