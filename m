Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTM4c-0003uF-Ri
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 22:03:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTM4Z-0003qy-V7
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 22:03:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTM4V-0005d9-Hi
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 22:03:39 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:17635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YTM4U-0005ck-Rt; Wed, 04 Mar 2015 22:03:35 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKI16070; Thu, 05 Mar 2015 10:58:57 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1; Thu, 5 Mar 2015
	10:58:50 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 5 Mar 2015 10:58:32 +0800
Message-ID: <1425524312-13144-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v2] arm: fix memory leak
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
X-List-Received-Date: Thu, 05 Mar 2015 03:03:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2: 
 Fix a complier error, remove `const' from the variable
 declaration. (mjt)
---
 hw/arm/digic_boards.c | 1 +
 hw/arm/highbank.c     | 1 +
 hw/arm/vexpress.c     | 3 ++-
 hw/arm/virt.c         | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 2a4b872..79c453a 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -113,6 +113,7 @@ static void digic_load_rom(DigicBoardState *s, hwaddr addr,
             error_report("Couldn't load rom image '%s'.\n", filename);
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
index 5933454..47b6d7d 100644
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
index 69f51ac..e36cd09 100644
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
1.7.12.4



