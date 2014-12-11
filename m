Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I1-0007dt-Si
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hv-0007T4-Qn
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hr-0002sF-9N
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hi-0002jD-8S; Thu, 11 Dec 2014 13:16:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 253BB41D41;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0AC408C4;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22964 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:53 +0300
Message-Id: <2c80ab15e218a0438627c2a79d74d5a13b864e15.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/20] virtio-bus: avoid breaking build when
	open DEBUG switch
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/virtio-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index eb77019..dfd2d8c 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -58,7 +58,7 @@ void virtio_bus_reset(VirtioBusState *bus)
 {
     VirtIODevice *vdev = virtio_bus_get_device(bus);
 
-    DPRINTF("%s: reset device.\n", qbus->name);
+    DPRINTF("%s: reset device.\n", BUS(bus)->name);
     if (vdev != NULL) {
         virtio_reset(vdev);
     }
-- 
2.1.3


