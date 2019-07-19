Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoq1p-0007vA-6J
	for mharc-qemu-trivial@gnu.org; Sat, 20 Jul 2019 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53825)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hoq1l-0007hC-KN
 for qemu-trivial@nongnu.org; Sat, 20 Jul 2019 10:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hoq1k-0002kW-Fr
 for qemu-trivial@nongnu.org; Sat, 20 Jul 2019 10:07:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37337 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hoq1b-0002Yf-TR; Sat, 20 Jul 2019 10:07:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45rV7Z1lSnz9sNC; Sun, 21 Jul 2019 00:07:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563631658;
 bh=GIs8XKwl06uRHQ/l1PcTQRA8mzVA6skBTsqI/zdaF8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FPvLmmmHZBlLaaXgusaUwse8JwUp2mxihgxR3ziSHYwABH5eyezdzlDumW0NzWqpW
 pcp2RJBCFgxcEXhdx6RqDnvvhUe1lrS5VVY4sa1aXTjtLxsK3GlWoW+VI1CcT0Z+he
 RRGbzMmQPyAsck+B8wAIfZe8RQD9bNxKJ0Ha8Bpo=
Date: Sat, 20 Jul 2019 00:20:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Corey Minyard <minyard@acm.org>,
 Max Reitz <mreitz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Message-ID: <20190719142038.GB4174@umbus.fritz.box>
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline
In-Reply-To: <20190719131425.10835-8-philmd@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-trivial] [PATCH-for-4.1? 7/7] spapr_events: Rewrite a
 fall through comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2019 14:08:00 -0000


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2019 at 03:14:25PM +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> GCC9 is confused by this comment when building with CFLAG
> -Wimplicit-fallthrough=3D2:
>=20
>     CC      ppc64-softmmu/hw/ppc/spapr_rtc.o
>   hw/ppc/spapr_events.c: In function =E2=80=98rtas_event_log_to_source=E2=
=80=99:
>   hw/ppc/spapr_events.c:312:12: error: this statement may fall through [-=
Werror=3Dimplicit-fallthrough=3D]
>     312 |         if (spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT)) {
>         |            ^
>   hw/ppc/spapr_events.c:317:5: note: here
>     317 |     case RTAS_LOG_TYPE_EPOW:
>         |     ^~~~
>   cc1: all warnings being treated as errors
>=20
> Rewrite the comment using 'fall through' which is recognized by
> GCC and static analyzers.
>=20
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_events.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index ae0f093f59..0a98894ad6 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -313,7 +313,7 @@ rtas_event_log_to_source(SpaprMachineState *spapr, in=
t log_type)
>              g_assert(source->enabled);
>              break;
>          }
> -        /* fall back to epow for legacy hotplug interrupt source */
> +        /* fall through back to epow for legacy hotplug interrupt source=
 */
>      case RTAS_LOG_TYPE_EPOW:
>          source =3D spapr_event_sources_get_source(spapr->event_sources,
>                                                  EVENT_CLASS_EPOW);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0x0bYACgkQbDjKyiDZ
s5I9vxAA0lXp2UY09O/eG6yHIgCAcvXl11ODbYnTahJ3Wu5LGLfj2UeOrj/wg+9+
CVd90uAGBr4qglgwtf8uIDYPgfCvLpr/Gj8RbnoYtOW4yZXI4dpbM7km/HWqHfxk
tumdLZTCEwWYHExhSalWcAroFyPwH04hqgrt9CXijyjfrgQttf4l8qJ7xXbJnuh4
+MTSUuSfTscfpXWUa/yBhNfzdHXLEs0EE6v1+jIbXGnuxxQwwMZ0VDUBL5uqpcPs
FeYQ94FHNnARf3wapU8T4U+Onkqf9AJESXYNGmJR9/rENRI47g3DmLg/EYqIf83G
2wwFxF07goup9Hc8eM2Zj8tO7Pg9CO8G++yTe1t9BTcXCgf+3xyz0UlAVGRNXRUT
OkfTHl2PsMowATemj0fZ6qdyCT/dbySUYTKbO6kNAt6KJcMVV5spKpH3nDTMuYKw
CghZorlnUImR+/QsNLqNaJlQi9eW0LuJdS2NYvRVOo4R4E4Baf3rKG1CKLISE2xF
HydYrUYTNYgZIeaAZK1U+ZMJRPtWnyTmNdqA3aOmVbfUA9D352d+K6k1HbEeWQRh
IR366wn4QRdAbdXPAu+F7UsrtVCkMwnrAu0Hrm6Vqn/xL9fEhli0krx9rciwwi7m
2tbq7Km4XdCoH6VTbuUi7R63GuofwTAeDhubO1nBQvOLwBamV+M=
=TTyo
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--

