Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEVV-0004va-6G
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:32:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVS-0004sn-P2
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVR-0000Ky-KW
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEVN-0000Hs-5g; Sun, 24 Sep 2017 17:32:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8FA1641C78;
	Mon, 25 Sep 2017 00:31:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D0E5BC39;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28292 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:44 +0300
Message-Id: <da47fc6d3663a87e5448b8be6f670f9a939fdd4b.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 26/31] hw/display/virtio-gpu: Put the
 virtio-gpu-device into the display category
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 21:32:07 -0000

From: Thomas Huth <thuth@redhat.com>

The virtio-gpu-pci device is already in the display category, so the
virtio-gpu-device should be there, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/virtio-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 3a8f1e1a2d..6b5f119d96 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1321,6 +1321,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
 
     vdc->reset = virtio_gpu_reset;
 
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->props = virtio_gpu_properties;
     dc->vmsd = &vmstate_virtio_gpu;
     dc->hotpluggable = false;
-- 
2.11.0


