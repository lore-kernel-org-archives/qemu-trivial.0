Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVQYZ-00064L-2f
	for mharc-qemu-trivial@gnu.org; Thu, 25 Apr 2013 14:06:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQYV-0005xw-Fg
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 14:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQYU-0005bQ-9Z
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 14:06:03 -0400
Received: from [216.171.111.232] (port=52708 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQYT-0005b9-Vx
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 14:06:02 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9dbed
	by freebsd.org (DragonFly Mail Agent 1);
	Thu, 25 Apr 2013 13:38:29 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-trivial@nongnu.org
Date: Thu, 25 Apr 2013 13:38:28 -0400
Message-Id: <1366911508-11078-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Subject: [Qemu-trivial] [PATCH] Fix compilation without CONFIG_VHOST_SCSI
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
X-List-Received-Date: Thu, 25 Apr 2013 18:06:05 -0000


Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 hw/s390x/s390-virtio-bus.c | 2 ++
 hw/s390x/virtio-ccw.c      | 2 ++
 hw/s390x/virtio-ccw.h      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
index cf51a85..a7e81d1 100644
--- a/hw/s390x/s390-virtio-bus.c
+++ b/hw/s390x/s390-virtio-bus.c
@@ -691,7 +691,9 @@ static void s390_virtio_register_types(void)
     type_register_static(&s390_virtio_blk);
     type_register_static(&s390_virtio_net);
     type_register_static(&s390_virtio_scsi);
+#ifdef CONFIG_VHOST_SCSI
     type_register_static(&s390_vhost_scsi);
+#endif
     type_register_static(&s390_virtio_rng);
     type_register_static(&s390_virtio_bridge_info);
 }
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 56e4872..86b1477 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1089,7 +1089,9 @@ static void virtio_ccw_register(void)
     type_register_static(&virtio_ccw_net);
     type_register_static(&virtio_ccw_balloon);
     type_register_static(&virtio_ccw_scsi);
+#ifdef CONFIG_VHOST_SCSI
     type_register_static(&vhost_ccw_scsi);
+#endif
     type_register_static(&virtio_ccw_rng);
     type_register_static(&virtual_css_bridge_info);
 }
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index 04ba1b9..121a5f8 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -101,6 +101,7 @@ typedef struct VirtIOSCSICcw {
     VirtIOSCSI vdev;
 } VirtIOSCSICcw;
 
+#ifdef CONFIG_VHOST_SCSI
 /* vhost-scsi-ccw */
 
 #define TYPE_VHOST_SCSI_CCW "vhost-scsi-ccw"
@@ -111,6 +112,7 @@ typedef struct VHostSCSICcw {
     VirtioCcwDevice parent_obj;
     VHostSCSI vdev;
 } VHostSCSICcw;
+#endif
 
 /* virtio-blk-ccw */
 
-- 
1.7.11.5


