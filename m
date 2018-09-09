Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fz3f2-0005wP-4o
	for mharc-qemu-trivial@gnu.org; Sun, 09 Sep 2018 13:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fz3ex-0005qO-7z
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 13:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fz3cA-0005iY-63
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 13:35:15 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:48962
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1fz3c2-0005Ub-QG; Sun, 09 Sep 2018 13:35:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 925F5DAF95C;
	Sun,  9 Sep 2018 19:35:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oRWrGX5Uf6Yg; Sun,  9 Sep 2018 19:35:01 +0200 (CEST)
Received: from [192.168.178.24] (p5B1518CB.dip0.t-ipconnect.de [91.21.24.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 0D760DAF957; 
	Sun,  9 Sep 2018 19:35:01 +0200 (CEST)
To: John Arbuckle <programmingkidx@gmail.com>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20180909153238.4046-1-programmingkidx@gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <817e08da-e255-7d1f-4668-503bd3c009d1@weilnetz.de>
Date: Sun, 9 Sep 2018 19:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180909153238.4046-1-programmingkidx@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RBSP6MN6HR3sTrNGNoKL1uzVxiY1FOcmO"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common.h: update
 copyright date to 2018
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
X-List-Received-Date: Sun, 09 Sep 2018 17:38:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RBSP6MN6HR3sTrNGNoKL1uzVxiY1FOcmO
Content-Type: multipart/mixed; boundary="RaV00Uj4aXeVRV0Fa18LWq3EBlfodBXJX";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: John Arbuckle <programmingkidx@gmail.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <817e08da-e255-7d1f-4668-503bd3c009d1@weilnetz.de>
Subject: Re: [Qemu-devel] [PATCH] qemu-common.h: update copyright date to 2018
References: <20180909153238.4046-1-programmingkidx@gmail.com>
In-Reply-To: <20180909153238.4046-1-programmingkidx@gmail.com>

--RaV00Uj4aXeVRV0Fa18LWq3EBlfodBXJX
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 09.09.2018 um 17:32 schrieb John Arbuckle:
> Currently the copyright date is set to 2017. Update the date to say
> 2018.
>=20
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 85f4749aef..ed60ba251d 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -17,7 +17,7 @@
>  #define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D=
 EINTR)
> =20
>  /* Copyright string for -version arguments, About dialogs, etc */
> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2017 " \
> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
>      "Fabrice Bellard and the QEMU Project developers"
> =20
>  /* Bug reporting information for --help arguments, About dialogs, etc =
*/
>=20


Reviewed-by: Stefan Weil <sw@weilnetz.de>

I think this is trivial enough for qemu-trivial.

Thanks,
Stefan


--RaV00Uj4aXeVRV0Fa18LWq3EBlfodBXJX--

--RBSP6MN6HR3sTrNGNoKL1uzVxiY1FOcmO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAluVWcQACgkQ4Iwh1Wd0
UK2DWA//VoOtjl67SvR9P6daDYJ9g2Ay4JU3AxsA76wNOHVsJZJoAVxNlD7Zipsl
ESbCeltWN9cBfieJECY+HLgnKj/WANf6TBnqriWoKtBYH5zaaOheVMhEZAMx1l52
gtiLuGt1dWmpFeN8WV/GlrVGtKsNc9XFYX4+ZKF3FDdV8uyzHaCrKTwkxRY9VH6T
jE5pWmZWAb/7TT00F6xOLQ2QBG7HoxMH+TP0wntSwbAuTUKzkx9xI8DNULt1IFy7
vfO1Jd8Tp5B8W4J18ZZMkjQ2p/L8/t1ntKp3HEGCFLXihYpq8y18L5S06Q3X37ea
LUBCZFZ8lyNHGj2HKp273hgDaSgrYB5a/dD7PO+mjY9BCKbX/p8S8UD6IbkkNuoJ
kw2Gw0YHnbwwVylevCfQeIm6gv2nbGwfWOfWySFBMm12Mv1o1TWBszsB2nYNxUBw
ApZ5ibgJjFyY0/BXbMjxjTtmeC99cGlI3PT1QWqDf5l5BLcah0ep7CoCi/eiDDUS
d941M7RddBOFGNdAhf8oARsLHCt6GIU6OnS37eQADTsJfW8/i+Ou4BJXvE3ROsGt
RNclPOXeQNm5Fxgd5du3cH7GXrKP55TIyddVzuz8ZUnBH30oTWxDNkGQ21Pw7CS/
EU5/BYRSHVOp77+eF49+K2Uon+J+wjuwh5AhK808DIBeS69G1S4=
=EwQX
-----END PGP SIGNATURE-----

--RBSP6MN6HR3sTrNGNoKL1uzVxiY1FOcmO--

