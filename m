Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHa-0003JR-4A
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:27:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHY-0003HB-4r
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHV-0006qe-6E
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:27:52 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:38250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHU-0006q2-Sr; Mon, 05 Mar 2018 06:27:49 -0500
Received: by mail-wm0-x243.google.com with SMTP id z9so14697094wmb.3;
	Mon, 05 Mar 2018 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Uvb4xx6HQvOOUNFEZHwmspQzY/GrA7Js3UYN9yWK9u4=;
	b=c46vnz0rzSMcVpY5Q1flJr4PSCUM9VTdL391denodfaPMeDEpYHXDxcxq/ey6WrjYL
	EqRgDY2ipJk7e4fBDUrt6cHXm53SD37IXiCAnfqxXeUS9KfwKjw6Mvy9EavIJywiDBt6
	GUp1I/XmpyRNa1d+ioWFSAr5CQeOSooWiOUowa7rcUxMzhqqkTptJ8WWkb4BlTMk2uXi
	o8Y9hjx5gc4LkPyaEVqpILImha6v/tbWMb12ukVEM/uQyMD5b65MMVwbcCFriuUkXZWa
	tMYStEgr9K1bfw2KhrUh0CsIKw+YTyzctCWVvhYnFVO+Ao0fhifXgvvPb1CrxV+vUwpf
	2ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Uvb4xx6HQvOOUNFEZHwmspQzY/GrA7Js3UYN9yWK9u4=;
	b=DeR6gJmUFc76y5metRMP67d71zud9Whjbfq7Nz3MMIjDAveqBOpqjdXqFKUqUPhmze
	+FiTjM3STO3B6FatGoEFeVhToTBuOlNRXjEU1ZDqXvSDFK+sfNmI48bQtw/nG5boZipt
	xTp7o0k7X0h9iIhPhrY7dnxBhhvsr/V6dh2s14637Lh9lzKoefEly1bWVnQUz3Wolmen
	gMG/twWpts2yHFoIVLq3JlxOGdPS2Cfa6gfUk+2Dom5DLDm4nyO5CI9d68zhGWv3pSRD
	JUcphjmxiSnXWcA13ezWJLAxuBO2txCtRueYfis6g17+MtaNHeafSBvM5Q9KVNDsupzi
	aXag==
X-Gm-Message-State: AElRT7GlSs3bpDgdO+PRQAB4FEhOWW0spCBB1j6KJKqVf2GcicON/aCA
	1P04GsNfHQ6MCdJGCDd/2NWloyu0
X-Google-Smtp-Source: AG47ELs/0HsfZ3nlPjyzAZCA8CtiOoutpCk2dpfqp+FOQroFsBANFxygSz2R5ZdNvkX9JOvW/TAXAA==
X-Received: by 10.28.10.134 with SMTP id 128mr7745603wmk.136.1520249267641;
	Mon, 05 Mar 2018 03:27:47 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:47 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Paul Burton <paul.burton@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@mips.com>
Date: Mon,  5 Mar 2018 08:27:08 -0300
Message-Id: <20180305112732.26471-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-trivial] [PATCH v2 06/30] hw/mips: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:27:53 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/intc/mips_gic.h |  2 +-
 include/hw/mips/bios.h     |  2 +-
 hw/mips/boston.c           |  2 +-
 hw/mips/mips_fulong2e.c    |  6 +++---
 hw/mips/mips_malta.c       | 19 ++++++++++---------
 hw/mips/mips_r4k.c         | 10 +++++-----
 hw/misc/mips_itu.c         |  2 +-
 hw/pci-host/xilinx-pcie.c  |  4 ++--
 8 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index b98d50094a..5ae5a74249 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -19,7 +19,7 @@
 
 /* The MIPS default location */
 #define GIC_BASE_ADDR           0x1bdc0000ULL
-#define GIC_ADDRSPACE_SZ        (128 * 1024)
+#define GIC_ADDRSPACE_SZ        (128 * K_BYTE)
 
 /* Constants */
 #define GIC_POL_POS     1
diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
index b4b88ac43d..c70fab193a 100644
--- a/include/hw/mips/bios.h
+++ b/include/hw/mips/bios.h
@@ -1,6 +1,6 @@
 #include "cpu.h"
 
-#define BIOS_SIZE (4 * 1024 * 1024)
+#define BIOS_SIZE (4 * M_BYTE)
 #ifdef TARGET_WORDS_BIGENDIAN
 #define BIOS_FILENAME "mips_bios.bin"
 #else
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index e99f3638cf..1a1be57ba0 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -436,7 +436,7 @@ static void boston_mach_init(MachineState *machine)
     bool is_64b;
 
     if ((machine->ram_size % G_BYTE) ||
-        (machine->ram_size > (2 * G_BYTE))) {
+        (machine->ram_size > 2 * G_BYTE)) {
         error_report("Memory size must be 1GB or 2GB");
         exit(1);
     }
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index f68c625666..428bf11fb4 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -164,7 +164,7 @@ static int64_t load_kernel (CPUMIPSState *env)
     /* Setup minimum environment variables */
     prom_set(prom_buf, index++, "busclock=33000000");
     prom_set(prom_buf, index++, "cpuclock=100000000");
-    prom_set(prom_buf, index++, "memsize=%i", loaderparams.ram_size/1024/1024);
+    prom_set(prom_buf, index++, "memsize=%llu", loaderparams.ram_size / M_BYTE);
     prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
