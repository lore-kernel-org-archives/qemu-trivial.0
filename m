Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMEjA-0007Ar-IY
	for mharc-qemu-trivial@gnu.org; Tue, 26 Aug 2014 07:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XMAPP-0001wJ-CD
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 02:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XMAPK-00035h-TO
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 02:39:11 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:35050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XMAPK-00031x-5V; Tue, 26 Aug 2014 02:39:06 -0400
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATN52957; Tue, 26 Aug 2014 14:38:56 +0800 (CST)
Received: from localhost (10.142.143.9) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 26 Aug 2014 14:38:47 +0800
From: "john.liuli" <john.liuli@huawei.com>
To: <peter.crosthwaite@xilinx.com>
Date: Tue, 26 Aug 2014 14:38:02 +0800
Message-ID: <1409035084-6740-1-git-send-email-john.liuli@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.53FC2B80.0092,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: f3c8d1688e9f8bcf1fb0357e676b5efe
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Tue, 26 Aug 2014 07:15:51 -0400
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2 1/2] device_tree.c: redirect
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
X-List-Received-Date: Tue, 26 Aug 2014 06:39:15 -0000

From: Li Liu <john.liuli@huawei.com>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
---
changes v1 -> v2:
1) fix indent issue as peter suggested.
2) dump all err mesages with error_report. 

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
1.7.9.5



