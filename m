Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5vD-0007LH-2i
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 13:19:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry5v5-00070R-K3
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:19:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry5uw-0003dH-86
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:19:02 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33942 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Ry5ul-0003VL-4S; Thu, 16 Feb 2012 13:18:43 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id C3204906EB;
	Thu, 16 Feb 2012 19:18:41 +0100 (CET)
Message-ID: <4F3D4881.5020308@suse.de>
Date: Thu, 16 Feb 2012 19:18:41 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Alexander Barabash <alexander_barabash@mentor.com>
References: <4F3D3EF2.4090503@mentor.com>
In-Reply-To: <4F3D3EF2.4090503@mentor.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [TRIVIAL] Removed unused
	arm_sysctl_init().
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
X-List-Received-Date: Thu, 16 Feb 2012 18:19:08 -0000

Am 16.02.2012 18:37, schrieb Alexander Barabash:
>=20
>     Removed unused arm_sysctl_init().
>     Renamed arm_sysctl_init1() into arm_sysctl_init().
>=20
>     Signed-off-by: Alexander Barabash <alexander_barabash@mentor.com>

This I believe I already reviewed in a patchset from Peter.

Not "trivial" but ARM.

Andreas

>=20
> diff --git a/hw/arm_sysctl.c b/hw/arm_sysctl.c
> index 149c639..5f1237b 100644
> --- a/hw/arm_sysctl.c
> +++ b/hw/arm_sysctl.c
> @@ -378,7 +378,7 @@ static void arm_sysctl_gpio_set(void *opaque, int
> line, int level)
>      }
>  }
>=20
> -static int arm_sysctl_init1(SysBusDevice *dev)
> +static int arm_sysctl_init(SysBusDevice *dev)
>  {
>      arm_sysctl_state *s =3D FROM_SYSBUS(arm_sysctl_state, dev);
>=20
> @@ -389,18 +389,6 @@ static int arm_sysctl_init1(SysBusDevice *dev)
>      return 0;
>  }
>=20
> -/* Legacy helper function.  */
> -void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id)
> -{
> -    DeviceState *dev;
> -
> -    dev =3D qdev_create(NULL, "realview_sysctl");
> -    qdev_prop_set_uint32(dev, "sys_id", sys_id);
> -    qdev_init_nofail(dev);
> -    qdev_prop_set_uint32(dev, "proc_id", proc_id);
> -    sysbus_mmio_map(sysbus_from_qdev(dev), 0, base);
> -}
> -
>  static Property arm_sysctl_properties[] =3D {
>      DEFINE_PROP_UINT32("sys_id", arm_sysctl_state, sys_id, 0),
>      DEFINE_PROP_UINT32("proc_id", arm_sysctl_state, proc_id, 0),
> @@ -412,7 +400,7 @@ static void arm_sysctl_class_init(ObjectClass
> *klass, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
>=20
> -    k->init =3D arm_sysctl_init1;
> +    k->init =3D arm_sysctl_init;
>      dc->reset =3D arm_sysctl_reset;
>      dc->vmsd =3D &vmstate_arm_sysctl;
>      dc->props =3D arm_sysctl_properties;
> diff --git a/hw/primecell.h b/hw/primecell.h
> index ded0446..7337c3b 100644
> --- a/hw/primecell.h
> +++ b/hw/primecell.h
> @@ -5,9 +5,6 @@
>  /* Also includes some devices that are currently only used by the
>     ARM boards.  */
>=20
> -/* arm_sysctl.c */
> -void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id)=
;
> -
>  /* arm_sysctl GPIO lines */
>  #define ARM_SYSCTL_GPIO_MMC_WPROT 0
>  #define ARM_SYSCTL_GPIO_MMC_CARDIN 1

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

