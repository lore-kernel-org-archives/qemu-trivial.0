Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrL-0002Ie-Gj
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrI-0002FB-6P
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrG-00088p-HB
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:40 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:33610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrB-00087O-Db; Mon, 25 Jun 2018 08:44:33 -0400
Received: by mail-qk0-x235.google.com with SMTP id c131-v6so7371701qkb.0;
	Mon, 25 Jun 2018 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4M0caCxGu2A70sPvvaj82hsuFYeC2A74as3zfwEKqvE=;
	b=mQMBAA/5P8FQ/yrHofXaMirN5Fk6hgELcsJ5uZGqlpIeU7vAE+kYOzpG7EICPfwhLh
	eFDX19SkQ82q6jkTJTReiiCVzOUdtK6lBYLdXliDpTgtchyPOZe8wbWUkiQYVcBM34t0
	UJQIAQp/zQoDM5hg+gc5n1MO5dS9I5dc6lBQhXkGPO3ddgv8L+xKLAoYGCf/cLirilwy
	jMkyr9dJ9PueGE39bRH5zuZCacZpoWpQZtBvd/1hNzG1ctnp/ZZu+7mfhkVf/yuBR/D6
	avvuz5Ih9xSKvty66z4C0Cn01b9A0qBgzOn2erxSBIY5sPPryov1FUCY4WhzOuhR8TeO
	yGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4M0caCxGu2A70sPvvaj82hsuFYeC2A74as3zfwEKqvE=;
	b=rFW5/pSeVVmdalLLrioox5jQ9cCMOADp3k2hdmYDJ/IaWA+SEWJe+zBJ+lIhpHsmO/
	x0CNf8kXTwo8T2Njl93QvLk7K8q2tvSWSUlg7RbveM1ZB5PTg+VzqJdFevQb/XYi/Wck
	wpDktifcdk2LmF24s57R0VHavnIgYaWugz9SybeSRlT5sDXumKS3XuA6GipczqI29KVF
	4hoJRIZCkRBySe7rXjNMw9TTTi3VwYWG+NG/tHHoXkKjPWveNTgnX0UiBw+g8mrB863y
	lVi2YgvDNQdLb+5DKmiWFcuQAU7hSrzhJTTVgoI0x/t6xrsTIyi1I4wZCkl223PPJJWU
	E9GA==
X-Gm-Message-State: APt69E3cpzhU704CKEJXUFINvG5TyUJr3cTQ2RjzWQVyjj722iuBj06/
	O7z48aag7P17AG0aQ+xRCy4=
X-Google-Smtp-Source: AAOMgpfjwew3tcbZtchgKakDohp/4CvvM+lrzbqjSOaUqCcwYF/gspMAFZsYSfkV5Hropo3pmKjshg==
X-Received: by 2002:ae9:e118:: with SMTP id
	g24-v6mr9941029qkm.99.1529930672846; 
	Mon, 25 Jun 2018 05:44:32 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>
Date: Mon, 25 Jun 2018 09:42:22 -0300
Message-Id: <20180625124238.25339-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v5 30/46] hw/mips: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:41 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/mips_gic.h |  3 ++-
 include/hw/mips/bios.h     |  3 ++-
 hw/mips/mips_fulong2e.c    |  7 ++++---
 hw/mips/mips_malta.c       | 25 ++++++++++++++-----------
 hw/mips/mips_r4k.c         | 11 ++++++-----
 hw/misc/mips_itu.c         |  3 ++-
 hw/pci-host/xilinx-pcie.c  |  5 +++--
 7 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index b98d50094a..902a12b178 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -11,6 +11,7 @@
 #ifndef MIPS_GIC_H
 #define MIPS_GIC_H
 
+#include "qemu/units.h"
 #include "hw/timer/mips_gictimer.h"
 #include "cpu.h"
 /*
@@ -19,7 +20,7 @@
 
 /* The MIPS default location */
 #define GIC_BASE_ADDR           0x1bdc0000ULL
-#define GIC_ADDRSPACE_SZ        (128 * 1024)
+#define GIC_ADDRSPACE_SZ        (128 * KiB)
 
 /* Constants */
 #define GIC_POL_POS     1
diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
index b4b88ac43d..d67ef33e83 100644
--- a/include/hw/mips/bios.h
+++ b/include/hw/mips/bios.h
@@ -1,6 +1,7 @@
+#include "qemu/units.h"
 #include "cpu.h"
 
-#define BIOS_SIZE (4 * 1024 * 1024)
+#define BIOS_SIZE (4 * MiB)
 #ifdef TARGET_WORDS_BIGENDIAN
 #define BIOS_FILENAME "mips_bios.bin"
 #else
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 02fb2fdcc4..c1694c8254 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/i386/pc.h"
@@ -159,7 +160,7 @@ static int64_t load_kernel (CPUMIPSState *env)
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "busclock=33000000");
     prom_set(prom_buf, index++, "cpuclock=100000000");
-    prom_set(prom_buf, index++, "memsize=%i", loaderparams.ram_size/1024/1024);
+    prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
     prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
@@ -303,10 +304,10 @@ static void mips_fulong2e_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, cpu);
 
     /* fulong 2e has 256M ram. */
-    ram_size = 256 * 1024 * 1024;
+    ram_size = 256 * MiB;
 
     /* fulong 2e has a 1M flash.Winbond W39L040AP70Z */
-    bios_size = 1024 * 1024;
+    bios_size = 1 * MiB;
 
     /* allocate RAM */
     memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram", ram_size);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 494f84e290..010001a0bf 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -191,7 +192,7 @@ static void generate_eeprom_spd(uint8_t *eeprom, ram_addr_t ram_size)
     int i;
 
     /* work in terms of MB */
