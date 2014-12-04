Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwQ5s-00078h-1A
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 01:40:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XwQ5k-00070m-8w
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:40:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XwQ5e-0004AD-4l
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:40:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1XwQ5R-00046Z-DJ; Thu, 04 Dec 2014 01:40:25 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB46eMP5027479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 01:40:22 -0500
Received: from localhost (vpn1-112-165.nay.redhat.com [10.66.112.165])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB46eKSS002201; Thu, 4 Dec 2014 01:40:21 -0500
Date: Thu, 4 Dec 2014 14:40:35 +0800
From: Amos Kong <akong@redhat.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20141204064035.GB10914@air.redhat.com>
References: <1417673896-14832-1-git-send-email-famz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <1417673896-14832-1-git-send-email-famz@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.3] configure: Replace
 which(1) with "has"
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
X-List-Received-Date: Thu, 04 Dec 2014 06:40:50 -0000


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 02:18:16PM +0800, Fam Zheng wrote:
> Using "has" is more slick because which(1) is not always there.
>=20
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/configure b/configure
> index 47048f0..cae588c 100755
> --- a/configure
> +++ b/configure
> @@ -2727,7 +2727,7 @@ fi
>  if test "$modules" =3D yes; then
>      shacmd_probe=3D"sha1sum sha1 shasum"
>      for c in $shacmd_probe; do
> -        if which $c >/dev/null 2>&1; then
> +        if has $c; then

we use self defined has function to check command in all other place
in configure. LGTM.

Reviewed-by: Amos Kong <akong@redhat.com>

>              shacmd=3D"$c"
>              break
>          fi
> --=20
> 1.9.3
>=20

--=20
			Amos.

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUgAHjAAoJELxSv6I5vP9jW9cP/i7w/CJozehTuY8VCtnEA/a3
Jul1fBHAe9Fio25SXYuFWhiD/KTXurjgrhovgQF9FShGqXifi2opHN++RY09DH3c
dVGOrqoj9INcfWsfWmWQVfMKQO6nK8FbWxa7q3N0xG01MlAeDwaW5xRzu8K1uCZ7
jlaOdICNuSnTSsydtw666KgjxOQuVn/+MaxQ7W4aZ+GJQ6daOxCELt0QmzQPC0FO
wnG2ZUlaW3eYEmFWrfpF4eQSNo5NYaOI+vcMkwSmCiby759pH5nDjU4DE7WtjpCB
2Si9aAEMjjIW36hr7UiQ8g70YkGT36ABwK/A4wpujQ5sh8ZZc0Z/fWfFF4X6btOL
3lRKhICcvep9cDJZRlETG+ybTIhOHVpO9ShEOXN38AjWWix5mMg1AJxWCCOsbwkn
aq3op4n7RSWFkEDqILqikNQVVJuFLMGuOO05CGbmRqZDDQ3qDD7YMcxo3biI8LHZ
UFDYbtl9LmTdDPuZ8CdUuRvoAietFZwlcpWH1XM8xjr6RVd+8U3W/0rCBvqCfovn
Q22c4fFEvIBpvTuCu4BaR8kmu/VZgIPQ3cv0Xfn0LNIZeevVe52WwfWlUXtgPwkU
KtnxUvXnbOGZW7z3+TCjQbvD4Op6RWqnwhzRYqt2+WxHcFM8eRqJxLN/Ggkvcas+
LTjJdsPMLErnjVWsExt1
=Xev8
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--

