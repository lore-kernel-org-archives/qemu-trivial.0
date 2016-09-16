Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktec-0004IA-ND
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteY-0004CQ-Fc
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteV-0007pU-FO
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdR-0006sh-AJ; Fri, 16 Sep 2016 09:57:50 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F3DD7F7B6;
	Fri, 16 Sep 2016 13:56:49 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkG024127; Fri, 16 Sep 2016 09:56:46 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 16 Sep 2016 15:56:05 +0200
Message-Id: <1474034177-17663-15-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 16 Sep 2016 13:56:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 14/26] x86: use exit(EXIT_SUCCESS) and
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:09 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/intel_iommu.c     |  2 +-
 hw/i386/multiboot.c       | 10 +++++-----
 hw/i386/pc.c              | 24 ++++++++++++------------
 hw/i386/pc_piix.c         |  2 +-
 hw/i386/pc_sysfw.c        |  6 +++---
 hw/i386/x86-iommu.c       |  2 +-
 hw/intc/ioapic.c          |  2 +-
 hw/smbios/smbios.c        | 22 +++++++++++-----------
 hw/xenpv/xen_machine_pv.c |  8 ++++----
 target-i386/kvm.c         |  8 ++++----
 target-i386/machine.c     |  2 +-
 xen-common.c              |  4 ++--
 xen-hvm.c                 |  2 +-
 13 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 28c31a2..a9a8df7 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2473,7 +2473,7 @@ static void vtd_realize(DeviceState *dev, Error **errp)
         !kvm_irqchip_is_split()) {
         error_report("Intel Interrupt Remapping cannot work with "
                      "kernel-irqchip=on, please use 'split|off'.");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 387caa6..e1b9897 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -194,7 +194,7 @@ int load_multiboot(FWCfgState *fw_cfg,
 
         if (((struct elf64_hdr*)header)->e_machine == EM_X86_64) {
             fprintf(stderr, "Cannot load x86-64 image, give a 32bit one.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         kernel_size = load_elf(kernel_filename, NULL, NULL, &elf_entry,
@@ -202,7 +202,7 @@ int load_multiboot(FWCfgState *fw_cfg,
                                0, 0);
         if (kernel_size < 0) {
             fprintf(stderr, "Error while loading elf kernel\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         mh_load_addr = elf_low;
         mb_kernel_size = elf_high - elf_low;
@@ -211,7 +211,7 @@ int load_multiboot(FWCfgState *fw_cfg,
         mbs.mb_buf = g_malloc(mb_kernel_size);
         if (rom_copy(mbs.mb_buf, mh_load_addr, mb_kernel_size) != mb_kernel_size) {
             fprintf(stderr, "Error while fetching elf kernel from rom\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         mb_debug("qemu: loading multiboot-elf kernel (%#x bytes) with entry %#zx\n",
@@ -251,7 +251,7 @@ int load_multiboot(FWCfgState *fw_cfg,
         fseek(f, mb_kernel_text_offset, SEEK_SET);
         if (fread(mbs.mb_buf, 1, mb_load_size, f) != mb_load_size) {
             fprintf(stderr, "fread() failed\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         memset(mbs.mb_buf + mb_load_size, 0, mb_kernel_size - mb_load_size);
         fclose(f);
@@ -308,7 +308,7 @@ int load_multiboot(FWCfgState *fw_cfg,
             mb_mod_length = get_image_size(initrd_filename);
             if (mb_mod_length < 0) {
                 fprintf(stderr, "Failed to open file '%s'\n", initrd_filename);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
 
             mbs.mb_buf_size = TARGET_PAGE_ALIGN(mb_mod_length + mbs.mb_buf_size);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2d6d792..d6095ab 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -854,7 +854,7 @@ static void load_linux(PCMachineState *pcms,
         MIN(ARRAY_SIZE(header), kernel_size)) {
         fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
                 kernel_filename, strerror(errno));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* kernel protocol version */
@@ -957,14 +957,14 @@ static void load_linux(PCMachineState *pcms,
     if (initrd_filename) {
         if (protocol < 0x200) {
             fprintf(stderr, "qemu: linux kernel too old to load a ram disk\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         initrd_size = get_image_size(initrd_filename);
         if (initrd_size < 0) {
             fprintf(stderr, "qemu: error reading initrd %s: %s\n",
                     initrd_filename, strerror(errno));
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         initrd_addr = (initrd_max-initrd_size) & ~4095;
@@ -988,7 +988,7 @@ static void load_linux(PCMachineState *pcms,
     setup_size = (setup_size+1)*512;
     if (setup_size > kernel_size) {
         fprintf(stderr, "qemu: invalid kernel header\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     kernel_size -= setup_size;
 
@@ -997,11 +997,11 @@ static void load_linux(PCMachineState *pcms,
     fseek(f, 0, SEEK_SET);
     if (fread(setup, 1, setup_size, f) != setup_size) {
         fprintf(stderr, "fread() failed\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (fread(kernel, 1, kernel_size, f) != kernel_size) {
         fprintf(stderr, "fread() failed\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     fclose(f);
 
@@ -1009,14 +1009,14 @@ static void load_linux(PCMachineState *pcms,
     if (dtb_filename) {
         if (protocol < 0x209) {
             fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         dtb_size = get_image_size(dtb_filename);
         if (dtb_size <= 0) {
             fprintf(stderr, "qemu: error reading dtb %s: %s\n",
                     dtb_filename, strerror(errno));
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
@@ -1171,13 +1171,13 @@ void pc_cpus_init(PCMachineState *pcms)
     model_pieces = g_strsplit(machine->cpu_model, ",", 2);
     if (!model_pieces[0]) {
         error_report("Invalid/empty CPU model name");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     oc = cpu_class_by_name(TYPE_X86_CPU, model_pieces[0]);
     if (oc == NULL) {
         error_report("Unable to find CPU definition: %s", model_pieces[0]);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     typename = object_class_get_name(oc);
     cc = CPU_CLASS(oc);
@@ -1195,7 +1195,7 @@ void pc_cpus_init(PCMachineState *pcms)
     if (pcms->apic_id_limit > ACPI_CPU_HOTPLUG_ID_LIMIT) {
         error_report("max_cpus is too large. APIC ID of last CPU is %u",
                      pcms->apic_id_limit - 1);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     pcms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
@@ -2096,7 +2096,7 @@ bool pc_machine_is_smm_enabled(PCMachineState *pcms)
 
     if (pcms->smm == ON_OFF_AUTO_ON) {
         error_report("System Management Mode not supported by this hypervisor.");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return false;
 }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a54a468..925fb02 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -404,7 +404,7 @@ static void pc_xen_hvm_init(MachineState *machine)
 
     if (!xen_enabled()) {
         error_report("xenfv machine requires the xen accelerator");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     pc_xen_hvm_init_pci(machine);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index f915ad0..17945a1 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -150,7 +150,7 @@ static void pc_system_flash_init(MemoryRegion *rom_memory)
             error_report("%s", fatal_errmsg);
             loc_pop(&loc);
             g_free(fatal_errmsg);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         phys_addr -= size;
@@ -204,7 +204,7 @@ static void old_pc_system_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
     if (ret != 0) {
     bios_error:
         fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     g_free(filename);
 
@@ -246,7 +246,7 @@ void pc_system_firmware_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
         /* Older KVM cannot execute from device memory. So, flash memory
          * cannot be used unless the readonly memory kvm capability is present. */
         fprintf(stderr, "qemu: pflash with kvm requires KVM readonly memory support\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     pc_system_flash_init(rom_memory);
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index ce26b2a..8852613 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -60,7 +60,7 @@ static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
     if (x86_iommu_default) {
         error_report("QEMU does not support multiple vIOMMUs "
                      "for x86 yet.");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     x86_iommu_default = x86_iommu;
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 31791b0..873c0fd 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -402,7 +402,7 @@ static void ioapic_realize(DeviceState *dev, Error **errp)
     if (s->version != 0x11 && s->version != 0x20) {
         error_report("IOAPIC only supports version 0x11 or 0x20 "
                      "(default: 0x11).");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     memory_region_init_io(&s->io_memory, OBJECT(s), &ioapic_io_ops, s,
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 74c7102..020d52b 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -332,7 +332,7 @@ static void smbios_validate_table(void)
     if (smbios_type4_count && smbios_type4_count != expect_t4_count) {
         error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
                      expect_t4_count, smbios_type4_count);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -733,7 +733,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
                           SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
             error_report("can't process fields for smbios "
                          "types > 1 on machine versions < 2.1!");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         g_free(smbios_entries);
@@ -898,7 +898,7 @@ void smbios_entry_add(QemuOpts *opts)
         size = get_image_size(val);
         if (size == -1 || size < sizeof(struct smbios_structure_header)) {
             error_report("Cannot read SMBIOS file %s", val);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         /*
@@ -912,13 +912,13 @@ void smbios_entry_add(QemuOpts *opts)
 
         if (load_image(val, (uint8_t *)header) != size) {
             error_report("Failed to load SMBIOS file %s", val);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (test_bit(header->type, have_fields_bitmap)) {
             error_report("can't load type %d struct, fields already specified!",
                          header->type);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         set_bit(header->type, have_binfile_bitmap);
 
@@ -964,12 +964,12 @@ void smbios_entry_add(QemuOpts *opts)
 
         if (type > SMBIOS_MAX_TYPE) {
             error_report("out of range!");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (test_bit(type, have_binfile_bitmap)) {
             error_report("can't add fields, binary file already loaded!");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         set_bit(type, have_fields_bitmap);
 
@@ -985,7 +985,7 @@ void smbios_entry_add(QemuOpts *opts)
             if (val) {
                 if (sscanf(val, "%hhu.%hhu", &type0.major, &type0.minor) != 2) {
                     error_report("Invalid release");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 type0.have_major_minor = true;
             }
@@ -1003,7 +1003,7 @@ void smbios_entry_add(QemuOpts *opts)
             if (val) {
                 if (qemu_uuid_parse(val, qemu_uuid) != 0) {
                     error_report("Invalid UUID");
-                    exit(1);
+                    exit(EXIT_FAILURE);
                 }
                 qemu_uuid_set = true;
             }
@@ -1047,10 +1047,10 @@ void smbios_entry_add(QemuOpts *opts)
         default:
             error_report("Don't know how to build fields for SMBIOS type %ld",
                          type);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 
     error_report("Must specify type= or file=");
-    exit(1);
+    exit(EXIT_FAILURE);
 }
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 79aef4e..233ec7c 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -37,7 +37,7 @@ static void xen_init_pv(MachineState *machine)
     /* Initialize backend core & drivers */
     if (xen_be_init() != 0) {
         fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     switch (xen_mode) {
@@ -52,18 +52,18 @@ static void xen_init_pv(MachineState *machine)
         if (xen_domain_build_pv(kernel_filename, initrd_filename,
                                 kernel_cmdline) < 0) {
             fprintf(stderr, "xen pv domain creation failed\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         break;
     }
 #endif
     case XEN_EMULATE:
         fprintf(stderr, "xen emulation not implemented (yet)\n");
-        exit(1);
+        exit(EXIT_FAILURE);
         break;
     default:
         fprintf(stderr, "unhandled xen_mode %d\n", xen_mode);
-        exit(1);
+        exit(EXIT_FAILURE);
         break;
     }
 
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index f1ad805..b5c2e08 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -193,7 +193,7 @@ static struct kvm_cpuid2 *try_get_cpuid(KVMState *s, int max)
         } else {
             fprintf(stderr, "KVM_GET_SUPPORTED_CPUID failed: %s\n",
                     strerror(-r));
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
     return cpuid;
@@ -426,7 +426,7 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr paddr, int code)
 static void hardware_memory_error(void)
 {
     fprintf(stderr, "Hardware memory error!\n");
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 int kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
@@ -3228,7 +3228,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
         for (i = 0; i < IOAPIC_NUM_PINS; i++) {
             if (kvm_irqchip_add_msi_route(s, 0, NULL) < 0) {
                 error_report("Could not enable split IRQ mode.");
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
     }
@@ -3242,7 +3242,7 @@ int kvm_arch_irqchip_create(MachineState *ms, KVMState *s)
         if (ret) {
             error_report("Could not enable split irqchip mode: %s",
                          strerror(-ret));
-            exit(1);
+            exit(EXIT_FAILURE);
         } else {
             DPRINTF("Enabled KVM_CAP_SPLIT_IRQCHIP\n");
             kvm_split_irqchip = true;
diff --git a/target-i386/machine.c b/target-i386/machine.c
index 71c0e4d..56f31ae 100644
--- a/target-i386/machine.c
+++ b/target-i386/machine.c
@@ -142,7 +142,7 @@ static const VMStateDescription vmstate_mtrr_var = {
 static void put_fpreg_error(QEMUFile *f, void *opaque, size_t size)
 {
     fprintf(stderr, "call put_fpreg() with invalid arguments\n");
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 /* XXX: add that in a FPU generic layer */
diff --git a/xen-common.c b/xen-common.c
index e641ad1..4b1c992 100644
--- a/xen-common.c
+++ b/xen-common.c
@@ -92,13 +92,13 @@ static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 
     if (xs == NULL) {
         fprintf(stderr, "xenstore connection not initialized\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
     if (!xs_write(xs, XBT_NULL, path, state, strlen(state))) {
         fprintf(stderr, "error recording dm state\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/xen-hvm.c b/xen-hvm.c
index 2f348ed..328f721 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -1320,7 +1320,7 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
 
 err:
     error_report("xen hardware virtual machine initialisation failed");
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 void destroy_hvm_domain(bool reboot)
-- 
2.5.5


