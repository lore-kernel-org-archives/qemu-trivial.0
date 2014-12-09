Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyAFS-00005U-6n
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 21:09:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XyAFM-000053-IZ
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 21:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XyAFG-00024r-S8
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 21:09:52 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:3583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XyAFG-00024U-AM; Mon, 08 Dec 2014 21:09:46 -0500
Received: from 172.24.2.119 (EHLO szxeml407-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CFU40170; Tue, 09 Dec 2014 10:09:37 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml407-hub.china.huawei.com
	(10.82.67.94) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	10:09:25 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 9 Dec 2014 10:09:22 +0800
Message-ID: <1418090962-10720-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Markus Armbruster <armbru@redhat.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH v2] virtio: remove useless declaration of
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
X-List-Received-Date: Tue, 09 Dec 2014 02:09:57 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 1773d9ee (virtio-net: cleanup: init and exit function)
removed the definition of virtio_net_init(), but didn't remove its
declaration in the header.  Clean that up.

Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2: 
 update the patch's tilte and commit message as suggested by Markus.
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
1.7.12.4



