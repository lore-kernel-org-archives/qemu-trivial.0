Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8aT-0003h9-CU
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:35:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aL-0003ak-Cd
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aH-00023W-0w
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Zz-0001tL-R0; Thu, 11 Dec 2014 13:35:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8EB2241D4B;
	Thu, 11 Dec 2014 21:35:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9A2A38CB;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22987 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:04 +0300
Message-Id: <7766aa0c0e9e1b84c80c3a8168c6d97c4a3d49b8.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 16/20] virtio: remove useless declaration of
	virtio_net_init()
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
X-List-Received-Date: Thu, 11 Dec 2014 18:35:38 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 1773d9ee (virtio-net: cleanup: init and exit function)
removed the definition of virtio_net_init(), but didn't remove its
declaration in the header.  Clean that up.

Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/virtio/virtio.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 0726d76..f24997d 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -230,9 +230,6 @@ int virtio_set_features(VirtIODevice *vdev, uint32_t val);
 /* Base devices.  */
 typedef struct VirtIOBlkConf VirtIOBlkConf;
 struct virtio_net_conf;
-VirtIODevice *virtio_net_init(DeviceState *dev, NICConf *conf,
-                              struct virtio_net_conf *net,
-                              uint32_t host_features);
 typedef struct virtio_serial_conf virtio_serial_conf;
 typedef struct VirtIOSCSIConf VirtIOSCSIConf;
 typedef struct VirtIORNGConf VirtIORNGConf;
-- 
2.1.3


