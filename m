Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGmBV-00077s-HC
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jan 2016 06:23:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aGmBQ-00071D-De
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 06:23:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aGmBP-00087U-8z
	for qemu-trivial@nongnu.org; Wed, 06 Jan 2016 06:23:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36720)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aGmBH-00086l-59; Wed, 06 Jan 2016 06:23:07 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 2BB9A6E78B;
	Wed,  6 Jan 2016 11:23:06 +0000 (UTC)
Received: from redhat.com (vpn1-4-41.ams2.redhat.com [10.36.4.41])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u06BN3AM021496; Wed, 6 Jan 2016 06:23:04 -0500
Date: Wed, 6 Jan 2016 13:23:03 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <20160106132255-mutt-send-email-mst@redhat.com>
References: <1452073066-28319-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452073066-28319-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, hare@suse.de
Subject: Re: [Qemu-trivial] [PATCH] SCSI device: fix to incomplete QOMify
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
X-List-Received-Date: Wed, 06 Jan 2016 11:23:19 -0000

On Wed, Jan 06, 2016 at 05:37:46PM +0800, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/scsi/megasas.c     | 12 ++++++------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  hw/scsi/virtio-scsi.c |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index d7dc667..78239bf 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -744,7 +744,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
>      info.device.type = MFI_INFO_DEV_SAS3G;
>      info.device.port_count = 8;
>      QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>          uint16_t pd_id;
>  
>          if (num_pd_disks < 8) {
> @@ -960,7 +960,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
>          max_pd_disks = MFI_MAX_SYS_PDS;
>      }
>      QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>          uint16_t pd_id;
>  
>          if (num_pd_disks >= max_pd_disks)
> @@ -1136,7 +1136,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
>          max_ld_disks = MFI_MAX_LD;
>      }
>      QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>  
>          if (num_ld_disks >= max_ld_disks) {
>              break;
> @@ -1187,7 +1187,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
>          max_ld_disks = MFI_MAX_LD;
>      }
>      QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>  
>          if (num_ld_disks >= max_ld_disks) {
>              break;
> @@ -1327,7 +1327,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
>      ld_offset = array_offset + sizeof(struct mfi_array) * num_pd_disks;
>  
>      QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -        SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +        SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>          uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (sdev->lun & 0xFF);
>          struct mfi_array *array;
>          struct mfi_ld_config *ld;
> @@ -2237,7 +2237,7 @@ static void megasas_soft_reset(MegasasState *s)
>           * after the initial reset.
>           */
>          QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -            SCSIDevice *sdev = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +            SCSIDevice *sdev = SCSI_DEVICE(kid->child);
>  
>              sdev->unit_attention = SENSE_CODE(NO_SENSE);
>              scsi_device_unit_attention_reported(sdev);
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index 00bddc9..fea0257 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -1850,7 +1850,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
>  
>  static char *scsibus_get_dev_path(DeviceState *dev)
>  {
> -    SCSIDevice *d = DO_UPCAST(SCSIDevice, qdev, dev);
> +    SCSIDevice *d = SCSI_DEVICE(dev);
>      DeviceState *hba = dev->parent_bus->parent;
>      char *id;
>      char *path;
> @@ -2023,7 +2023,7 @@ static void scsi_device_class_init(ObjectClass *klass, void *data)
>  static void scsi_dev_instance_init(Object *obj)
>  {
>      DeviceState *dev = DEVICE(obj);
> -    SCSIDevice *s = DO_UPCAST(SCSIDevice, qdev, dev);
> +    SCSIDevice *s = SCSI_DEVICE(dev);
>  
>      device_add_bootindex_property(obj, &s->conf.bootindex,
>                                    "bootindex", NULL,
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 3a4f520..607593c 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -352,7 +352,7 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
>          target = req->req.tmf.lun[1];
>          s->resetting++;
>          QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
> -             d = DO_UPCAST(SCSIDevice, qdev, kid->child);
> +             d = SCSI_DEVICE(kid->child);
>               if (d->channel == 0 && d->id == target) {
>                  qdev_reset_all(&d->qdev);
>               }
> -- 
> 2.1.0
> 
> 

