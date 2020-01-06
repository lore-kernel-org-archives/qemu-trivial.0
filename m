Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iocJx-0008AY-HQ
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 19:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iocJr-0007zf-4X
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 19:02:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iocJp-0005jx-NK
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 19:01:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41055 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iocJh-0005PY-VE; Mon, 06 Jan 2020 19:01:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sCGd6bm1z9sP6; Tue,  7 Jan 2020 11:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578355305;
 bh=9Bh1BVSkU2fO4Bfqxk189SK4eaAbxsL5R57epcEUJp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnpSPEagavsM7C2tEMc4/w+RZuxT9lZkoLlNXiaBwpJii/Fi7ErofuaKL8xgFq9Pi
 bMuZNEI546+0wCrxYzXtafJhiipmc0oG4KngvPOmZxH+DEzeti4aUrTD4ZJ7OBYN4v
 M4crjejG4A0g4RJ9Ryz7k24NISCeDDp2yOedLsAg=
Date: Tue, 7 Jan 2020 10:45:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v1 02/59] ppc440_bamboo.c: remove label from
 bamboo_load_device_tree()
Message-ID: <20200106234517.GY2098@umbus>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x0Bbm7aQwrWvLJ2v"
Content-Disposition: inline
In-Reply-To: <20200106182425.20312-3-danielhb413@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
X-List-Received-Date: Tue, 07 Jan 2020 00:02:03 -0000


--x0Bbm7aQwrWvLJ2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 03:23:28PM -0300, Daniel Henrique Barboza wrote:
> 'out' label can be replaced by 'return -1' in all cases.
>=20
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-5.0.

> ---
>  hw/ppc/ppc440_bamboo.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 4d95c0f8a8..b782641b23 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -71,12 +71,12 @@ static int bamboo_load_device_tree(hwaddr addr,
> =20
>      filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, BINARY_DEVICE_TREE_=
FILE);
>      if (!filename) {
> -        goto out;
> +        return -1;
>      }
>      fdt =3D load_device_tree(filename, &fdt_size);
>      g_free(filename);
>      if (fdt =3D=3D NULL) {
> -        goto out;
> +        return -1;
>      }
> =20
>      /* Manipulate device tree in memory. */
> @@ -117,10 +117,6 @@ static int bamboo_load_device_tree(hwaddr addr,
>      rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
>      g_free(fdt);
>      return 0;
> -
> -out:
> -
> -    return ret;
>  }
> =20
>  /* Create reset TLB entries for BookE, spanning the 32bit addr space.  */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x0Bbm7aQwrWvLJ2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4Txo0ACgkQbDjKyiDZ
s5L17RAAmJ1Bw60CFwUnwu8st/D0e8Pd/vAa+WaWKNZprz0ooDjDwkJH5vYVmJVn
kZ/tkt9+t8aJr6f4oG5ffa7fUO0JXRbD9ZJr7eK/MCnKyYsaoQRlz8i7RWppNcJL
uewhNKOXRnVrjb4H50fj4zAKitPLmn0O8zkTDdE3JV+f/89g1w/Kerb2SMcJ0qCe
3/IAj102DcxvTwlfN192a7Y02HeY187dSdnCeaY6EqScjZ7llIh9AgHn70ivWqaB
Vxmp2OFRbiSrzXCjUZILQ0JaG74gaOORaEUDZN3jqqrEgA4sJ0QgG22w/5QYxLvp
I8Ru1sVch1yhoJDegFXscZR5u7TxGzJhwCnndBDiisxpWWo3aIyT7ZcVuaFtU656
Jm0g5dZaY9amD+0srkWKijJrptOJtcuoDaejFj/xS2OO3fELpLX8b+F2ZY7hRSNY
2HMRZqweXPyjCIX6/c+a1ZOhW57JcrW+Ho2bsGSaFZU7I2t+JbJeJu7H8zT5FMes
+z4pFyDCu6uYseL2UkRWIm4q1KbAOBSS9m+CIgoR2oXmEQ+MBU0orEwS1miHQnzR
TGw3iTIuCoRPoDq92GUUMtdZwZGWVjH6yHshHTlPYYaUzlMc3HHQHecMIVuq9FLi
Y9xbc4gQs0io0arO+t57vxb3CR1kRaKrQ/PIls92C3zB1i1nfpI=
=IHz7
-----END PGP SIGNATURE-----

--x0Bbm7aQwrWvLJ2v--

