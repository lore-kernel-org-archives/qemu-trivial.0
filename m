Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1go3cL-0001yo-Bt
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 04:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1go3cG-0001wU-JN
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 04:54:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1go3cE-0001YX-Ov
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 04:54:07 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60603)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1go3cA-0001Sz-Cp; Mon, 28 Jan 2019 04:54:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 43p4hh0vDNz9sBb; Mon, 28 Jan 2019 20:53:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1548669236;
	bh=BasufMgyQkgCk3Kt22pi8GEHptrygY95fa+I8n6KeAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQviNEIl+gDv31B3OREXSz3zvds0YAMGXcIfsNBAX6h/fqZKTuHYkdK6G/SEY61Nj
	LO8IH9Fis2OjckJknOXZ65KJLy50pY/ERTzElEPygtKLN8SxmUkD8gM+t2t8yKHGd1
	hw5vrLCXAdbs3kPSVjRq/vtcOcfS2UQvrCG42dT8=
Date: Mon, 28 Jan 2019 20:17:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20190128091750.GC1870@umbus.fritz.box>
References: <20190127100215.12584-1-sourav.jb1988@gmail.com>
	<758ce56b-4a03-405f-b668-f81094bec147@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline
In-Reply-To: <758ce56b-4a03-405f-b668-f81094bec147@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] hw/input/adb.c: set device
 category of adb
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
X-List-Received-Date: Mon, 28 Jan 2019 09:54:12 -0000


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 10:06:03AM +0100, Thomas Huth wrote:
> On 2019-01-27 11:02, kumar sourav wrote:
> > Sets the category of adb as DEVICE_CATEGORY_INPUT
> > Devices should be assigned to one of DEVICE_CATEGORY_XXXX
> >=20
> > Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> > ---
> >  hw/input/adb.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/input/adb.c b/hw/input/adb.c
> > index bbb40aeef1..6ca7c5641c 100644
> > --- a/hw/input/adb.c
> > +++ b/hw/input/adb.c
> > @@ -126,6 +126,7 @@ static void adb_device_class_init(ObjectClass *oc, =
void *data)
> >      dc->realize =3D adb_device_realizefn;
> >      dc->props =3D adb_device_properties;
> >      dc->bus_type =3D TYPE_ADB_BUS;
> > +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> >  }
>=20
> This patch does not make too much sense in its current shape:
> TYPE_ADB_DEVICE is an abstract device and does not show up in the output
> of "-device help", so it is not necessary for this device itself.
>=20
> Looking at the "child" devices adb-kdb and adb-mouse, they bother
> already set DEVICE_CATEGORY_INPUT in their own, so they are already fine.
>=20
> Thus please do one of the following:
>=20
> 1) Simply drop this patch.
>=20
> 2) Keep setting the category here in the abstract parent class, but then
> also remove the DEVICE_CATEGORY_INPUT in the adb-kdb and adb-mouse child
> classes.

Ah, good point.  Dropped from ppc-for-4.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlxOyLoACgkQbDjKyiDZ
s5LhVBAAyzmDPNHjnqwqiMmxxhT8ixjZMgm87JSVBCCysFlEj9c2zY4zRAEe8Tkb
Ex1E0XohHcP2YuP+h7bzhLnDicy/KDR66amDU5M3tsorMMyFuU7kEzukX42lO/fb
PE1lDWZEXxEIBwusGpZJWWTeHoHKx5N4pIc5JeC5uLwYbYR8cdTUSYdaS1PFgjPQ
YesuLsUIzoI2O0ce3ulgRAzSD4qzc/ryfL5toBZ0biZfj0Cuv5ZgiV0xPszcXuY+
ZIrPLY4Qonrlyedga843jE2FmBxXbV0dgk08LKzMYcvA382De4NCfRDRVgXeCe/T
j+eWjahOj9uwlbZVQbMimRVpYIZipKTolqS/UBWE8ahlbLCGcl0yI1u/Tw9CKKoz
AJNd4nVrsG7i5Hy1wtbsLBDIVjqeH5JFVOX9GMuVTufRLWcOHyVqv4IZwhT8lXFj
cbSKGeZyBgdP3QTYd77ADZZkisCrt8Qeo8PI/ZFYw9cE5xmHGO9d7wfcENX5M7LN
nmJqQmXwqZIvsUqDK+u016U1M/mDOf4TrPCQHfpuLgdmZ9G3wPi1yqCb9lPOb1RN
HfLXu+z8iPx7bnQm74wOYc/R1Ak6+SKXTNEVeK45cqptFCrMcOWYnHBk+fMqXyM+
7jThsAJLJCwCs3wiMM1drIIN17goD+vVdiTMfa5gVkZF9klXwhw=
=dObv
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--

