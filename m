Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WM06X-0000V8-9U
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 14:06:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WM06Q-0000N8-Ec
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 14:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WM06L-0003Cq-5A
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 14:06:38 -0500
Received: from cantor2.suse.de ([195.135.220.15]:44820 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WM06A-0003Af-Bc; Fri, 07 Mar 2014 14:06:22 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4D93DAB49;
	Fri,  7 Mar 2014 19:06:21 +0000 (UTC)
Message-ID: <531A18AC.20808@suse.de>
Date: Fri, 07 Mar 2014 20:06:20 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394218139-24915-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394218139-24915-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Fix typos in comments
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
X-List-Received-Date: Fri, 07 Mar 2014 19:06:44 -0000

Am 07.03.2014 19:48, schrieb Stefan Weil:
> Codespell found and fixed these new typos:
>=20
> * doesnt -> doesn't
> * funtion -> function
> * perfomance -> performance
> * remaing -> remaining
>=20
> A code style issue (line too long) was fixed manually.

"coding style"?

>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
[...]
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 7760272..d7c38fa 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -195,8 +195,8 @@ static void process_tx_fcb(eTSEC *etsec)
> =20
>      /* if packet is IP4 and IP checksum is requested */
>      if (flags & FCB_TX_IP && flags & FCB_TX_CIP) {
> -        /* do IP4 checksum (TODO This funtion does TCP/UDP checksum bu=
t not sure
> -         * if it also does IP4 checksum. */
> +        /* do IP4 checksum (TODO This function does TCP/UDP checksum
> +         * but not sure if it also does IP4 checksum. */

While rebreaking it, you could've also added the missing parenthesis,
after the dot I guess. Apart from that,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

>          net_checksum_calculate(etsec->tx_buffer + 8,
>                  etsec->tx_buffer_len - 8);
>      }
[snip]

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

