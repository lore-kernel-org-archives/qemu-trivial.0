Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEWcW-0005Aa-IJ
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 03:31:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEWcU-00058g-6o
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 03:30:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEWcS-0001UI-Ta
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 03:30:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEWcF-0001GV-Tl; Tue, 14 Nov 2017 03:30:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07F98C047B6B;
	Tue, 14 Nov 2017 08:30:43 +0000 (UTC)
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5052389F34;
	Tue, 14 Nov 2017 08:30:39 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: alistair23@gmail.com, qemu-ppc@nongnu.org, armbru@redhat.com
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<6cb7a17813bdc7df94d3efbe5d0b54d90e14ed98.1510612380.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a03a0890-4915-8df5-d820-94cdf953beaa@redhat.com>
Date: Tue, 14 Nov 2017 09:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <6cb7a17813bdc7df94d3efbe5d0b54d90e14ed98.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 14 Nov 2017 08:30:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v5 20/29] hw/ppc: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 14 Nov 2017 08:30:59 -0000

On 13.11.2017 23:35, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
> @@ -720,7 +720,7 @@ static DeviceState *ppce500_init_mpic_kvm(PPCE500Pa=
rams *params,
> =20
>      CPU_FOREACH(cs) {
>          if (kvm_openpic_connect_vcpu(dev, cs)) {
> -            fprintf(stderr, "%s: failed to connect vcpu to irqchip\n",
> +            error_report("%s: failed to connect vcpu to irqchip",
>                      __func__);

Wrong indentation.

>              abort();
>          }
> @@ -809,7 +809,7 @@ void ppce500_init(MachineState *machine, PPCE500Par=
ams *params)
>          cs =3D CPU(cpu);
> =20
>          if (env->mmu_model !=3D POWERPC_MMU_BOOKE206) {
> -            fprintf(stderr, "MMU model %i not supported by this machin=
e.\n",
> +            error_report("MMU model %i not supported by this machine."=
,
>                  env->mmu_model);

Wrong indentation.

>              exit(1);
>          }
[...]
> diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
> index ce1254b5d4..3a2c49e3fd 100644
> --- a/hw/ppc/mpc8544_guts.c
> +++ b/hw/ppc/mpc8544_guts.c
> @@ -18,6 +18,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> @@ -83,7 +84,7 @@ static uint64_t mpc8544_guts_read(void *opaque, hwadd=
r addr,
>          value =3D env->spr[SPR_E500_SVR];
>          break;
>      default:
> -        fprintf(stderr, "guts: Unknown register read: %x\n", (int)addr=
);
> +        error_report("guts: Unknown register read: %x", (int)addr);
>          break;
>      }
> =20
> @@ -102,7 +103,7 @@ static void mpc8544_guts_write(void *opaque, hwaddr=
 addr,
>          }
>          break;
>      default:
> -        fprintf(stderr, "guts: Unknown register write: %x =3D %x\n",
> +        error_report("guts: Unknown register write: %x =3D %x",
>                  (int)addr, (unsigned)value);

Wrong indentation.

>          break;
>      }
[...]
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 693c215108..12f92b9f2c 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -12,6 +12,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "qemu-common.h"
>  #include "net/net.h"
>  #include "hw/hw.h"
> @@ -80,22 +81,22 @@ static int bamboo_load_device_tree(hwaddr addr,
>      ret =3D qemu_fdt_setprop(fdt, "/memory", "reg", mem_reg_property,
>                             sizeof(mem_reg_property));
>      if (ret < 0)
> -        fprintf(stderr, "couldn't set /memory/reg\n");
> +        error_report("couldn't set /memory/reg");
> =20
>      ret =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start"=
,
>                                  initrd_base);
>      if (ret < 0)
> -        fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
> +        error_report("couldn't set /chosen/linux,initrd-start");
> =20
>      ret =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>                                  (initrd_base + initrd_size));
>      if (ret < 0)
> -        fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
> +        error_report("couldn't set /chosen/linux,initrd-end");
> =20
>      ret =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>                                    kernel_cmdline);
>      if (ret < 0)
> -        fprintf(stderr, "couldn't set /chosen/bootargs\n");
> +        error_report("couldn't set /chosen/bootargs");

While you're at it, add proper curly braces?

>      /* Copy data from the host device tree into the guest. Since the g=
uest can
>       * directly access the timebase without host involvement, we must =
expose
> @@ -186,7 +187,7 @@ static void bamboo_init(MachineState *machine)
>      env =3D &cpu->env;
> =20
>      if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
> -        fprintf(stderr, "MMU model %i not supported by this machine.\n=
",
> +        error_report("MMU model %i not supported by this machine.",
>              env->mmu_model);

Wrong indentation.

[...]
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 5ac4f76613..c1cac864c6 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -187,7 +187,7 @@ static int xilinx_load_device_tree(hwaddr addr,
> =20
>      r =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_c=
mdline);
>      if (r < 0)
> -        fprintf(stderr, "couldn't set /chosen/bootargs\n");
> +        error_report("couldn't set /chosen/bootargs");
>      cpu_physical_memory_write(addr, fdt, fdt_size);
>      return fdt_size;
>  }
> @@ -215,7 +215,7 @@ static void virtex_init(MachineState *machine)
>      env =3D &cpu->env;
> =20
>      if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
> -        fprintf(stderr, "MMU model %i not supported by this machine.\n=
",
> +        error_report("MMU model %i not supported by this machine.",
>              env->mmu_model);

Wrong indentation.

>          exit(1);
>      }
>=20

Before you resend your series, could you please check *all* patches for
correct indentation. I'm getting tired of indicating this ...

 Thanks,
  Thomas

