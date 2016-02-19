Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWYyo-0000H8-Ly
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2016 19:31:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aWYyk-000066-OC
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 19:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1aWYyj-0005UJ-K8
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 19:31:26 -0500
Received: from ozlabs.org ([103.22.144.67]:42831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1aWYyb-0005Pb-I0; Thu, 18 Feb 2016 19:31:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 6922614030F; Fri, 19 Feb 2016 11:31:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1455841873;
	bh=Uj7dya8/R+uCg0DnQV8Nv70nQYr7LNoipZHAoKf6GRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+4+s/LGzuKdSOt2CGNF4BSi7avynmTRu9JM4nW0sV1LxdjoEURIbC3tgi+tR8WAP
	0L77Izz92MWC3i1bOvDND2/dB/2qprl6D337cH7WTQIjE1QVRQOQDDt4nGCG6nOzMs
	AjsmBrOVg8UtsN9/tuAFUp1Vv8+id69sN0VC0eqo=
Date: Fri, 19 Feb 2016 11:15:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20160219001529.GP15224@voom.fritz.box>
References: <20160218144045.7349.67293.stgit@bahia.huguette.org>
	<87povuawo2.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6iXXu7NwgEt9u5a7"
Content-Disposition: inline
In-Reply-To: <87povuawo2.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] spapr: initialize local
	Error pointer
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
X-List-Received-Date: Fri, 19 Feb 2016 00:31:28 -0000


--6iXXu7NwgEt9u5a7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 04:02:53PM +0100, Markus Armbruster wrote:
> Greg Kurz <gkurz@linux.vnet.ibm.com> writes:
>=20
> > This fixes a crash in the target QEMU during migration.
> >
> > Fixes: c5f54f3e31bf693f70a98d4d73ea5dbe05689857
>=20
> Suggest to word that as "Broken in commit c5f54f3."
>=20
> > Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> > ---
> >  hw/ppc/spapr.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index e214a34257b3..c119f5582429 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -1528,7 +1528,7 @@ static int htab_load(QEMUFile *f, void *opaque, i=
nt version_id)
> >      section_hdr =3D qemu_get_be32(f);
> > =20
> >      if (section_hdr) {
> > -        Error *local_err;
> > +        Error *local_err =3D NULL;
> > =20
> >          /* First section gives the htab size */
> >          spapr_reallocate_hpt(spapr, section_hdr, &local_err);
>=20
> Easy mistake to make (I've made it myself).  I wish I had the time to
> figure out how to make Coccinelle catch it.
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Applied to ppc-for-2.6 with Markus's suggested rewording.  Thanks.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6iXXu7NwgEt9u5a7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWxl6hAAoJEGw4ysog2bOSzTIQAOX2Lo4SFFgptCoC1B9hYgK1
dfBoyBqsFV/9npZ6kedcCT7I3pif2F4AkAI0Bd+pV4XWiofudtLNSo1+M1bv3sPq
bjJk/TUfpOmrn6+7wrJ0yfAPJxQXn+90AWvGzpWEPgEWwr8qEE+SI8OMLTIs6293
mlIOrzSTw2zv5RI/uzpvhb+k3nrhi/agJNl2Fg+r71gL28mLj/xKymEZzE9iol8e
YGZRYTU6K4pkhJAw2Ham8kWgmsRprTT563xQEcAkO1spLDUkUFuLgAQ9/vfs+Id+
d/Wm2jdMQZLbmYuX2nzHQ3FcJ+oF1sAZ3F15+viGR/BJO/nrCWIVmzZoL5huu0XE
fp7W3/SH3MBii0/Wd/KsLpX9yAS151v6eOWs8nEmpGf5WCSYp+x5SrM/G8+/Vr9S
b4pwesuFIN9gVysTjDEPMjWyf6aXSX6R6jBqjZwF4w5HdlPFnPUWITwC64ON7a7X
171Z1QQZq+rRaE8lyjwCbJ/sYMO5evUy4ZmZJ3azNN8YYIwJYmT1HajMTPzLiKUJ
Zl2aPuEWEk6VrOTApJwzBTxkoAkWyxQYV7pnRd/0w9xfqLtCFUPD9zqsPX5nourh
yBR03Quhe45BpJFcrIUmolgf8ftUn5p1H00JzVZR+fY3LelSZaHkEHmIizmawuFb
czs5HgepSA6KhK1mygUq
=42CD
-----END PGP SIGNATURE-----

--6iXXu7NwgEt9u5a7--

