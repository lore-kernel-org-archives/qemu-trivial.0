Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktev-0004ZE-DG
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktep-0004SD-4e
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktei-00083k-LI
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdf-0006se-5R; Fri, 16 Sep 2016 09:58:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5CBC01B141;
	Fri, 16 Sep 2016 13:56:51 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkH024127; Fri, 16 Sep 2016 09:56:49 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Leon Alrae <leon.alrae@imgtec.com>
Date: Fri, 16 Sep 2016 15:56:06 +0200
Message-Id: <1474034177-17663-16-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 16 Sep 2016 13:56:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 15/26] mips: use exit(EXIT_SUCCESS) and
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
CC: Leon Alrae <leon.alrae@imgtec.com>
---
 hw/mips/mips_fulong2e.c | 12 ++++++------
 hw/mips/mips_jazz.c     | 10 +++++-----
 hw/mips/mips_malta.c    | 20 ++++++++++----------
 hw/mips/mips_mipssim.c  | 10 +++++-----
 hw/mips/mips_r4k.c      | 10 +++++-----
 hw/pci-host/bonito.c    |  2 +-
 6 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 889cdc7..24adc46 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -121,7 +121,7 @@ static int64_t load_kernel (CPUMIPSState *env)
                  (uint64_t *)&kernel_high, 0, EM_MIPS, 1, 0) < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* load initrd */
@@ -135,7 +135,7 @@ static int64_t load_kernel (CPUMIPSState *env)
                 fprintf(stderr,
                         "qemu: memory too small for initial ram disk '%s'\n",
                         loaderparams.initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                      initrd_offset, ram_size - initrd_offset);
