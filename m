Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWdOk-0001U5-Gv
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2017 01:19:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWdOh-0001Qv-Lp
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 01:19:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWdOg-00018Y-Le
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 01:19:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cWdOa-00017B-76; Thu, 26 Jan 2017 01:18:56 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D52797FB67;
	Thu, 26 Jan 2017 06:18:55 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q6IowO025426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2017 01:18:52 -0500
To: Valentin Plotkin <caliborn@SDF.ORG>, qemu-devel@nongnu.org
References: <Pine.NEB.4.64.1701251446290.11466@sdf.lonestar.org>
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Scott Wood <scottwood@freescale.com>,
	David Gibson <david@gibson.dropbear.id.au>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ac4f39e3-6ef7-e57d-f393-e0d069be192d@redhat.com>
Date: Thu, 26 Jan 2017 07:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <Pine.NEB.4.64.1701251446290.11466@sdf.lonestar.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 26 Jan 2017 06:18:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v2] target-ppc: Add MMU model
 check for booke machines
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
X-List-Received-Date: Thu, 26 Jan 2017 06:19:04 -0000

On 25.01.2017 15:50, Valentin Plotkin wrote:
> Machines bamboo, e500 and virtex-ml507 assume a certain MMU model,
> otherwise resulting in unpredictable behavior. Add apropriate checks
> into *_init functions.
>=20
> Signed-off-by: Valentin <caliborn@sdf.org>

Missing last name? ------^

Apart from that, the patch looks fine to me now, thanks for the update!

 Thomas


> ---
>  hw/ppc/e500.c          | 6 ++++++
>  hw/ppc/ppc440_bamboo.c | 6 ++++++
>  hw/ppc/virtex_ml507.c  | 7 +++++++
>  3 files changed, 19 insertions(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index cf8b122..5b1958c 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -827,6 +827,12 @@ void ppce500_init(MachineState *machine,
> PPCE500Params *params)
>          env =3D &cpu->env;
>          cs =3D CPU(cpu);
>=20
> +        if (env->mmu_model !=3D POWERPC_MMU_BOOKE206) {
> +            fprintf(stderr, "MMU model %i not supported by this
> machine.\n",
> +                env->mmu_model);
> +            exit(1);
> +        }
> +
>          if (!firstenv) {
>              firstenv =3D env;
>          }
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 5c535b1..9d997bf 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -193,6 +193,12 @@ static void bamboo_init(MachineState *machine)
>      }
>      env =3D &cpu->env;
>=20
> +    if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
> +        fprintf(stderr, "MMU model %i not supported by this machine.\n=
",
> +            env->mmu_model);
> +        exit(1);
> +    }
> +
>      qemu_register_reset(main_cpu_reset, cpu);
>      ppc_booke_timers_init(cpu, 400000000, 0);
>      ppc_dcr_init(env, NULL, NULL);
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index b97d966..fdbcf22 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -221,6 +221,13 @@ static void virtex_init(MachineState *machine)
>=20
>      cpu =3D ppc440_init_xilinx(&ram_size, 1, machine->cpu_model, 40000=
0000);
>      env =3D &cpu->env;
> +
> +    if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
> +        fprintf(stderr, "MMU model %i not supported by this machine.\n=
",
> +            env->mmu_model);
> +        exit(1);
> +    }
> +
>      qemu_register_reset(main_cpu_reset, cpu);
>=20
>      memory_region_allocate_system_memory(phys_ram, NULL, "ram", ram_si=
ze);


