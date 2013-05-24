Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfqbJ-0001p5-Dr
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 07:56:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfqbG-0001lr-6s
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 07:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfqbE-0006Tv-QH
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 07:55:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47515 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UfqbB-0006T4-0c; Fri, 24 May 2013 07:55:53 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D4B8AA67E3;
	Fri, 24 May 2013 13:55:51 +0200 (CEST)
Message-ID: <519F5545.2070906@suse.de>
Date: Fri, 24 May 2013 13:55:49 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1369363654-7063-5-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1369363654-7063-5-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] debugcon: use
 fprintf(stderr...) instead of printf
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
X-List-Received-Date: Fri, 24 May 2013 11:55:59 -0000

Am 24.05.2013 04:47, schrieb liguang:
> suggested by Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/char/debugcon.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index 3b0637d..be20ede 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -55,7 +55,8 @@ static void debugcon_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
>      unsigned char ch =3D val;
> =20
>  #ifdef DEBUG_DEBUGCON
> -    printf(" [debugcon: write addr=3D0x%04" HWADDR_PRIx " val=3D0x%02"=
 PRIx64 "]\n", addr, val);
> +    fprintf(stderr, " [debugcon: write addr=3D0x%04" HWADDR_PRIx
> +            " val=3D0x%02" PRIx64 "]\n", addr, val);
>  #endif
> =20
>      qemu_chr_fe_write(s->chr, &ch, 1);
> @@ -67,7 +68,7 @@ static uint64_t debugcon_ioport_read(void *opaque, hw=
addr addr, unsigned width)
>      DebugconState *s =3D opaque;
> =20
>  #ifdef DEBUG_DEBUGCON
> -    printf("debugcon: read addr=3D0x%04" HWADDR_PRIx "\n", addr);
> +    fprintf(stderr, "debugcon: read addr=3D0x%04" HWADDR_PRIx "\n", ad=
dr);
>  #endif
> =20
>      return s->readback;
>=20

Actually my suggestion was to make this a two-patch series:

1/2 debugcon: Fix debug format specifiers
2/2 debugcon: Separate debug console output from device debug output

The former would do both HWADDR_PRIx and PRIx64 in one go and not do a
lengthy example or "Oh, that's wrong" in the commit message.
The latter would change where/how the debug output is written, without
changing to " [...]".

Thinking more about this, I think it would be best to turn this into a
DPRINTF() macro or so, then the change can be made in one central
location and the inline #ifdefs can be dropped. Bonus points if the
macro were designed in such a way that even if DEBUG_DEBUGCON is not
defined the (f)printfs get tested, to avoid regressions. :)

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

