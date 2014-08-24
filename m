Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyM-0004Be-Fa
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyG-00040V-Cg
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyB-0006pR-Qs
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxz-0006lE-9A; Sun, 24 Aug 2014 09:36:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 371EC44A05;
	Sun, 24 Aug 2014 17:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 87D376E4;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30079 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:55 +0400
Message-Id: <1408887062-30022-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/11] microblaze: ml605: Get rid of ddr_base
	variable
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:41 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

It's a constant based on a macro. Just use the macro in place.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/microblaze/petalogix_ml605_mmu.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index aea9c5b..6843abf 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -89,7 +89,6 @@ petalogix_ml605_init(MachineState *machine)
     SysBusDevice *busdev;
     DriveInfo *dinfo;
     int i;
-    hwaddr ddr_base = MEMORY_BASEADDR;
     MemoryRegion *phys_lmb_bram = g_new(MemoryRegion, 1);
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
@@ -106,7 +105,7 @@ petalogix_ml605_init(MachineState *machine)
 
     memory_region_init_ram(phys_ram, NULL, "petalogix_ml605.ram", ram_size);
     vmstate_register_ram_global(phys_ram);
-    memory_region_add_subregion(address_space_mem, ddr_base, phys_ram);
+    memory_region_add_subregion(address_space_mem, MEMORY_BASEADDR, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     /* 5th parameter 2 means bank-width
@@ -201,7 +200,7 @@ petalogix_ml605_init(MachineState *machine)
         }
     }
 
-    microblaze_load_kernel(cpu, ddr_base, ram_size,
+    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            machine_cpu_reset);
-- 
1.7.10.4


