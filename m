Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVD7h-00081Z-KV
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 01:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVD7f-000806-Ls
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVD7e-0002D9-Mv
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:54:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVD7Y-0002Bu-JU; Tue, 10 Mar 2015 01:54:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C88841302;
	Tue, 10 Mar 2015 08:54:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 69A44722;
	Tue, 10 Mar 2015 08:54:23 +0300 (MSK)
Received: (nullmailer pid 13645 invoked by uid 1000);
	Tue, 10 Mar 2015 05:54:23 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2015 08:54:20 +0300
Message-Id: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] 9pfs-proxy: tiny cleanups in proxy_pwritev
	and proxy_preadv
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
X-List-Received-Date: Tue, 10 Mar 2015 05:54:32 -0000

Don't compare syscall return with -1, use "<0" condition.
Don't introduce useless local variables when we already
have similar variable
Rename local variable to be consistent with other usages

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-proxy.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 59c7445..a01804a 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -696,9 +696,9 @@ static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
 #ifdef CONFIG_PREADV
     return preadv(fs->fd, iov, iovcnt, offset);
 #else
-    int err = lseek(fs->fd, offset, SEEK_SET);
-    if (err == -1) {
-        return err;
+    int ret = lseek(fs->fd, offset, SEEK_SET);
+    if (err < 0)
+        return ret;
     } else {
         return readv(fs->fd, iov, iovcnt);
     }
@@ -714,10 +714,8 @@ static ssize_t proxy_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
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
-- 
2.1.4


