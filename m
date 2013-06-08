Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlDvo-0002Xy-Sb
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jun 2013 03:51:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UlDvm-0002SJ-4b
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 03:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UlDvk-0004s1-Ud
	for qemu-trivial@nongnu.org; Sat, 08 Jun 2013 03:51:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UlDvf-0004rM-Q6; Sat, 08 Jun 2013 03:51:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DC99840CF3;
	Sat,  8 Jun 2013 11:51:12 +0400 (MSK)
Message-ID: <51B2E26F.8030106@msgid.tls.msk.ru>
Date: Sat, 08 Jun 2013 11:51:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Peter Crosthwaite <peter.crosthwaite@petalogix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] ioport/memory: check that both .read and
 .write callbacks are defined
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
X-List-Received-Date: Sat, 08 Jun 2013 07:51:23 -0000

05.06.2013 17:42, Herv=C3=A9 Poussineau wrote:
> If that's not the case, QEMU will may during execution.
> This has recently been fixed for:
> - acpi (2d3b989529727ccace243b953a181fbae04a30d1)
> - kvmapic (0c1cd0ae2a4faabeb948b9a07ea1696e853de174)
> - xhci (6d3bc22e31bcee74dc1e05a5370cabb33b7c3fda)

And apparently we also have alot of other cases like
this, which will trigger this new assert:

hw/ssi/xilinx_spips.c:static const MemoryRegionOps lqspi_ops =3D {
hw/ssi/xilinx_spips.c-    .read =3D lqspi_read,
hw/ssi/xilinx_spips.c-    .endianness =3D DEVICE_NATIVE_ENDIAN,
hw/ssi/xilinx_spips.c-    .valid =3D {
hw/ssi/xilinx_spips.c-        .min_access_size =3D 1,
hw/ssi/xilinx_spips.c-        .max_access_size =3D 4
hw/ssi/xilinx_spips.c-    }

hw/usb/hcd-ehci.c:static const MemoryRegionOps ehci_mmio_caps_ops =3D {
hw/usb/hcd-ehci.c-    .read =3D ehci_caps_read,
hw/usb/hcd-ehci.c-    .valid.min_access_size =3D 1,
hw/usb/hcd-ehci.c-    .valid.max_access_size =3D 4,
hw/usb/hcd-ehci.c-    .impl.min_access_size =3D 1,
hw/usb/hcd-ehci.c-    .impl.max_access_size =3D 1,
hw/usb/hcd-ehci.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/usb/hcd-ehci.c-};

hw/scsi/megasas.c:static const MemoryRegionOps megasas_queue_ops =3D {
hw/scsi/megasas.c-    .read =3D megasas_queue_read,
hw/scsi/megasas.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/scsi/megasas.c-    .impl =3D {
hw/scsi/megasas.c-        .min_access_size =3D 8,
hw/scsi/megasas.c-        .max_access_size =3D 8,
hw/scsi/megasas.c-    }
hw/scsi/megasas.c-};

hw/pci/msix.c:static const MemoryRegionOps msix_pba_mmio_ops =3D {
hw/pci/msix.c-    .read =3D msix_pba_mmio_read,
hw/pci/msix.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/pci/msix.c-    .valid =3D {
hw/pci/msix.c-        .min_access_size =3D 4,
hw/pci/msix.c-        .max_access_size =3D 4,
hw/pci/msix.c-    },
hw/pci/msix.c-};

hw/misc/lm32_sys.c:static const MemoryRegionOps sys_ops =3D {
hw/misc/lm32_sys.c-    .write =3D sys_write,
hw/misc/lm32_sys.c-    .valid.accepts =3D sys_ops_accepts,
hw/misc/lm32_sys.c-    .endianness =3D DEVICE_NATIVE_ENDIAN,
hw/misc/lm32_sys.c-};

hw/misc/vfio.c:static const MemoryRegionOps vfio_ati_3c3_quirk =3D {
hw/misc/vfio.c-    .read =3D vfio_ati_3c3_quirk_read,
hw/misc/vfio.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/misc/vfio.c-};

hw/misc/debugexit.c:static const MemoryRegionOps debug_exit_ops =3D {
hw/misc/debugexit.c-    .write =3D debug_exit_write,
hw/misc/debugexit.c-    .valid.min_access_size =3D 1,
hw/misc/debugexit.c-    .valid.max_access_size =3D 4,
hw/misc/debugexit.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/misc/debugexit.c-};

hw/misc/pc-testdev.c:static const MemoryRegionOps test_irq_ops =3D {
hw/misc/pc-testdev.c-    .write =3D test_irq_line,
hw/misc/pc-testdev.c-    .valid.min_access_size =3D 1,
hw/misc/pc-testdev.c-    .valid.max_access_size =3D 1,
hw/misc/pc-testdev.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/misc/pc-testdev.c-};

hw/misc/pc-testdev.c:static const MemoryRegionOps test_flush_ops =3D {
hw/misc/pc-testdev.c-    .write =3D test_flush_page,
hw/misc/pc-testdev.c-    .valid.min_access_size =3D 4,
hw/misc/pc-testdev.c-    .valid.max_access_size =3D 4,
hw/misc/pc-testdev.c-    .endianness =3D DEVICE_LITTLE_ENDIAN,
hw/misc/pc-testdev.c-};


Maybe instead (or in addition to), we should provide a dummy
read or write functions -- instead of fixing each such occurence
to use its own dummy function -- and maybe even a function to
map old_mmio.{read,write} into {read,write} (so we'll have
less ifs in there).

Adding some Cc's.  I don't think this is "trivial enough"
having in mind all the above :)

Thanks,

/mjt

> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
> I started all current QEMU system emulations with
> qemu-system-{arch} -M {machine} , and none broke on these
> additionnal asserts.
> However, lots of them exited for other reasons, like not having the
> right number of CPUs, no -kernel argument, or fetching invalid
> instructions from RAM.
>=20
>  ioport.c |    1 +
>  memory.c |    2 ++
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/ioport.c b/ioport.c
> index a0ac2a0..8dd9d50 100644
> --- a/ioport.c
> +++ b/ioport.c
> @@ -337,6 +337,7 @@ void portio_list_init(PortioList *piolist,
>      unsigned n =3D 0;
> =20
>      while (callbacks[n].size) {
> +        assert(callbacks[n].read && callbacks[n].write);
>          ++n;
>      }
> =20
> diff --git a/memory.c b/memory.c
> index 5cb8f4a..654d1ce 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1008,6 +1008,8 @@ void memory_region_init_io(MemoryRegion *mr,
>                             uint64_t size)
>  {
>      memory_region_init(mr, name, size);
> +    assert(ops->read || ops->old_mmio.read);
> +    assert(ops->write || ops->old_mmio.write);
>      mr->ops =3D ops;
>      mr->opaque =3D opaque;
>      mr->terminates =3D true;
>=20


