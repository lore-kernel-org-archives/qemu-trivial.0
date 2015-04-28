Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn1Y5-0003TH-4k
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 05:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Y0-0003MI-RP
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Xv-0000Dk-DY
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:20 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:37485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yn1Xu-00009L-JV; Tue, 28 Apr 2015 05:11:15 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMW64219; Tue, 28 Apr 2015 17:11:07 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 28 Apr 2015 17:11:01 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 28 Apr 2015 17:11:04 +0800
Message-ID: <1430212264-9672-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 3/3] vhost-user: remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Tue, 28 Apr 2015 09:11:22 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/virtio/vhost-user.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index aefe0bb..e7ab829 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -128,7 +128,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 
     r = qemu_chr_fe_read_all(chr, p, size);
     if (r != size) {
-        error_report("Failed to read msg header. Read %d instead of %d.\n", r,
+        error_report("Failed to read msg header. Read %d instead of %d.", r,
                 size);
         goto fail;
     }
@@ -136,7 +136,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
     /* validate received flags */
     if (msg->flags != (VHOST_USER_REPLY_MASK | VHOST_USER_VERSION)) {
         error_report("Failed to read msg header."
-                " Flags 0x%x instead of 0x%x.\n", msg->flags,
+                " Flags 0x%x instead of 0x%x.", msg->flags,
                 VHOST_USER_REPLY_MASK | VHOST_USER_VERSION);
         goto fail;
     }
@@ -144,7 +144,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
     /* validate message size is sane */
     if (msg->size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
-                " Size %d exceeds the maximum %zu.\n", msg->size,
+                " Size %d exceeds the maximum %zu.", msg->size,
                 VHOST_USER_PAYLOAD_SIZE);
         goto fail;
     }
@@ -155,7 +155,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
         r = qemu_chr_fe_read_all(chr, p, size);
         if (r != size) {
             error_report("Failed to read msg payload."
-                         " Read %d instead of %d.\n", r, msg->size);
+                         " Read %d instead of %d.", r, msg->size);
             goto fail;
         }
     }
@@ -235,8 +235,8 @@ static int vhost_user_call(struct vhost_dev *dev, unsigned long int request,
         msg.memory.nregions = fd_num;
 
         if (!fd_num) {
-            error_report("Failed initializing vhost-user memory map\n"
-                    "consider using -object memory-backend-file share=on\n");
+            error_report("Failed initializing vhost-user memory map, "
+                    "consider using -object memory-backend-file share=on");
             return -1;
         }
 
@@ -280,7 +280,7 @@ static int vhost_user_call(struct vhost_dev *dev, unsigned long int request,
         }
         break;
     default:
-        error_report("vhost-user trying to send unhandled ioctl\n");
+        error_report("vhost-user trying to send unhandled ioctl");
         return -1;
         break;
     }
@@ -296,27 +296,27 @@ static int vhost_user_call(struct vhost_dev *dev, unsigned long int request,
 
         if (msg_request != msg.request) {
             error_report("Received unexpected msg type."
-                    " Expected %d received %d\n", msg_request, msg.request);
+                    " Expected %d received %d", msg_request, msg.request);
             return -1;
         }
 
         switch (msg_request) {
         case VHOST_USER_GET_FEATURES:
             if (msg.size != sizeof(m.u64)) {
-                error_report("Received bad msg size.\n");
+                error_report("Received bad msg size.");
                 return -1;
             }
             *((__u64 *) arg) = msg.u64;
             break;
         case VHOST_USER_GET_VRING_BASE:
             if (msg.size != sizeof(m.state)) {
-                error_report("Received bad msg size.\n");
+                error_report("Received bad msg size.");
                 return -1;
             }
             memcpy(arg, &msg.state, sizeof(struct vhost_vring_state));
             break;
         default:
-            error_report("Received unexpected msg type.\n");
+            error_report("Received unexpected msg type.");
             return -1;
             break;
         }
-- 
1.7.12.4



