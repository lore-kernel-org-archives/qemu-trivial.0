Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFr2C-0003LL-MB
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:45:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr26-00039i-Hf
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr22-0005sq-4s
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFr1s-0005m4-Rs; Fri, 08 Aug 2014 16:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5203C41A14;
	Sat,  9 Aug 2014 00:44:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B60DA6D3;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10318 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:58 +0400
Message-Id: <1407530342-10259-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 5/9] virtio: Move extern declaration to header
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
X-List-Received-Date: Fri, 08 Aug 2014 20:45:07 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from smatch (static code analyser).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


