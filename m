Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3rIj-0001cr-Gj
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 13:04:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r08-0004OP-DG
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:45:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r03-0001vX-U8
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:45:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qzt-0001iK-LR; Thu, 16 Jan 2014 12:44:53 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96DE3415C6;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 78AD7635;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16396 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:13 +0400
Message-Id: <1389893719-16336-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PULL 05/11] virtio-balloon: don't hardcode config
	size value
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
X-List-Received-Date: Thu, 16 Jan 2014 18:04:19 -0000

From: Luiz Capitulino <lcapitulino@redhat.com>

Use sizeof(struct virtio_balloon_config) instead.

Signed-off-by: Luiz capitulino <lcapitulino@redhat.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio-balloon.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index d9754db..a470a0b 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -263,7 +263,7 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
     config.num_pages = cpu_to_le32(dev->num_pages);
     config.actual = cpu_to_le32(dev->actual);
 
-    memcpy(config_data, &config, 8);
+    memcpy(config_data, &config, sizeof(struct virtio_balloon_config));
 }
 
 static void virtio_balloon_set_config(VirtIODevice *vdev,
@@ -272,7 +272,7 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
     VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
     struct virtio_balloon_config config;
     uint32_t oldactual = dev->actual;
-    memcpy(&config, config_data, 8);
+    memcpy(&config, config_data, sizeof(struct virtio_balloon_config));
     dev->actual = le32_to_cpu(config.actual);
     if (dev->actual != oldactual) {
         qemu_balloon_changed(ram_size -
@@ -343,7 +343,8 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON, 8);
+    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
+                sizeof(struct virtio_balloon_config));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
-- 
1.7.10.4


