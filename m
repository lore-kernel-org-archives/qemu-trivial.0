Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Un5Q5-0003pC-8d
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 07:10:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Un5Pz-0003en-Oj
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 07:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Un5Pu-0005Sz-VR
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 07:10:15 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51023 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Un5Pr-0005RE-Kt; Thu, 13 Jun 2013 07:10:07 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D74A0A53D5;
	Thu, 13 Jun 2013 13:10:06 +0200 (CEST)
Message-ID: <51B9A88C.3080105@suse.de>
Date: Thu, 13 Jun 2013 13:10:04 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
In-Reply-To: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix some printf errors when
	debug is enabled
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
X-List-Received-Date: Thu, 13 Jun 2013 11:10:20 -0000

Am 13.06.2013 12:51, schrieb Hu Tao:
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  cputlb.c        | 4 ++--
>  hw/acpi/piix4.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/cputlb.c b/cputlb.c
> index 86666c8..1230e9e 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong v=
addr,
> =20
>  #if defined(DEBUG_TLB)
>      printf("tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET=
_FMT_plx
> -           " prot=3D%x idx=3D%d pd=3D0x%08lx\n",
> -           vaddr, paddr, prot, mmu_idx, pd);
> +           " prot=3D%x idx=3D%d\n",
> +           vaddr, paddr, prot, mmu_idx);
>  #endif
> =20
>      address =3D vaddr;
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index e6525ac..eafa76f 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -518,7 +518,7 @@ static uint64_t gpe_readb(void *opaque, hwaddr addr=
, unsigned width)
>      PIIX4PMState *s =3D opaque;
>      uint32_t val =3D acpi_gpe_ioport_readb(&s->ar, addr);
> =20
> -    PIIX4_DPRINTF("gpe read %x =3D=3D %x\n", addr, val);
> +    PIIX4_DPRINTF("gpe read %lx =3D=3D %x\n", addr, val);

You need HWADDR_PRIx as seen below, because it might be %llx on some
platforms. While touching it, changing %x to PRIx32 would be even better.

>      return val;
>  }
> =20
> @@ -530,7 +530,7 @@ static void gpe_writeb(void *opaque, hwaddr addr, u=
int64_t val,
>      acpi_gpe_ioport_writeb(&s->ar, addr, val);
>      pm_update_sci(s);
> =20
> -    PIIX4_DPRINTF("gpe write %x <=3D=3D %d\n", addr, val);
> +    PIIX4_DPRINTF("gpe write %lx <=3D=3D %lu\n", addr, val);

HWADDR_PRIx, PRIx64

Regards,
Andreas

>  }
> =20
>  static const MemoryRegionOps piix4_gpe_ops =3D {
> @@ -579,7 +579,7 @@ static void pci_write(void *opaque, hwaddr addr, ui=
nt64_t data,
>      switch (addr) {
>      case PCI_EJ_BASE - PCI_HOTPLUG_ADDR:
>          acpi_piix_eject_slot(opaque, (uint32_t)data);
> -        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <=3D=3D % " PRIu64=
 "\n",
> +        PIIX4_DPRINTF("pciej write %" HWADDR_PRIx " <=3D=3D %" PRIu64 =
"\n",
>                        addr, data);
>          break;
>      default:
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

