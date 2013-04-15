Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URYbu-0001UR-Q5
	for mharc-qemu-trivial@gnu.org; Sun, 14 Apr 2013 21:53:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1URYbs-0001UJ-ST
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1URYbr-0002Im-Ll
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:53:32 -0400
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:54740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dwg@au1.ibm.com>) id 1URYbr-0002HL-3r
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:53:31 -0400
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <dwg@au1.ibm.com>;
	Mon, 15 Apr 2013 11:48:33 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 15 Apr 2013 11:48:31 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 35E342CE804A;
	Mon, 15 Apr 2013 11:53:22 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r3F1dkBn58851338; Mon, 15 Apr 2013 11:39:49 +1000
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r3F1rINd022056; Mon, 15 Apr 2013 11:53:18 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av02.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r3F1rIec022053; Mon, 15 Apr 2013 11:53:18 +1000
Received: by ozlabs.au.ibm.com (Postfix, from userid 1010)
	id 39A65A0191; Mon, 15 Apr 2013 11:53:18 +1000 (EST)
Date: Mon, 15 Apr 2013 11:52:32 +1000
From: David Gibson <dwg@au1.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20130415015232.GB16400@truffula.fritz.box>
References: <51686F17.7070503@weilnetz.de>
	<1365990476-14975-1-git-send-email-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <1365990476-14975-1-git-send-email-aik@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13041501-1396-0000-0000-000002CDB641
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.147
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, qemu-ppc@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v2] bswap: fix compiler warning
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
X-List-Received-Date: Mon, 15 Apr 2013 01:53:34 -0000

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 11:47:56AM +1000, Alexey Kardashevskiy wrote:
> The bswap functions use memcpy but the bswap.h header itself does not see=
m to
> include it in some configuration such as cross compiling for powerpc64
> on x86_64 machine.
>=20
> The patch explicitly includes string.h.
>=20
> v2:
> * #include statement moved to the right place
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFrXWAACgkQaILKxv3ab8bnhACfb0+XAMpC83jXGjBQlBex4BAw
YtkAn1r5GeuydRDP1pRKEBS6YvHQm1ag
=ZPdy
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--


