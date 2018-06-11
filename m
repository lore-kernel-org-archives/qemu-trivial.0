Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSHtL-0007sM-3M
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 04:09:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1fSHtF-0007r1-Lj
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 04:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1fSHtE-000351-KS
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 04:09:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1fSHt6-00030P-JE; Mon, 11 Jun 2018 04:09:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 891327456FB;
	Mon, 11 Jun 2018 10:09:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id B69A1745714; Mon, 11 Jun 2018 10:09:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id B5C5D74569D;
	Mon, 11 Jun 2018 10:09:06 +0200 (CEST)
Date: Mon, 11 Jun 2018 10:09:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	"open list:sPAPR" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, 
	=?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
	David Gibson <david@gibson.dropbear.id.au>
In-Reply-To: <20180611011501.10235-33-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.21.1806110959440.5957@zero.eik.bme.hu>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-33-f4bug@amsat.org>
User-Agent: Alpine 2.21 (BSF 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="3866299591-213785344-1528704170=:5957"
Content-ID: <alpine.BSF.2.21.1806111002580.5957@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v4 32/40] hw/ppc: Use the IEC
 binary prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 08:09:29 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-213785344-1528704170=:5957
Content-Type: text/plain; CHARSET=ISO-8859-15; FORMAT=flowed
Content-ID: <alpine.BSF.2.21.1806111002581.5957@zero.eik.bme.hu>
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Jun 2018, Philippe Mathieu-Daud=E9 wrote:
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 2a98c10664..b35e3fff1c 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -12,8 +12,9 @@
>  */
>
> #include "qemu/osdep.h"
> +#include "qemu/units.h"
> #include "qemu-common.h"
> -#include "qemu/cutils.h"
> +#include "qemu/units.h"

I think one of these includes of qemu/units.h is enough.

> #include "qemu/error-report.h"
> #include "qapi/error.h"
> #include "hw/hw.h"
> @@ -46,7 +47,7 @@
> /* from Sam460 U-Boot include/configs/Sam460ex.h */
> #define FLASH_BASE             0xfff00000
> #define FLASH_BASE_H           0x4
> -#define FLASH_SIZE             (1 << 20)
> +#define FLASH_SIZE             (1 * MiB)
> #define UBOOT_LOAD_BASE        0xfff80000
> #define UBOOT_SIZE             0x00080000
> #define UBOOT_ENTRY            0xfffffffc
> @@ -71,7 +72,8 @@
>
> /* FIXME: See u-boot.git 8ac41e, also fix in ppc440_uc.c */
> static const unsigned int ppc460ex_sdram_bank_sizes[] =3D {
> -    1024 << 20, 512 << 20, 256 << 20, 128 << 20, 64 << 20, 32 << 20, 0
> +    1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB,
> +    64 * MiB, 32 * MiB, 0
> };

You said elsewhere:

On Sun, 10 Jun 2018, Philippe Mathieu-Daud=E9 wrote:
> Each use this saves 3 char of the 80 columns limit!

Except when not but at least should not be longer than before and maybe=20
more readable. But why are you splitting this line into two? I prefer one=
=20
line for readability if it's not over the line limit.

> struct boot_info {
> @@ -225,7 +227,7 @@ static int sam460ex_load_uboot(void)
>     fl_sectors =3D (bios_size + 65535) >> 16;
>
>     if (!pflash_cfi01_register(base, NULL, "sam460ex.flash", bios_size,
> -                               blk, (64 * 1024), fl_sectors,
> +                               blk, 64 * KiB, fl_sectors,
>                                1, 0x89, 0x18, 0x0000, 0x0, 1)) {
>         error_report("qemu: Error registering flash memory.");
>         /* XXX: return an error instead? */
> @@ -359,14 +361,14 @@ static void main_cpu_reset(void *opaque)
>
>     /* either we have a kernel to boot or we jump to U-Boot */
>     if (bi->entry !=3D UBOOT_ENTRY) {
> -        env->gpr[1] =3D (16 << 20) - 8;
> +        env->gpr[1] =3D (16 * MiB) - 8;
>         env->gpr[3] =3D FDT_ADDR;
>         env->nip =3D bi->entry;
>
>         /* Create a mapping for the kernel.  */
>         mmubooke_create_initial_mapping(env, 0, 0);
>         env->gpr[6] =3D tswap32(EPAPR_MAGIC);
> -        env->gpr[7] =3D (16 << 20) - 8; /*bi->ima_size;*/
> +        env->gpr[7] =3D (16 * MiB) - 8; /* bi->ima_size; */
>
>     } else {
>         env->nip =3D UBOOT_ENTRY;
> @@ -479,8 +481,8 @@ static void sam460ex_init(MachineState *machine)
>     /* 256K of L2 cache as memory */
>     ppc4xx_l2sram_init(env);
>     /* FIXME: remove this after fixing l2sram mapping in ppc440_uc.c? *=
/
> -    memory_region_init_ram(l2cache_ram, NULL, "ppc440.l2cache_ram", 25=
6 << 10,
> -                           &error_abort);
> +    memory_region_init_ram(l2cache_ram, NULL, "ppc440.l2cache_ram",
> +                           256 * KiB, &error_abort);

Line is split differently here too for no apparent reason.

Regards,
BALATON Zoltan
--3866299591-213785344-1528704170=:5957--

