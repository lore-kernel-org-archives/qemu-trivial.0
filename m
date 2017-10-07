Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0hWf-0004oD-W4
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 01:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e0hWd-0004ld-CK
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1e0hWc-0003GG-8Y
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 01:19:47 -0400
Received: from ozlabs.org ([103.22.144.67]:51545)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1e0hWT-0003AE-U7; Sat, 07 Oct 2017 01:19:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3y8FDg3rv4z9t5C; Sat,  7 Oct 2017 16:19:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1507353571;
	bh=wYhySI3Cywan3WPoSTDCgoKzXm0UDTDipKfIcQ8NSsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8Jb4jI2Y4/kWgMv7OkfJAAN1pWJKl+B7OAuBhaWafKLxaEVkt89kbPnkHn1y2XFb
	ytc/urd+GabU6uhbA5piU9wPSI6QLZ1DQAN94OCqKfLKZC/y4d1y0hCCWRM9yQZ0qO
	LNRz57HzbI0rvVZILjpnQhpME/vd9TnFvc7z9BJo=
Date: Sat, 7 Oct 2017 16:16:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Alexander Graf <agraf@suse.de>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-ppc@nongnu.org
Message-ID: <20171007051614.GH10050@umbus.fritz.box>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-60-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VkqCAaSJIySsbD6j"
Content-Disposition: inline
In-Reply-To: <20171006235023.11952-60-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH 59/88] ppce500: use g_new() family of
 functions
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
X-List-Received-Date: Sat, 07 Oct 2017 05:19:48 -0000


--VkqCAaSJIySsbD6j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2017 at 08:49:54PM -0300, Philippe Mathieu-Daud=E9 wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> [PMD: replaced g_new0() -> g_new() since no bzero() required]

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/e500.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index db0e49ab8f..b396fd1a22 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -737,8 +737,6 @@ static qemu_irq *ppce500_init_mpic(MachineState *mach=
ine, PPCE500Params *params,
>      SysBusDevice *s;
>      int i;
> =20
> -    mpic =3D g_new0(qemu_irq, 256);
> -
>      if (kvm_enabled()) {
>          Error *err =3D NULL;
> =20
> @@ -756,6 +754,7 @@ static qemu_irq *ppce500_init_mpic(MachineState *mach=
ine, PPCE500Params *params,
>          dev =3D ppce500_init_mpic_qemu(params, irqs);
>      }
> =20
> +    mpic =3D g_new(qemu_irq, 256);
>      for (i =3D 0; i < 256; i++) {
>          mpic[i] =3D qdev_get_gpio_in(dev, i);
>      }
> @@ -808,7 +807,7 @@ void ppce500_init(MachineState *machine, PPCE500Param=
s *params)
>          machine->cpu_model =3D "e500v2_v30";
>      }
> =20
> -    irqs =3D g_malloc0(smp_cpus * sizeof(qemu_irq *));
> +    irqs =3D g_new0(qemu_irq *, smp_cpus);
>      irqs[0] =3D g_malloc0(smp_cpus * sizeof(qemu_irq) * OPENPIC_OUTPUT_N=
B);
>      for (i =3D 0; i < smp_cpus; i++) {
>          PowerPCCPU *cpu;
> @@ -844,7 +843,7 @@ void ppce500_init(MachineState *machine, PPCE500Param=
s *params)
>          if (!i) {
>              /* Primary CPU */
>              struct boot_info *boot_info;
> -            boot_info =3D g_malloc0(sizeof(struct boot_info));
> +            boot_info =3D g_new0(struct boot_info, 1);
>              qemu_register_reset(ppce500_cpu_reset, cpu);
>              env->load_info =3D boot_info;
>          } else {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VkqCAaSJIySsbD6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnYYx4ACgkQbDjKyiDZ
s5Lk3hAAooO82qb3e/xWkTG6MFTIJ+tnygBkIulA0K8nxfuMMvKadhphLQhButm4
flgIBHIF7hDdf+CiWXZ1sKHlLoPyQjJ2RscYH475DoebCCGY0cDoCyHKTlLqNQN9
/gPL15ZpWLm/KuW73oJ7vK4zaAZtUaf8BbwbPa0TUu6rjS9h3Vg7Rxv3UJcDi4Km
xN47IOiUDRHn611lKRZ4qgFWiBhCt6onrgz/7glV9BUhXZfUQ8CjeHRX9m1AGTjg
Ng86NpAIjCMGWY+dGli3HqkXBiSdgpFY1A4lgqmEY74lOVQwvjbO83w3dCo3CY0o
nSMSzLLHTqqCNthF2gQfkgEcFUMn1mvkOkOPkE9hUMTXgpXXtsPdzNChqI8fKaDN
pCELv/TlMuyzy8IUWbkV7kMpkTl/ctY8tiQIMn4laK3pDo8TyZV2D3RRvmNmx5w1
f4++nT89vgXKmfoywFY2VIP0TIwxG+ozzPLdwRqOalyD42We5rQSdzOPzlHfa6sr
KTLUROb8b/zAhJ497pG2wHJ/AU09gkBo/yujLehirlp+baJTE1HKPPtd0mgIRFYS
Ub1+XhaWn756uZyA+nSx5VhXMrW+aLCCAjuZ69w3z8f9OMEYy7ungNbcaiNJr+rY
k60tTM3FDYPveg7/Dm7c7krSMce6mjpoHA7rOSOaqlp6wZTS6TU=
=nJRX
-----END PGP SIGNATURE-----

--VkqCAaSJIySsbD6j--