-    ram_size >>= 20;
+    ram_size /= MiB;
 
     while ((ram_size >= 4) && (nbanks <= 2)) {
         int sz_log2 = MIN(31 - clz32(ram_size), 14);
@@ -843,7 +844,8 @@ static int64_t load_kernel (void)
             /* The kernel allocates the bootmap memory in the low memory after
                the initrd.  It takes at most 128kiB for 2GB RAM and 4kiB
                pages.  */
-            initrd_offset = (loaderparams.ram_low_size - initrd_size - 131072
+            initrd_offset = (loaderparams.ram_low_size - initrd_size
+                             - (128 * KiB)
                              - ~INITRD_PAGE_MASK) & INITRD_PAGE_MASK;
             if (kernel_high >= initrd_offset) {
                 error_report("memory too small for initial ram disk '%s'",
@@ -1021,9 +1023,9 @@ void mips_malta_init(MachineState *machine)
     mips_create_cpu(s, machine->cpu_type, &cbus_irq, &i8259_irq);
 
     /* allocate RAM */
-    if (ram_size > (2048u << 20)) {
-        error_report("Too much memory for this machine: %dMB, maximum 2048MB",
-                     ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 2 * GiB) {
+        error_report("Too much memory for this machine: %" PRId64 "MB,"
+                     " maximum 2048MB", ram_size / MiB);
         exit(1);
     }
 
@@ -1034,17 +1036,18 @@ void mips_malta_init(MachineState *machine)
 
     /* alias for pre IO hole access */
     memory_region_init_alias(ram_low_preio, NULL, "mips_malta_low_preio.ram",
-                             ram_high, 0, MIN(ram_size, (256 << 20)));
+                             ram_high, 0, MIN(ram_size, 256 * MiB));
     memory_region_add_subregion(system_memory, 0, ram_low_preio);
 
     /* alias for post IO hole access, if there is enough RAM */
-    if (ram_size > (512 << 20)) {
+    if (ram_size > 512 * MiB) {
         ram_low_postio = g_new(MemoryRegion, 1);
         memory_region_init_alias(ram_low_postio, NULL,
                                  "mips_malta_low_postio.ram",
-                                 ram_high, 512 << 20,
-                                 ram_size - (512 << 20));
-        memory_region_add_subregion(system_memory, 512 << 20, ram_low_postio);
+                                 ram_high, 512 * MiB,
+                                 ram_size - 512 * MiB);
+        memory_region_add_subregion(system_memory, 512 * MiB,
+                                    ram_low_postio);
     }
 
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -1076,7 +1079,7 @@ void mips_malta_init(MachineState *machine)
     bios = pflash_cfi01_get_memory(fl);
     fl_idx++;
     if (kernel_filename) {
-        ram_low_size = MIN(ram_size, 256 << 20);
+        ram_low_size = MIN(ram_size, 256 * MiB);
         /* For KVM we reserve 1MB of RAM for running bootloader */
         if (kvm_enabled()) {
             ram_low_size -= 0x100000;
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index fc38b4bf99..d5725d0555 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -8,6 +8,7 @@
  * the standard PC ISA addresses.
 */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -143,7 +144,7 @@ static int64_t load_kernel(void)
     }
 
     rom_add_blob_fixed("params", params_buf, params_size,
-                       (16 << 20) - params_size);
+                       16 * MiB - params_size);
 
     g_free(params_buf);
     return entry;
@@ -158,7 +159,7 @@ static void main_cpu_reset(void *opaque)
     env->active_tc.PC = s->vector;
 }
 
-static const int sector_len = 32 * 1024;
+static const int sector_len = 32 * KiB;
 static
 void mips_r4k_init(MachineState *machine)
 {
@@ -194,9 +195,9 @@ void mips_r4k_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
 
     /* allocate RAM */
-    if (ram_size > (256 << 20)) {
-        error_report("Too much memory for this machine: %dMB, maximum 256MB",
-                     ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 256 * MiB) {
+        error_report("Too much memory for this machine: %" PRId64 "MB,"
+                     " maximum 256MB", ram_size / MiB);
         exit(1);
     }
     memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_size);
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index ccc4c7d98a..43bbec46cf 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
@@ -80,7 +81,7 @@ static void itc_reconfigure(MIPSITUState *tag)
     uint64_t *am = &tag->ITCAddressMap[0];
     MemoryRegion *mr = &tag->storage_io;
     hwaddr address = am[0] & ITC_AM0_BASE_ADDRESS_MASK;
-    uint64_t size = (1 << 10) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
+    uint64_t size = (1 * KiB) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
     bool is_enabled = (am[0] & ITC_AM0_EN_MASK) != 0;
 
     memory_region_transaction_begin();
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index 044e312dc1..ff0cf38156 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci-host/xilinx-pcie.h"
@@ -158,9 +159,9 @@ static void xilinx_pcie_host_init(Object *obj)
 static Property xilinx_pcie_host_props[] = {
     DEFINE_PROP_UINT32("bus_nr", XilinxPCIEHost, bus_nr, 0),
     DEFINE_PROP_SIZE("cfg_base", XilinxPCIEHost, cfg_base, 0),
-    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 << 20),
+    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 * MiB),
     DEFINE_PROP_SIZE("mmio_base", XilinxPCIEHost, mmio_base, 0),
-    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 << 20),
+    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 * MiB),
     DEFINE_PROP_BOOL("link_up", XilinxPCIEHost, link_up, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.18.0


