Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVwjJ-0004Pa-AG
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 02:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwjG-0004Ln-UA
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:36:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwjF-0001Q4-Px
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:36:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVwj9-0001Mo-Fj; Thu, 12 Mar 2015 02:36:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2686C41725;
	Thu, 12 Mar 2015 09:36:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BB98791E;
	Thu, 12 Mar 2015 09:36:13 +0300 (MSK)
Received: (nullmailer pid 30927 invoked by uid 1000);
	Thu, 12 Mar 2015 06:36:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 12 Mar 2015 09:36:12 +0300
Message-Id: <1426142172-30886-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2] 9pfs-proxy: tiny cleanups in
	proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Thu, 12 Mar 2015 06:36:24 -0000

Don't compare syscall return with -1, use "<0" condition.
Don't introduce useless local variables when we already
have similar variable
Rename local variable to be consistent with other usages
Finally make the two methods, read and write, to be similar to each other

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
v2: send the right patch, after actually committin the changes
Also, now use more context in diff to show both functions.

 hw/9pfs/virtio-9p-proxy.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 59c7445..6bb191e 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -690,37 +690,35 @@ static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 }
 
 static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
                             const struct iovec *iov,
                             int iovcnt, off_t offset)
 {
+    ssize_t ret;
 #ifdef CONFIG_PREADV
-    return preadv(fs->fd, iov, iovcnt, offset);
+    ret = preadv(fs->fd, iov, iovcnt, offset);
 #else
-    int err = lseek(fs->fd, offset, SEEK_SET);
-    if (err == -1) {
-        return err;
-    } else {
-        return readv(fs->fd, iov, iovcnt);
+    ret = lseek(fs->fd, offset, SEEK_SET);
+    if (ret >= 0) {
+        ret = readv(fs->fd, iov, iovcnt);
     }
 #endif
+    return ret;
 }
 
 static ssize_t proxy_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
                              const struct iovec *iov,
                              int iovcnt, off_t offset)
 {
     ssize_t ret;
 
 #ifdef CONFIG_PREADV
     ret = pwritev(fs->fd, iov, iovcnt, offset);
 #else
-    int err = lseek(fs->fd, offset, SEEK_SET);
-    if (err == -1) {
-        return err;
-    } else {
+    ret = lseek(fs->fd, offset, SEEK_SET);
+    if (ret >= 0) {
         ret = writev(fs->fd, iov, iovcnt);
     }
 #endif
 #ifdef CONFIG_SYNC_FILE_RANGE
     if (ret > 0 && ctx->export_flags & V9FS_IMMEDIATE_WRITEOUT) {
         /*
-- 
2.1.4


