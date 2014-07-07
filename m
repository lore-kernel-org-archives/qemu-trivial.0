Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EM5-00020i-2A
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:13:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EM2-0001ya-UA
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EM2-0006Pm-2T
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:13:34 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:47196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4ELx-0006PN-Qx; Mon, 07 Jul 2014 15:13:29 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id B0F6417FA16; Mon,  7 Jul 2014 21:13:27 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:13:27 +0200
Message-Id: <1404760407-1554-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] virtio: Move extern declaration to header
	file
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
X-List-Received-Date: Mon, 07 Jul 2014 19:13:35 -0000

This fixes a warning from smatch (static code analyser).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/virtio/vhost-backend.c         |    2 --
 include/hw/virtio/vhost-backend.h |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 35316c4..ff4f200 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -14,8 +14,6 @@
 
 #include <sys/ioctl.h>
 
-extern const VhostOps user_ops;
-
 static int vhost_kernel_call(struct vhost_dev *dev, unsigned long int request,
                              void *arg)
 {
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index d31768a..e472f29 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -32,6 +32,8 @@ typedef struct VhostOps {
     vhost_backend_cleanup vhost_backend_cleanup;
 } VhostOps;
 
+extern const VhostOps user_ops;
+
 int vhost_set_backend_type(struct vhost_dev *dev,
                            VhostBackendType backend_type);
 
-- 
1.7.10.4


