Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Ap-000223-NK
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:36:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Aj-0001pY-Fd
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Ad-0005g7-DP
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:36:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4AM-0005by-A6; Wed, 03 Sep 2014 02:35:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BE05340762;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A1AA86DF;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1612 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:30 +0400
Message-Id: <1409726135-1547-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/10] device_tree.c: dump all err mesages
	with error_report
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
X-List-Received-Date: Wed, 03 Sep 2014 06:36:06 -0000

From: Li Liu <john.liuli@huawei.com>

Signed-off-by: Li Liu <john.liuli@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 device_tree.c |   40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index 9d47195..df9eed9 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -60,13 +60,13 @@ void *create_device_tree(int *sizep)
     }
     ret = fdt_open_into(fdt, fdt, *sizep);
     if (ret) {
-        fprintf(stderr, "Unable to copy device tree in memory\n");
+        error_report("Unable to copy device tree in memory");
         exit(1);
     }
 
     return fdt;
 fail:
-    fprintf(stderr, "%s Couldn't create dt: %s\n", __func__, fdt_strerror(ret));
+    error_report("%s Couldn't create dt: %s", __func__, fdt_strerror(ret));
     exit(1);
 }
 
@@ -124,8 +124,8 @@ static int findnode_nofail(void *fdt, const char *node_path)
 
     offset = fdt_path_offset(fdt, node_path);
     if (offset < 0) {
-        fprintf(stderr, "%s Couldn't find node %s: %s\n", __func__, node_path,
-                fdt_strerror(offset));
+        error_report("%s Couldn't find node %s: %s", __func__, node_path,
+                     fdt_strerror(offset));
         exit(1);
     }
 
@@ -139,8 +139,8 @@ int qemu_fdt_setprop(void *fdt, const char *node_path,
 
     r = fdt_setprop(fdt, findnode_nofail(fdt, node_path), property, val, size);
     if (r < 0) {
-        fprintf(stderr, "%s: Couldn't set %s/%s: %s\n", __func__, node_path,
-                property, fdt_strerror(r));
+        error_report("%s: Couldn't set %s/%s: %s", __func__, node_path,
+                     property, fdt_strerror(r));
         exit(1);
     }
 
@@ -154,8 +154,8 @@ int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
 
     r = fdt_setprop_cell(fdt, findnode_nofail(fdt, node_path), property, val);
     if (r < 0) {
-        fprintf(stderr, "%s: Couldn't set %s/%s = %#08x: %s\n", __func__,
-                node_path, property, val, fdt_strerror(r));
+        error_report("%s: Couldn't set %s/%s = %#08x: %s", __func__,
+                     node_path, property, val, fdt_strerror(r));
         exit(1);
     }
 
@@ -176,8 +176,8 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
 
     r = fdt_setprop_string(fdt, findnode_nofail(fdt, node_path), property, string);
     if (r < 0) {
-        fprintf(stderr, "%s: Couldn't set %s/%s = %s: %s\n", __func__,
-                node_path, property, string, fdt_strerror(r));
+        error_report("%s: Couldn't set %s/%s = %s: %s", __func__,
+                     node_path, property, string, fdt_strerror(r));
         exit(1);
     }
 
@@ -194,8 +194,8 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
     }
     r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
     if (!r) {
-        fprintf(stderr, "%s: Couldn't get %s/%s: %s\n", __func__,
-                node_path, property, fdt_strerror(*lenp));
+        error_report("%s: Couldn't get %s/%s: %s", __func__,
+                     node_path, property, fdt_strerror(*lenp));
         exit(1);
     }
     return r;
@@ -207,8 +207,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
     int len;
     const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len);
     if (len != 4) {
-        fprintf(stderr, "%s: %s/%s not 4 bytes long (not a cell?)\n",
-                __func__, node_path, property);
+        error_report("%s: %s/%s not 4 bytes long (not a cell?)",
+                     __func__, node_path, property);
         exit(1);
     }
     return be32_to_cpu(*p);
@@ -220,8 +220,8 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path)
 
     r = fdt_get_phandle(fdt, findnode_nofail(fdt, path));
     if (r == 0) {
-        fprintf(stderr, "%s: Couldn't get phandle for %s: %s\n", __func__,
-                path, fdt_strerror(r));
+        error_report("%s: Couldn't get phandle for %s: %s", __func__,
+                     path, fdt_strerror(r));
         exit(1);
     }
 
@@ -266,8 +266,8 @@ int qemu_fdt_nop_node(void *fdt, const char *node_path)
 
     r = fdt_nop_node(fdt, findnode_nofail(fdt, node_path));
     if (r < 0) {
-        fprintf(stderr, "%s: Couldn't nop node %s: %s\n", __func__, node_path,
-                fdt_strerror(r));
+        error_report("%s: Couldn't nop node %s: %s", __func__, node_path,
+                     fdt_strerror(r));
         exit(1);
     }
 
@@ -295,8 +295,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
     retval = fdt_add_subnode(fdt, parent, basename);
     if (retval < 0) {
-        fprintf(stderr, "FDT: Failed to create subnode %s: %s\n", name,
-                fdt_strerror(retval));
+        error_report("FDT: Failed to create subnode %s: %s", name,
+                     fdt_strerror(retval));
         exit(1);
     }
 
-- 
1.7.10.4


