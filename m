Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjQsI-00064I-Je
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 06:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjQsC-0005xK-1K
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 06:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjQs6-0004Bx-Ud
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 06:53:03 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:9133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjQru-00043X-GT; Wed, 29 Oct 2014 06:52:47 -0400
Received: from 172.24.2.119 (EHLO SZXEML453-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDP67462; Wed, 29 Oct 2014 18:52:28 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML453-HUB.china.huawei.com
	(10.82.67.196) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 29 Oct 2014 18:52:20 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 29 Oct 2014 18:52:17 +0800
Message-ID: <1414579937-1064-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	weidong.huang@huawei.com, aneesh.kumar@linux.vnet.ibm.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] virtio-9p-proxy: Fix sockfd leak and modify
	the check logic
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
X-List-Received-Date: Wed, 29 Oct 2014 10:53:09 -0000

From: Gonglei <arei.gonglei@huawei.com>

If connect() return false, the sockfd will leak,
meanwhile proxy_init() can't check the return value
of connect_namedsocket(), maybe cause unpredictable
results.

Let's move the sock_id check logic out, which can
check both if and else statements.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/9pfs/virtio-9p-proxy.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
index b57966d..1c3aa5f 100644
--- a/hw/9pfs/virtio-9p-proxy.c
+++ b/hw/9pfs/virtio-9p-proxy.c
@@ -1112,6 +1112,7 @@ static int connect_namedsocket(const char *path)
     size = strlen(helper.sun_path) + sizeof(helper.sun_family);
     if (connect(sockfd, (struct sockaddr *)&helper, size) < 0) {
         fprintf(stderr, "socket error\n");
+        close(sockfd);
         return -1;
     }
 
@@ -1152,11 +1153,12 @@ static int proxy_init(FsContext *ctx)
         sock_id = connect_namedsocket(ctx->fs_root);
     } else {
         sock_id = atoi(ctx->fs_root);
-        if (sock_id < 0) {
-            fprintf(stderr, "socket descriptor not initialized\n");
-            g_free(proxy);
-            return -1;
-        }
+    }
+
+    if (sock_id < 0) {
+        fprintf(stderr, "socket descriptor not initialized\n");
+        g_free(proxy);
+        return -1;
     }
     g_free(ctx->fs_root);
     ctx->fs_root = NULL;
-- 
1.7.12.4



