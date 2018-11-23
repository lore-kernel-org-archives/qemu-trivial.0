Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPzNJ-0002Lu-V6
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 19:31:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gPzNG-0002LS-Jk
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 19:31:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gPzNC-00062l-Fu
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 19:31:10 -0500
Received: from ozlabs.org ([203.11.71.1]:59593)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gPzDH-0007Ox-Gn; Thu, 22 Nov 2018 19:20:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 431H5n5qfrz9s1x; Fri, 23 Nov 2018 11:20:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1542932445;
	bh=qy01HploAosqnGnvYph6BS77VSTqOY23cc7/8xI0iZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnXaNcSrfDrNFuRDTYPrjVd2TNWgYW4fNXGdHCdO3z+YwMcqIfRPhAazWtvaL3HQx
	XkniqGvY5yFTk0QUohn6VfmthsR/IezIXoFZOrIEXBnAvVI/jNWOlCvWwub67m3gTp
	p65rcnLeM0Pzgkarr+0h4ACyTVSPIOTP+K0DPtJs=
Date: Fri, 23 Nov 2018 11:20:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181123002037.GO10448@umbus.fritz.box>
References: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vEfizQhTV1P/vojJ"
Content-Disposition: inline
In-Reply-To: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-trivial] [PATCH] spapr: drop redundant statement in
 spapr_populate_drconf_memory()
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
X-List-Received-Date: Fri, 23 Nov 2018 00:31:12 -0000


--vEfizQhTV1P/vojJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 03:31:36PM +0100, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-3.2.

> ---
>  hw/ppc/spapr.c |    2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9c41098b5781..7771a628f879 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -893,8 +893,6 @@ static int spapr_populate_drconf_memory(sPAPRMachineS=
tate *spapr, void *fdt)
>      /* ibm,associativity-lookup-arrays */
>      buf_len =3D (nr_nodes * 4 + 2) * sizeof(uint32_t);
>      cur_index =3D int_buf =3D g_malloc0(buf_len);
> -
> -    cur_index =3D int_buf;
>      int_buf[0] =3D cpu_to_be32(nr_nodes);
>      int_buf[1] =3D cpu_to_be32(4); /* Number of entries per associativit=
y list */
>      cur_index +=3D 2;
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vEfizQhTV1P/vojJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlv3R9UACgkQbDjKyiDZ
s5JgzQ/9Gud9ccOjZ+GsxWD2C47Oe84U75HjmPMaLF7tvRkLInWuABAcCaAkrc9X
UpNJy+ySiTMleECMgZ6g37IVbxT56gR3uaOgICuIpnD24AG3kZLZCU3V9fwyZded
c4UWsCyW3r6cTjbv9SXmuNJvaBpKatdUwuLnqovKchTkH1SaPrT2efY1vQGK1LHd
gz2bBcoyEXVyVh8NAYG5+t0yF+6Qf3eU71vJLhnjhPF1llv9jVib0DX9uEbAb3jU
pNrBY/2ixHSBarpcKvQxh+9mqAWMbGyK1f6rVeeC2hnPgeTJjccPJtxQblbOiOJo
bFWQjWaez8tDCbkvrFfcJ4mJ53karS0eZ9CtFE/2GfrY+PXvFLpYYwdlA8iuQAmj
qidaA2PjfrNI42PHL3LchxDBtfTal6lXs9guUkHx7pVD1hNhbUEDT5taNNdq/lQa
ifCpIHLw9+xrnFiegkrUcoiK0p2bekw96KVWXV8YxZjx+kWzQ2eDdJAsMXDUo/Jq
K05knUdZDHPxYe/s93jbnL9hQrr/oRh5lVZxdnz4iF+FU++Fl2bF1w9MdaM+bFkx
FBKiIhUN644X7s4DD49k5luBz9dusyA6oqAdt7ch9McAiqoEzoqCf0azT8HJOrEV
VobBzy/imMLf4s3lvHZ/nRVg/JBLq/+QlCNPJkI3JgLI5ep37hE=
=JQP0
-----END PGP SIGNATURE-----

--vEfizQhTV1P/vojJ--

