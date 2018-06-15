Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTkMK-0008II-BP
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 04:45:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTkMH-0008Gf-JH
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 04:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fTkMG-0002nu-66
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 04:45:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33438 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fTkLx-0002MC-5B; Fri, 15 Jun 2018 04:45:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F4F28A702;
	Fri, 15 Jun 2018 08:45:04 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-79.ams2.redhat.com [10.36.116.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1BDB2023580;
	Fri, 15 Jun 2018 08:45:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Jun 2018 10:45:00 +0200
Message-Id: <1529052300-23093-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 08:45:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 08:45:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
X-List-Received-Date: Fri, 15 Jun 2018 08:45:27 -0000

The rom_ptr() function allows direct access to the ROM blobs that we
load during startup. However, there are currently no checks for the
size of the accesses, so it's currently possible to crash QEMU for
example with:

$ echo "Insane in the mainframe" > /tmp/test.txt
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
Segmentation fault (core dumped)
$ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
Segmentation fault (core dumped)
$ echo -n HdrS > /tmp/hdr.txt
$ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
Segmentation fault (core dumped)

We need a possibility to check the size of the ROM area that we want
to access, thus let's add a size parameter to the rom_ptr() function
to avoid these problems.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Add sparc64 crash to the patch description
 - Added Cornelia's Rb from v1
 - NULL pointer check in the sparc machines

 hw/core/loader.c     | 10 +++++-----
 hw/mips/mips_malta.c |  6 ++++--
 hw/s390x/ipl.c       | 13 ++++++++++---
 hw/sparc/sun4m.c     |  4 ++--
 hw/sparc64/sun4u.c   |  4 ++--
 include/hw/loader.h  |  2 +-
 target/arm/cpu.c     |  2 +-
 7 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 06bdbca..54be522 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -191,7 +191,7 @@ void pstrcpy_targphys(const char *name, hwaddr dest, int buf_size,
         rom_add_blob_fixed(name, source, (nulp - source) + 1, dest);
     } else {
         rom_add_blob_fixed(name, source, buf_size, dest);
-        ptr = rom_ptr(dest + buf_size - 1);
+        ptr = rom_ptr(dest + buf_size - 1, sizeof(*ptr));
         *ptr = 0;
     }
 }
@@ -1165,7 +1165,7 @@ void rom_reset_order_override(void)
     fw_cfg_reset_order_override(fw_cfg);
 }
 
-static Rom *find_rom(hwaddr addr)
+static Rom *find_rom(hwaddr addr, size_t size)
 {
     Rom *rom;
 
@@ -1176,7 +1176,7 @@ static Rom *find_rom(hwaddr addr)
         if (rom->mr) {
             continue;
         }
-        if (rom->addr > addr) {
+        if (rom->addr > addr + size) {
             continue;
         }
         if (rom->addr + rom->romsize < addr) {
@@ -1249,11 +1249,11 @@ int rom_copy(uint8_t *dest, hwaddr addr, size_t size)
     return (d + l) - dest;
 }
 
-void *rom_ptr(hwaddr addr)
+void *rom_ptr(hwaddr addr, size_t size)
 {
     Rom *rom;
 
-    rom = find_rom(addr);
+    rom = find_rom(addr, size);
     if (!rom || !rom->data)
         return NULL;
     return rom->data + (addr - rom->addr);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 494f84e..3733e2f 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1133,11 +1133,13 @@ void mips_malta_init(MachineState *machine)
            a neat trick which allows bi-endian firmware. */
 #ifndef TARGET_WORDS_BIGENDIAN
         {
-            uint32_t *end, *addr = rom_ptr(FLASH_ADDRESS);
+            uint32_t *end, *addr;
+            const size_t swapsize = MIN(bios_size, 0x3e0000);
+            addr = rom_ptr(FLASH_ADDRESS, swapsize);
             if (!addr) {
                 addr = memory_region_get_ram_ptr(bios);
             }
-            end = (void *)addr + MIN(bios_size, 0x3e0000);
+            end = (void *)addr + swapsize;
             while (addr < end) {
                 bswap32s(addr);
                 addr++;
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 04245b5..bcac204 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -169,9 +169,12 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
          * loader) and it won't work. For this case we force it to 0x10000, too.
          */
         if (pentry == KERN_IMAGE_START || pentry == 0x800) {
+            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
-            strcpy(rom_ptr(KERN_PARM_AREA), ipl->cmdline);
+            if (parm_area) {
+                strcpy(parm_area, ipl->cmdline);
+            }
         } else {
             ipl->start_addr = pentry;
         }
@@ -179,6 +182,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
         if (ipl->initrd) {
             ram_addr_t initrd_offset;
             int initrd_size;
+            uint64_t *romptr;
 
             initrd_offset = INITRD_START;
             while (kernel_size + 0x100000 > initrd_offset) {
@@ -195,8 +199,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
              * we have to overwrite values in the kernel image,
              * which are "rom"
              */
-            stq_p(rom_ptr(INITRD_PARM_START), initrd_offset);
-            stq_p(rom_ptr(INITRD_PARM_SIZE), initrd_size);
+            romptr = rom_ptr(INITRD_PARM_START, 16);
+            if (romptr) {
+                stq_p(romptr, initrd_offset);
+                stq_p(romptr + 1, initrd_size);
+            }
         }
     }
     /*
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 0ee779f..8eef74b 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -272,8 +272,8 @@ static unsigned long sun4m_load_kernel(const char *kernel_filename,
         }
         if (initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(KERNEL_LOAD_ADDR + i);
-                if (ldl_p(ptr) == 0x48647253) { // HdrS
+                ptr = rom_ptr(KERNEL_LOAD_ADDR + i, 24);
+                if (ptr && ldl_p(ptr) == 0x48647253) { /* HdrS */
                     stl_p(ptr + 16, INITRD_LOAD_ADDR);
                     stl_p(ptr + 20, initrd_size);
                     break;
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1bede85..5b76863 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -186,8 +186,8 @@ static uint64_t sun4u_load_kernel(const char *kernel_filename,
         }
         if (*initrd_size > 0) {
             for (i = 0; i < 64 * TARGET_PAGE_SIZE; i += TARGET_PAGE_SIZE) {
-                ptr = rom_ptr(*kernel_addr + i);
-                if (ldl_p(ptr + 8) == 0x48647253) { /* HdrS */
+                ptr = rom_ptr(*kernel_addr + i, 32);
+                if (ptr && ldl_p(ptr + 8) == 0x48647253) { /* HdrS */
                     stl_p(ptr + 24, *initrd_addr + *kernel_addr);
                     stl_p(ptr + 28, *initrd_size);
                     break;
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5ed3fd8..e98b84b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -226,7 +226,7 @@ void rom_set_fw(FWCfgState *f);
 void rom_set_order_override(int order);
 void rom_reset_order_override(void);
 int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
-void *rom_ptr(hwaddr addr);
+void *rom_ptr(hwaddr addr, size_t size);
 void hmp_info_roms(Monitor *mon, const QDict *qdict);
 
 #define rom_add_file_fixed(_f, _a, _i)          \
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ab047b9..95f92b2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -232,7 +232,7 @@ static void arm_cpu_reset(CPUState *s)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase);
+        rom = rom_ptr(vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
1.8.3.1


