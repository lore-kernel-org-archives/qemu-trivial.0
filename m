Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Z-00021P-3U
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0T-0001p8-Af
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0005fQ-8Y
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005dL-4v; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7AC2B42FBF;
	Sat, 27 Jul 2013 11:33:29 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 4070F202885; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:18 +0400
Message-Id: <1374910406-15273-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 03/11] hw/9pfs: Fix potential memory
	leak and avoid reuse of freed memory
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:38 -0000

From: Stefan Weil <sw@weilnetz.de>

The leak was reported by cppcheck.

Function proxy_init also calls g_free for ctx->fs_root.
Avoid reuse of this memory by setting ctx->fs_root to NULL.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: M. Mohan Kumar <mohan@in.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-proxy.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index 8ba2959..5f44bb7 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1153,10 +1153,12 @@ static int proxy_init(FsContext *ctx)
         sock_id = atoi(ctx->fs_root);
         if (sock_id < 0) {
             fprintf(stderr, "socket descriptor not initialized\n");
+            g_free(proxy);
             return -1;
         }
     }
     g_free(ctx->fs_root);
+    ctx->fs_root = NULL;
 
     proxy->in_iovec.iov_base  = g_malloc(PROXY_MAX_IO_SZ + PROXY_HDR_SZ);
     proxy->in_iovec.iov_len   = PROXY_MAX_IO_SZ + PROXY_HDR_SZ;
-- 
1.7.10.4


