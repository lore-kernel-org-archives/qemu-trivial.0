Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQy8N-0007F2-GL
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2013 07:28:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1VQy8G-00073o-Da
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1VQy8A-0006qM-By
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 07:28:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1VQy7y-0006m7-3W; Tue, 01 Oct 2013 07:28:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r91BSQJN019340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 1 Oct 2013 07:28:26 -0400
Received: from localhost.localdomain.com (dhcp-1-155.lcy.redhat.com
	[10.32.224.155])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r91BSOI2006754; Tue, 1 Oct 2013 07:28:25 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Oct 2013 12:28:17 +0100
Message-Id: <1380626897-500-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] [PATCH] hw/9pfs: Fix errno value for xattr functions
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
X-List-Received-Date: Tue, 01 Oct 2013 11:28:54 -0000

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
---
 hw/9pfs/virtio-9p-xattr.c | 6 +++---
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
1.8.3.1


