Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYXbE-000454-8k
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 06:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbB-00041m-GY
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYXbA-0006xh-F4
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 06:22:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYXb4-0006wR-4Q; Thu, 19 Mar 2015 06:22:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0AC1041E55;
	Thu, 19 Mar 2015 13:22:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1A2D691F;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 349 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:31 +0300
Message-Id: <6e05a12f8f7f32a3fecbeb0c572d549a5f6e9177.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 13/24] arm: fix memory leak
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
X-List-Received-Date: Thu, 19 Mar 2015 10:22:46 -0000

From: Gonglei <arei.gonglei@huawei.com>

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/digic_boards.c | 1 +
 hw/arm/highbank.c     | 1 +
 hw/arm/vexpress.c     | 3 ++-
 hw/arm/virt.c         | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 7114c36..e576646 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -113,6 +113,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
             error_report("Couldn't load rom image '%s'.", filename);
             exit(1);
         }
+        g_free(fn);
     }
 }
 
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index a92cdc3..ddd10dc 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -282,6 +282,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
             if (load_image_targphys("sysram.bin", 0xfff88000, filesize) < 0) {
                 hw_error("Unable to load %s\n", bios_name);
             }
+            g_free(sysboot_filename);
         } else {
            hw_error("Unable to find %s\n", bios_name);
         }
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 8496c16..e9a7ced 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -562,7 +562,7 @@ static void vexpress_common_init(MachineState *machine)
      * If a bios file was provided, attempt to map it into memory
      */
     if (bios_name) {
-        const char *fn;
+        char *fn;
 
         if (drive_get(IF_PFLASH, 0, 0)) {
             error_report("The contents of the first flash device may be "
@@ -576,6 +576,7 @@ static void vexpress_common_init(MachineState *machine)
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
         }
+        g_free(fn);
     }
 
     /* Motherboard peripherals: the wiring is the same but the
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9072bc2..b2eaea8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -552,7 +552,7 @@ static void create_flash(const VirtBoardInfo *vbi)
     char *nodename;
 
     if (bios_name) {
-        const char *fn;
+        char *fn;
 
         if (drive_get(IF_PFLASH, 0, 0)) {
             error_report("The contents of the first flash device may be "
@@ -565,6 +565,7 @@ static void create_flash(const VirtBoardInfo *vbi)
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
         }
+        g_free(fn);
     }
 
     create_one_flash("virt.flash0", flashbase, flashsize);
-- 
2.1.4


