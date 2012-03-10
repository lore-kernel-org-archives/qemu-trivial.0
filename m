Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S6T09-0004IP-OK
	for mharc-qemu-trivial@gnu.org; Sat, 10 Mar 2012 15:34:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S6T07-0004C4-Ir
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 15:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S6T05-0005fW-Ni
	for qemu-trivial@nongnu.org; Sat, 10 Mar 2012 15:34:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:50744 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S6T02-0005ew-52; Sat, 10 Mar 2012 15:34:46 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 82CA192EF4;
	Sat, 10 Mar 2012 21:34:44 +0100 (CET)
Message-ID: <4F5BBAE3.60705@suse.de>
Date: Sat, 10 Mar 2012 21:34:43 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330177825-7618-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330177825-7618-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paul Brook <paul@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ds1338: Add missing break
	statement
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
X-List-Received-Date: Sat, 10 Mar 2012 20:34:53 -0000

Am 25.02.2012 14:50, schrieb Stefan Weil:
> Without the break statement, case 5 sets month and year from the same
> data. This does not look correct.
>=20
> The missing break was reported by splint.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Assigning data to both month and year certainly makes no sense,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

> ---
>  hw/ds1338.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/hw/ds1338.c b/hw/ds1338.c
> index 6397f0a..d590d9c 100644
> --- a/hw/ds1338.c
> +++ b/hw/ds1338.c
> @@ -100,6 +100,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
>              break;
>          case 5:
>              s->now.tm_mon =3D from_bcd(data & 0x1f) - 1;
> +            break;
>          case 6:
>              s->now.tm_year =3D from_bcd(data) + 100;
>              break;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

