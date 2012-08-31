Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7YtD-0003Qk-Md
	for mharc-qemu-trivial@gnu.org; Fri, 31 Aug 2012 17:36:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T7YtA-0003GY-0J
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 17:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T7Yt8-0007IX-QB
	for qemu-trivial@nongnu.org; Fri, 31 Aug 2012 17:36:27 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38209 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T7Yt0-00079w-R0; Fri, 31 Aug 2012 17:36:19 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 955F9A3421;
	Fri, 31 Aug 2012 23:36:17 +0200 (CEST)
Message-ID: <50412E4D.9010204@suse.de>
Date: Fri, 31 Aug 2012 23:36:13 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346444481-31727-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ppc405_uc: Fix buffer
	overflow
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
X-List-Received-Date: Fri, 31 Aug 2012 21:36:30 -0000

Am 31.08.2012 22:21, schrieb Stefan Weil:
> Report from smatch:
>=20
> ppc405_uc.c:209 dcr_read_pob(12) error: buffer overflow 'pob->besr' 2 <=
=3D 2
> ppc405_uc.c:232 dcr_write_pob(12) error: buffer overflow 'pob->besr' 2 =
<=3D 2
>=20
> The old code reads and writes besr[POB0_BESR1 - POB0_BESR0] or besr[2]
> which is one too much.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> As this code was wrong for more than 5 years, there is no urgent need t=
o
> fix it now for QEMU 1.2.
>=20
> Regards,
>=20
> Stefan Weil
>=20
>  hw/ppc405_uc.c |   16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc405_uc.c b/hw/ppc405_uc.c
> index 89e5013..b52ab2f 100644
> --- a/hw/ppc405_uc.c
> +++ b/hw/ppc405_uc.c
> @@ -191,7 +191,8 @@ enum {
>  typedef struct ppc4xx_pob_t ppc4xx_pob_t;
>  struct ppc4xx_pob_t {
>      uint32_t bear;
> -    uint32_t besr[2];
> +    uint32_t besr0;
> +    uint32_t besr1;
>  };
> =20
>  static uint32_t dcr_read_pob (void *opaque, int dcrn)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

We could alternatively leave besr[2] and access it with hardcoded 0..1.

Adding qemu-stable to the mix so it can be backported to stable-1.2
after the release.

Andreas

> @@ -205,8 +206,10 @@ static uint32_t dcr_read_pob (void *opaque, int dc=
rn)
>          ret =3D pob->bear;
>          break;
>      case POB0_BESR0:
> +        ret =3D pob->besr0;
> +        break;
>      case POB0_BESR1:
> -        ret =3D pob->besr[dcrn - POB0_BESR0];
> +        ret =3D pob->besr1;
>          break;
>      default:
>          /* Avoid gcc warning */
> @@ -227,9 +230,12 @@ static void dcr_write_pob (void *opaque, int dcrn,=
 uint32_t val)
>          /* Read only */
>          break;
>      case POB0_BESR0:
> +        /* Write-clear */
> +        pob->besr0 &=3D ~val;
> +        break;
>      case POB0_BESR1:
>          /* Write-clear */
> -        pob->besr[dcrn - POB0_BESR0] &=3D ~val;
> +        pob->besr1 &=3D ~val;
>          break;
>      }
>  }
> @@ -241,8 +247,8 @@ static void ppc4xx_pob_reset (void *opaque)
>      pob =3D opaque;
>      /* No error */
>      pob->bear =3D 0x00000000;
> -    pob->besr[0] =3D 0x0000000;
> -    pob->besr[1] =3D 0x0000000;
> +    pob->besr0 =3D 0x0000000;
> +    pob->besr1 =3D 0x0000000;
>  }
> =20
>  static void ppc4xx_pob_init(CPUPPCState *env)
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

