Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEMl-00006X-0B
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:23:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMg-0008QW-0d
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMe-0004B2-Sj
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEMZ-000475-G4; Sun, 24 Sep 2017 17:22:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CC3D541C95;
	Mon, 25 Sep 2017 00:22:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4008BB6D;
	Mon, 25 Sep 2017 00:22:53 +0300 (MSK)
Received: (nullmailer pid 28243 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:20 +0300
Message-Id: <8d208c2cf20e631221031ba7f0091d0491d05c7d.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/31] Replace round_page() with
 TARGET_PAGE_ALIGN()
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
X-List-Received-Date: Sun, 24 Sep 2017 21:23:03 -0000

From: Kamil Rytarowski <n54@gmx.com>

This change fixes conflict with the DragonFly BSD headers.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/mac_newworld.c | 11 +++--------
 hw/ppc/mac_oldworld.c | 11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 33b46cb50b..d013c412d6 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -124,11 +124,6 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
-{
-    return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
-}
-
 static void ppc_core99_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -252,7 +247,7 @@ static void ppc_core99_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -260,11 +255,11 @@ static void ppc_core99_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 193b9047d9..61838c3e6f 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -66,11 +66,6 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static hwaddr round_page(hwaddr addr)
-{
-    return (addr + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK;
-}
-
 static void ppc_heathrow_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -187,7 +182,7 @@ static void ppc_heathrow_init(MachineState *machine)
         }
         /* load initrd */
         if (initrd_filename) {
-            initrd_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
@@ -195,11 +190,11 @@ static void ppc_heathrow_init(MachineState *machine)
                              initrd_filename);
                 exit(1);
             }
-            cmdline_base = round_page(initrd_base + initrd_size);
+            cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
             initrd_base = 0;
             initrd_size = 0;
-            cmdline_base = round_page(kernel_base + kernel_size + KERNEL_GAP);
+            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-- 
2.11.0


