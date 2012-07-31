Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwEdQ-0001Yv-4M
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 11:45:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwEdK-0001Yd-3Q
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1SwEdD-0004MC-Eq
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 11:45:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1SwEdD-0004Lk-3D; Tue, 31 Jul 2012 11:45:11 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VFj9ZM031990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 11:45:09 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-21.ams2.redhat.com
	[10.36.112.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VFj6lp030207; Tue, 31 Jul 2012 11:45:06 -0400
Message-ID: <5017FD81.3040707@redhat.com>
Date: Tue, 31 Jul 2012 17:45:05 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de> <87y5m06jx1.fsf@codemonkey.ws>
In-Reply-To: <87y5m06jx1.fsf@codemonkey.ws>
Content-Type: multipart/mixed; boundary="------------020606050602000506050508"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Tue, 31 Jul 2012 15:45:23 -0000

This is a multi-part message in MIME format.
--------------020606050602000506050508
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id q6VFj9ZM031990

Il 31/07/2012 17:15, Anthony Liguori ha scritto:
> Andreas F=C3=A4rber <afaerber@suse.de> writes:
>=20
>> Am 31.07.2012 16:50, schrieb Paolo Bonzini:
>>> Il 31/07/2012 16:46, Andreas F=C3=A4rber ha scritto:
>>>>>> Why would megasas be in master but not compiled/linked?
>>>>> Because Anthony objected to how it picks the initiator WWN.
>>>> Ah, anything keeping us from fixing that? :)
>>>
>>> Exact knowledge of the requirements, basically. :)
>>
>> I.e. waiting on feedback about numeric constraints from Hannes? :)
>> Or waiting on general direction from Anthony?
>> How to make progress there for 1.2 / Soft Freeze?
>=20
> You cannot build guest visible state by casting pointers.
>=20
> I'm really disappointed that this hasn't been resolved yet.  If it's no=
t
> resolved before the soft freeze, I think we ought to revert the megasas
> patches completely.

Hannes, can you give a quick yes/no on the approach of the attached
patch?  The address of the HBA is given by a wwn property or, in the
lack of one, by an increasing index similar to the one used for MAC
addresses.  The address of the disks is also given by a wwn property or,
in the lack of one, by combining the HBA address with the target number.

Paolo

--------------020606050602000506050508
Content-Type: text/x-patch;
 name="0001-megasas-generate-repeatable-WWNs.patch"
Content-Disposition: attachment;
 filename="0001-megasas-generate-repeatable-WWNs.patch"
Content-Transfer-Encoding: 7bit

From 832fbadba4739821cac427c879fe6481f47a659a Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Jul 2012 17:42:11 +0200
Subject: [PATCH] megasas: generate repeatable WWNs

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/megasas.c   |   34 +++++++++++++++++++++++++---------
 hw/scsi-bus.c  |   10 ++++++++++
 hw/scsi-disk.c |    9 +++++++++
 hw/scsi.h      |    2 ++
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/hw/megasas.c b/hw/megasas.c
index 8a4960f..c07a2bb 100644
--- a/hw/megasas.c
+++ b/hw/megasas.c
@@ -38,6 +38,9 @@
 #define MEGASAS_MAX_SECTORS 0xFFFF      /* No real limit */
 #define MEGASAS_MAX_ARRAYS 128
 
+#define MEGASAS_ADDR_BASE 0x5525400123456000ULL
+#define MEGASAS_ADDR_STEP 0x1000ULL
+
 #define MEGASAS_FLAG_USE_JBOD      0
 #define MEGASAS_MASK_USE_JBOD      (1 << MEGASAS_FLAG_USE_JBOD)
 #define MEGASAS_FLAG_USE_MSIX      1
@@ -49,6 +52,8 @@ static const char *mfi_frame_desc[] = {
     "MFI init", "LD Read", "LD Write", "LD SCSI", "PD SCSI",
     "MFI Doorbell", "MFI Abort", "MFI SMP", "MFI Stop"};
 