@@ -281,10 +281,10 @@ static void mips_fulong2e_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, cpu);
 
     /* fulong 2e has 256M ram. */
-    ram_size = 256 * 1024 * 1024;
+    ram_size = 256 * M_BYTE;
 
     /* fulong 2e has a 1M flash.Winbond W39L040AP70Z */
-    bios_size = 1024 * 1024;
+    bios_size = 1 * M_BYTE;
 
     /* allocate RAM */
     memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram", ram_size);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 6f0deb99e7..7d27502b1a 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1033,9 +1033,9 @@ void mips_malta_init(MachineState *machine)
     mips_create_cpu(s, machine->cpu_type, &cbus_irq, &i8259_irq);
 
     /* allocate RAM */
-    if (ram_size > (2048u << 20)) {
-        error_report("Too much memory for this machine: %dMB, maximum 2048MB",
-                     ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 2 * G_BYTE) {
+        error_report("Too much memory for this machine: %lluMB, maximum 2048MB",
+                     ram_size / M_BYTE);
         exit(1);
     }
 
@@ -1046,17 +1046,18 @@ void mips_malta_init(MachineState *machine)
 
     /* alias for pre IO hole access */
     memory_region_init_alias(ram_low_preio, NULL, "mips_malta_low_preio.ram",
-                             ram_high, 0, MIN(ram_size, (256 << 20)));
+                             ram_high, 0, MIN(ram_size, 256 * M_BYTE));
     memory_region_add_subregion(system_memory, 0, ram_low_preio);
 
     /* alias for post IO hole access, if there is enough RAM */
-    if (ram_size > (512 << 20)) {
+    if (ram_size > 512 * M_BYTE) {
         ram_low_postio = g_new(MemoryRegion, 1);
         memory_region_init_alias(ram_low_postio, NULL,
                                  "mips_malta_low_postio.ram",
-                                 ram_high, 512 << 20,
-                                 ram_size - (512 << 20));
-        memory_region_add_subregion(system_memory, 512 << 20, ram_low_postio);
+                                 ram_high, 512 * M_BYTE,
+                                 ram_size - 512 * M_BYTE);
+        memory_region_add_subregion(system_memory, 512 * M_BYTE,
+                                    ram_low_postio);
     }
 
     /* generate SPD EEPROM data */
@@ -1090,7 +1091,7 @@ void mips_malta_init(MachineState *machine)
     bios = pflash_cfi01_get_memory(fl);
     fl_idx++;
     if (kernel_filename) {
-        ram_low_size = MIN(ram_size, 256 << 20);
+        ram_low_size = MIN(ram_size, 256 * M_BYTE);
         /* For KVM we reserve 1MB of RAM for running bootloader */
         if (kvm_enabled()) {
             ram_low_size -= 0x100000;
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 2556786def..b35f1649af 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -143,7 +143,7 @@ static int64_t load_kernel(void)
     }
 
     rom_add_blob_fixed("params", params_buf, params_size,
-                       (16 << 20) - params_size);
+                       16 * M_BYTE - params_size);
 
     g_free(params_buf);
     return entry;
@@ -158,7 +158,7 @@ static void main_cpu_reset(void *opaque)
     env->active_tc.PC = s->vector;
 }
 
-static const int sector_len = 32 * 1024;
+static const int sector_len = 32 * K_BYTE;
 static
 void mips_r4k_init(MachineState *machine)
 {
@@ -194,9 +194,9 @@ void mips_r4k_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
 
     /* allocate RAM */
-    if (ram_size > (256 << 20)) {
-        error_report("Too much memory for this machine: %dMB, maximum 256MB",
-                     ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 256 * M_BYTE) {
+        error_report("Too much memory for this machine: %lluMB, maximum 256MB",
+                     ram_size / M_BYTE);
         exit(1);
     }
     memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_size);
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index ef935b51a8..fc72d376e4 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -83,7 +83,7 @@ static void itc_reconfigure(MIPSITUState *tag)
     uint64_t *am = &tag->ITCAddressMap[0];
     MemoryRegion *mr = &tag->storage_io;
     hwaddr address = am[0] & ITC_AM0_BASE_ADDRESS_MASK;
-    uint64_t size = (1 << 10) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
+    uint64_t size = (1 * K_BYTE) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
     bool is_enabled = (am[0] & ITC_AM0_EN_MASK) != 0;
 
     memory_region_transaction_begin();
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index 044e312dc1..b7272d173a 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -158,9 +158,9 @@ static void xilinx_pcie_host_init(Object *obj)
 static Property xilinx_pcie_host_props[] = {
     DEFINE_PROP_UINT32("bus_nr", XilinxPCIEHost, bus_nr, 0),
     DEFINE_PROP_SIZE("cfg_base", XilinxPCIEHost, cfg_base, 0),
-    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 << 20),
+    DEFINE_PROP_SIZE("cfg_size", XilinxPCIEHost, cfg_size, 32 * M_BYTE),
     DEFINE_PROP_SIZE("mmio_base", XilinxPCIEHost, mmio_base, 0),
-    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 << 20),
+    DEFINE_PROP_SIZE("mmio_size", XilinxPCIEHost, mmio_size, 1 * M_BYTE),
     DEFINE_PROP_BOOL("link_up", XilinxPCIEHost, link_up, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.16.2


