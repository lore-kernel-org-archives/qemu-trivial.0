Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ix1mN-00066V-CP
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2020 23:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ix1mK-000656-94
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 23:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ix1mJ-0007VY-95
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 23:50:08 -0500
Received: from ozlabs.org ([203.11.71.1]:43415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ix1mE-00076r-Sv; Wed, 29 Jan 2020 23:50:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 487SZW584tz9sPJ; Thu, 30 Jan 2020 15:49:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580359795;
 bh=4xQuzqLOTfH/SPcGn/lMFf1PJru0124fT/E/tkEgDcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZUkS6RzKo2AQ+RbNcKZ0JjPZZC5D0708UXGoa8f6tDLuC/Py3lBuKO0I4z2gU9wv2
 oDw0EM078JN7fBwk/+QKxCt3KgWQFZ4Omffh6vBWFN49CGFzvZ6T95qaYLRz8s5eX8
 lWzvylEHml23pWtxWgzowxssBlwqBlQVqPDseKW4=
Date: Thu, 30 Jan 2020 15:24:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] target/ppc/cpu.h: Put macro parameter in parentheses
Message-ID: <20200130042413.GC2640@umbus.fritz.box>
References: <20200130021619.65FAB747871@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <20200130021619.65FAB747871@zero.eik.bme.hu>
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
X-List-Received-Date: Thu, 30 Jan 2020 04:50:09 -0000


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 03:06:18AM +0100, BALATON Zoltan wrote:
> Fix PPC_INPUT macro to work with more complex expressions by
> protecting its argument with parentheses.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Pretty unlikely to break anything in practice, but applied nonetheless.

> ---
>  target/ppc/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 8ebeaba649..e3a937e163 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -180,7 +180,7 @@ enum {
>      POWERPC_EXCP_TRAP          =3D 0x40,
>  };
> =20
> -#define PPC_INPUT(env) (env->bus_model)
> +#define PPC_INPUT(env) ((env)->bus_model)
> =20
>  /***********************************************************************=
******/
>  typedef struct opc_handler_t opc_handler_t;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4yWmsACgkQbDjKyiDZ
s5JCZxAAgKdQUFXpM9yIqVthfOcqq+YGnmC6FBnw6LJqRk1i9NpqSnS4cSsgnN5H
t1qyggVk+h3+Gp/nDYtYsk2J6Whk21dN5u080Z3jtvG2ixm4+yiS3vuDyvmM+Soe
6PZgRlwJ/7rFAxqUDftWVBgML4S5K/m+prbJSmkAeMV+tfhcb9H02xNnphCpMaeM
t5AbMuhMF6PP0A5bM11usiKAwnvp/kzAQvkL1abl/K5j7bJaw7oUh7nHpsaJmQt9
gTDiz/QBJb33yCkLqs+ZFVqoeqhQupEYdy6hSGnNnG8FDotbCVoDw0jJlTdVgN3W
ryocbIkBju5sdfUp8uyN/y3TTNTjsd6AR7geToa8v1Z/4Llqgo7g8RSMlDr0E+iC
FPaDu14Z7T93rJugGWk/O6UYBg9ufbJ60akBY4y/WdYiF21kBCf957+HgfbPIc+q
PTHlGxJUeIxQUgXrq3Dh6OfJNszLSqmge5qA95mmVmzm0CIB1Jur+SgoRDiDBLm+
ej12J89wVdi+VpG2VuUxxA2vgT1wdh4JMHmcM2LWvVrlCoOHQKasIfsIMlW8zELi
B1mM5m5eALuIZAj88pAmZeHAJORLGHuwivbL0v+xBM1QdEsXd+z8fihCX1I8KPzB
OE7CJ9+fQyWfaSvJ0nAocqbWSX3A19COcsksk5/Yg7fsD/V2M20=
=Q99P
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

