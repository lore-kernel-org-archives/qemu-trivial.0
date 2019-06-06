Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYnde-0000Lv-HO
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 04:20:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYndc-0000Km-U3
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 04:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYndb-0006Bc-1H
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 04:20:44 -0400
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:33535)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hYnda-0005qk-DT
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 04:20:42 -0400
Received: from player750.ha.ovh.net (unknown [10.108.42.170])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 8FD1F11E869
	for <qemu-trivial@nongnu.org>; Thu,  6 Jun 2019 10:20:31 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 413A96A60698;
	Thu,  6 Jun 2019 08:20:18 +0000 (UTC)
Date: Thu, 6 Jun 2019 10:20:17 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Like Xu <like.xu@linux.intel.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, =?UTF-8?B?SGVydsOp?= Poussineau
	<hpoussin@reactos.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, 
	Igor Mammedov <imammedo@redhat.com>, Alistair Francis
	<alistair23@gmail.com>, qemu-ppc@nongnu.org
Message-ID: <20190606102017.264123c5@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20190606030732.GL10319@umbus.fritz.box>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-5-like.xu@linux.intel.com>
	<20190606025241.GM22416@habkost.net>
	<20190606025456.GN22416@habkost.net>
	<20190606030732.GL10319@umbus.fritz.box>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/OqITJOZMth2QE6A/fhmv3pz";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 14758014507939043814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.122.254
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH v3 04/10] hw/ppc:
 Replace global smp variables with machine smp properties
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
X-List-Received-Date: Thu, 06 Jun 2019 08:20:46 -0000

--Sig_/OqITJOZMth2QE6A/fhmv3pz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Jun 2019 13:07:32 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Jun 05, 2019 at 11:54:56PM -0300, Eduardo Habkost wrote:
> > On Wed, Jun 05, 2019 at 11:52:41PM -0300, Eduardo Habkost wrote: =20
> > > On Sun, May 19, 2019 at 04:54:22AM +0800, Like Xu wrote: =20
> > > > The global smp variables in ppc are replaced with smp machine prope=
rties.
> > > >=20
> > > > A local variable of the same name would be introduced in the declar=
ation
> > > > phase if it's used widely in the context OR replace it on the spot =
if it's
> > > > only used once. No semantic changes.
> > > >=20
> > > > Signed-off-by: Like Xu <like.xu@linux.intel.com> =20
> > >=20
> > > Any objections from the ppc maintainers to queueing this through
> > > the Machine Core tree? =20
> >=20
> > Oops, CCing the ppc maintainers. =20
>=20
> No objection here.
>=20
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>=20

Just one nit...

[...]

> > > > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > > > index ee24212765..c9ffe9786c 100644
> > > > --- a/hw/ppc/spapr_rtas.c
> > > > +++ b/hw/ppc/spapr_rtas.c
> > > > @@ -231,6 +231,8 @@ static void rtas_ibm_get_system_parameter(Power=
PCCPU *cpu,
> > > >                                            target_ulong args,
> > > >                                            uint32_t nret, target_ul=
ong rets)
> > > >  {
> > > > +    MachineState *ms =3D MACHINE(qdev_get_machine());

rtas_ibm_get_system_parameter() has a SpaprMachineState *spapr argument, no
need to rely on qdev_get_machine().

But this can be fixed in a followup patch I guess. Not worth holding the
patchset because of that.

> > > > +    unsigned int max_cpus =3D ms->smp.max_cpus;
> > > >      target_ulong parameter =3D rtas_ld(args, 0);
> > > >      target_ulong buffer =3D rtas_ld(args, 1);
> > > >      target_ulong length =3D rtas_ld(args, 2);
> > > > @@ -244,7 +246,7 @@ static void rtas_ibm_get_system_parameter(Power=
PCCPU *cpu,
> > > >                                            "MaxPlatProcs=3D%d",
> > > >                                            max_cpus,
> > > >                                            current_machine->ram_siz=
e / MiB,
> > > > -                                          smp_cpus,
> > > > +                                          ms->smp.cpus,
> > > >                                            max_cpus);
> > > >          ret =3D sysparm_st(buffer, length, param_val, strlen(param=
_val) + 1);
> > > >          g_free(param_val); =20
> > >  =20
> >  =20
>=20


--Sig_/OqITJOZMth2QE6A/fhmv3pz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAlz4zMEACgkQcdTV5YIv
c9YlyRAAigru/BNqZDBbSGkoX6B45x6xk7roooaITKIJM9YGw8gKx7aXXaX7HNvc
0v0Bcfp48PqBynzBIFzKWvpVy3zAV9uodX9VRMaNPJgObvNa0vtEJqbQxfdVnYTt
JJNRKYOPRPM72FW436/ft6JtmRmt/GvYFOotYE+5NPQ9VsLNN1aZ5i2yYXZ2U6dC
Z9WQa+Sa9DIAUwW3EANuu9Swvoj5SiXC+1w285lDKHwia037LM0bfZQRSb0oP9cl
KXuUA2m9sL/wC60DxAoVthuPbd9LDKvQfuR+sLNrBt+i7SpsnWPgITlo1MZTg+1Y
JYBuPU6m5n2DMLlj9sUBofbyjGWgzxylQdI+5j9wAD09+AQzgmKkUdNpagSwDcqq
BLhxalUBVe7CJ5vMcxwU+19GIxCZOIK7n6FD3/1xTmOR3a4OXrEHTQlPFVM7k+cr
JGpGt7IOIE6DAXGDHEGEsPFWmmRj6IQtvf1xm13nhhkJydSGsyvAY2vNmy6vq+nO
pBoK/K/0zTZcER7jLI2uSTqW+vjlP4P9HFkjlTZrgZ/90/A4hGTaHovx8NhPKUDK
GGd5XDLOnxidTVIpE+SnIeOlqsz3RheMKBgJlqlArP+Vv9PE+X6BUrpGz6nVfAw4
i9DMgyZ6uJiY40AeIQj7RnzCGhoAYSXfWF4mYIB6aA9D54iqG0s=
=XjKp
-----END PGP SIGNATURE-----

--Sig_/OqITJOZMth2QE6A/fhmv3pz--

