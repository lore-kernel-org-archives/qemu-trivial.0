Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1QrP-0003q2-W6
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 18:17:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1QrF-0003Dm-SG
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 18:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1Qr8-0003fv-9B
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 18:16:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:53197 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S1Qqx-0003fI-G8; Sat, 25 Feb 2012 18:16:35 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 1890D89471;
	Sun, 26 Feb 2012 00:16:34 +0100 (CET)
Message-ID: <4F496BD1.5010205@suse.de>
Date: Sun, 26 Feb 2012 00:16:33 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120208 Thunderbird/10.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
	<1330173433-32043-2-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330173433-32043-2-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] ppc: Add missing
	'static' to spin_rw_ops
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
X-List-Received-Date: Sat, 25 Feb 2012 23:17:01 -0000

Am 25.02.2012 13:37, schrieb Stefan Weil:
> spin_rw_ops is only used in hw/ppce500_spin.c.
>=20
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Andreas F=E4rber <afaerber@suse.de>

/-F

> ---
>  hw/ppce500_spin.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
> index 6b8a189..6ed676b 100644
> --- a/hw/ppce500_spin.c
> +++ b/hw/ppce500_spin.c
> @@ -182,7 +182,7 @@ static uint64_t spin_read(void *opaque, target_phys=
_addr_t addr, unsigned len)
>      }
>  }
> =20
> -const MemoryRegionOps spin_rw_ops =3D {
> +static const MemoryRegionOps spin_rw_ops =3D {
>      .read =3D spin_read,
>      .write =3D spin_write,
>      .endianness =3D DEVICE_BIG_ENDIAN,

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

