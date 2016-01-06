Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGkV6-0006iI-UL
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jan 2016 04:35:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGkV2-0006cf-3T
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 04:35:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aGkV0-0002DQ-To
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 04:35:24 -0500
Received: from [59.151.112.132] (port=22342 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aGkUt-00028x-0L; Wed, 06 Jan 2016 04:35:15 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2279324"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2016 17:35:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8ED0645DEE0C;
	Wed,  6 Jan 2016 17:34:49 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 6 Jan 2016 17:34:49 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 6 Jan 2016 17:37:46 +0800
Message-ID: <1452073066-28319-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 8ED0645DEE0C.AE2FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, hare@suse.de,
	qemu-block@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] SCSI device: fix to incomplete QOMify
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
X-List-Received-Date: Wed, 06 Jan 2016 09:35:27 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/scsi/megasas.c     | 12 ++++++------
 hw/scsi/scsi-bus.c    |  4 ++--
 hw/scsi/virtio-scsi.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index d7dc667..78239bf 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -744,7 +744,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
     info.device.type = MFI_INFO_DEV_SAS3G;
     info.device.port_count = 8;
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
         uint16_t pd_id;
 
         if (num_pd_disks < 8) {
@@ -960,7 +960,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
         max_pd_disks = MFI_MAX_SYS_PDS;
     }
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
         uint16_t pd_id;
 
         if (num_pd_disks >= max_pd_disks)
@@ -1136,7 +1136,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
         max_ld_disks = MFI_MAX_LD;
     }
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
 
         if (num_ld_disks >= max_ld_disks) {
             break;
@@ -1187,7 +1187,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
         max_ld_disks = MFI_MAX_LD;
     }
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
 
         if (num_ld_disks >= max_ld_disks) {
             break;
@@ -1327,7 +1327,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
     ld_offset = array_offset + sizeof(struct mfi_array) * num_pd_disks;
 
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
         uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (sdev->lun & 0xFF);
         struct mfi_array *array;
         struct mfi_ld_config *ld;
@@ -2237,7 +2237,7 @@ static void megasas_soft_reset(MegasasState *s)
          * after the initial reset.
          */
         QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-            SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
+            SCSIDevice *sdev = SCSI_DEVICE(kid->child);
 
             sdev->unit_attention = SENSE_CODE(NO_SENSE);
             scsi_device_unit_attention_reported(sdev);
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 00bddc9..fea0257 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1850,7 +1850,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
 
 static char *scsibus_get_dev_path(DeviceState *dev)
 {
-    SCSIDevice *d = DO_UPCAST(SCSIDevice, qdev, dev);
+    SCSIDevice *d = SCSI_DEVICE(dev);
     DeviceState *hba = dev->parent_bus->parent;
     char *id;
     char *path;
@@ -2023,7 +2023,7 @@ static void scsi_device_class_init(ObjectClass *klass, void *data)
 static void scsi_dev_instance_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    SCSIDevice *s = DO_UPCAST(SCSIDevice, qdev, dev);
+    SCSIDevice *s = SCSI_DEVICE(dev);
 
     device_add_bootindex_property(obj, &s->conf.bootindex,
                                   "bootindex", NULL,
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 3a4f520..607593c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -352,7 +352,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
         target = req->req.tmf.lun[1];
         s->resetting++;
         QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-             d = DO_UPCAST(SCSIDevice, qdev, kid->child);
+             d = SCSI_DEVICE(kid->child);
              if (d->channel == 0 && d->id == target) {
                 qdev_reset_all(&d->qdev);
              }
-- 
2.1.0