+static uint64_t megasas_cur_addr = MEGASAS_ADDR_BASE;
+
 typedef struct MegasasCmd {
     uint32_t index;
     uint16_t flags;
@@ -89,6 +94,8 @@ typedef struct MegasasState {
     int shutdown_event;
     int boot_event;
 
+    uint64_t wwn;
+
     uint64_t reply_queue_pa;
     void *reply_queue;
     int reply_queue_len;
@@ -372,14 +379,17 @@ static uint64_t megasas_fw_time(void)
     return bcd_time;
 }
 
-static uint64_t megasas_gen_sas_addr(uint64_t id)
+static uint64_t megasas_get_sas_addr(MegasasState *s, uint64_t id)
 {
-    uint64_t addr;
+    return s->wwn + id;
+}
 
-    addr = 0x5001a4aULL << 36;
-    addr |= id & 0xfffffffff;
+static uint64_t megasas_disk_sas_addr(SCSIDevice *sdev)
+{
+    MegasasState *s = DO_UPCAST(MegasasState, dev.qdev,
+                                sdev->qdev.parent_bus->parent);
 
-    return addr;
+    return scsi_device_get_wwn(sdev) ?: megasas_get_sas_addr(s, sdev->id + 1);
 }
 
 /*
@@ -672,7 +682,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
     info.host.type = MFI_INFO_HOST_PCIX;
     info.device.type = MFI_INFO_DEV_SAS3G;
     info.device.port_count = 2;
-    info.device.port_addr[0] = cpu_to_le64(megasas_gen_sas_addr((uint64_t)s));
+    info.device.port_addr[0] = cpu_to_le64(megasas_get_sas_addr(s, 0));
 
     memcpy(info.product_name, "MegaRAID SAS 8708EM2", 20);
     snprintf(info.serial_number, 32, "QEMU%08lx",
@@ -761,7 +771,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
         return MFI_STAT_INVALID_PARAMETER;
     }
 
-    info.sas_addr = cpu_to_le64(megasas_gen_sas_addr((uint64_t)s));
+    info.sas_addr = cpu_to_le64(megasas_get_sas_addr(s, 0));
     info.stripe_size = 3;
     info.flush_time = 4;
     info.background_rate = 30;
@@ -891,7 +901,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
         info.addr[num_pd_disks].scsi_dev_type = sdev->type;
         info.addr[num_pd_disks].connect_port_bitmap = 0x1;
         info.addr[num_pd_disks].sas_addr[0] =
-            cpu_to_le64(megasas_gen_sas_addr((uint64_t)sdev));
+            cpu_to_le64(megasas_disk_sas_addr(sdev));
         num_pd_disks++;
         offset += sizeof(struct mfi_pd_address);
     }
@@ -994,7 +1004,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->slot_number = (sdev->id & 0xFF);
     info->path_info.count = 1;
     info->path_info.sas_addr[0] =
-        cpu_to_le64(megasas_gen_sas_addr((uint64_t)sdev));
+        cpu_to_le64(megasas_disk_sas_addr(sdev));
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
@@ -2069,6 +2079,11 @@ static int megasas_scsi_init(PCIDevice *dev)
     uint8_t *pci_conf;
     int i, bar_type;
 
+    if (!s->wwn) {
+        s->wwn = megasas_cur_addr;
+        megasas_cur_addr += MEGASAS_ADDR_STEP;
+    }
+
     pci_conf = s->dev.config;
 
     /* PCI latency timer = 0 */
@@ -2136,6 +2151,7 @@ static Property megasas_properties[] = {
                        MEGASAS_DEFAULT_SGE),
     DEFINE_PROP_UINT32("max_cmds", MegasasState, fw_cmds,
                        MEGASAS_DEFAULT_FRAMES),
+    DEFINE_PROP_HEX64("wwn", MegasasState, wwn, 0),
 #ifdef USE_MSIX
     DEFINE_PROP_BIT("use_msix", MegasasState, flags,
                     MEGASAS_FLAG_USE_MSIX, false),
diff --git a/hw/scsi-bus.c b/hw/scsi-bus.c
index 68049f6..79c732a 100644
--- a/hw/scsi-bus.c
+++ b/hw/scsi-bus.c
@@ -71,6 +71,16 @@ static void scsi_device_unit_attention_reported(SCSIDevice *s)
     }
 }
 
