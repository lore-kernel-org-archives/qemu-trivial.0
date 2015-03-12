Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVwz5-0003tu-34
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 02:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwz2-0003rq-Db
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwz1-0006jQ-ER
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVwyw-0006iI-1M; Thu, 12 Mar 2015 02:52:34 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 518A941725;
	Thu, 12 Mar 2015 09:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 34C8191E;
	Thu, 12 Mar 2015 09:52:33 +0300 (MSK)
Received: (nullmailer pid 5681 invoked by uid 1000);
	Thu, 12 Mar 2015 06:52:33 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 12 Mar 2015 09:52:30 +0300
Message-Id: <1426143150-5641-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] 9pfs-local: simplify/optimize
	local_mapped_attr_path()
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
X-List-Received-Date: Thu, 12 Mar 2015 06:52:41 -0000

Omit one unnecessary memory allocation for components
of the path and create the resulting path directly given
lengths of the components.

Do not use basename(3) because there are 2 versions of
this function which differs when argument ends with
slash character, use strrchr() instead so we have
consistent result.  This also makes sure the function
will do the right thing in corner cases (eg, empty
pathname is given), when basename(3) return entirely
another string.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
v2: switch from basename(3) to strrchr(3)

 hw/9pfs/virtio-9p-local.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index 0d79150..c9e5c28 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -45,19 +45,17 @@
 
 static char *local_mapped_attr_path(FsContext *ctx, const char *path)
 {
-    char *dir_name;
-    char *tmp_path = g_strdup(path);
-    char *base_name = basename(tmp_path);
-    char *buffer;
-
-    /* NULL terminate the directory */
-    dir_name = tmp_path;
-    *(base_name - 1) = '\0';
-
-    buffer = g_strdup_printf("%s/%s/%s/%s",
-             ctx->fs_root, dir_name, VIRTFS_META_DIR, base_name);
-    g_free(tmp_path);
-    return buffer;
+    int dirlen;
+    const char *name = strrchr(path, '/');
+    if (name) {
+        dirlen = name - path;
+        ++name;
+    } else {
+        name = path;
+        dirlen = 0;
+    }
+    return g_strdup_printf("%s/%.*s/%s/%s", ctx->fs_root,
+                           dirlen, path, VIRTFS_META_DIR, name);
 }
 
 static FILE *local_fopen(const char *path, const char *mode)
-- 
2.1.4


