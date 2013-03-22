Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ08E-0004QF-Pt
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 07:27:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UJ08B-0004M4-Nb
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 07:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UJ088-0002Qm-Qq
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 07:27:31 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46530 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UJ01p-0000VW-Ev; Fri, 22 Mar 2013 07:20:57 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 49AAEA3E1C;
	Fri, 22 Mar 2013 12:20:15 +0100 (CET)
Message-ID: <514C3E6D.9040002@suse.de>
Date: Fri, 22 Mar 2013 12:20:13 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/i386/pc: fix possible
 segment fault for port92_write
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
X-List-Received-Date: Fri, 22 Mar 2013 11:27:33 -0000

Am 22.03.2013 10:12, schrieb liguang:
> e.g.
> $qemu-system-x86_64 -device port92
> will report segment fault,
> for port92_write try a un-allocated
> assignment for a20_out.
> so check before this assignment.
>=20
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ed7d9ba..a0e8ee0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -440,7 +440,8 @@ static void port92_write(void *opaque, hwaddr addr,=
 uint64_t val,
> =20
>      DPRINTF("port92: write 0x%02x\n", val);
>      s->outport =3D val;
> -    qemu_set_irq(*s->a20_out, (val >> 1) & 1);
> +    if (s->a20_out)
> +        qemu_set_irq(*s->a20_out, (val >> 1) & 1);

Missing braces.

But I think it would be better to proceed with my QOM'ification [1] and
return an Error on realize here since these IRQs don't change while
realized and qdev init doesn't allow to return a textual error.

Andreas

[1] https://github.com/afaerber/qemu-cpu/commits/realize-isa

>      if (val & 1) {
>          qemu_system_reset_request();
>      }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

