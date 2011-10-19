Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGYuZ-0001j6-48
	for mharc-qemu-trivial@gnu.org; Wed, 19 Oct 2011 12:22:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RGYuV-0001YJ-24
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 12:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RGYuT-00021r-Nj
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 12:22:30 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48648 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RGYuK-0001zh-Of; Wed, 19 Oct 2011 12:22:21 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B30278AD27;
	Wed, 19 Oct 2011 18:22:17 +0200 (CEST)
Message-ID: <4E9EF939.1060306@suse.de>
Date: Wed, 19 Oct 2011 18:22:17 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Dmitry Koshelev <karaghiozis@gmail.com>
References: <CAKUHwZqVz1egRsgTtf_=Voe66EkL8n0kETW5zEFK5f=JHq_K6w@mail.gmail.com>
In-Reply-To: <CAKUHwZqVz1egRsgTtf_=Voe66EkL8n0kETW5zEFK5f=JHq_K6w@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [v2] arm gic saving/loading
	fix
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
X-List-Received-Date: Wed, 19 Oct 2011 16:22:32 -0000

Dmitry,

It would be nice to cc the people that have cared to review previous
versions of the patch, Peter Maydell and me. Gets you quicker replies.

Functional ARM patches are being reviewed by our ARM gurus and not by
Stefan Hajnoczi, so please drop qemu-trivial from the cc list, as
pointed out before.

Am 19.10.2011 16:10, schrieb Dmitry Koshelev:
> irq_target field saving/loading is in the wrong loop
> version bump
>=20
> Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>

From my side this version looks okay now, with a check for loading and a
bump for registration. Being no expert for the old savevm format,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

> ---
>  hw/arm_gic.c |   16 ++++++++--------
>  1 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/arm_gic.c b/hw/arm_gic.c
> index 8286a28..d0747cf 100644
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
> @@ -693,15 +693,12 @@ static int gic_load(QEMUFile *f, void *opaque,
> int version_id)
>      int i;
>      int j;
>=20
> -    if (version_id !=3D 1)
> +    if (version_id !=3D 2)
>          return -EINVAL;
>=20
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
> @@ -744,5 +744,5 @@ static void gic_init(gic_state *s)
>      s->iomemtype =3D cpu_register_io_memory(gic_dist_readfn,
>                                            gic_dist_writefn, s);
>      gic_reset(s);
> -    register_savevm(NULL, "arm_gic", -1, 1, gic_save, gic_load, s);
> +    register_savevm(NULL, "arm_gic", -1, 2, gic_save, gic_load, s);
>  }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746, AG N=FCrnb=
erg

