Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blr3D-00078x-Aj
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 01:23:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1blr37-00075l-Ej
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 01:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1blr33-00010H-GS
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 01:23:25 -0400
Received: from ozlabs.org ([103.22.144.67]:40269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1blr2r-0000w9-VN; Mon, 19 Sep 2016 01:23:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3scvRX3cklz9s2Q; Mon, 19 Sep 2016 15:23:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1474262584;
	bh=TBgX+3JbZ8A24aLp6Ep7Lf0ulT7M5kaOqJoOHC0uq24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggJAEXk02OZpUIOZddqDpjEuLmg459PWxBGBfOv3fgEDbIN2iEkyO4e6uZvF9Op59
	mkaKXuhjxKWhDJ0Q7iRUYNC6yliKR2mxjF3CteQi/z2rTP/RovzUspg0JC8S9ZIEq7
	kX+Vtrvs2nhdMEaj1sbph/8wTo+YoAWK6eDIMr2I=
Date: Mon, 19 Sep 2016 15:22:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160919052248.GB20488@umbus>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-6-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <1474034177-17663-6-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH 05/26] ppc: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Mon, 19 Sep 2016 05:23:29 -0000


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2016 at 03:55:56PM +0200, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/exit.cocci
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> CC: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  device_tree.c               | 18 ++++++++--------
>  hw/intc/xics_kvm.c          |  6 +++---
>  hw/ppc/e500.c               | 14 ++++++------
>  hw/ppc/mac_newworld.c       | 12 +++++------
>  hw/ppc/mac_oldworld.c       | 16 +++++++-------
>  hw/ppc/mpc8544ds.c          |  2 +-
>  hw/ppc/ppc.c                |  4 ++--
>  hw/ppc/ppc405_boards.c      | 16 +++++++-------
>  hw/ppc/ppc440_bamboo.c      | 10 ++++-----
>  hw/ppc/ppc4xx_devs.c        |  2 +-
>  hw/ppc/prep.c               | 12 +++++------
>  hw/ppc/spapr.c              | 52 ++++++++++++++++++++++-----------------=
------
>  hw/ppc/virtex_ml507.c       |  4 ++--
>  target-ppc/kvm.c            |  6 +++---
>  target-ppc/translate.c      |  2 +-
>  target-ppc/translate_init.c | 28 ++++++++++++------------
>  tcg/ppc/tcg-target.inc.c    |  6 +++---
>  17 files changed, 105 insertions(+), 105 deletions(-)
>=20
> diff --git a/device_tree.c b/device_tree.c
> index 6e06320..202cee8 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -61,13 +61,13 @@ void *create_device_tree(int *sizep)
>      ret =3D fdt_open_into(fdt, fdt, *sizep);
>      if (ret) {
>          error_report("Unable to copy device tree in memory");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return fdt;
>  fail:
>      error_report("%s Couldn't create dt: %s", __func__, fdt_strerror(ret=
));
> -    exit(1);
> +    exit(EXIT_FAILURE);
>  }
> =20
>  void *load_device_tree(const char *filename_path, int *sizep)
> @@ -222,7 +222,7 @@ static int findnode_nofail(void *fdt, const char *nod=
e_path)
>      if (offset < 0) {
>          error_report("%s Couldn't find node %s: %s", __func__, node_path,
>                       fdt_strerror(offset));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return offset;
> @@ -291,7 +291,7 @@ int qemu_fdt_setprop(void *fdt, const char *node_path,
>      if (r < 0) {
>          error_report("%s: Couldn't set %s/%s: %s", __func__, node_path,
>                       property, fdt_strerror(r));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return r;
> @@ -306,7 +306,7 @@ int qemu_fdt_setprop_cell(void *fdt, const char *node=
_path,
>      if (r < 0) {
>          error_report("%s: Couldn't set %s/%s =3D %#08x: %s", __func__,
>                       node_path, property, val, fdt_strerror(r));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return r;
> @@ -328,7 +328,7 @@ int qemu_fdt_setprop_string(void *fdt, const char *no=
de_path,
>      if (r < 0) {
>          error_report("%s: Couldn't set %s/%s =3D %s: %s", __func__,
>                       node_path, property, string, fdt_strerror(r));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return r;
> @@ -380,7 +380,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *=
path)
>      if (r =3D=3D 0) {
>          error_report("%s: Couldn't get phandle for %s: %s", __func__,
>                       path, fdt_strerror(r));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return r;
> @@ -425,7 +425,7 @@ int qemu_fdt_nop_node(void *fdt, const char *node_pat=
h)
>      if (r < 0) {
>          error_report("%s: Couldn't nop node %s: %s", __func__, node_path,
>                       fdt_strerror(r));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return r;
> @@ -454,7 +454,7 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      if (retval < 0) {
>          error_report("FDT: Failed to create subnode %s: %s", name,
>                       fdt_strerror(retval));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      g_free(dupname);
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index c9caefc..82c65e8 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -67,7 +67,7 @@ static void icp_get_kvm_state(ICPState *ss)
>      if (ret !=3D 0) {
>          error_report("Unable to retrieve KVM interrupt controller state"
>                  " for CPU %ld: %s", kvm_arch_vcpu_id(ss->cs), strerror(e=
rrno));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      ss->xirr =3D state >> KVM_REG_PPC_ICP_XISR_SHIFT;
> @@ -164,7 +164,7 @@ static void ics_get_kvm_state(ICSState *ics)
>          if (ret !=3D 0) {
>              error_report("Unable to retrieve KVM interrupt controller st=
ate"
>                      " for IRQ %d: %s", i + ics->offset, strerror(errno));
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          irq->server =3D state & KVM_XICS_DESTINATION_MASK;
> @@ -353,7 +353,7 @@ static void xics_kvm_cpu_setup(XICSState *xics, Power=
PCCPU *cpu)
>      if (ret < 0) {
>          error_report("Unable to connect CPU%ld to kernel XICS: %s",
>                       kvm_arch_vcpu_id(cs), strerror(errno));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      ss->cap_irq_xics_enabled =3D true;
>  }
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 0cd534d..5b4dc56 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -209,7 +209,7 @@ static int sysbus_device_create_devtree(SysBusDevice =
*sbdev, void *opaque)
>      if (!matched) {
>          error_report("Device %s is not supported by this machine yet.",
>                       qdev_fw_name(DEVICE(sbdev)));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return 0;
> @@ -754,7 +754,7 @@ static qemu_irq *ppce500_init_mpic(MachineState *mach=
ine, PPCE500Params *params,
>          if (machine_kernel_irqchip_required(machine) && !dev) {
>              error_reportf_err(err,
>                                "kernel_irqchip requested but unavailable:=
 ");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -824,7 +824,7 @@ void ppce500_init(MachineState *machine, PPCE500Param=
s *params)
>          cpu =3D cpu_ppc_init(machine->cpu_model);
>          if (cpu =3D=3D NULL) {
>              fprintf(stderr, "Unable to initialize CPU!\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          env =3D &cpu->env;
>          cs =3D CPU(cpu);
> @@ -972,7 +972,7 @@ void ppce500_init(MachineState *machine, PPCE500Param=
s *params)
>          if (kernel_size < 0) {
>              fprintf(stderr, "qemu: could not load kernel '%s'\n",
>                      machine->kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          cur_base +=3D kernel_size;
> @@ -987,7 +987,7 @@ void ppce500_init(MachineState *machine, PPCE500Param=
s *params)
>          if (initrd_size < 0) {
>              fprintf(stderr, "qemu: could not load initial ram disk '%s'\=
n",
>                      machine->initrd_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          cur_base =3D initrd_base + initrd_size;
> @@ -1028,7 +1028,7 @@ void ppce500_init(MachineState *machine, PPCE500Par=
ams *params)
>                                    NULL, NULL);
>          if (kernel_size < 0) {
>              fprintf(stderr, "qemu: could not load firmware '%s'\n", file=
name);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
>      g_free(filename);
> @@ -1041,7 +1041,7 @@ void ppce500_init(MachineState *machine, PPCE500Par=
ams *params)
>                                         kernel_base, kernel_size);
>      if (dt_size < 0) {
>          fprintf(stderr, "couldn't load device tree\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      assert(dt_size < DTB_MAX_SIZE);
> =20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7d25106..72ff9ad 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -196,7 +196,7 @@ static void ppc_core99_init(MachineState *machine)
>          cpu =3D cpu_ppc_init(machine->cpu_model);
>          if (cpu =3D=3D NULL) {
>              fprintf(stderr, "Unable to find PowerPC CPU definition\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          env =3D &cpu->env;
> =20
> @@ -231,7 +231,7 @@ static void ppc_core99_init(MachineState *machine)
>      }
>      if (bios_size < 0 || bios_size > BIOS_SIZE) {
>          error_report("could not load PowerPC bios '%s'", bios_name);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      if (linux_boot) {
> @@ -258,7 +258,7 @@ static void ppc_core99_init(MachineState *machine)
>                                                ram_size - kernel_base);
>          if (kernel_size < 0) {
>              error_report("could not load kernel '%s'", kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          /* load initrd */
>          if (initrd_filename) {
> @@ -268,7 +268,7 @@ static void ppc_core99_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  error_report("could not load initial ram disk '%s'",
>                               initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              cmdline_base =3D round_page(initrd_base + initrd_size);
>          } else {
> @@ -294,7 +294,7 @@ static void ppc_core99_init(MachineState *machine)
>          }
>          if (ppc_boot_device =3D=3D '\0') {
>              fprintf(stderr, "No valid boot device for Mac99 machine\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -350,7 +350,7 @@ static void ppc_core99_init(MachineState *machine)
>  #endif /* defined(TARGET_PPC64) */
>          default:
>              error_report("Bus model not supported on mac99 machine");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 4479487..01196fe 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -116,7 +116,7 @@ static void ppc_heathrow_init(MachineState *machine)
>          cpu =3D cpu_ppc_init(machine->cpu_model);
>          if (cpu =3D=3D NULL) {
>              fprintf(stderr, "Unable to find PowerPC CPU definition\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          env =3D &cpu->env;
> =20
> @@ -130,7 +130,7 @@ static void ppc_heathrow_init(MachineState *machine)
>          fprintf(stderr,
>                  "qemu: Too much memory for this machine: %d MB, maximum =
2047 MB\n",
>                  ((unsigned int)ram_size / (1 << 20)));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      memory_region_allocate_system_memory(ram, NULL, "ppc_heathrow.ram",
> @@ -158,7 +158,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      }
>      if (bios_size < 0 || bios_size > BIOS_SIZE) {
>          error_report("could not load PowerPC bios '%s'", bios_name);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      if (linux_boot) {
> @@ -184,7 +184,7 @@ static void ppc_heathrow_init(MachineState *machine)
>                                                ram_size - kernel_base);
>          if (kernel_size < 0) {
>              error_report("could not load kernel '%s'", kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          /* load initrd */
>          if (initrd_filename) {
> @@ -194,7 +194,7 @@ static void ppc_heathrow_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  error_report("could not load initial ram disk '%s'",
>                               initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              cmdline_base =3D round_page(initrd_base + initrd_size);
>          } else {
> @@ -228,7 +228,7 @@ static void ppc_heathrow_init(MachineState *machine)
>          }
>          if (ppc_boot_device =3D=3D '\0') {
>              fprintf(stderr, "No valid boot device for G3 Beige machine\n=
");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -251,7 +251,7 @@ static void ppc_heathrow_init(MachineState *machine)
>              break;
>          default:
>              error_report("Bus model not supported on OldWorld Mac machin=
e");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -265,7 +265,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      /* init basic PC hardware */
>      if (PPC_INPUT(env) !=3D PPC_FLAGS_INPUT_6xx) {
>          error_report("Only 6xx bus is supported on heathrow machine");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      pic =3D heathrow_pic_init(&pic_mem, 1, heathrow_irqs);
>      pci_bus =3D pci_grackle_init(0xfec00000, pic,
> diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
> index 27b8289..8d646bb 100644
> --- a/hw/ppc/mpc8544ds.c
> +++ b/hw/ppc/mpc8544ds.c
> @@ -43,7 +43,7 @@ static void mpc8544ds_init(MachineState *machine)
> =20
>      if (machine->ram_size > 0xc0000000) {
>          error_report("The MPC8544DS board only supports up to 3GB of RAM=
");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      ppce500_init(machine, &params);
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 8945869..478b848 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1362,13 +1362,13 @@ void ppc_cpu_parse_features(const char *cpu_model)
>      model_pieces =3D g_strsplit(cpu_model, ",", 2);
>      if (!model_pieces[0]) {
>          error_report("Invalid/empty CPU model name");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      oc =3D cpu_class_by_name(TYPE_POWERPC_CPU, model_pieces[0]);
>      if (oc =3D=3D NULL) {
>          error_report("Unable to find CPU definition: %s", model_pieces[0=
]);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      typename =3D object_class_get_name(oc);
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4b2f07a..53d4c73 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -266,13 +266,13 @@ static void ref405ep_init(MachineState *machine)
>              g_free(filename);
>              if (bios_size < 0 || bios_size > BIOS_SIZE) {
>                  error_report("Could not load PowerPC BIOS '%s'", bios_na=
me);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              bios_size =3D (bios_size + 0xfff) & ~0xfff;
>              memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), =
bios);
>          } else if (!qtest_enabled() || kernel_filename !=3D NULL) {
>              error_report("Could not load PowerPC BIOS '%s'", bios_name);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          } else {
>              /* Avoid an uninitialized variable warning */
>              bios_size =3D -1;
> @@ -329,7 +329,7 @@ static void ref405ep_init(MachineState *machine)
>          if (kernel_size < 0) {
>              fprintf(stderr, "qemu: could not load kernel '%s'\n",
>                      kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          printf("Load kernel size %ld at " TARGET_FMT_lx,
>                 kernel_size, kernel_base);
> @@ -341,7 +341,7 @@ static void ref405ep_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  fprintf(stderr, "qemu: could not load initial ram disk '=
%s'\n",
>                          initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else {
>              initrd_base =3D 0;
> @@ -564,13 +564,13 @@ static void taihu_405ep_init(MachineState *machine)
>              g_free(filename);
>              if (bios_size < 0 || bios_size > BIOS_SIZE) {
>                  error_report("Could not load PowerPC BIOS '%s'", bios_na=
me);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              bios_size =3D (bios_size + 0xfff) & ~0xfff;
>              memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), =
bios);
>          } else if (!qtest_enabled()) {
>              error_report("Could not load PowerPC BIOS '%s'", bios_name);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          memory_region_set_readonly(bios, true);
>      }
> @@ -613,7 +613,7 @@ static void taihu_405ep_init(MachineState *machine)
>          if (kernel_size < 0) {
>              fprintf(stderr, "qemu: could not load kernel '%s'\n",
>                      kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          /* load initrd */
>          if (initrd_filename) {
> @@ -624,7 +624,7 @@ static void taihu_405ep_init(MachineState *machine)
>                  fprintf(stderr,
>                          "qemu: could not load initial ram disk '%s'\n",
>                          initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else {
>              initrd_base =3D 0;
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 5c535b1..26b3f46 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -189,7 +189,7 @@ static void bamboo_init(MachineState *machine)
>      cpu =3D cpu_ppc_init(machine->cpu_model);
>      if (cpu =3D=3D NULL) {
>          fprintf(stderr, "Unable to initialize CPU!\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      env =3D &cpu->env;
> =20
> @@ -223,7 +223,7 @@ static void bamboo_init(MachineState *machine)
>      pcibus =3D (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>      if (!pcibus) {
>          fprintf(stderr, "couldn't create PCI controller!\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      memory_region_init_alias(isa, NULL, "isa_mmio",
> @@ -265,7 +265,7 @@ static void bamboo_init(MachineState *machine)
>          if (success < 0) {
>              fprintf(stderr, "qemu: could not load kernel '%s'\n",
>                      kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -277,7 +277,7 @@ static void bamboo_init(MachineState *machine)
>          if (initrd_size < 0) {
>              fprintf(stderr, "qemu: could not load ram disk '%s' at %x\n",
>                      initrd_filename, RAMDISK_ADDR);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -286,7 +286,7 @@ static void bamboo_init(MachineState *machine)
>          if (bamboo_load_device_tree(FDT_ADDR, ram_size, RAMDISK_ADDR,
>                                      initrd_size, kernel_cmdline) < 0) {
>              fprintf(stderr, "couldn't load device tree\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
>  }
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index e7f413e..0e6312a 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -60,7 +60,7 @@ PowerPCCPU *ppc4xx_init(const char *cpu_model,
>      if (cpu =3D=3D NULL) {
>          fprintf(stderr, "Unable to find PowerPC %s CPU definition\n",
>                  cpu_model);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      env =3D &cpu->env;
> =20
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 054af1e..1040ddc 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -512,7 +512,7 @@ static void ppc_prep_init(MachineState *machine)
>          cpu =3D cpu_ppc_init(machine->cpu_model);
>          if (cpu =3D=3D NULL) {
>              fprintf(stderr, "Unable to find PowerPC CPU definition\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          env =3D &cpu->env;
> =20
> @@ -537,7 +537,7 @@ static void ppc_prep_init(MachineState *machine)
>                                            ram_size - kernel_base);
>          if (kernel_size < 0) {
>              error_report("could not load kernel '%s'", kernel_filename);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          /* load initrd */
>          if (initrd_filename) {
> @@ -547,7 +547,7 @@ static void ppc_prep_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  error_report("could not load initial ram disk '%s'",
>                               initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else {
>              initrd_base =3D 0;
> @@ -569,13 +569,13 @@ static void ppc_prep_init(MachineState *machine)
>          }
>          if (ppc_boot_device =3D=3D '\0') {
>              fprintf(stderr, "No valid boot device for Mac99 machine\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
>      if (PPC_INPUT(env) !=3D PPC_FLAGS_INPUT_6xx) {
>          error_report("Only 6xx bus is supported on PREP machine");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      dev =3D qdev_create(NULL, "raven-pcihost");
> @@ -590,7 +590,7 @@ static void ppc_prep_init(MachineState *machine)
>      pci_bus =3D (PCIBus *)qdev_get_child_bus(dev, "pci.0");
>      if (pci_bus =3D=3D NULL) {
>          fprintf(stderr, "Couldn't create PCI host controller.\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      sysctrl->contiguous_map_irq =3D qdev_get_gpio_in(dev, 0);
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ca77bb0..9019fe4 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -912,20 +912,20 @@ static void spapr_finalize_fdt(sPAPRMachineState *s=
papr,
>      ret =3D spapr_populate_memory(spapr, fdt);
>      if (ret < 0) {
>          error_report("couldn't setup memory nodes in fdt");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      ret =3D spapr_populate_vdevice(spapr->vio_bus, fdt);
>      if (ret < 0) {
>          error_report("couldn't setup vio devices in fdt");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      if (object_resolve_path_type("", TYPE_SPAPR_RNG, NULL)) {
>          ret =3D spapr_rng_populate_dt(fdt);
>          if (ret < 0) {
>              error_report("could not set up rng device in the fdt");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -933,7 +933,7 @@ static void spapr_finalize_fdt(sPAPRMachineState *spa=
pr,
>          ret =3D spapr_populate_pci_dt(phb, PHANDLE_XICP, fdt);
>          if (ret < 0) {
>              error_report("couldn't setup PCI devices in fdt");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -950,7 +950,7 @@ static void spapr_finalize_fdt(sPAPRMachineState *spa=
pr,
>      if (cb && bootlist) {
>          int offset =3D fdt_path_offset(fdt, "/chosen");
>          if (offset < 0) {
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          for (i =3D 0; i < cb; i++) {
>              if (bootlist[i] =3D=3D '\n') {
> @@ -965,7 +965,7 @@ static void spapr_finalize_fdt(sPAPRMachineState *spa=
pr,
>          int offset =3D fdt_path_offset(fdt, "/chosen");
> =20
>          if (offset < 0) {
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          fdt_setprop_string(fdt, offset, "qemu,boot-device", boot_device);
>      }
> @@ -984,7 +984,7 @@ static void spapr_finalize_fdt(sPAPRMachineState *spa=
pr,
>                                      SPAPR_DR_CONNECTOR_TYPE_CPU);
>          if (ret < 0) {
>              error_report("Couldn't set up CPU DR device tree properties"=
);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -993,7 +993,7 @@ static void spapr_finalize_fdt(sPAPRMachineState *spa=
pr,
>      if (fdt_totalsize(fdt) > FDT_MAX_SIZE) {
>          error_report("FDT too big ! 0x%x bytes (max is 0x%x)",
>                       fdt_totalsize(fdt), FDT_MAX_SIZE);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> @@ -1126,7 +1126,7 @@ static int find_unknown_sysbus_device(SysBusDevice =
*sbdev, void *opaque)
>      if (!matched) {
>          error_report("Device %s is not supported by this machine yet.",
>                       qdev_fw_name(DEVICE(sbdev)));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      return 0;
> @@ -1696,12 +1696,12 @@ static void ppc_spapr_init(MachineState *machine)
>          if (smp_cpus % smp_threads) {
>              error_report("smp_cpus (%u) must be multiple of threads (%u)=
",
>                           smp_cpus, smp_threads);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          if (max_cpus % smp_threads) {
>              error_report("max_cpus (%u) must be multiple of threads (%u)=
",
>                           max_cpus, smp_threads);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
> =20
> @@ -1716,7 +1716,7 @@ static void ppc_spapr_init(MachineState *machine)
> =20
>      if (rma_alloc_size =3D=3D -1) {
>          error_report("Unable to create RMA");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      if (rma_alloc_size && (rma_alloc_size < node0_size)) {
> @@ -1749,7 +1749,7 @@ static void ppc_spapr_init(MachineState *machine)
>      if (spapr->rma_size > node0_size) {
>          error_report("Numa node 0 has to span the RMA (%#08"HWADDR_PRIx"=
)",
>                       spapr->rma_size);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      /* Setup a load limit for the ramdisk leaving room for SLOF and FDT =
*/
> @@ -1776,7 +1776,7 @@ static void ppc_spapr_init(MachineState *machine)
> =20
>          if (type =3D=3D NULL) {
>              error_report("Unable to find sPAPR CPU Core definition");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          spapr->cores =3D g_new0(Object *, spapr_max_cores);
> @@ -1804,7 +1804,7 @@ static void ppc_spapr_init(MachineState *machine)
>              PowerPCCPU *cpu =3D cpu_ppc_init(machine->cpu_model);
>              if (cpu =3D=3D NULL) {
>                  error_report("Unable to find PowerPC CPU definition");
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              spapr_cpu_init(spapr, cpu, &error_fatal);
>         }
> @@ -1847,7 +1847,7 @@ static void ppc_spapr_init(MachineState *machine)
>              error_report("Specified number of memory slots %"
>                           PRIu64" exceeds max supported %d",
>                           machine->ram_slots, max_memslots);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          spapr->hotplug_memory.base =3D ROUND_UP(machine->ram_size,
> @@ -1865,22 +1865,22 @@ static void ppc_spapr_init(MachineState *machine)
>      filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, "spapr-rtas.bin");
>      if (!filename) {
>          error_report("Could not find LPAR rtas '%s'", "spapr-rtas.bin");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      spapr->rtas_size =3D get_image_size(filename);
>      if (spapr->rtas_size < 0) {
>          error_report("Could not get size of LPAR rtas '%s'", filename);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      spapr->rtas_blob =3D g_malloc(spapr->rtas_size);
>      if (load_image_size(filename, spapr->rtas_blob, spapr->rtas_size) < =
0) {
>          error_report("Could not load LPAR rtas '%s'", filename);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      if (spapr->rtas_size > RTAS_MAX_SIZE) {
>          error_report("RTAS too big ! 0x%zx bytes (max is 0x%x)",
>                       (size_t)spapr->rtas_size, RTAS_MAX_SIZE);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      g_free(filename);
> =20
> @@ -1950,7 +1950,7 @@ static void ppc_spapr_init(MachineState *machine)
>          error_report(
>              "pSeries SLOF firmware requires >=3D %ldM guest RMA (Real Mo=
de Area memory)",
>              MIN_RMA_SLOF);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      if (kernel_filename) {
> @@ -1969,7 +1969,7 @@ static void ppc_spapr_init(MachineState *machine)
>          if (kernel_size < 0) {
>              error_report("error loading %s: %s",
>                           kernel_filename, load_elf_strerror(kernel_size)=
);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
> =20
>          /* load initrd */
> @@ -1983,7 +1983,7 @@ static void ppc_spapr_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  error_report("could not load initial ram disk '%s'",
>                               initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else {
>              initrd_base =3D 0;
> @@ -1997,12 +1997,12 @@ static void ppc_spapr_init(MachineState *machine)
>      filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>      if (!filename) {
>          error_report("Could not find LPAR firmware '%s'", bios_name);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
>      if (fw_size <=3D 0) {
>          error_report("Could not load LPAR firmware '%s'", filename);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      g_free(filename);
> =20
> @@ -2042,7 +2042,7 @@ static int spapr_kvm_type(const char *vm_type)
>      }
> =20
>      error_report("Unknown kvm-type specified '%s'", vm_type);
> -    exit(1);
> +    exit(EXIT_FAILURE);
>  }
> =20
>  /*
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index b97d966..fb540a3 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -99,7 +99,7 @@ static PowerPCCPU *ppc440_init_xilinx(ram_addr_t *ram_s=
ize,
>      cpu =3D cpu_ppc_init(cpu_model);
>      if (cpu =3D=3D NULL) {
>          fprintf(stderr, "Unable to initialize CPU!\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      env =3D &cpu->env;
> =20
> @@ -284,7 +284,7 @@ static void virtex_init(MachineState *machine)
>              if (initrd_size < 0) {
>                  error_report("couldn't load ram disk '%s'",
>                               machine->initrd_filename);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              high =3D ROUND_UP(high + initrd_size, 4);
>          }
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index dcb68b9..231718b 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -323,7 +323,7 @@ static long gethugepagesize(const char *mem_path)
>      if (ret !=3D 0) {
>          fprintf(stderr, "Couldn't statfs() memory path: %s\n",
>                  strerror(errno));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>  #define HUGETLBFS_MAGIC       0x958458f6
> @@ -2063,7 +2063,7 @@ void kvmppc_set_papr(PowerPCCPU *cpu)
>      ret =3D kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_PAPR, 0);
>      if (ret) {
>          error_report("This vCPU type or KVM version does not support PAP=
R");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
> =20
>      /* Update the capability flag so we sync the right information
> @@ -2084,7 +2084,7 @@ void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpi=
c_proxy)
>      ret =3D kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_EPR, 0, mpic_proxy);
>      if (ret && mpic_proxy) {
>          error_report("This KVM version does not support EPR");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>  }
> =20
> diff --git a/target-ppc/translate.c b/target-ppc/translate.c
> index 618334a..b704676 100644
> --- a/target-ppc/translate.c
> +++ b/target-ppc/translate.c
> @@ -7149,7 +7149,7 @@ void gen_intermediate_code(CPUPPCState *env, struct=
 TranslationBlock *tb)
>              fprintf(stderr, "Opcode %02x %02x %02x %02x (%08x) leaked "
>                      "temporaries\n", opc1(ctx.opcode), opc2(ctx.opcode),
>                      opc3(ctx.opcode), opc4(ctx.opcode), ctx.opcode);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      }
>      if (tb->cflags & CF_LAST_IO)
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index 407ccb9..b362ae7 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -656,7 +656,7 @@ static inline void _spr_register(CPUPPCState *env, in=
t num,
>  #endif
>          spr->uea_read !=3D NULL || spr->uea_write !=3D NULL) {
>          printf("Error: Trying to register SPR %d (%03x) twice !\n", num,=
 num);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>  #if defined(PPC_DEBUG_SPR)
>      printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num,=
 num,
> @@ -1742,7 +1742,7 @@ static void gen_spr_BookE (CPUPPCState *env, uint64=
_t ivor_mask)
>          if (ivor_mask & (1ULL << i)) {
>              if (ivor_sprn[i] =3D=3D SPR_BOOKE_IVORxx) {
>                  fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i=
);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              spr_register(env, ivor_sprn[i], ivor_names[i],
>                           SPR_NOACCESS, SPR_NOACCESS,
> @@ -8974,12 +8974,12 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>          default:
>              fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                      "Should define POWERPC_FLAG_SPE or POWERPC_FLAG_VRE\=
n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      } else if (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
>          fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                  "Should not define POWERPC_FLAG_SPE nor POWERPC_FLAG_VRE=
\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      if (env->msr_mask & (1 << 17)) {
>          switch (env->flags & (POWERPC_FLAG_TGPR | POWERPC_FLAG_CE)) {
> @@ -8989,12 +8989,12 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>          default:
>              fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                      "Should define POWERPC_FLAG_TGPR or POWERPC_FLAG_CE\=
n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      } else if (env->flags & (POWERPC_FLAG_TGPR | POWERPC_FLAG_CE)) {
>          fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                  "Should not define POWERPC_FLAG_TGPR nor POWERPC_FLAG_CE=
\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      if (env->msr_mask & (1 << 10)) {
>          switch (env->flags & (POWERPC_FLAG_SE | POWERPC_FLAG_DWE |
> @@ -9007,14 +9007,14 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>              fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                      "Should define POWERPC_FLAG_SE or POWERPC_FLAG_DWE o=
r "
>                      "POWERPC_FLAG_UBLE\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      } else if (env->flags & (POWERPC_FLAG_SE | POWERPC_FLAG_DWE |
>                               POWERPC_FLAG_UBLE)) {
>          fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                  "Should not define POWERPC_FLAG_SE nor POWERPC_FLAG_DWE =
nor "
>                  "POWERPC_FLAG_UBLE\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>      }
>      if (env->msr_mask & (1 << 9)) {
>          switch (env->flags & (POWERPC_FLAG_BE | POWERPC_FLAG_DE)) {
> @@ -9024,12 +9024,12 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>          default:
>              fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                      "Should define POWERPC_FLAG_BE or POWERPC_FLAG_DE\n"=
);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      } else if (env->flags & (POWERPC_FLAG_BE | POWERPC_FLAG_DE)) {
>          fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                  "Should not define POWERPC_FLAG_BE nor POWERPC_FLAG_DE\n=
");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      if (env->msr_mask & (1 << 2)) {
>          switch (env->flags & (POWERPC_FLAG_PX | POWERPC_FLAG_PMM)) {
> @@ -9039,17 +9039,17 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>          default:
>              fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                      "Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM\n=
");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>      } else if (env->flags & (POWERPC_FLAG_PX | POWERPC_FLAG_PMM)) {
>          fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>                  "Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM\=
n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      if ((env->flags & (POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_BUS_CLK)) =3D=
=3D 0) {
>          fprintf(stderr, "PowerPC flags inconsistency\n"
>                  "Should define the time-base and decrementer clock sourc=
e\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      /* Allocate TLBs buffer when needed */
>  #if !defined(CONFIG_USER_ONLY)
> @@ -10365,7 +10365,7 @@ static void ppc_cpu_reset(CPUState *s)
>      msr |=3D (target_ulong)1 << MSR_LE; /* Little-endian user mode */
>      if (!((env->msr_mask >> MSR_LE) & 1)) {
>          fprintf(stderr, "Selected CPU does not support little-endian.\n"=
);
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>  #endif
>  #endif
> diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
> index eaf1bd9..8377302 100644
> --- a/tcg/ppc/tcg-target.inc.c
> +++ b/tcg/ppc/tcg-target.inc.c
> @@ -2742,7 +2742,7 @@ static void __attribute__((constructor)) tcg_cache_=
init(void)
>          if (isize =3D=3D 0) {
>              fprintf(stderr, "getauxval AT_ICACHEBSIZE failed\n");
>          }
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      dcache_bsize =3D dsize;
>      icache_bsize =3D isize;
> @@ -2760,7 +2760,7 @@ static void __attribute__((constructor)) tcg_cache_=
init(void)
>      len =3D sizeof(cacheline);
>      if (sysctl(name, 2, &cacheline, &len, NULL, 0)) {
>          perror("sysctl CTL_HW HW_CACHELINE failed");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      dcache_bsize =3D cacheline;
>      icache_bsize =3D cacheline;
> @@ -2777,7 +2777,7 @@ static void __attribute__((constructor)) tcg_cache_=
init(void)
>      if (sysctlbyname ("machdep.cacheline_size", &cacheline, &len, NULL, =
0)) {
>          fprintf(stderr, "sysctlbyname machdep.cacheline_size failed: %s\=
n",
>                  strerror(errno));
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      dcache_bsize =3D cacheline;
>      icache_bsize =3D cacheline;
> --=20
> 2.5.5
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX33YlAAoJEGw4ysog2bOSwocP/1dSP634BLTJs4FPnslJzVKu
UmUg+VhQTUQooFQA2ptWIDys0F13TDEIjj7AJnm5+7zBkR3RVvJsBN4doY4VQgxd
woIKdB9VGnLMCeRP2/fIt3euyMlLObLyzGz4cVlbBXRMF8ZpX1BbXJHa8uMb9NLf
DjkYKM1NbcUiH7OeYHNDOZmN90dlAI12Tge40Ls8Mbbp+M1+pLoZyccZzUD221gt
JZdisQhMkXHQTzXtJTCldCahzzXWDj/muhycrTJcuCB0YajrY0Rk/6I7OOYCA6Ts
nS2xhTM7bZUxqNqfNRhuo57JK7FBsp+VFCJeLQrBa7hQbqpab8EZ1K7D7KhQNAs0
rOtmFNq+brruhrfDVXJn/QGo9F2WwFr8J8szyoUZKiaZUtdClTG/24QF6bMpRUPj
wQ7KjjXGSQpmdLTO3oy8ZZGwCx3T9rbi4wXn3y2qYGAuKMHwkCRi9Rvz2JJmKcWs
ACenk2sdNl1qmHM0syUyBbcT3/oAGj9wWpY/7rqWSZy5zcxOSpF5ZgjZD2pT7uUV
lvGtCtxwRddTcEQpC7C/b2Jo/azCkkkWSVyordFm/XU/8woauUDkbdi+R957jSng
L+TyiGBKdrkp9vnWGTno7bHwcssuHMoPGqckJUF5RMwBiBkZ1nOW7WkX/Aw/xReg
B8QG6wrnx+27MLhip0Dp
=aIPv
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

