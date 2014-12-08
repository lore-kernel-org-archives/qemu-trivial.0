Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XxwoX-0002vf-CR
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 06:49:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwoR-0002ox-8P
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:49:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwoM-0004pE-EV
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:49:11 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:48058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XxwoC-0004nT-F5; Mon, 08 Dec 2014 06:48:56 -0500
Received: from 172.24.2.119 (EHLO szxeml404-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDQ97034; Mon, 08 Dec 2014 19:48:53 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml404-hub.china.huawei.com
	(10.82.67.59) with Microsoft SMTP Server id 14.3.158.1; Mon, 8 Dec 2014
	19:48:45 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 8 Dec 2014 19:48:42 +0800
Message-ID: <1418039322-7892-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] virtio: remove useless virtio_net_init define
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
X-List-Received-Date: Mon, 08 Dec 2014 11:49:16 -0000

From: Gonglei <arei.gonglei@huawei.com>

commit 1773d9ee (virtio-net: cleanup: init and exit function)
had removed realization of virtio_net_init(), but didn't remove
the define of head file. Let's remove it.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
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



