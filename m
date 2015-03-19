Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVX-0002TQ-Fm
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVS-0002Kz-Vq
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVR-0007mz-VQ
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVJ-0007iW-FO; Thu, 19 Mar 2015 05:12:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AE93241E46;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F05D892A;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 327 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:21 +0300
Message-Id: <0289a412e8e41bfddf9e61336ee94e348dcaedfe.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PULL 03/24] 9pfs: Fix warnings from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:48 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

9pfs/virtio-9p.c:1953:9: warning: returning void-valued expression
9pfs/virtio-9p-handle.c:143:5: warning: returning void-valued expression
9pfs/virtio-9p-handle.c:160:5: warning: returning void-valued expression
9pfs/virtio-9p-local.c:384:5: warning: returning void-valued expression
9pfs/virtio-9p-local.c:415:5: warning: returning void-valued expression
9pfs/virtio-9p-proxy.c:672:5: warning: returning void-valued expression
9pfs/virtio-9p-proxy.c:689:5: warning: returning void-valued expression

Cc: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
index d6b1c0c..f1f2e25 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -378,7 +378,7 @@ static int local_opendir(FsContext *ctx,
 
 static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return rewinddir(fs->dir);
+    rewinddir(fs->dir);
 }
 
 static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
@@ -409,7 +409,7 @@ again:
 
 static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
-    return seekdir(fs->dir, off);
+    seekdir(fs->dir, off);
 }
 
 static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 71b6198..1bc7881 100644
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


