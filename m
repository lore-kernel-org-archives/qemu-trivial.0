Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dRDbp-0004KY-LU
	for mharc-qemu-trivial@gnu.org; Sat, 01 Jul 2017 04:18:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dRDbl-0004D9-2P
	for qemu-trivial@nongnu.org; Sat, 01 Jul 2017 04:18:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dRDbj-0002AT-Sx
	for qemu-trivial@nongnu.org; Sat, 01 Jul 2017 04:18:25 -0400
Received: from ozlabs.org ([103.22.144.67]:37209)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1dRDbj-00028P-Gl
	for qemu-trivial@nongnu.org; Sat, 01 Jul 2017 04:18:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3x05r35hMtz9sRT; Sat,  1 Jul 2017 18:18:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1498897091;
	bh=6/dyuitK+mSa++wLysUL9HJ4aJyvRKdFfLF6tIa90JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mq3pxrNhg/4l3mfz5WMzSVhCbOP/7n8/Rf1aYoB68uNRayTBXM3tA5l59e7tSi8oq
	gYcO6df22BfV1yQkgGysOjT2iKQTcgVBJHMAlcy8OGEc3fdKqv1z6vwYaXGDfXy4S/
	gbSThn6kzuP48oETbb7HuHwOfoYi7lrLad27aOdo=
Date: Sat, 1 Jul 2017 17:50:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <20170701075024.GI13989@umbus.fritz.box>
References: <149882869053.24031.15086612121177689276.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline
In-Reply-To: <149882869053.24031.15086612121177689276.stgit@bahia.lan>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH] spapr: make
 spapr_populate_hotplug_cpu_dt() static
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
X-List-Received-Date: Sat, 01 Jul 2017 08:18:28 -0000


--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 03:18:10PM +0200, Greg Kurz wrote:
> Since commit ff9006ddbfd1 ("spapr: move spapr_core_[foo]plug() callbacks
> close to machine code in spapr.c"), this function doesn't need to be exte=
rn
> anymore.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-2.10.

> ---
>  hw/ppc/spapr.c         |    4 ++--
>  include/hw/ppc/spapr.h |    2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0ee9fac50bd4..65d8ad2f4966 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2863,8 +2863,8 @@ out:
>      error_propagate(errp, local_err);
>  }
> =20
> -void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
> -                                    sPAPRMachineState *spapr)
> +static void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
> +                                           sPAPRMachineState *spapr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      DeviceClass *dc =3D DEVICE_GET_CLASS(cs);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index a66bbac35242..12bf9697990e 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -640,8 +640,6 @@ void spapr_hotplug_req_add_by_count_indexed(sPAPRDRCo=
nnectorType drc_type,
>  void spapr_hotplug_req_remove_by_count_indexed(sPAPRDRConnectorType drc_=
type,
>                                                 uint32_t count, uint32_t =
index);
>  void spapr_cpu_parse_features(sPAPRMachineState *spapr);
> -void *spapr_populate_hotplug_cpu_dt(CPUState *cs, int *fdt_offset,
> -                                    sPAPRMachineState *spapr);
> =20
>  /* CPU and LMB DRC release callbacks. */
>  void spapr_core_release(DeviceState *dev);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZV1Q8AAoJEGw4ysog2bOS4P0QAObR28rEfoIlcJeW5W5U4vlo
GESFD1iSkyQd3KW1N5pSql25DXTbpah8LSvClOMJIWf5I13nUqyo/Vt6bQepA9p9
fw1vuO5MhiGwvR/bqDccXOuI4WdFct6NS4RAc/dhZG0c0ErJ3mhCjG+Yy+FSjm/T
MvBf0VjeRSkqmsftBrpHHE7iPl68cKpRlCeDzhPrOmy9OSpMiF9nyutSuy2rv2S1
LIxoYQylkeX7UGQR0xxUCSxomVYpSBhk56TGhycDZJIq0kNr+P8TLq+zyOfdUoGB
eymbtPwL3EPUhRhYbwhSQLRdD/yvvYJi7ekf54tIggXt9igl3QoQBvTBvjdDdCpp
BuAxmbPutXTlVRXPMmfU5yztYCx7Gcl0Z6eIu9cwIEcpvexKuHUbaa5DmDQttAM3
pc4nj/Ks23lJLfW+xLbUScwu6Y9tqZQ+XwzDB1caWkj1IIrBbbbs1JyDjbE5LmKp
DxkXASQKthZtBbAbwC0582dRi7AmLmK3QJinXOQI03HdCy15sQRDS8IarJ+LF7oA
/t53Ob5YGIs++Ma4pWbkEFQTVS3xXOm5myK55pIunlEEwBWl1pT5ob5Y9kt4aJkg
Mzv2JcOcQR57czmx1hlPVlhPxvlefvCwjxxNgZSQdDDTmBCsg1hFlAWOVBuYdQ9A
CHgXceVCiKln6qJHAQYg
=Aa4p
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--

