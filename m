Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWepd-0000f0-6e
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2017 02:50:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cWepb-0000d5-7E
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 02:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cWepa-0007E8-Cq
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2017 02:50:55 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cWepN-00078z-OC; Thu, 26 Jan 2017 02:50:42 -0500
Received: by mail-lf0-x244.google.com with SMTP id q89so23037817lfi.1;
	Wed, 25 Jan 2017 23:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KE7kbP9D0xX6VyzwEo7EvuwC8t3EGvhB8+7dnX1c7bg=;
	b=QWba1bPmNIqjMx4rlazBGT8TMFlzBLjkqBOerurQ2vlBf0djwWKMIq5T+uDGx2WzXN
	ufAagzo4LsIg7f5VA+lZfcm5vhHhVHhTxEiK9vEn6pEar6+6fcUPGQEKoJYvGSkopShX
	aaGQtt2ZecleYbOurZDAJ6E8fxY4pGYBM3GhxnBkhdCC5/xkI9NF6+5zqH3aM1qIZDrG
	IgFWpNFrUJCMbRcjEmQV2Y7hxhmQXL55mLstMbi1E2MJ9ZYAxZFSzRa8Jq3y5J2on29E
	RpFQfWzKtdZZ/pHHptYv7ejuzy6nnAWtaoov/ihKxfTw2QKouAnxY+3K4MDZMjRhYFPL
	Xa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KE7kbP9D0xX6VyzwEo7EvuwC8t3EGvhB8+7dnX1c7bg=;
	b=MbG0ge5HcJGar48P7cfZ7Ei7dPRJ4zkCLqsQMOi7KRuRX6JTLoHMU24Pj1kMJKQx9R
	WDjpz+AO4Gey/ypNOzL+eShIXog0kyKPF+xt4tteHG4lT6WoN+Vd0cOdmNTyW/Spqxzq
	GMwkhRXKirPkZcLA1Jh5d5+uX5ryV4E2nYjc2PjUpfrf3r4rENass4qLR0Q5AMi9gNS+
	9vCqoDz9dZCD654hETKSo7vbsp7bz7HdtvUXJz3kWYMeFHGpNtVlLA4yKR8L7zYL1ifR
	bKw5hhw39AcRf2+9ywf4PKsLoQsD0Z8+8/AFY8mvacZrJ5k7hh0yrVH7BR6xsB7cG+L9
	+eoA==
X-Gm-Message-State: AIkVDXJjOtXGC314ZiKBCQ2VCHG/JT9hl+VNi5cF3YNq6PnuSrNSYAZim1Bu//LI7fiv1g==
X-Received: by 10.25.198.6 with SMTP id w6mr478560lff.175.1485417038581;
	Wed, 25 Jan 2017 23:50:38 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id s7sm218184lja.27.2017.01.25.23.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 23:50:37 -0800 (PST)
Date: Thu, 26 Jan 2017 08:50:37 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Valentin Plotkin <caliborn@SDF.ORG>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170126075037.GF9606@toto>
References: <Pine.NEB.4.64.1701251446290.11466@sdf.lonestar.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1701251446290.11466@sdf.lonestar.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [PATCH v2] target-ppc: Add MMU model check for
 booke machines
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
X-List-Received-Date: Thu, 26 Jan 2017 07:50:56 -0000

On Wed, Jan 25, 2017 at 02:50:30PM +0000, Valentin Plotkin wrote:
> Machines bamboo, e500 and virtex-ml507 assume a certain MMU model,
> otherwise resulting in unpredictable behavior. Add apropriate checks
> into *_init functions.

The Virtex part looks OK.
I couldn't apply the patch with git am though...



> 
> Signed-off-by: Valentin <caliborn@sdf.org>
> ---
>  hw/ppc/e500.c          | 6 ++++++
>  hw/ppc/ppc440_bamboo.c | 6 ++++++
>  hw/ppc/virtex_ml507.c  | 7 +++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index cf8b122..5b1958c 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -827,6 +827,12 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
>          env = &cpu->env;
>          cs = CPU(cpu);
> 
> +        if (env->mmu_model != POWERPC_MMU_BOOKE206) {
> +            fprintf(stderr, "MMU model %i not supported by this machine.\n",
> +                env->mmu_model);
> +            exit(1);
> +        }
> +
>          if (!firstenv) {
>              firstenv = env;
>          }
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 5c535b1..9d997bf 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -193,6 +193,12 @@ static void bamboo_init(MachineState *machine)
>      }
>      env = &cpu->env;
> 
> +    if (env->mmu_model != POWERPC_MMU_BOOKE) {
> +        fprintf(stderr, "MMU model %i not supported by this machine.\n",
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
> 
>      cpu = ppc440_init_xilinx(&ram_size, 1, machine->cpu_model, 400000000);
>      env = &cpu->env;
> +
> +    if (env->mmu_model != POWERPC_MMU_BOOKE) {
> +        fprintf(stderr, "MMU model %i not supported by this machine.\n",
> +            env->mmu_model);
> +        exit(1);
> +    }
> +
>      qemu_register_reset(main_cpu_reset, cpu);
> 
>      memory_region_allocate_system_memory(phys_ram, NULL, "ram", ram_size);
> -- 
> 2.5.5
> 
> 
> This fixes 'qemu-system-ppc -nographic -cpu G2leGP3 -M ppce500; bug from
> BiteSizedTasks.
> 
> Version 2: fixed style, moved checks from mmubooke_create_initial_mapping
> to *_init. Thanks to Thomas Huth <thuth@redhat.com>.

