Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJF-0001iI-JW
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ8-0001cm-03
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ3-0007RH-87
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIr-0007Ia-Ib; Fri, 15 Aug 2014 11:20:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ED4FE43079;
	Fri, 15 Aug 2014 19:20:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F257B6F3;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17943 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:11 +0400
Message-Id: <1408115711-17836-21-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 20/20] ivshmem: check the value returned by
	fstat()
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:50 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

The function fstat() may fail, so check its return value.

Acked-by: Levente Kurusa <lkurusa@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/ivshmem.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 768e528..2be4b86 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -324,7 +324,11 @@ static int check_shm_size(IVShmemState *s, int fd) {
 
     struct stat buf;
 
-    fstat(fd, &buf);
+    if (fstat(fd, &buf) < 0) {
+        fprintf(stderr, "ivshmem: exiting: fstat on fd %d failed: %s\n",
+                fd, strerror(errno));
+        return -1;
+    }
 
     if (s->ivshmem_size > buf.st_size) {
         fprintf(stderr,
-- 
1.7.10.4


