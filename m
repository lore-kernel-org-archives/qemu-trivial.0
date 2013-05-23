Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfVD6-0002Qy-U1
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 09:05:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfVCz-0002AM-Dv
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 09:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfVCu-0003w1-PR
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 09:05:29 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56807 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UfVCl-0003sI-TW; Thu, 23 May 2013 09:05:16 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1E87BA5077;
	Thu, 23 May 2013 15:05:14 +0200 (CEST)
Message-ID: <519E1408.4060602@suse.de>
Date: Thu, 23 May 2013 15:05:12 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1369292323-31762-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1369292323-31762-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][v4 1/3] debugcon: fix
 always print "addr=0x0, val=0x0" bug when use DEBUG_DEBUGCON
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
X-List-Received-Date: Thu, 23 May 2013 13:05:35 -0000

Am 23.05.2013 08:58, schrieb liguang:
> when use DEBUG_DEBUGCON, screen spits:
> debugcon: write addr=3D0x0000 val=3D0x00
> Rdebugcon: write addr=3D0x0000 val=3D0x00
> udebugcon: write addr=3D0x0000 val=3D0x00
> ndebugcon: write addr=3D0x0000 val=3D0x00
> ndebugcon: write addr=3D0x0000 val=3D0x00
> idebugcon: write addr=3D0x0000 val=3D0x00
> ndebugcon: write addr=3D0x0000 val=3D0x00
> gdebugcon: write addr=3D0x0000 val=3D0x00
>  debugcon: write addr=3D0x0000 val=3D0x00
> odebugcon: write addr=3D0x0000 val=3D0x00
> pdebugcon: write addr=3D0x0000 val=3D0x00
> tdebugcon: write addr=3D0x0000 val=3D0x00
> idebugcon: write addr=3D0x0000 val=3D0x00
> odebugcon: write addr=3D0x0000 val=3D0x00
> ndebugcon: write addr=3D0x0000 val=3D0x00
>  debugcon: write addr=3D0x0000 val=3D0x00
> rdebugcon: write addr=3D0x0000 val=3D0x00
> odebugcon: write addr=3D0x0000 val=3D0x00
> mdebugcon: write addr=3D0x0000 val=3D0x00
>  debugcon: write addr=3D0x0000 val=3D0x00
> adebugcon: write addr=3D0x0000 val=3D0x00
> tdebugcon: write addr=3D0x0000 val=3D0x00
>  debugcon: write addr=3D0x0000 val=3D0x00
>=20
> Oh, that's wrong, val is not always be 0.
> this bug caused by lack of length modifier
> for specifier 'x'.
>=20
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
> v4: fix misleading subject

As I've reminded before, please prepend a cover letter (0/x) when
sending more than once patch!

> ---
>  hw/char/debugcon.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index 02c9577..7e41c90 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
>      unsigned char ch =3D val;
> =20
>  #ifdef DEBUG_DEBUGCON
> -    printf("debugcon: write addr=3D0x%04x val=3D0x%02x\n", addr, val);
> +    printf("debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x\n=
", addr, val);

Please merge 3/3 with this patch - the changes are pretty obviously
correct, so you can shorten the commit message by dropping the example
output.

Andreas

>  #endif
> =20
>      qemu_chr_fe_write(s->chr, &ch, 1);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

