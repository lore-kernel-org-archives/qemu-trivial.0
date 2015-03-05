Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTM6j-0005Rm-F3
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 22:05:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTM6g-0005O6-FZ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 22:05:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTM6d-0006IJ-AK
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 22:05:50 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YTM6c-0006IB-Bf; Wed, 04 Mar 2015 22:05:47 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKI16951; Thu, 05 Mar 2015 11:05:42 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1; Thu, 5 Mar 2015
	11:05:36 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 5 Mar 2015 11:05:20 +0800
Message-ID: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Thu, 05 Mar 2015 03:05:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

When not assign a -dtb argument, the variable dtb_filename
storage returned from qemu_find_file(), which should be freed
after use. Alternatively we define a local variable filename,
with 'char *' type, free after use.

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2: fix a complier error.
---
 hw/microblaze/boot.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index a2843cd..352ccb1 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *dtb_arg;
+    char *filename = NULL;
 
     machine_opts = qemu_get_machine_opts();
     kernel_filename = qemu_opt_get(machine_opts, "kernel");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
     dtb_arg = qemu_opt_get(machine_opts, "dtb");
-    if (dtb_arg) { /* Preference a -dtb argument */
-        dtb_filename = dtb_arg;
-    } else { /* default to pcbios dtb as passed by machine_init */
-        dtb_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
+    /* default to pcbios dtb as passed by machine_init */
+    if (!dtb_arg) {
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
     }
 
     boot_info.machine_cpu_reset = machine_cpu_reset;
@@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                             boot_info.initrd_start,
                             boot_info.initrd_end,
                             kernel_cmdline,
-                            dtb_filename);
+                            /* Preference a -dtb argument */
+                            dtb_arg ? dtb_arg : filename);
     }
-
+    g_free(filename);
 }
-- 
1.7.12.4



