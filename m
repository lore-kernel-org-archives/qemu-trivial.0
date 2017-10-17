Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4StW-0006vN-IF
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:30:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@mips.com>) id 1e4StT-0006vA-PE
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <James.Hogan@mips.com>) id 1e4StP-0001Qh-QP
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:30:55 -0400
Received: from 20pmail.ess.barracuda.com ([64.235.154.232]:56460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <James.Hogan@mips.com>)
	id 1e4StP-0001Nt-HG; Tue, 17 Oct 2017 10:30:51 -0400
Received: from MIPSMAIL01.mipstec.com (mailrelay.mips.com [12.201.5.28]) by
	mx1412.ess.rzc.cudaops.com (version=TLSv1.2
	cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Tue, 17 Oct 2017 14:30:15 +0000
Received: from localhost (192.168.154.110) by MIPSMAIL01.mipstec.com
	(10.20.43.31) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 17 Oct 2017 07:29:51 -0700
Date: Tue, 17 Oct 2017 15:30:16 +0100
From: James Hogan <james.hogan@mips.com>
To: Laurent Vivier <laurent@vivier.eu>
CC: <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	<qemu-trivial@nongnu.org>
Message-ID: <20171017143015.GP15235@jhogan-linux>
References: <20171017141311.22194-1-james.hogan@imgtec.com>
	<1abdfc6b-6e23-0949-84b1-bd1b1f6121c3@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ie5iOtK4e9kgqh2F"
Content-Disposition: inline
In-Reply-To: <1abdfc6b-6e23-0949-84b1-bd1b1f6121c3@vivier.eu>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Originating-IP: [192.168.154.110]
X-BESS-ID: 1508250615-452060-2490-420279-1
X-BESS-VER: 2017.12.1-r1709122024
X-BESS-Apparent-Source-IP: 12.201.5.28
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.186055
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS59374 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 64.235.154.232
Subject: Re: [Qemu-trivial] [PATCH v2] Update James Hogan's email address
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
X-List-Received-Date: Tue, 17 Oct 2017 14:30:57 -0000

--Ie5iOtK4e9kgqh2F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 04:21:13PM +0200, Laurent Vivier wrote:
> Le 17/10/2017 =C3=A0 16:13, james.hogan@imgtec.com a =C3=A9crit=C2=A0:
> > From: James Hogan <james.hogan@imgtec.com>
> >=20
> > Update my imgtec.com email address to my kernel.org one in MAINTAINERS
> > as MIPS will soon no longer be part of Imagination Technologies, and add
> > a mapping in .mailcap so get_maintainer.pl reports the right address.
> >=20
> > Signed-off-by: James Hogan <james.hogan@imgtec.com>
> > Cc: Michael Tokarev <mjt@tls.msk.ru>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: qemu-devel@nongnu.org
> > Cc: qemu-trivial@nongnu.org
> > ---
> > Changes in v2:
> > - Use my imgtec address as the author / SoB (Laurent Vivier)
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/.mailmap b/.mailmap
> > index 28defa1b2c57..5aec1bdf9f7d 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -8,6 +8,7 @@ Aurelien Jarno <aurelien@aurel32.net> aurel32 <aurel32@=
c046a42c-6fe2-441c-8c8c-7
> >  Blue Swirl <blauwirbel@gmail.com> blueswir1 <blueswir1@c046a42c-6fe2-4=
41c-8c8c-71466251a162>
> >  Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046=
a42c-6fe2-441c-8c8c-71466251a162>
> >  Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-4=
41c-8c8c-71466251a162>
> > +James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> >  Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-=
8c8c-71466251a162>
> >  Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8=
c8c-71466251a162>
> >  Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-7146=
6251a162>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9522d1b621bd..b01f5c46ef83 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -284,7 +284,7 @@ S: Maintained
> >  F: target/arm/kvm.c
> > =20
> >  MIPS
> > -M: James Hogan <james.hogan@imgtec.com>
> > +M: James Hogan <jhogan@kernel.org>
> >  S: Maintained
> >  F: target/mips/kvm.c
> > =20
> >=20
>=20
> Thank you.
>=20
> I don't understand why you need to update the .mailmap: updating the
> MAINTAINERS file should be enough to have the correct address with
> get_maintainer.pl?

It allows get_maintainer.pl results based on git history (e.g. git
blame) to show the up to date address. Admitedly I based that on my
equivalent patch for the Linux kernel, so perhaps it is less relevant
with QEMU?

Cheers
James

--Ie5iOtK4e9kgqh2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlnmE/cACgkQbAtpk944
dnrSwxAAozhfXqaMDP+XEcMeJdTE+vSV6Jhh+J+leA2NRfxqvkRXFPbooyKNJiuS
fz+Iw5OZYwMaVbRyOzrYejWObVITr+R5ykHbjsqgF23R2jFMEsY4xyJaaR01aOlK
Xq0WXuYazKnjt2KjjegqG1SvL8i0Bd4xv7w3s6i9DRvwk867sA8ZfTnvmouUY+JX
Yp2b5enm2VEAW5hXR2b9QpnaVT9oM+v3Y1qcSEiaAfc++ChGG1B0elTBdQVW4bJ9
IA9oZHR0X3xyRWGm6tbnQtrMp6LTGPmEDS0l+XiR/TP4/g9ajPMwJ1vuFqPQcwTS
GHZDCKXdt3rTLZ3FaSDiAc9YQD7duEg/hrHcxyMBgZ7oZ31quhFRP7fBFH+iwIR4
tgRexrUP2R7WtYK2FgKL8xFfyzaVVhJB/cGhylhf+P5YmMiByqwEwOnpwxmlLNdH
AQZ4t1cZFSb2UzxQNDfE2RA508A76hjzOA7Ue6ru34xCmNFH1AoEl6168dPdOZMa
AcoEzbr9+E3ZzGNLhds54oZh3gQYH6b85wMz9TqDg/45uzJwb3mKt1kmnzFcr38Q
iGKHnq2YjviQIXP15/pLWGomWPe0BYe8l7Zmp+Uj6ngTQ62T8uPv02FkM/Ej19cN
U3XD6ccHFbQFfgmoaxtf2SJ7txpNNYavw47GvtuwHJhOGmDuHds=
=oSQ1
-----END PGP SIGNATURE-----

--Ie5iOtK4e9kgqh2F--

