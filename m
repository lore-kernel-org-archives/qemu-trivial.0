Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ZT6-00012y-Te
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 06:05:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9ZT4-00012S-2g
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9ZT2-0000VY-33
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:05:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33598 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S9ZSr-0000Ub-4B; Mon, 19 Mar 2012 06:05:21 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 62F5090072;
	Mon, 19 Mar 2012 11:05:18 +0100 (CET)
Message-ID: <4F6704DE.5040209@suse.de>
Date: Mon, 19 Mar 2012 11:05:18 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Jason Wang <jasowang@redhat.com>
References: <20120319031957.17031.94258.stgit@amd-6168-8-1.englab.nay.redhat.com>
In-Reply-To: <20120319031957.17031.94258.stgit@amd-6168-8-1.englab.nay.redhat.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [REPOST PATCH] ioapic: fix build with
	DEBUG_IOAPIC
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
X-List-Received-Date: Mon, 19 Mar 2012 10:05:35 -0000

Am 19.03.2012 04:19, schrieb Jason Wang:
> ioapic.c:198: error: format =E2=80=98%08x=E2=80=99 expects type =E2=80=98=
unsigned int=E2=80=99, but argument 3 has type =E2=80=98uint64_t=E2=80=99
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Thanks,
Andreas

> ---
>  hw/ioapic.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/ioapic.c b/hw/ioapic.c
> index 3fee011..e2e4796 100644
> --- a/hw/ioapic.c
> +++ b/hw/ioapic.c
> @@ -195,7 +195,7 @@ ioapic_mem_write(void *opaque, target_phys_addr_t a=
ddr, uint64_t val,
>          if (size !=3D 4) {
>              break;
>          }
> -        DPRINTF("write: %08x =3D %08x\n", s->ioregsel, val);
> +        DPRINTF("write: %08x =3D %08" PRIx64 "\n", s->ioregsel, val);
>          switch (s->ioregsel) {
>          case IOAPIC_REG_ID:
>              s->id =3D (val >> IOAPIC_ID_SHIFT) & IOAPIC_ID_MASK;
>=20

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

