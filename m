Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfm9-0000Gn-Js
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfm6-0000Cw-Sd
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfm5-0005iE-PY
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:18:02 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:46090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfm1-0005hh-43; Sun, 08 Mar 2015 14:17:57 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id A036117F9E9; Sun,  8 Mar 2015 19:17:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:17:54 +0100
Message-Id: <1425838674-28393-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/7] 9pfs: Fix warnings from Sparse
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
X-List-Received-Date: Sun, 08 Mar 2015 18:18:04 -0000

Sparse report:

9pfs/virtio-9p.c:1953:9: warning: returning void-valued expression
9pfs/virtio-9p-handle.c:143:5: warning: returning void-valued expression
9pfs/virtio-9p-handle.c:160:5: warning: returning void-valued expression
9pfs/virtio-9p-local.c:384:5: warning: returning void-valued expression
9pfs/virtio-9p-local.c:415:5: warning: returning void-valued expression
9pfs/virtio-9p-proxy.c:672:5: warning: returning void-valued expression
9pfs/virtio-9p-proxy.c:689:5: warning: returning void-valued expression

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/9pfs/virtio-9p-handle.c | 4 ++--
 hw/9pfs/virtio-9p-local.c  | 4 ++--
 hw/9pfs/virtio-9p-proxy.c  | 4 ++--
 hw/9pfs/virtio-9p.c        | 3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/virtio-9p-handle.c b/hw/9pfs/virtio-9p-handle.c
index 4b79cef..13eabb9 100644
--- a/hw/9pfs/virtio-9p-handle.c
+++ b/hw/9pfs/virtio-9p-handle.c
@@ -140,7 +140,7 @@ static int handle_opendir(FsContext *ctx,
 
 static void handle_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return rewinddir(fs->dir);
+    rewinddir(fs->dir);
 }
 
 static off_t handle_telldir(FsContext *ctx, V9fsFidOpenState *fs)
@@ -157,7 +157,7 @@ static int handle_readdir_r(FsContext *ctx, V9fsFidOpenState *fs,
 
 static void handle_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
-    return seekdir(fs->dir, off);
+    seekdir(fs->dir, off);
 }
 
 static ssize_t handle_preadv(FsContext *ctx, V9fsFidOpenState *fs,
diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index a183eee..fec580b 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -381,7 +381,7 @@ static int local_opendir(FsContext *ctx,
 
 static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return rewinddir(fs->dir);
+    rewinddir(fs->dir);
 }
 
 static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
@@ -412,7 +412,7 @@ again:
 
 static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
-    return seekdir(fs->dir, off);
+    seekdir(fs->dir, off);
 }
 
 static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 59c7445..edab402 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -669,7 +669,7 @@ static int proxy_opendir(FsContext *ctx,
 
 static void proxy_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return rewinddir(fs->dir);
+    rewinddir(fs->dir);
 }
 
 static off_t proxy_telldir(FsContext *ctx, V9fsFidOpenState *fs)
@@ -686,7 +686,7 @@ static int proxy_readdir_r(FsContext *ctx, V9fsFidOpenState *fs,
 
 static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
-    return seekdir(fs->dir, off);
+    seekdir(fs->dir, off);
 }
 
 static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index 5861a5b..4964da0 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -1950,7 +1950,8 @@ static void v9fs_write(void *opaque)
 
     err = pdu_unmarshal(pdu, offset, "dqd", &fid, &off, &count);
     if (err < 0) {
-        return complete_pdu(s, pdu, err);
+        complete_pdu(s, pdu, err);
+        return;
     }
     offset += err;
     v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, count, true);
-- 
2.1.4


