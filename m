Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0hSK-0002Og-KK
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 01:15:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e0hSI-0002MJ-Ft
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e0hSH-00006d-8f
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:15:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50649)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1e0hSB-0008Ip-2R; Sat, 07 Oct 2017 01:15:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3y8F7T4tCSz9t6m; Sat,  7 Oct 2017 16:15:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1507353301;
	bh=/lwVqk4cTbFA1bmDxltoYarW3o8+WFRKafL2r3wkzpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nePWuTCXmRIdz1EXlQ8BVA1eDSOsF7IykSPrbxPlXmbWDRyrXnXdQ7gB2G0EQgiQM
	5bUtJckwzXzYzHvbyEJ94V74yirdthN+yfAXAIYYM2wccLcOmE+DeqitmPF+B+1Tlc
	zEFXYN55eYqzP5Is+4d3IhlMmIniaPD61OkIQtpA=
Date: Sat, 7 Oct 2017 15:38:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Alexander Graf <agraf@suse.de>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org
Message-ID: <20171007043835.GD10050@umbus.fritz.box>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-56-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <20171006235023.11952-56-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH 55/88] PReP: use g_new() family of
 functions
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
X-List-Received-Date: Sat, 07 Oct 2017 05:15:19 -0000


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2017 at 08:49:50PM -0300, Philippe Mathieu-Daud=E9 wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/prep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 94138a4e8c..c638d3d17a 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -512,7 +512,7 @@ static void ppc_prep_init(MachineState *machine)
>      int ppc_boot_device;
>      DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
> =20
> -    sysctrl =3D g_malloc0(sizeof(sysctrl_t));
> +    sysctrl =3D g_new0(sysctrl_t, 1);
> =20
>      linux_boot =3D (kernel_filename !=3D NULL);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnYWkkACgkQbDjKyiDZ
s5LuhxAAp9FQk73Q/sIzyoa9XyFZgOPo00brOX8S1MZaUX/3VfkBnQyHi75dVnD8
zHpIi+xDFKvzQ+X+YQsTqiFhiIAtKzWp8ZvdjDZKzALy7mkBDI/BLfIbGzGu/VBC
hY957F9ECPZrE18Z3sPLoju335bFJ7Nta4HQUA6eSvZCYlLvvO83BTuYC4ZUq/DC
gUCKN0UT51w/eT2J2C6YC4jjq/XY5j0+RLR0ZA4C8/OVoPNKOoR7BS8LZGRYYwBW
Lgj5sbs8cPGNrHQ2rX4KCnpZ+i5WwGYU91ZMKBoYLhi8deiUcoiHj1fZKRLrsHAG
qJmpa/UBgfOGVWfoH4AsuAIPuTGsQFpR3kDcG2/BQdthTOzF50Rr+sv4CR8zlQha
ANZFpawOlgP5V89+8D441uo4fl4kCrQ/BYnvzy586PqmSTCSBvqTAA2NNNvM12oK
FFpRSSxjraa+/FB/3e64YoAdKsIbgRBarL/BW7DnsyUBS/WvtucUDhGrkRQ6PPxd
k8EAjAiOwY2SLwJhTWXlAFZlhZd+udKfAklt0JJLNQOxOxfJcoKk/JrKg4MPlsVq
CRkxL+R4jVK5Z02C/8jFyGA1oIPJSsXzxNN+cOfa3DshtoEBFcbJP4JxDlnHlSlu
JloVk7N8yM9/Ba5b57Q8/Azpk/1xjvcV3OZC2QzniCvKG8UIgrg=
=CNhv
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--

