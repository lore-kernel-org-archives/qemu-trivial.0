Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnElC-0002dM-Iy
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 17:08:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Un12v-0008BG-Fu
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 02:30:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Un12r-0001Ne-A3
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 02:30:09 -0400
Received: from ozlabs.org ([2402:b800:7003:1:1::1]:52592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1Un12a-000164-5k; Thu, 13 Jun 2013 02:29:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 98E6B2C009C; Thu, 13 Jun 2013 16:29:44 +1000 (EST)
Date: Thu, 13 Jun 2013 15:52:47 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20130613055247.GA9218@voom.bne.redhat.com>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
	<9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
	<51B90D81.1020000@ozlabs.ru>
	<EF248D0E-36D7-403D-83BF-8F966459D299@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <EF248D0E-36D7-403D-83BF-8F966459D299@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2402:b800:7003:1:1::1
X-Mailman-Approved-At: Thu, 13 Jun 2013 17:08:43 -0400
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
X-List-Received-Date: Thu, 13 Jun 2013 06:30:14 -0000


--d6Gm4EdcadzBjdND
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

Yeah, I've been meaning to.  Just very busy this week.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iEYEARECAAYFAlG5Xi8ACgkQaILKxv3ab8a1HACeKSffEFTp5C1/Wjous8moHldc
xIYAnRDcFCgP1/l9b53LVhQYEs9RHddF
=BFE5
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

