Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkoI-0006y4-I2
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:39:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkoC-0006lC-Hb
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko7-0003Om-CD
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSknv-0003LQ-Md; Sun, 06 Oct 2013 05:39:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA04540CAE;
	Sun,  6 Oct 2013 13:39:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DED0B522;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25825 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:57 +0400
Message-Id: <1381051979-25742-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/14] hw/9pfs: Fix errno value for xattr
	functions
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
X-List-Received-Date: Sun, 06 Oct 2013 09:39:33 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

If there is no operation driver for the xattr type the
functions return '-1' and set errno to '-EOPNOTSUPP'.
When the calling code sets 'ret = -errno' this turns
into a large positive number.

In Linux 3.11, the kernel has switched to using 9p
version 9p2000.L, instead of 9p2000.u, which enables
support for xattr operations. This on its own is harmless,
but for another change which makes it request the xattr
with a name 'security.capability'.

The result is that the guest sees a succesful return
of 95 bytes of data, instead of a failure with errno
set to 95. Since the kernel expects a maximum of 20
bytes for an xattr return this gets translated to the
unexpected errno ERANGE.

This all means that when running a binary off a 9p fs
in 3.11 kernels you get a fun result of:

  # ./date
  sh: ./date: Numerical result out of range

The only workaround is to pass 'version=9p2000.u' when
mounting the 9p fs in the guest, to disable all use of
xattrs.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-xattr.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/virtio-9p-xattr.c b/hw/9pfs/virtio-9p-xattr.c
index 90ae565..3fae557 100644
--- a/hw/9pfs/virtio-9p-xattr.c
+++ b/hw/9pfs/virtio-9p-xattr.c
@@ -36,7 +36,7 @@ ssize_t v9fs_get_xattr(FsContext *ctx, const char *path,
     if (xops) {
         return xops->getxattr(ctx, path, name, value, size);
     }
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
     return -1;
 }
 
@@ -123,7 +123,7 @@ int v9fs_set_xattr(FsContext *ctx, const char *path, const char *name,
     if (xops) {
         return xops->setxattr(ctx, path, name, value, size, flags);
     }
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
     return -1;
 
 }
@@ -135,7 +135,7 @@ int v9fs_remove_xattr(FsContext *ctx,
     if (xops) {
         return xops->removexattr(ctx, path, name);
     }
-    errno = -EOPNOTSUPP;
+    errno = EOPNOTSUPP;
     return -1;
 
 }
-- 
1.7.10.4


