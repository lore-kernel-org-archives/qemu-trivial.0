Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gQ6S5-0005Kc-5h
	for mharc-qemu-trivial@gnu.org; Fri, 23 Nov 2018 03:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gQ6S3-0005JV-KI
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2018 03:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gQ6Rx-0006ie-U9
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2018 03:04:35 -0500
Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29]:56213)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1gQ6Rx-0006U6-La
	for qemu-trivial@nongnu.org; Fri, 23 Nov 2018 03:04:29 -0500
Received: from player714.ha.ovh.net (unknown [10.109.143.109])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7C2561FAFCA
	for <qemu-trivial@nongnu.org>; Fri, 23 Nov 2018 09:04:27 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 57B5E1093C2;
	Fri, 23 Nov 2018 08:04:21 +0000 (UTC)
Date: Fri, 23 Nov 2018 09:04:19 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20181123090419.6209d66e@bahia.lan>
In-Reply-To: <20181123002037.GO10448@umbus.fritz.box>
References: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
	<20181123002037.GO10448@umbus.fritz.box>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/_ErRIVuHeKJ0Rq6TyT+afR/";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 13009491949901617638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedruddutddgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.107.29
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] spapr: drop redundant
 statement in spapr_populate_drconf_memory()
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
X-List-Received-Date: Fri, 23 Nov 2018 08:04:36 -0000

--Sig_/_ErRIVuHeKJ0Rq6TyT+afR/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Nov 2018 11:20:37 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Nov 22, 2018 at 03:31:36PM +0100, Greg Kurz wrote:
> > Signed-off-by: Greg Kurz <groug@kaod.org> =20
>=20
> Applied to ppc-for-3.2.
>=20

AFAIK, next release will be 4.0.

> > ---
> >  hw/ppc/spapr.c |    2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 9c41098b5781..7771a628f879 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -893,8 +893,6 @@ static int spapr_populate_drconf_memory(sPAPRMachin=
eState *spapr, void *fdt)
> >      /* ibm,associativity-lookup-arrays */
> >      buf_len =3D (nr_nodes * 4 + 2) * sizeof(uint32_t);
> >      cur_index =3D int_buf =3D g_malloc0(buf_len);
> > -
> > -    cur_index =3D int_buf;
> >      int_buf[0] =3D cpu_to_be32(nr_nodes);
> >      int_buf[1] =3D cpu_to_be32(4); /* Number of entries per associativ=
ity list */
> >      cur_index +=3D 2;
> >  =20
>=20


--Sig_/_ErRIVuHeKJ0Rq6TyT+afR/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAlv3tIMACgkQcdTV5YIv
c9ZgZw//cTfKod9ATnNl97gYNd7rG95YuQLw2cwuh272VQiSfPS2kJbN2+288A6Z
Gzub8ecIcP0eT7W+tyCAduGc3nRFV6/GhIg1a4zj5Xe8w1sJXln8HhgiYNtLYy5R
X9uvG1YxysrFLJFQofrTO1zJbKiwYScBp+IaMfrhaQOyobl7ChVYBBhJ1JP0JJoU
Jbor3kXflLE+ACxCaI5F2o8lv7/Bc2e55C5ctD5C3TXSIlzVVBgABQlL8jpQyF30
H+fH8MLLgLwBCKDBuSI3TfpZLZO2+7tjbU2HFFc3Nk+G7FlLFrgI4RYKXVtRcNr3
rT/1JRPQm/jmIgHTl+bEfefeR+xw5wB5S8lVi6Ii0XWjTgQEs5Tf/4geaU2qhI8u
PObluR6QEaR9vkGUeZNuk4ap4AxD/Sd743WqfOXaOvn0tPi3XknLt11mc/eQI/6S
EbNsDwc0sVMRJiIbya0F0DLLvdg3ohFLEstVTF8IXLoe1OpC/uXaoR79Ycs5r0QF
dZfK72cJvZ4idmNc1DIJySMgcyDtrXo3vjjW912d2RN28cuhWPn2m+4e0pS4liuY
yYg0Sjl3QtMp1NTHNdArkUVIBzBzihH/DNme/0yX+n+9RlReO9K/gs2D+Cv5Sz2o
63Xq+3qYBF+Iosgd+0yVvgRjnpKLctLNf2d2Com4u1jH8CZXK7k=
=s1m2
-----END PGP SIGNATURE-----

--Sig_/_ErRIVuHeKJ0Rq6TyT+afR/--

