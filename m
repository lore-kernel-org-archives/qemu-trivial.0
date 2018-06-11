Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSQ-00063t-PV
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSL-0005zK-Du
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSJ-0003V6-Ua
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:13 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSG-0003T6-G7; Sun, 10 Jun 2018 21:17:08 -0400
Received: by mail-qt0-x244.google.com with SMTP id x34-v6so18852706qtk.5;
	Sun, 10 Jun 2018 18:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2OMo50wcwQ+8a7iPDZaZ0i69z1vzVd/aZLrq6D++KhU=;
	b=J7c99VYO20WKzxXuRJVX4CSrDkaPoKlAT62PJsRJVvKP8OAAiiJ92QvOmcgy+56Qfe
	okuZsEdrwkeq397sU5zzdRmI1kvJGNnwLXUgGwprol549OcID7spP2nXybUj88gVZGar
	MiQA0O8Nqm/xRojZSw4vIB9CuvfJrc5Ya+QynIQhmTxyOPVZMNOTeqQzSBpTwQZwB8oG
	q0PA+aGd9iv0BDlD1/LozqTE/pAzfe3ds+I6WeisYIxtHYvuJz4zz6eveUk2bQdPrif0
	CLvYIu5bNQsqUnR0ueoBkC8bB4XPEPs8Lui+5MQm4wRjd27FBGcxVgR5RLcqDeNTGJ64
	4dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2OMo50wcwQ+8a7iPDZaZ0i69z1vzVd/aZLrq6D++KhU=;
	b=tNYgm6u3BoUgc6ymxyH71XAOPzuTDLe9zCW5QgCJWuf34GTlY/zx13Fct6yJ1Ohr2F
	PNbPelZ+G0Q1sUKCMs7qYhAfU6RE8+R8BzolCx8dXGSlCHGHg98eB5067Ilo+EOhXdzP
	131823uBUH0ysR021tZmIiX+pQiRZPBbr5kwlZzS7hW72pGsR/npSmRRd1uDE2v1rs4Z
	rRMxd6aQ2LXVOVlgSPx32Dnrvx7UFxKRBZS8Yi+05MPDXDp8xHKX+OT9A4G3SlLgVvOh
	7XHJ+oIgjbI97BTwdU4qoalE/18J9onEzZ8P2uTXMDJBOArIqGQaV6ZBh/yhRks01GSd
	4JjQ==
X-Gm-Message-State: APt69E3NWDsn8LZFVoSFrIQAwdCOcD4nxou1boWpkM5126DaGMUzMgIq
	AAX1kKKISkJ7Ka5UpvvIxs7r9NNPn1o=
X-Google-Smtp-Source: ADUXVKL2TqPU9rxLtpR2Lr7HXx3v2ppfWW13zBJ/ihKk4SUjAGacFbi8R2isavtkQRV+k8AI7Gqq3g==
X-Received: by 2002:a0c:c981:: with SMTP id
	b1-v6mr13408072qvk.170.1528679828022; 
	Sun, 10 Jun 2018 18:17:08 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>
Date: Sun, 10 Jun 2018 22:14:51 -0300
Message-Id: <20180611011501.10235-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 30/40] hw/mips: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:16 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/mips_gic.h |  3 ++-
 include/hw/mips/bios.h     |  3 ++-
 hw/mips/mips_fulong2e.c    |  7 ++++---
 hw/mips/mips_malta.c       | 23 +++++++++++++----------
 hw/mips/mips_r4k.c         | 11 ++++++-----
 hw/misc/mips_itu.c         |  3 ++-
 hw/pci-host/xilinx-pcie.c  |  5 +++--
 7 files changed, 32 insertions(+), 23 deletions(-)

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
index 02fb2fdcc4..d22f50e97b 100644
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
+    prom_set(prom_buf, index++, "memsize=%llu", loaderparams.ram_size / MiB);
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
index 494f84e290..c8ae477d75 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
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
+        error_report("Too much memory for this machine: %lluMB, maximum 2048MB",
+                     ram_size / MiB);
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
index fc38b4bf99..2be7ed5dc5 100644
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
+        error_report("Too much memory for this machine: %lluMB, maximum 256MB",
+                     ram_size / MiB);
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
2.17.1


