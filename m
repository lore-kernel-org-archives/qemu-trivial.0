Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tqhdo-0005GW-NM
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2013 05:03:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Tqhdi-00058Y-63
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 05:03:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Tqhde-0007QV-9L
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 05:03:06 -0500
Received: from ozlabs.org ([203.10.76.45]:34268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Tqhdd-0007Q4-UF
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 05:03:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 17D312C008D; Thu,  3 Jan 2013 21:02:55 +1100 (EST)
Date: Thu, 3 Jan 2013 20:58:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20130103095830.GG4729@truffula.fritz.box>
References: <1355986241-32461-1-git-send-email-sw@weilnetz.de>
	<20130103085946.GA11586@stefanha-thinkpad.muc.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline
In-Reply-To: <20130103085946.GA11586@stefanha-thinkpad.muc.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pseries: Remove unneeded
 include statement (fixes MinGW builds)
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
X-List-Received-Date: Thu, 03 Jan 2013 10:03:10 -0000


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 09:59:46AM +0100, Stefan Hajnoczi wrote:
> On Thu, Dec 20, 2012 at 07:50:41AM +0100, Stefan Weil wrote:
> > sys/mman.h is not needed (tested on Linux) and unavailable for MinGW,
> > so remove it.
> >=20
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >  hw/spapr_nvram.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I audited the code and cannot see anything that would require
> <sys/mman.h>.

Oh, yes, that would have been from an early draft that directly
mmap()ed a backing file rather than using the block layer.  It
shouldn't be needed any more.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDlVkYACgkQaILKxv3ab8aClACdETnTWisJSzbMjZch91zGSHNK
uVoAn22nb1GvMfAON9QqZTSL9iXrf6qF
=vssV
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--

