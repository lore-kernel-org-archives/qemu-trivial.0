Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dL07p-0005ZQ-Dg
	for mharc-qemu-trivial@gnu.org; Wed, 14 Jun 2017 00:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dL07m-0005Xo-T6
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 00:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dL07j-0002xl-Fc
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 00:41:46 -0400
Received: from ozlabs.org ([103.22.144.67]:35569)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1dL07j-0002wy-3u
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 00:41:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wnYr019glz9s8J; Wed, 14 Jun 2017 14:41:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1497415296;
	bh=TROyp8I+FvQJadNZIUfxExxRVldkHSxMX5dBLf0UJ5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix5AMVAAZt+VcPyxe7aOsHDViiMido50ZObTnuoYnfD+Pxs5wo5HI8qRN3FVP2a/t
	EgIkikGpaf9TaLGi9R8zLRHchXGroXcim9AIonbOyhM0a43GTAjDJpyWMsghfNn1B8
	EwBc4RFhBDg6DP6t68Pq0/jkAbD8dF5GjsTjw8nQ=
Date: Wed, 14 Jun 2017 10:30:17 +0800
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, famz@redhat.com, agraf@suse.de,
	marcel@redhat.com, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20170614023017.GG13420@umbus>
References: <1497383329-10393-1-git-send-email-thuth@redhat.com>
	<149738389265.243.11409224507286961666@4a9a010726c0>
	<20170614051851-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0z5c7mBtSy1wdr4F"
Content-Disposition: inline
In-Reply-To: <20170614051851-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci-bridge/dec: Classify
 the DEC PCI bridge as bridge device
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
X-List-Received-Date: Wed, 14 Jun 2017 04:41:48 -0000


--0z5c7mBtSy1wdr4F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:19:18AM +0300, Michael S. Tsirkin wrote:
> On Tue, Jun 13, 2017 at 12:58:13PM -0700, no-reply@patchew.org wrote:
> > In file included from /tmp/qemu-test/src/hw/net/vmxnet3.c:30:
> > /tmp/qemu-test/src/include/migration/register.h:18: error: redefinition=
 of typedef =E2=80=98LoadStateHandler=E2=80=99
> > /tmp/qemu-test/src/include/migration/vmstate.h:32: note: previous decla=
ration of =E2=80=98LoadStateHandler=E2=80=99 was here
> > make: *** [hw/net/vmxnet3.o] Error 1
> > make: *** Waiting for unfinished jobs....
> > tests/docker/Makefile.include:118: recipe for target 'docker-run' failed
> > make[1]: *** [docker-run] Error 2
> > make[1]: Leaving directory '/var/tmp/patchew-tester-tmp-dv2lv743/src'
> > tests/docker/Makefile.include:149: recipe for target 'docker-run-test-q=
uick@centos6' failed
> > make: *** [docker-run-test-quick@centos6] Error 2
> > =3D=3D=3D OUTPUT END =3D=3D=3D
> >=20
> > Test command exited with code: 2
>=20
> Any idea what's going on here?

I _think_ that's unrelated to the patch here.  Looks like the
autobuilder is using a compiler version that doesn't like typedef
redefinitions, even if they're identical.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0z5c7mBtSy1wdr4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQJ+2AAoJEGw4ysog2bOSlSoP/iR3BoK7sWXpk8rVGQhEYra1
bWEq143Fr0Xhg/AUZrZYiMnlAnWYqILcgVfSXJoq4leEPy7iDoGdWDxjEbMddsG1
LXvo7A/eahl33I3wc13PF+nkEAPam5enxbclI4cyQzEcpX2PtMKL82pKED1oLc9N
RmjVrMmZxnjAdsIFArKS+LyOI1H0+ksfPMrg9cGdw5MIy8s1jKW/GODTXwcl8OzB
EdJp7FnnVY8DsanfsKFMj/iBzQcjCOvpW2FDA3ZvW7mUXUxqFxtggc8lvsVqBmE8
hgPSOzJtGtQgVkxCeW2nI7QoDnTm4WAbGFWJMSUATWGLnmBbVW5N2onxvItiG0Lf
GjVqzKY8kPhhNW9FgtIKSqUWOodonQbCnBgB+QIHiIc9MrR08/LlehKt76qGd7vL
jd/nSJKPNhxM1vpclorOKT4bcNAs1mRAghGh3zoRz/Z8vtWSiJtTemG8FmWbvfgh
QBHi+wuHUySK7omLNb/ygAVVmiWdf0ncqjWRemepyKoL06CUTt8G1VtrccaOLoZL
rHGRJboslA2+mznrxMMYBp2F7A69UTqwUpcZlu2Msz68gnH+kUNSM6DryB/bDp/m
D7bxAFzjc0D4Uok5yGNLTXl/bkp/bDogdebkMb8fbWL2T9g3I/Oyfi0UZhpCnuf/
+Pj7ekhIPv4BhPAuQmuk
=5v2A
-----END PGP SIGNATURE-----

--0z5c7mBtSy1wdr4F--

