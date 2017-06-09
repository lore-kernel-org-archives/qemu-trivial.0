Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJ9ma-0007fZ-Eg
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 22:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dJ9mW-0007bg-K3
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 22:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dJ9mV-000147-QB
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 22:36:12 -0400
Received: from ozlabs.org ([103.22.144.67]:56393)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1dJ9mV-00013H-EV
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 22:36:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wkRHT63wyz9s5L; Fri,  9 Jun 2017 12:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1496975765;
	bh=1Sx2U6g5d3S7/fe6LM66rSfQLZmwKNg+ElJZ/H1rL8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DALoH57T3stbJnSILr24brr49v1cELqpM03h2cLQmjwlwoIJmHwMnHa4ASSgLbwQL
	lK3CbUKOXt2PFhPbuOuQ71gsQcc0zHfN+Snox5SfNjf5LPpTwlq19uVqt1QYsQYoa8
	UuaopFd5fy84XWBgm/7tHbOJLwQsRbesdU9lKa48=
Date: Fri, 9 Jun 2017 12:03:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Juan Quintela <quintela@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <drjones@redhat.com>
Message-ID: <20170609020338.GC26521@umbus.fritz.box>
References: <1496927934-21815-1-git-send-email-thuth@redhat.com>
	<871squblsp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <871squblsp.fsf@secure.mitica>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] hw/cpu: core.c can be compiled as common
 object
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
X-List-Received-Date: Fri, 09 Jun 2017 02:36:13 -0000


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 04:23:34PM +0200, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
> > There does not seem to be any target specific code in core.c, so we can
> > put it into "common-obj" instead of "obj" to compile it only once for
> > all targets.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> It compiles.
> I can't see anything that is target dependent on core.c.
>=20
> So
>=20
> Reviewed-by: Juan Quintela <quintela@redhat.com>

I've merged this into my ppc-for-2.10 tree, on the basis that ppc is
the only user of core.c so far.  Any objections?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZOgH6AAoJEGw4ysog2bOSDhUQAJGsjICJ0/3TSOlN4/GAyODr
g/w3Hnfs8R7RB24il/WOA+gtKP4g5JfRFROS1eaCtj81mP94GpVRlTYRyVC+4ssI
tCNbqCOve37S74GeeElL2AeC2dEKyatcjHHW47aJvS9Ne3DSKAFRY3Dt8H18xz+U
DSKvwnBCDmAJWqI3yQ7xcBT20ge9Bg5Pi4LY5+IeoJeto1gbt/czj2wx0s7R5VZw
45lTey+RX8WbAIScLfdioB5YhZoL2SbBuGe5ZnlPLLZf+AFI3Q3rk6UxwfAvVEsW
GvpJAk83WkQTCovi6+RzUK4K8eRhdCUrfKJbaYmEICn25Kc2UbdFYF7tHdYFOz6h
JCJ0d25HOb9FtiayTqEQBmoeIJWiwDowZv2TecHRmiySScoluWI2gidn0cDpEJvZ
OxS+hDjK1nklvA0FRS7W3ewJA6JgmPT7uJw5QaA1XxFW1l6XUDFEQn3R64aGMlBA
rfMzbFo1a6xp9Z97JZ9bhGvn+xmOmLIgjVNbF2MrznDeW3ES7fp1MrHYjO5GNvOw
Eut9iqT9bWN7bZvXI2T01QmQIb2H8QsLNrSSFKeuEqG6WrzoXy7Z1c+UhScJ8UYZ
54w5g4j4f1UwPG+/mrMTaUS40xdjUDf2+9s/+at3kRd+NFuF6VjjClnsiJPoI/ol
qlUfoeeGatirDxf8jBn4
=Wye/
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

