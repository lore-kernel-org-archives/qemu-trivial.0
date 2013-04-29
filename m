Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWmYC-0006hF-3Y
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 07:47:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UWmY6-0006ey-0R
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 07:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UWmY1-000601-GJ
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 07:47:13 -0400
Received: from ozlabs.org ([203.10.76.45]:58337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UWmY1-0005zC-5B
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 07:47:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 29ECD2C00BD; Mon, 29 Apr 2013 21:47:05 +1000 (EST)
Date: Mon, 29 Apr 2013 21:09:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130429110954.GN20202@truffula.fritz.box>
References: <517BC1F2.70405@redhat.com>
	<1367201460-28594-1-git-send-email-aik@ozlabs.ru>
	<517E2C5C.8000700@redhat.com> <517E2D74.3070804@ozlabs.ru>
	<517E3C7C.3080604@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s3R87C3fwYeCSZ0b"
Content-Disposition: inline
In-Reply-To: <517E3C7C.3080604@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.10.76.45
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] memory: give name every AddressSpace
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
X-List-Received-Date: Mon, 29 Apr 2013 11:47:18 -0000


--s3R87C3fwYeCSZ0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 11:25:16AM +0200, Paolo Bonzini wrote:
> Il 29/04/2013 10:21, Alexey Kardashevskiy ha scritto:
> >>> >> +    g_free((void *)as->name);
> >> >=20
> >> > No cast here.
> > ?
> >=20
> >   CC    ppc64-softmmu/memory.o
> > /home/alexey/pcipassthru/qemu-impreza/memory.c: In function
> > 'address_space_destroy':
> > /home/alexey/pcipassthru/qemu-impreza/memory.c:1626:5: warning: passing
> > argument 1 of 'g_free' discards 'const' qualifier from pointer target t=
ype
> > [enabled by default]
> >      g_free(/*(void *)*/as->name);
> >      ^
>=20
> Please remove the const from as->name instead.  Since you are strdup-ing
> it, and the field is meant to be private to memory.c anyway, you do not
> need protection against changing it.

As a general rule, pointer variables that you malloc()ate should not
be const.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s3R87C3fwYeCSZ0b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF+VQIACgkQaILKxv3ab8Y0GQCfX0q3ZoQiP5CoDTw5UhkNmGDn
zjcAn3YUDCckTeYJ1lCQle2iDWaULmjh
=eADQ
-----END PGP SIGNATURE-----

--s3R87C3fwYeCSZ0b--