@@ -143,7 +143,7 @@ static int64_t load_kernel (CPUMIPSState *env)
         if (initrd_size == (target_ulong) -1) {
             fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                     loaderparams.initrd_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -281,7 +281,7 @@ static void mips_fulong2e_init(MachineState *machine)
     cpu = cpu_mips_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -329,7 +329,7 @@ static void mips_fulong2e_init(MachineState *machine)
         if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
             !kernel_filename && !qtest_enabled()) {
             error_report("Could not load MIPS bios '%s'", bios_name);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -346,7 +346,7 @@ static void mips_fulong2e_init(MachineState *machine)
     isa_bus = vt82c686b_init(pci_bus, PCI_DEVFN(FULONG2E_VIA_SLOT, 0));
     if (!isa_bus) {
         fprintf(stderr, "vt82c686b_init error\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Interrupt controller */
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 73f6c9f..6c4b423 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -154,7 +154,7 @@ static void mips_jazz_init(MachineState *machine,
     cpu = cpu_mips_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
     qemu_register_reset(main_cpu_reset, cpu);
@@ -197,7 +197,7 @@ static void mips_jazz_init(MachineState *machine,
     }
     if ((bios_size < 0 || bios_size > MAGNUM_BIOS_SIZE) && !qtest_enabled()) {
         error_report("Could not load MIPS bios '%s'", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Init CPU internal devices */
@@ -278,10 +278,10 @@ static void mips_jazz_init(MachineState *machine,
             break;
         } else if (is_help_option(nd->model)) {
             fprintf(stderr, "qemu: Supported NICs: dp83932\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         } else {
             fprintf(stderr, "qemu: Unsupported NIC: %s\n", nd->model);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -293,7 +293,7 @@ static void mips_jazz_init(MachineState *machine,
     /* Floppy */
     if (drive_get_max_bus(IF_FLOPPY) >= MAX_FD) {
         fprintf(stderr, "qemu: too many floppy drives\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     for (n = 0; n < MAX_FD; n++) {
         fds[n] = drive_get(IF_FLOPPY, 0, n);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index e90857e..c7baa51 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -803,7 +803,7 @@ static int64_t load_kernel (void)
                  big_endian, EM_MIPS, 1, 0) < 0) {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Sanity check where the kernel has been linked */
@@ -811,7 +811,7 @@ static int64_t load_kernel (void)
         if (kernel_entry & 0x80000000ll) {
             error_report("KVM guest kernels must be linked in useg. "
                          "Did you forget to enable CONFIG_KVM_GUEST?");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         xlate_to_kseg0 = cpu_mips_kvm_um_phys_to_kseg0;
@@ -819,7 +819,7 @@ static int64_t load_kernel (void)
         if (!(kernel_entry & 0x80000000ll)) {
             error_report("KVM guest kernels aren't supported with TCG. "
                          "Did you unintentionally enable CONFIG_KVM_GUEST?");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         xlate_to_kseg0 = cpu_mips_phys_to_kseg0;
@@ -836,7 +836,7 @@ static int64_t load_kernel (void)
                 fprintf(stderr,
                         "qemu: memory too small for initial ram disk '%s'\n",
                         loaderparams.initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
@@ -845,7 +845,7 @@ static int64_t load_kernel (void)
         if (initrd_size == (target_ulong) -1) {
             fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                     loaderparams.initrd_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -921,7 +921,7 @@ static void create_cpu_without_cps(const char *cpu_model,
         cpu = cpu_mips_init(cpu_model);
         if (cpu == NULL) {
             fprintf(stderr, "Unable to find CPU definition\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /* Init internal devices */
@@ -950,7 +950,7 @@ static void create_cps(MaltaState *s, const char *cpu_model,
     object_property_set_bool(OBJECT(s->cps), true, "realized", &err);
     if (err != NULL) {
         error_report("%s", error_get_pretty(err));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s->cps), 0, 0, 1);
@@ -1037,7 +1037,7 @@ void mips_malta_init(MachineState *machine)
         fprintf(stderr,
                 "qemu: Too much memory for this machine: %d MB, maximum 2048 MB\n",
                 ((unsigned int)ram_size / (1 << 20)));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* register RAM at high address where it is undisturbed by IO */
@@ -1121,7 +1121,7 @@ void mips_malta_init(MachineState *machine)
         if (kvm_enabled()) {
             error_report("KVM enabled but no -kernel argument was specified. "
                          "Booting from flash is not supported with KVM.");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         /* Load firmware from flash. */
         if (!dinfo) {
@@ -1141,7 +1141,7 @@ void mips_malta_init(MachineState *machine)
                 !kernel_filename && !qtest_enabled()) {
                 error_report("Could not load MIPS bios '%s', and no "
                              "-kernel argument was specified", bios_name);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
         /* In little endian mode the 32bit words in the bios are swapped,
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 1b91195..d9dc5fa 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -80,7 +80,7 @@ static int64_t load_kernel(void)
     } else {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* load initrd */
@@ -94,7 +94,7 @@ static int64_t load_kernel(void)
                 fprintf(stderr,
                         "qemu: memory too small for initial ram disk '%s'\n",
                         loaderparams.initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                 initrd_offset, loaderparams.ram_size - initrd_offset);
@@ -102,7 +102,7 @@ static int64_t load_kernel(void)
         if (initrd_size == (target_ulong) -1) {
             fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                     loaderparams.initrd_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
     return entry;
@@ -165,7 +165,7 @@ mips_mipssim_init(MachineState *machine)
     cpu = cpu_mips_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -201,7 +201,7 @@ mips_mipssim_init(MachineState *machine)
         /* Bail out if we have neither a kernel image nor boot vector code. */
         error_report("Could not load MIPS bios '%s', and no "
                      "-kernel argument was specified", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     } else {
         /* We have a boot vector start address. */
         env->active_tc.PC = (target_long)(int32_t)0xbfc00000;
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 16a59c7..fd5808e 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -98,7 +98,7 @@ static int64_t load_kernel(void)
     } else {
         fprintf(stderr, "qemu: could not load kernel '%s'\n",
                 loaderparams.kernel_filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* load initrd */
@@ -112,7 +112,7 @@ static int64_t load_kernel(void)
                 fprintf(stderr,
                         "qemu: memory too small for initial ram disk '%s'\n",
                         loaderparams.initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
             initrd_size = load_image_targphys(loaderparams.initrd_filename,
                                               initrd_offset,
@@ -121,7 +121,7 @@ static int64_t load_kernel(void)
         if (initrd_size == (target_ulong) -1) {
             fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
                     loaderparams.initrd_filename);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
@@ -194,7 +194,7 @@ void mips_r4k_init(MachineState *machine)
     cpu = cpu_mips_init(cpu_model);
     if (cpu == NULL) {
         fprintf(stderr, "Unable to find CPU definition\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     env = &cpu->env;
 
@@ -208,7 +208,7 @@ void mips_r4k_init(MachineState *machine)
         fprintf(stderr,
                 "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
                 ((unsigned int)ram_size / (1 << 20)));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_size);
 
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 1999ece..19ae58f 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -451,7 +451,7 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
     if (idsel == 0) {
         fprintf(stderr, "error in bonito pci config address " TARGET_FMT_plx
             ",pcimap_cfg=%x\n", addr, s->regs[BONITO_PCIMAP_CFG]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     pciaddr = PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
     DPRINTF("cfgaddr %x pciaddr %x busno %x devno %d funno %d regno %d\n",
-- 
2.5.5


