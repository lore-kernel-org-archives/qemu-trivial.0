Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdJZ1-0001Ok-Ba
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 05:38:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RdJYt-00011A-9K
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:38:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RdJYp-0000rj-3z
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:38:15 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:55258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RdJYe-0000pM-I3; Wed, 21 Dec 2011 05:38:00 -0500
Received: from blackfin.pond.sub.org (p5B32C957.dip.t-dialin.net
	[91.50.201.87])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 61C799FF76;
	Wed, 21 Dec 2011 11:37:58 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 9999260074; Wed, 21 Dec 2011 11:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Dec 2011 11:37:57 +0100
Message-Id: <1324463877-1281-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com
Subject: [Qemu-trivial] [PATCH] scsi virtio-blk usb-msd: Clean up device
	init error messages
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
X-List-Received-Date: Wed, 21 Dec 2011 10:38:22 -0000

Replace

    error_report("DEVICE-NAME: MESSAGE");

by just

    error_report("MESSAGE");

in block device init functions.

DEVICE-NAME is bogus in some cases: it's "scsi-disk" for device
scsi-hd and scsi-cd, "virtio-blk-pci" for virtio-blk-s390, and
"usb-msd" for usb-storage.

There is no real need to put a device name in the message, because
error_report() points to the offending command line option already:

$ qemu-system-x86_64 --nodefaults --enable-kvm -vnc :0 -S -monitor stdio -usb -device virtio-blk-pci
upstream-qemu: -device virtio-blk-pci: virtio-blk-pci: drive property not set
upstream-qemu: -device virtio-blk-pci: Device 'virtio-blk-pci' could not be initialized

And for a monitor command, it's obvious anyway:

$ qemu-system-x86_64 --nodefaults --enable-kvm -vnc :0 -S -monitor stdio -usb
(qemu) device_add virtio-blk-pci
virtio-blk-pci: drive property not set
Device 'virtio-blk-pci' could not be initialized

Reported-by: Amit Shah <amit.shah@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/scsi-disk.c    |    4 ++--
 hw/scsi-generic.c |    8 ++++----
 hw/usb-msd.c      |    2 +-
 hw/virtio-blk.c   |    2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index 505accd..5d8bf53 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -1515,7 +1515,7 @@ static int scsi_initfn(SCSIDevice *dev)
     DriveInfo *dinfo;
 
     if (!s->qdev.conf.bs) {
-        error_report("scsi-disk: drive property not set");
+        error_report("drive property not set");
         return -1;
     }
 
@@ -1537,7 +1537,7 @@ static int scsi_initfn(SCSIDevice *dev)
     }
 
     if (bdrv_is_sg(s->qdev.conf.bs)) {
-        error_report("scsi-disk: unwanted /dev/sg*");
+        error_report("unwanted /dev/sg*");
         return -1;
     }
 
diff --git a/hw/scsi-generic.c b/hw/scsi-generic.c
index 6f7d3db..0aebcdd 100644
--- a/hw/scsi-generic.c
+++ b/hw/scsi-generic.c
@@ -374,13 +374,13 @@ static int scsi_generic_initfn(SCSIDevice *s)
     struct sg_scsi_id scsiid;
 
     if (!s->conf.bs) {
-        error_report("scsi-generic: drive property not set");
+        error_report("drive property not set");
         return -1;
     }
 
     /* check we are really using a /dev/sg* file */
     if (!bdrv_is_sg(s->conf.bs)) {
-        error_report("scsi-generic: not /dev/sg*");
+        error_report("not /dev/sg*");
         return -1;
     }
 
@@ -396,13 +396,13 @@ static int scsi_generic_initfn(SCSIDevice *s)
     /* check we are using a driver managing SG_IO (version 3 and after */
     if (bdrv_ioctl(s->conf.bs, SG_GET_VERSION_NUM, &sg_version) < 0 ||
         sg_version < 30000) {
-        error_report("scsi-generic: scsi generic interface too old");
+        error_report("scsi generic interface too old");
         return -1;
     }
 
     /* get LUN of the /dev/sg? */
     if (bdrv_ioctl(s->conf.bs, SG_GET_SCSI_ID, &scsiid)) {
-        error_report("scsi-generic: SG_GET_SCSI_ID ioctl failed");
+        error_report("SG_GET_SCSI_ID ioctl failed");
         return -1;
     }
 
diff --git a/hw/usb-msd.c b/hw/usb-msd.c
index 4c06950..b87b929 100644
--- a/hw/usb-msd.c
+++ b/hw/usb-msd.c
@@ -517,7 +517,7 @@ static int usb_msd_initfn(USBDevice *dev)
     DriveInfo *dinfo;
 
     if (!bs) {
-        error_report("usb-msd: drive property not set");
+        error_report("drive property not set");
         return -1;
     }
 
diff --git a/hw/virtio-blk.c b/hw/virtio-blk.c
index ef27421..5e81f53 100644
--- a/hw/virtio-blk.c
+++ b/hw/virtio-blk.c
@@ -569,7 +569,7 @@ VirtIODevice *virtio_blk_init(DeviceState *dev, BlockConf *conf,
     DriveInfo *dinfo;
 
     if (!conf->bs) {
-        error_report("virtio-blk-pci: drive property not set");
+        error_report("drive property not set");
         return NULL;
     }
     if (!bdrv_is_inserted(conf->bs)) {
-- 
1.7.6.4


