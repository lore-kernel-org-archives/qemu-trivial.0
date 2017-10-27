Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e85FL-0001uW-U0
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2017 10:04:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e85FJ-0001u3-Sc
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 10:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e85FF-0000GL-0J
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 10:04:25 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41649)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1e85F9-0000DQ-FJ; Fri, 27 Oct 2017 10:04:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3yNlwp0sVcz9t2d; Sat, 28 Oct 2017 01:04:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1509113050;
	bh=bOvEI6KZPcsjdeM2K5Fh4WgeA9jdhPHbW2WM6EWRly4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C92k/ajfgiDDGzT61kqUn8Ioz68N9+H1JA7u7N9hr/S8cG8JACM+aUJ3n9ZV64/Mg
	uh5Bbdvy9LcWX2ogNiI7TRNqPATYI4W7HdqLGSA3/R976NTGoKP7r9PPqeB8SMjZ/2
	J2/w+2scGS5aejsnOm5qnwyAIlim9yHQ3Z0zrLpw=
Date: Fri, 27 Oct 2017 16:03:59 +0200
From: David Gibson <david@gibson.dropbear.id.au>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20171027140359.GD7115@umbus>
References: <1508493233-1166-1-git-send-email-thuth@redhat.com>
	<1508748555.16488.4.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline
In-Reply-To: <1508748555.16488.4.camel@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-trivial] [PATCH] hw/display/sm501: Fix comment in
 sm501_sysbus_class_init()
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
X-List-Received-Date: Fri, 27 Oct 2017 14:04:27 -0000


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2017 at 10:49:15AM +0200, Gerd Hoffmann wrote:
> On Fri, 2017-10-20 at 11:53 +0200, Thomas Huth wrote:
> > The "cannot_instantiate_with_device_add_yet" flag has been renamed
> > to "user_creatable" a while ago.
> >=20
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> > =A0hw/display/sm501.c | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> > index 6eddac9..7f18224 100644
> > --- a/hw/display/sm501.c
> > +++ b/hw/display/sm501.c
> > @@ -1758,7 +1758,7 @@ static void sm501_sysbus_class_init(ObjectClass
> > *klass, void *data)
> > =A0=A0=A0=A0=A0dc->reset =3D sm501_reset_sysbus;
> > =A0=A0=A0=A0=A0dc->vmsd =3D &vmstate_sm501_sysbus;
> > =A0=A0=A0=A0=A0/* Note: pointer property "chr-state" may remain null, t=
hus
> > -=A0=A0=A0=A0=A0* no need for dc->cannot_instantiate_with_device_add_ye=
t =3D
> > true;
> > +=A0=A0=A0=A0=A0* no need for dc->user_creatable =3D false;
> > =A0=A0=A0=A0=A0=A0*/
> > =A0}
> > =A0
>=20
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Applied to ppc-for-2.11, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnzPM8ACgkQbDjKyiDZ
s5Kwiw/9FVAGVJXIDtxpsw2T/6v4hLOupXk7KNLbOBG391y7ujOvwiHeYPkDhFB2
JYnGuLp50IxI9LpGETTltLVtPO+xO27k7ugaziMscRZmm0+9zdlJkAM2o7Anf3iC
qOb7fFILyOfxVTZRfktxY2FN4NfFRTd7O18WJC8SP9/nsYLrRIg1b1TJD2Fgx95d
IQkQLg9b0Ufa2gpjJGYyhAZAN/NgwLC1MMWt7dDBVIWc+GlKRSoUZE8cgifW/mAy
hW7TFkEwIpkb48xbOIkyqjM/gnOCrDPVv0nqiD/8Ny/eb2kOvshwNnESZevPhbkr
Cmi66a2uUVznbvHxjigY5yzcn5j40S29G0jdbmDzk6vhSQDKMwS6TsOAxj3B6KIh
nL3yGEEGf87//z02nJl8Ls/RmNuccNNMSCQseqJoADUNVs6OmdhpFT/ZrDd0e81/
eJjl5t4jV2tLy0fQa1UK05/ArtK33vlZ5QOWpCghOyhuCmBoGA07IiuM38gvyyvq
prlpqJ27h5oBuR+xylxLEYLEY/0bBOk1BvSlGT4c02LX/SsMR4mMcR+6wIB0Di7V
BLn8D8JAf1rfy9QpWJkLo76YyvtwAOH0hl5D44V4bZLOk/ggYRTdId2h9JxB+VDu
Q46H3vpyXIRZ2vgi5cwS9vY7pj+G8EBjPQRPyOPVUQm52BGHI8Y=
=feLP
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--

