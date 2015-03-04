Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGSe-0004be-Ep
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:04:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGSc-0004Ym-Do
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGSa-0007EF-JH
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:04:06 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGSV-0007Bj-QP; Wed, 04 Mar 2015 16:03:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CAD0A4092B;
	Thu,  5 Mar 2015 00:03:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AF5EE93A;
	Thu,  5 Mar 2015 00:03:57 +0300 (MSK)
Received: (nullmailer pid 23747 invoked by uid 1000);
	Wed, 04 Mar 2015 21:03:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Date: Thu,  5 Mar 2015 00:03:56 +0300
Message-Id: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] 9pfs-local: simplify/optimize
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
X-List-Received-Date: Wed, 04 Mar 2015 21:04:07 -0000

Omit one unnecessary memory allocation for components of the path
and create the resulting path directly given lengths of the components.

This uses (char*) cast because basename() accepts a char* without const,
for unknown reason.  Maybe it is better to use strrchr(), but I'm not
sure for various forms of directory component delimiter.

And according to basename(3) manpage, it might return different strings
for various corner cases, for example for empty argument it returns a
string "." which is obviously at some other address, so both the old
code and new code will do a bad thing here.  So maybe it is actually
better to use strrchr() after all.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-local.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index d05c917..fddc242 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -45,19 +45,10 @@
 
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
+    const char *name = basename((char*)path);
+    int dirlen = name - path - 1;
+    return g_strdup_printf("%s/%.*s/%s/%s", ctx->fs_root,
+                           dirlen, path, VIRTFS_META_DIR, name);
 }
 
 static FILE *local_fopen(const char *path, const char *mode)
-- 
2.1.4


