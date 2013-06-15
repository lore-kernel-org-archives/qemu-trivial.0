Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Unfhj-00041W-4W
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 21:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Unfhd-0003t0-Lv
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 21:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UnfhZ-0003Il-I9
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 21:54:53 -0400
Received: from ozlabs.org ([2402:b800:7003:1:1::1]:54985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1UnfhI-0003GG-Lz; Fri, 14 Jun 2013 21:54:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 7D4882C009F; Sat, 15 Jun 2013 11:54:30 +1000 (EST)
Date: Sat, 15 Jun 2013 11:52:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20130615015236.GC9218@voom.bne.redhat.com>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
	<9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
	<51B90D81.1020000@ozlabs.ru>
	<EF248D0E-36D7-403D-83BF-8F966459D299@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <EF248D0E-36D7-403D-83BF-8F966459D299@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2402:b800:7003:1:1::1
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [Qemu-trivial] [PATCH] spapr: add yet another maintainer
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
X-List-Received-Date: Sat, 15 Jun 2013 01:54:58 -0000


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2013 at 02:10:43AM +0200, Alexander Graf wrote:
>=20
> On 13.06.2013, at 02:08, Alexey Kardashevskiy wrote:
>=20
> > On 06/13/2013 12:33 AM, Alexander Graf wrote:
> >>=20
> >> On 12.06.2013, at 16:27, Alexey Kardashevskiy wrote:
> >>=20
> >>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >>> ---
> >>> MAINTAINERS |    1 +
> >>> 1 file changed, 1 insertion(+)
> >>>=20
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 13c0cc5..1e00bb1 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
> >>> sPAPR
> >>> M: David Gibson <david@gibson.dropbear.id.au>
> >>=20
> >> David should get removed here then, no?
> >=20
> > Well, at least sometime he is a qemu-ppc maintainer :) Don't know and I=
 am
> > not the one to decide.
>=20
> Yup, hence David should send a patch to remove himself and add you
> instead, if that's what he sees fit. Otherwise I'd like a patch from
> David removing himself only for now.

I've send an updated version through to you.
--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iEYEARECAAYFAlG7yOQACgkQaILKxv3ab8bf7gCeI5tmMePdXwrBavQ/NsB/FQ7z
VAEAnjaRxWaHCOyarPb8WMk2ZB44hWMA
=amdb
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

