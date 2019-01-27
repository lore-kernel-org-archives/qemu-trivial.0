Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnsEf-0001on-NM
	for mharc-qemu-trivial@gnu.org; Sun, 27 Jan 2019 16:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gnsEe-0001nL-0B
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 16:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gnsEb-0004vh-EU
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 16:44:59 -0500
Received: from ozlabs.org ([203.11.71.1]:56801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gnsEV-0004oG-Qi; Sun, 27 Jan 2019 16:44:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 43nmWG1wljz9sBQ; Mon, 28 Jan 2019 08:44:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1548625482;
	bh=cE5fR2pSQzuXfx5LrygZh0wJGsiaAnGg8Ok9bESNbYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orvR3u+zpItzw10GWpbjodW9e+scObyMIBeMZAnOfF3GMd8PxqQEvqWRW6LSnDZRY
	FqKv3AaT9smIrJvAbw/sjxJibm6bknlMxTkDFXA2UNgfupBbS25De4DHYpZ3LlbSse
	wKd5OWASUYv6OfZY1TJzsObz3eDImou5OfSZEFmU=
Date: Mon, 28 Jan 2019 00:27:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: kumar sourav <sourav.jb1988@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20190127132732.GB1870@umbus.fritz.box>
References: <20190127100215.12584-1-sourav.jb1988@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <20190127100215.12584-1-sourav.jb1988@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-trivial] [PATCH] hw/input/adb.c: set device category of
 adb
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
X-List-Received-Date: Sun, 27 Jan 2019 21:45:00 -0000


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2019 at 03:32:15PM +0530, kumar sourav wrote:
> Sets the category of adb as DEVICE_CATEGORY_INPUT
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX
>=20
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>

Applied, thanks.

> ---
>  hw/input/adb.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/input/adb.c b/hw/input/adb.c
> index bbb40aeef1..6ca7c5641c 100644
> --- a/hw/input/adb.c
> +++ b/hw/input/adb.c
> @@ -126,6 +126,7 @@ static void adb_device_class_init(ObjectClass *oc, vo=
id *data)
>      dc->realize =3D adb_device_realizefn;
>      dc->props =3D adb_device_properties;
>      dc->bus_type =3D TYPE_ADB_BUS;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
> =20
>  static const TypeInfo adb_device_type_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxNscEACgkQbDjKyiDZ
s5IgJRAA0ILqCo/JtJWtOJpAmLZL8JrBcBBj18I14svTvWzco6DME4opCDs1mAK2
DELgQI5/vpwfZK5zCHLXNUE6R6nK7DzmDXwOsFNROr0k+XTZ3rmx4OfYaFVID15s
bWwk36Gufcg7Eu0GFNAa+0XuIuQZunsow4Ru7hj+GV89cY32xuBWxpsAaZ2JR0Cv
GCtrCbYk+ssAkMe4tw20HtynepQJYNc0CwhdgEhUCoUPVXfhPiG5qUOKpPtSfxl1
jOyOVbpkQ2amOsg/ordtylkCgP/sIxEicnzjyLFbyY+miKVcbbeCiOgRRppul8jU
H572Vr8jFy85YU4Sy5OjN0pLm4LklxDdZiLHqyYj4eB+tuGS9kvw/QwHYRtoVHr3
kZCzSh6X84Q348CSiNoF6Ia+tXDif2oEuY0cwM+vaVgkybG//XMaISHNt7tW989Y
VopKK0tjGM1un44+C8m3FYFND4b+cbjZ7bh2XdsbFP7jubCBPk0ujLIGpKUZNpoO
llrUpHk6PqNBDAaDj2zVhi5jjHxvhxHCmkBGf6CKYT+e1ekEI2TmRvh4hJOKP32E
5mmiF8hUzhFSoUkNe4afVFFMLtN1XGqv7Z5lGDBjhWaDw8CAk4fTdpyx9qBlDbel
xsO+2SxSW4NxRhb4hhVKja0aXt8yKDHTswdk/sULIpk549S2hP4=
=+MDI
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

