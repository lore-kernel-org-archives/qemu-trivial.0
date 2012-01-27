Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqklA-0008Nx-Sv
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 07:18:28 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1Rqkl4-000804-7C
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:18:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1Rqkky-0002j5-48
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:18:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1Rqkkn-0002ie-TH; Fri, 27 Jan 2012 07:18:06 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0RCI2sW005265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 07:18:02 -0500
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0RCI0k8005884; Fri, 27 Jan 2012 07:18:00 -0500
From: Juan Quintela <quintela@redhat.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
In-Reply-To: <1327593288-22521-1-git-send-email-afaerber@suse.de> ("Andreas
	=?utf-8?Q?F=C3=A4rber=22's?= message of "Thu,
	26 Jan 2012 16:54:48 +0100")
References: <1327593288-22521-1-git-send-email-afaerber@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.0.92 (gnu/linux)
Date: Fri, 27 Jan 2012 13:17:59 +0100
Message-ID: <8739b1pceg.fsf@elfo.elfo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Andreas =?utf-8?Q?F?= =?utf-8?Q?=C3=A4rber?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v8] qdev: Add support for property type
	bool
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 12:18:26 -0000

Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>
> VMState supports the type bool but qdev instead supports bit, backed by
> uint32_t. Therefore let's add PROP_TYPE_BOOL and qdev_prop_set_bool().
>  PropertyInfo qdev_prop_bit =3D {
> -    .name  =3D "boolean",
> +    .name  =3D "bit",

my plan for vmstate was to name this "bool32", as it feels more
descriptive (on QDEV, we can change it, but for qemu for compatibility
reasons, it needs to stay as 4 bytes on the wire, but we can have a bool
on the struct).

This are all the uses of DEFINE_PROP_BIT.

./hw/scsi-disk.c:1736:            DEFINE_PROP_BIT("removable", SCSIDiskStat=
e, removable, 0, false),

Con be movde to bool

./hw/scsi-disk.c:1780:            DEFINE_PROP_BIT("removable", SCSIDiskStat=
e, removable, 0, false),

same

./hw/usb-msd.c:658:        DEFINE_PROP_BIT("removable", MSDState, removable=
, 0, false),

    s->scsi_dev =3D scsi_bus_legacy_add_drive(&s->bus, bs, 0, !!s->removabl=
e,
                                            s->conf.bootindex);
*should* be moved to bool

./hw/hpet.c:707:        DEFINE_PROP_BIT("msi", HPETState, flags, HPET_MSI_S=
UPPORT, false),

it is a bitmap with only one bit defined, not sure about this one.


./hw/virtio.h:213:	DEFINE_PROP_BIT("indirect_desc", _state, _field, \
./hw/virtio.h:215:	DEFINE_PROP_BIT("event_idx", _state, _field, \

This is a real bitmap with 2 values.

./hw/virtio-pci.c:800:            DEFINE_PROP_BIT("ioeventfd", VirtIOPCIPro=
xy, flags,
./hw/virtio-pci.c:819:            DEFINE_PROP_BIT("ioeventfd", VirtIOPCIPro=
xy, flags,
./hw/virtio-pci.c:843:            DEFINE_PROP_BIT("ioeventfd", VirtIOPCIPro=
xy, flags,
./hw/9pfs/virtio-9p-device.c:175:        DEFINE_PROP_BIT("ioeventfd", VirtI=
OPCIProxy, flags,

Another bitmap with only one defined value.

./hw/virtio-blk.h:103:        DEFINE_PROP_BIT("scsi", _state, _field, VIRTI=
O_BLK_F_SCSI, true)

It is a bitmap

./hw/ivshmem.c:782:        DEFINE_PROP_BIT("ioeventfd", IVShmemState, featu=
res, IVSHMEM_IOEVENTFD, false),
./hw/ivshmem.c:783:        DEFINE_PROP_BIT("msi", IVShmemState,
features, IVSHMEM_MSI, true),

Another bitmap with two values.

./hw/virtio-net.h:172:        DEFINE_PROP_BIT("csum", _state, _field, VIRTI=
O_NET_F_CSUM, true), \
./hw/virtio-net.h:173:        DEFINE_PROP_BIT("guest_csum", _state, _field,=
 VIRTIO_NET_F_GUEST_CSUM, true), \
./hw/virtio-net.h:174:        DEFINE_PROP_BIT("gso", _state, _field, VIRTIO=
_NET_F_GSO, true), \
./hw/virtio-net.h:175:        DEFINE_PROP_BIT("guest_tso4", _state, _field,=
 VIRTIO_NET_F_GUEST_TSO4, true), \
./hw/virtio-net.h:176:        DEFINE_PROP_BIT("guest_tso6", _state, _field,=
 VIRTIO_NET_F_GUEST_TSO6, true), \
./hw/virtio-net.h:177:        DEFINE_PROP_BIT("guest_ecn", _state, _field, =
VIRTIO_NET_F_GUEST_ECN, true), \
./hw/virtio-net.h:178:        DEFINE_PROP_BIT("guest_ufo", _state, _field, =
VIRTIO_NET_F_GUEST_UFO, true), \
./hw/virtio-net.h:179:        DEFINE_PROP_BIT("host_tso4", _state, _field, =
VIRTIO_NET_F_HOST_TSO4, true), \
./hw/virtio-net.h:180:        DEFINE_PROP_BIT("host_tso6", _state, _field, =
VIRTIO_NET_F_HOST_TSO6, true), \
./hw/virtio-net.h:181:        DEFINE_PROP_BIT("host_ecn", _state, _field, V=
IRTIO_NET_F_HOST_ECN, true), \
./hw/virtio-net.h:182:        DEFINE_PROP_BIT("host_ufo", _state, _field, V=
IRTIO_NET_F_HOST_UFO, true), \
./hw/virtio-net.h:183:        DEFINE_PROP_BIT("mrg_rxbuf", _state, _field, =
VIRTIO_NET_F_MRG_RXBUF, true), \
./hw/virtio-net.h:184:        DEFINE_PROP_BIT("status", _state, _field, VIR=
TIO_NET_F_STATUS, true), \
./hw/virtio-net.h:185:        DEFINE_PROP_BIT("ctrl_vq", _state, _field, VI=
RTIO_NET_F_CTRL_VQ, true), \
./hw/virtio-net.h:186:        DEFINE_PROP_BIT("ctrl_rx", _state, _field, VI=
RTIO_NET_F_CTRL_RX, true), \
./hw/virtio-net.h:187:        DEFINE_PROP_BIT("ctrl_vlan", _state, _field, =
VIRTIO_NET_F_CTRL_VLAN, true), \
./hw/virtio-net.h:188:        DEFINE_PROP_BIT("ctrl_rx_extra", _state, _fie=
ld, VIRTIO_NET_F_CTRL_RX_EXTRA, true)

Bitmap.

./hw/i8259.c:570:        DEFINE_PROP_BIT("master", PicState, master,  0, fa=
lse),

BOOL

./hw/pci.c:58:        DEFINE_PROP_BIT("multifunction", PCIDevice, cap_prese=
nt,
./hw/pci.c:60:        DEFINE_PROP_BIT("command_serr_enable", PCIDevice, cap=
_present,

bitmap with two values.

./hw/pxa2xx_timer.c:488:        DEFINE_PROP_BIT("tm4", PXA2xxTimerInfo, fla=
gs,
./hw/pxa2xx_timer.c:502:        DEFINE_PROP_BIT("tm4", PXA2xxTimerInfo, fla=
gs,

Bitmap with only one value.


> +{
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +    if (strcmp(str, "true") =3D=3D 0 || strcmp(str, "yes") =3D=3D 0) {
> +        *ptr =3D true;
> +    } else if (strcmp(str, "false") =3D=3D 0 || strcmp(str, "no") =3D=3D=
 0) {
> +        *ptr =3D false;
> +    } else {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int parse_bool_switch(DeviceState *dev, Property *prop,
> +                             const char *str)
> +{
> +    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
> +    if (strcmp(str, "on") =3D=3D 0) {
> +        *ptr =3D true;
> +    } else if (strcmp(str, "off") =3D=3D 0) {
> +        *ptr =3D false;
> +    } else {
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}

As I am joining late to this discussion, I am not going to point it very
strong.  But I think that it is an easy to have a single bool type that
accept yes/on/true and no/off/false.  Didn't really see a strong
advantage with the split.

Later, Juan.

