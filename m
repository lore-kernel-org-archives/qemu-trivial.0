Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoQ-00062q-3L
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoH-0005nT-NV
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoB-0002Th-St
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto0-0002RG-SU; Sun, 02 Nov 2014 06:58:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 11E62402BC;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E683D709;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: (nullmailer pid 14974 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:24 +0300
Message-Id: <6af76c6f7dbcc6255f5a5cac20ad61d1492d4052.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/23] virtio-9p-proxy: fix error return in
	proxy_init()
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:11 -0000

proxy_init() does not check the return value of connect_namedsocket(),
fix this by rearranging code a little bit.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-proxy.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index e6bbb06..2ec211b 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1155,10 +1155,12 @@ static int proxy_init(FsContext *ctx)
         sock_id = atoi(ctx->fs_root);
         if (sock_id < 0) {
             fprintf(stderr, "socket descriptor not initialized\n");
-            g_free(proxy);
-            return -1;
         }
     }
+    if (sock_id < 0) {
+        g_free(proxy);
+        return -1;
+    }
     g_free(ctx->fs_root);
     ctx->fs_root = NULL;
 
-- 
1.7.10.4


