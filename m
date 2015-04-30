Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhOq-00024P-8U
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOl-0001rc-M4
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOk-0008CM-PG
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhOf-00088n-KX; Thu, 30 Apr 2015 01:52:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1512442B96;
	Thu, 30 Apr 2015 08:46:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 723F7965;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4379 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:55 +0300
Message-Id: <fe31d3e6e6945b509e5b4ab03d38aae1266fe64e.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 42/42] microblaze: fix memory leak
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
X-List-Received-Date: Thu, 30 Apr 2015 05:52:37 -0000

From: Gonglei <arei.gonglei@huawei.com>

When not assign a -dtb argument, the variable dtb_filename
storage returned from qemu_find_file(), which should be freed
after use. Alternatively we define a local variable filename,
with 'char *' type, free after use.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/microblaze/boot.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 38c59db..4c44317 100644
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
2.1.4


