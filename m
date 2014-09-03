Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4H0-00086x-Li
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:42:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gu-0007sw-5W
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gp-0007EH-Vi
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4Gd-0007Bl-Io; Wed, 03 Sep 2014 02:42:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 132404076A;
	Wed,  3 Sep 2014 10:42:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2DE7E6EF;
	Wed,  3 Sep 2014 10:35:37 +0400 (MSK)
Received: (nullmailer pid 1610 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:29 +0400
Message-Id: <1409726135-1547-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/10] device_tree.c: redirect
	load_device_tree err message to stderr
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
X-List-Received-Date: Wed, 03 Sep 2014 06:42:28 -0000

From: Li Liu <john.liuli@huawei.com>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 device_tree.c |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index ca83504..9d47195 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -20,6 +20,7 @@
 
 #include "config.h"
 #include "qemu-common.h"
+#include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
@@ -79,8 +80,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
     *sizep = 0;
     dt_size = get_image_size(filename_path);
     if (dt_size < 0) {
-        printf("Unable to get size of device tree file '%s'\n",
-            filename_path);
+        error_report("Unable to get size of device tree file '%s'",
+                     filename_path);
         goto fail;
     }
 
@@ -92,21 +93,21 @@ void *load_device_tree(const char *filename_path, int *sizep)
 
     dt_file_load_size = load_image(filename_path, fdt);
     if (dt_file_load_size < 0) {
-        printf("Unable to open device tree file '%s'\n",
-               filename_path);
+        error_report("Unable to open device tree file '%s'",
+                     filename_path);
         goto fail;
     }
 
     ret = fdt_open_into(fdt, fdt, dt_size);
     if (ret) {
-        printf("Unable to copy device tree in memory\n");
+        error_report("Unable to copy device tree in memory");
         goto fail;
     }
 
     /* Check sanity of device tree */
     if (fdt_check_header(fdt)) {
-        printf ("Device tree file loaded into memory is invalid: %s\n",
-            filename_path);
+        error_report("Device tree file loaded into memory is invalid: %s",
+                     filename_path);
         goto fail;
     }
     *sizep = dt_size;
-- 
1.7.10.4


