Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQdn2-0001Vg-1a
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 09:13:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1UQdmv-0001Mn-LU
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 09:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1UQdmt-00053f-Ua
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 09:13:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1UQdmn-00051C-5h; Fri, 12 Apr 2013 09:13:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3CDCvnl010600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 12 Apr 2013 09:12:57 -0400
Received: from localhost (ovpn-113-61.phx2.redhat.com [10.3.113.61])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3CDCuQD002294; Fri, 12 Apr 2013 09:12:56 -0400
Date: Fri, 12 Apr 2013 09:12:55 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <20130412091255.7a3f1c75@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, fred.konrad@greensocs.com
Subject: [Qemu-trivial] [PATCH] virtio.h: drop unused function prototypes
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
X-List-Received-Date: Fri, 12 Apr 2013 13:13:14 -0000

They are unused since commit 5c7d0962f60498c3f11d402e1c857cb9d5d8568d.

Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
---
 include/hw/virtio/virtio.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 7e24b2b..2c57c47 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -246,7 +246,6 @@ VirtIODevice *virtio_net_init(DeviceState *dev, NICConf *conf,
                               uint32_t host_features);
 typedef struct virtio_serial_conf virtio_serial_conf;
 VirtIODevice *virtio_serial_init(DeviceState *dev, virtio_serial_conf *serial);
-VirtIODevice *virtio_balloon_init(DeviceState *dev);
 typedef struct VirtIOSCSIConf VirtIOSCSIConf;
 VirtIODevice *virtio_scsi_init(DeviceState *dev, VirtIOSCSIConf *conf);
 typedef struct VirtIORNGConf VirtIORNGConf;
@@ -258,7 +257,6 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf);
 
 void virtio_net_exit(VirtIODevice *vdev);
 void virtio_serial_exit(VirtIODevice *vdev);
-void virtio_balloon_exit(VirtIODevice *vdev);
 void virtio_scsi_exit(VirtIODevice *vdev);
 void virtio_rng_exit(VirtIODevice *vdev);
 
-- 
1.8.1.4


