Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6YCx-00081s-4c
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 06:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YCs-0007xc-EH
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YCo-00074I-MM
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:54 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6YCo-00072y-Gu
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 06:16:50 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so11730932oty.6
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 03:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JVBTg1kYJiZtDEsHxQmdYhgc7E08qi8Vmk9K+xag6R0=;
 b=ZOQyY30zFUEgzJVWXYAIMOJgtV4P4QHbzhzE3v+f4YZyuIOnKejUyfo+4tPCCKAvXN
 2SG6C9vNDzveHs/zP6HXYWK5CMyyMasJVYPRzTvvy2FXp6jj2lJAUyHTv6A0nR1Qa3Qw
 vfs/bzlESpCdx26adraVxF9Rnd61Ovh+LeG9PzjdML0gRSwOX3xprpTaqlSK4HmqG6uT
 nNJr/bPegJ4FdYzSXTQUMJ+adcytwA1rZS58J31IaY8w+jrq5xYG6fPdvaHvdii+faSs
 5MwkGkwC1YZXUbkQZhk2Mqj+R3McQ9Fccw6bCjj/86l0wl8RYuijsRkTdUxe/i75BY7k
 8iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JVBTg1kYJiZtDEsHxQmdYhgc7E08qi8Vmk9K+xag6R0=;
 b=OfEBJXyCRSeDYs4uszR3V/faMK8Tx9ssuRP/MNVuNotHZ8e9lFVrD7qoTe8swL7Xh1
 4dXXoZCx7CNt9nx4BIWI2pJm9nk2rJu99CTj4CvPk8jukO5V3Ug5wGOEzRXhGTn7NBS9
 mIN6MpzZFTzhvIHrpH3HrOVRuzsdjCBQM/GB/oE3DqROtP0maaik4Nwr32oyFrP8VvFP
 RtGM+VZtO2RvU+ySdyHrJGMP7W1gm3Unl3/wICy313aM3ooBSV2ZvOcz8tdd5FdcCoJ0
 g8KLcl2jmCWFKP5Ri4S5tX0ODNMLGbWwYpKKm+a8BbByw0KFUSLEXTJzLUIGCi+hYJDE
 0Pxw==
X-Gm-Message-State: APjAAAXABVVb/MwBrJekYcJ94MvFdCfay8omN+F2Q1piye6i0OdEOSB3
 5xsZMjp1Kkc1UhA2hxcAE4ayY8EDEYGjB0MMw0/B1A==
X-Google-Smtp-Source: APXvYqyeDWb4cppy2QBvUdbChLnb8jgNXeUsTBP3NVlogzjG/9Et0KNRKMsaFacl1JdWBQ64jrazEDItx6Xb0qq2CN4=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr42061915otq.221.1582629409417; 
 Tue, 25 Feb 2020 03:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20200223231044.8003-1-philmd@redhat.com>
 <20200223231044.8003-3-philmd@redhat.com>
In-Reply-To: <20200223231044.8003-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:16:38 +0000
Message-ID: <CAFEAcA8MSO4YMEq2FqvpJKUVYE_1CqaB2KLD1YN-YebOhJVgEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/gumstix: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 11:16:58 -0000

On Sun, 23 Feb 2020 at 23:10, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Add a comment describing the Connex uses a Numonyx RC28F128J3F75
> flash, and the Verdex uses a Micron RC28F256P30TFA.
>
> Correct the Verdex machine description (we model the 'Pro' board).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This patch is doing somewhat more than the commit Subject line
suggests. I don't think it's particularly strongly in need
of splitting into more patches, but could you make the
subject line a bit closer to what the patch is doing?

> ---
>  hw/arm/gumstix.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
> index 94904d717b..ca918fda0c 100644
> --- a/hw/arm/gumstix.c
> +++ b/hw/arm/gumstix.c
> @@ -35,6 +35,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/pxa.h"
>  #include "net/net.h"
> @@ -45,18 +46,14 @@
>  #include "sysemu/qtest.h"
>  #include "cpu.h"
>
> -static const int sector_len =3D 128 * 1024;
> +static const int sector_len =3D 128 * KiB;
>
>  static void connex_init(MachineState *machine)
>  {
>      PXA2xxState *cpu;
>      DriveInfo *dinfo;
> -    MemoryRegion *address_space_mem =3D get_system_memory();
>
> -    uint32_t connex_rom =3D 0x01000000;
> -    uint32_t connex_ram =3D 0x04000000;
> -
> -    cpu =3D pxa255_init(address_space_mem, connex_ram);
> +    cpu =3D pxa255_init(get_system_memory(), 64 * MiB);
>
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      if (!dinfo && !qtest_enabled()) {
> @@ -65,7 +62,8 @@ static void connex_init(MachineState *machine)
>          exit(1);
>      }
>
> -    if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
> +    /* Numonyx RC28F128J3F75 */
> +    if (!pflash_cfi01_register(0x00000000, "connext.rom", 16 * MiB,
>                                 dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
>                                 sector_len, 2, 0, 0, 0, 0, 0)) {
>          error_report("Error registering flash memory");

Previously the variable names were helpfully acting as a
bit of documentation of what the 64MB and 16MB things were.
Perhaps we could instead have

#define CONNEX_ROM_SIZE (16 * MiB)
#define CONNEX_RAM_SIZE (64 * MiB)

and then use those?

> @@ -81,12 +79,8 @@ static void verdex_init(MachineState *machine)
>  {
>      PXA2xxState *cpu;
>      DriveInfo *dinfo;
> -    MemoryRegion *address_space_mem =3D get_system_memory();
>
> -    uint32_t verdex_rom =3D 0x02000000;
> -    uint32_t verdex_ram =3D 0x10000000;
> -
> -    cpu =3D pxa270_init(address_space_mem, verdex_ram, machine->cpu_type=
);
> +    cpu =3D pxa270_init(get_system_memory(), 256 * MiB, machine->cpu_typ=
e);
>
>      dinfo =3D drive_get(IF_PFLASH, 0, 0);
>      if (!dinfo && !qtest_enabled()) {
> @@ -95,7 +89,8 @@ static void verdex_init(MachineState *machine)
>          exit(1);
>      }
>
> -    if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
> +    /* Micron RC28F256P30TFA */
> +    if (!pflash_cfi01_register(0x00000000, "verdex.rom", 32 * MiB,
>                                 dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
>                                 sector_len, 2, 0, 0, 0, 0, 0)) {
>          error_report("Error registering flash memory");

Similarly here.

> @@ -126,7 +121,7 @@ static void verdex_class_init(ObjectClass *oc, void *=
data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
>
> -    mc->desc =3D "Gumstix Verdex (PXA270)";
> +    mc->desc =3D "Gumstix Verdex Pro XL6P COMs (PXA270)";
>      mc->init =3D verdex_init;
>      mc->ignore_memory_transaction_failures =3D true;
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("pxa270-c0");
> --

thanks
-- PMM

