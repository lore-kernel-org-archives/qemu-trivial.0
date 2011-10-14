Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REjCg-0003Ss-0N
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 10:57:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1REjCZ-00031g-2R
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 10:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1REjCX-0001vy-T8
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 10:57:35 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41291 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1REjCP-0001v2-TC; Fri, 14 Oct 2011 10:57:26 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 74C1389994;
	Fri, 14 Oct 2011 16:57:24 +0200 (CEST)
Message-ID: <4E984DD4.50608@suse.de>
Date: Fri, 14 Oct 2011 16:57:24 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Dmitry Koshelev <karaghiozis@gmail.com>
References: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
In-Reply-To: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ARM GIC and CPU state
	saving/loading fix
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
X-List-Received-Date: Fri, 14 Oct 2011 14:57:40 -0000

Am 14.10.2011 15:25, schrieb Dmitry Koshelev:
> Fixes two trivial indices errors.
>=20
> Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
> ---
>  hw/arm_gic.c         |   12 ++++++------
>  target-arm/machine.c |    4 ++--
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/arm_gic.c b/hw/arm_gic.c
> index 8286a28..ba05131 100644
> --- a/hw/arm_gic.c
> +++ b/hw/arm_gic.c
> @@ -662,9 +662,6 @@ static void gic_save(QEMUFile *f, void *opaque)
>      qemu_put_be32(f, s->enabled);
>      for (i =3D 0; i < NUM_CPU(s); i++) {
>          qemu_put_be32(f, s->cpu_enabled[i]);
> -#ifndef NVIC
> -        qemu_put_be32(f, s->irq_target[i]);
> -#endif
>          for (j =3D 0; j < 32; j++)
>              qemu_put_be32(f, s->priority1[j][i]);
>          for (j =3D 0; j < GIC_NIRQ; j++)
> @@ -678,6 +675,9 @@ static void gic_save(QEMUFile *f, void *opaque)
>          qemu_put_be32(f, s->priority2[i]);
>      }
>      for (i =3D 0; i < GIC_NIRQ; i++) {
> +#ifndef NVIC
> +        qemu_put_be32(f, s->irq_target[i]);
> +#endif
>          qemu_put_byte(f, s->irq_state[i].enabled);
>          qemu_put_byte(f, s->irq_state[i].pending);
>          qemu_put_byte(f, s->irq_state[i].active);
> @@ -699,9 +699,6 @@ static int gic_load(QEMUFile *f, void *opaque, int
> version_id)
>      s->enabled =3D qemu_get_be32(f);
>      for (i =3D 0; i < NUM_CPU(s); i++) {
>          s->cpu_enabled[i] =3D qemu_get_be32(f);
> -#ifndef NVIC
> -        s->irq_target[i] =3D qemu_get_be32(f);
> -#endif
>          for (j =3D 0; j < 32; j++)
>              s->priority1[j][i] =3D qemu_get_be32(f);
>          for (j =3D 0; j < GIC_NIRQ; j++)
> @@ -715,6 +712,9 @@ static int gic_load(QEMUFile *f, void *opaque, int
> version_id)
>          s->priority2[i] =3D qemu_get_be32(f);
>      }
>      for (i =3D 0; i < GIC_NIRQ; i++) {
> +#ifndef NVIC
> +        s->irq_target[i] =3D qemu_get_be32(f);
> +#endif
>          s->irq_state[i].enabled =3D qemu_get_byte(f);
>          s->irq_state[i].pending =3D qemu_get_byte(f);
>          s->irq_state[i].active =3D qemu_get_byte(f);

This part:

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

The definition is int irq_target[GIC_NIRQ] and not [NCPU] as others.

The following part however is totally unrelated and should be put in a
separate patch. Both are non-trivial, please cc Peter Maydell instead.

> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 3925d3a..1b1b3ec 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -53,7 +53,7 @@ void cpu_save(QEMUFile *f, void *opaque)
>      qemu_put_be32(f, env->features);
>=20
>      if (arm_feature(env, ARM_FEATURE_VFP)) {
> -        for (i =3D 0;  i < 16; i++) {
> +        for (i =3D 16;  i < 32; i++) {
>              CPU_DoubleU u;
>              u.d =3D env->vfp.regs[i];
>              qemu_put_be32(f, u.l.upper);
> @@ -175,7 +175,7 @@ int cpu_load(QEMUFile *f, void *opaque, int version=
_id)
>          env->vfp.vec_stride =3D qemu_get_be32(f);
>=20
>          if (arm_feature(env, ARM_FEATURE_VFP3)) {
> -            for (i =3D 0;  i < 16; i++) {
> +            for (i =3D 16;  i < 32; i++) {
>                  CPU_DoubleU u;
>                  u.l.upper =3D qemu_get_be32(f);
>                  u.l.lower =3D qemu_get_be32(f);
>=20

This does not look fully right either way... In addition, it touches the
storage format so any change there may require a version bump.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746, AG N=FCrnb=
erg