+uint64_t scsi_device_get_wwn(SCSIDevice *s)
+{
+    SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(s);
+    if (sc->get_wwn) {
+        return sc->get_wwn(s);
+    } else {
+        return 0;
+    }
+}
+
 /* Create a scsi bus, and attach devices to it.  */
 void scsi_bus_new(SCSIBus *bus, DeviceState *host, const SCSIBusInfo *info)
 {
diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index a9c7279..2cb9d4e 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -2239,6 +2239,12 @@ static SCSIRequest *scsi_block_new_request(SCSIDevice *d, uint32_t tag,
 }
 #endif
 
+static uint64_t scsi_disk_get_wwn(SCSIDevice *sdev)
+{
+    SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, sdev);
+    return s->wwn;
+}
+
 #define DEFINE_SCSI_DISK_PROPERTIES()                                \
     DEFINE_BLOCK_PROPERTIES(SCSIDiskState, qdev.conf),               \
     DEFINE_PROP_STRING("ver", SCSIDiskState, version),               \
@@ -2281,6 +2287,7 @@ static void scsi_hd_class_initfn(ObjectClass *klass, void *data)
     sc->init         = scsi_hd_initfn;
     sc->destroy      = scsi_destroy;
     sc->alloc_req    = scsi_new_request;
+    sc->get_wwn      = scsi_disk_get_wwn;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->fw_name = "disk";
     dc->desc = "virtual SCSI disk";
@@ -2310,6 +2317,7 @@ static void scsi_cd_class_initfn(ObjectClass *klass, void *data)
     sc->init         = scsi_cd_initfn;
     sc->destroy      = scsi_destroy;
     sc->alloc_req    = scsi_new_request;
+    sc->get_wwn      = scsi_disk_get_wwn;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->fw_name = "disk";
     dc->desc = "virtual SCSI CD-ROM";
@@ -2372,6 +2380,7 @@ static void scsi_disk_class_initfn(ObjectClass *klass, void *data)
     sc->init         = scsi_disk_initfn;
     sc->destroy      = scsi_destroy;
     sc->alloc_req    = scsi_new_request;
+    sc->get_wwn      = scsi_disk_get_wwn;
     sc->unit_attention_reported = scsi_disk_unit_attention_reported;
     dc->fw_name = "disk";
     dc->desc = "virtual SCSI disk or CD-ROM (legacy)";
diff --git a/hw/scsi.h b/hw/scsi.h
index 1aeee46..053a529 100644
--- a/hw/scsi.h
+++ b/hw/scsi.h
@@ -76,6 +76,7 @@ typedef struct SCSIDeviceClass {
     SCSIRequest *(*alloc_req)(SCSIDevice *s, uint32_t tag, uint32_t lun,
                               uint8_t *buf, void *hba_private);
     void (*unit_attention_reported)(SCSIDevice *s);
+    uint64_t (*get_wwn)(SCSIDevice *s);
 } SCSIDeviceClass;
 
 struct SCSIDevice
@@ -242,6 +243,7 @@ void scsi_req_abort(SCSIRequest *req, int status);
 void scsi_req_cancel(SCSIRequest *req);
 void scsi_req_retry(SCSIRequest *req);
 void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense);
+uint64_t scsi_device_get_wwn(SCSIDevice *sdev);
 void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense);
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense);
 int scsi_device_get_sense(SCSIDevice *dev, uint8_t *buf, int len, bool fixed);
-- 
1.7.10.4


--------------020606050602000506050508--

