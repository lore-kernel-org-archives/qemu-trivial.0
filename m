Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfVEX-0004eH-83
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 09:07:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfVEQ-0004SE-GT
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 09:07:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfVEK-0004Mi-Qx
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 09:06:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:56893 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UfVE8-0004Ic-AH; Thu, 23 May 2013 09:06:40 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DA3D8A50DD;
	Thu, 23 May 2013 15:06:39 +0200 (CEST)
Message-ID: <519E145D.8040205@suse.de>
Date: Thu, 23 May 2013 15:06:37 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1369292323-31762-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1369292323-31762-2-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1369292323-31762-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][v4 2/3] debugcon: make
 debug message more readable
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
X-List-Received-Date: Thu, 23 May 2013 13:07:04 -0000

Am 23.05.2013 08:58, schrieb liguang:
> before change:
> Bdebugcon: write addr=3D0x0000 val=3D0x6f
> odebugcon: write addr=3D0x0000 val=3D0x6f
> odebugcon: write addr=3D0x0000 val=3D0x74
> tdebugcon: write addr=3D0x0000 val=3D0x69
> idebugcon: write addr=3D0x0000 val=3D0x6e
> ndebugcon: write addr=3D0x0000 val=3D0x67
> gdebugcon: write addr=3D0x0000 val=3D0x20
>  debugcon: write addr=3D0x0000 val=3D0x66
>=20
> after change:
> B [debugcon: write addr=3D0x0000 val=3D0x6f]
> o [debugcon: write addr=3D0x0000 val=3D0x6f]
> o [debugcon: write addr=3D0x0000 val=3D0x74]
> t [debugcon: write addr=3D0x0000 val=3D0x69]
> i [debugcon: write addr=3D0x0000 val=3D0x6e]
> n [debugcon: write addr=3D0x0000 val=3D0x67]
> g [debugcon: write addr=3D0x0000 val=3D0x20]
>   [debugcon: write addr=3D0x0000 val=3D0x66]
>=20
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/char/debugcon.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index 7e41c90..52fa0ab 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -55,7 +55,7 @@ static void debugcon_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
>      unsigned char ch =3D val;
> =20
>  #ifdef DEBUG_DEBUGCON
> -    printf("debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x\n=
", addr, val);
> +    printf(" [debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02x=
]\n", addr, val);

While not wrong, this is rather exotic - wouldn't it be better to
fprintf() to stderr instead or to use qemu_log() or tracepoints?

Andreas

>  #endif
> =20
>      qemu_chr_fe_write(s->chr, &ch, 1);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

