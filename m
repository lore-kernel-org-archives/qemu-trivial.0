Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gQpGD-0001MU-BP
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 02:55:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gQpGB-0001KZ-3e
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 02:55:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gQpGA-0004DP-6N
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 02:55:19 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:36129)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gQpG5-00040J-UE; Sun, 25 Nov 2018 02:55:14 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 432j57119Wz9s0n; Sun, 25 Nov 2018 18:55:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1543132507;
	bh=k7JCqWDx8//zRU+DreYb5HiM7qLM284EynuzAWnT6/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLP6qkQmP1vSStOO/xYs7X/ajYsGLjxFyQ/vdDXOL9I9oeUcAGU/iKX/c/h64ZW7q
	YSHB5WqVIBuDi8JHUDF/D5fDzdPJBNIMqZptxcvryU5XIhYyiHkSD3V4Hqh8XaIdm+
	DXBjzUZBPZOG9E1IomrzjRKQG3uSQ3I9CweuoCPs=
Date: Sun, 25 Nov 2018 18:46:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20181125074643.GB2251@umbus.fritz.box>
References: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
	<20181123002037.GO10448@umbus.fritz.box>
	<20181123090419.6209d66e@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline
In-Reply-To: <20181123090419.6209d66e@bahia.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] spapr: drop redundant
 statement in spapr_populate_drconf_memory()
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
X-List-Received-Date: Sun, 25 Nov 2018 07:55:20 -0000


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 09:04:19AM +0100, Greg Kurz wrote:
> On Fri, 23 Nov 2018 11:20:37 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Nov 22, 2018 at 03:31:36PM +0100, Greg Kurz wrote:
> > > Signed-off-by: Greg Kurz <groug@kaod.org> =20
> >=20
> > Applied to ppc-for-3.2.
> >=20
>=20
> AFAIK, next release will be 4.0.

Oh, right, I've renamed that.

>=20
> > > ---
> > >  hw/ppc/spapr.c |    2 --
> > >  1 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 9c41098b5781..7771a628f879 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -893,8 +893,6 @@ static int spapr_populate_drconf_memory(sPAPRMach=
ineState *spapr, void *fdt)
> > >      /* ibm,associativity-lookup-arrays */
> > >      buf_len =3D (nr_nodes * 4 + 2) * sizeof(uint32_t);
> > >      cur_index =3D int_buf =3D g_malloc0(buf_len);
> > > -
> > > -    cur_index =3D int_buf;
> > >      int_buf[0] =3D cpu_to_be32(nr_nodes);
> > >      int_buf[1] =3D cpu_to_be32(4); /* Number of entries per associat=
ivity list */
> > >      cur_index +=3D 2;
> > >  =20
> >=20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlv6U2MACgkQbDjKyiDZ
s5ICvg/+JZKlo+ZJjq90SSqVDf5v3tJcCrTH0L98DVM6Y9hgCLUP5MW9BDfSoJch
+rQ7e5/XKPl7oOcuLUpyXz+9Us7RfpMYd8Ac2H2ZgFDZB1lTTyvLKU7Wqas32o3u
BTzx0yQaoYTp9BlPmTMiAOlrAECugvoDWY0/yeLaOv0L/xD7pFYvCCYuUUDavOnu
lgC3+mwcBStNNnxpK40x9JFO2OolfFkcyD2bMa0bHU+v/rE3+ArdglYy3dcoOnWe
AAJBP4iDctzyYiE3CN8lBY3kxXa7JhIDzObW8TXeVIURmM73f4mDaxDyUrlvvwgQ
RVokFXkJa7nfAEqriKhx/6fdW6xb6178YaCWteU/UKHvmjwajXUQqkWlpdS10t+A
oDBC+HPaO1s+ca9p3/HVh1fCv2+s3Ymx4fh2pT0EnlHuZOJML83FMuaM3per7nzx
JqTw3ZV/362A2Hc9VflO5A484AB90BDxdazhtMmvSMByWJXHJJ0K86NFWAA+erK4
RyM7q00vF4/+9bgG/YgdOEjQn7bVE+W8wfv8EjqSJGYnFgV5ibxmmAR1sv8jQl1t
kNvuftc5UYizYwSta5bwBAGMHAlRrciWL3qLdfC1cqSlYiLlMdi33rS3Ha3017KN
L2uV5iPnMGgOnb8QpKupVANcdjrZr3B1WmBYlJQIpHdO94znkKY=
=HiJG
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--

