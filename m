Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6uSV-0003cz-Po
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 02:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b6uSU-0003bg-1c
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 02:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1b6uSS-00051v-6O
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 02:44:21 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=41534 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1b6uSL-00051Z-10; Sun, 29 May 2016 02:44:13 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 8FB0711810A6;
	Sun, 29 May 2016 08:44:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id lHrRN_fbkMiV; Sun, 29 May 2016 08:44:09 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC8F14.dip0.t-ipconnect.de
	[84.172.143.20])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 71F4511810A5;
	Sun, 29 May 2016 08:44:09 +0200 (CEST)
To: Sameeh Jubran <sameeh@daynix.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
References: <1464503845-29545-1-git-send-email-sameeh@daynix.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Yan Vugenfirer <yan@daynix.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <574A8FB2.6080602@weilnetz.de>
Date: Sun, 29 May 2016 08:44:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1464503845-29545-1-git-send-email-sameeh@daynix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="g1U6fumqo64pSOtJfcTohTSCuI9Vqcd7Q"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] e1000: Removing unnecessary
 if statement
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 06:44:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g1U6fumqo64pSOtJfcTohTSCuI9Vqcd7Q
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Am 29.05.2016 um 08:37 schrieb Sameeh Jubran:
> Since mit_delay can never be 0 this if statement is
> superfluous.
>
> Signed-off-by: Sameeh Jubran <sameeh@daynix.com>
> ---
>  hw/net/e1000.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 8e79b55..eb903a9 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -365,11 +365,9 @@ set_interrupt_cause(E1000State *s, int index, uint=
32_t val)
>               */
>              mit_delay =3D (mit_delay < 500) ? 500 : mit_delay;
> =20
> -            if (mit_delay) {
> -                s->mit_timer_on =3D 1;
> -                timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_V=
IRTUAL) +
> -                          mit_delay * 256);
> -            }
> +            s->mit_timer_on =3D 1;
> +            timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL) +
> +                      mit_delay * 256);
>              s->mit_ide =3D 0;
>          }
>      }

Reviewed-by: Stefan Weil <sw@weilnetz.de>

CC'ing qemu-trivial



--g1U6fumqo64pSOtJfcTohTSCuI9Vqcd7Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXSo+5AAoJEOCMIdVndFCtupYP/jL1SN6pFMAedXQjLGakeBQL
EStKAXlWZwr5/jan9NNzRB65xmtPM0TL6c2qUBoKo/fyC9wAqckjCs9EWHrwAVAr
jnaISv093pI4V27Hpi72WthmzYZUFToPs4pPTl+ASujVU8xU37cUl054M8pRqPPc
XqB8rOq2SZhA6Vbz43yuCdBVlxkpnslec2eJM+4++QUtQEJP/zyKkC9s5YMIxdi6
G1U30RspFrU54cjZZiO6zO96f5B/O8mqU/opxZbrZs/TQWHYiZocy3SCBj0awauU
c5PATXlc2rBOVzf96NRHRvCPP4aaVaILg8QBTLS17eZRrpgSaK6puVquNjnuNcut
TEJlzjVZJvoDIFNfxYRLPYb8FRdvJQxXQezWnwY4S9SLkMqzBCEXutbuUfNfwIqI
6OZJamQKNpHMWhK3npZdO6NlxVqIbpAA8KWXS0F0x5lhMK0lcmv3tA05Nr2mTBnn
zp7E+3pXN/0XP6WNLt1wM0BKte+gdwW4i/CQvwhR6EZzoFuxyW8yQbfUrJ73lHIV
8kovZa6Nw2/4EMBXGMQP/Vozq25/59EXKC7CMgiXxhC2TvyDRlGSz/kAtEI6zPDI
NlMdwmBRmCgIZyl9klqIXYLE1nJIXVBXmttqdlOMX8d2VBb3KJgWeM9M/vlNpZlU
OlRdV/OKyFpwldmna5Xn
=batF
-----END PGP SIGNATURE-----

--g1U6fumqo64pSOtJfcTohTSCuI9Vqcd7Q--

