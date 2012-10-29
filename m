Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSuhP-0007NA-FY
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 15:08:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TSuhM-0007DG-BE
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 15:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TSuhL-0006zo-0f
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 15:08:32 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47191 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1TSuhD-0006yT-2e; Mon, 29 Oct 2012 15:08:23 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id BFF83A30ED;
	Mon, 29 Oct 2012 20:08:21 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <5d8cc784f28d55335457ca6dae1add0040bd4e17.1351422116.git.blauwirbel@gmail.com>
Date: Mon, 29 Oct 2012 20:08:19 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F67BD53A-66E0-480D-9033-1AFCA54B9FD3@suse.de>
References: <cover.1351422116.git.blauwirbel@gmail.com>
	<5d8cc784f28d55335457ca6dae1add0040bd4e17.1351422116.git.blauwirbel@gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 5/6] target-ppc: make some functions
	static
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
X-List-Received-Date: Mon, 29 Oct 2012 19:08:34 -0000


On 28.10.2012, at 12:04, Blue Swirl wrote:

> Signed-off-by: Blue Swirl <blauwirbel@gmail.com>

Acked-by: Alexander Graf <agraf@suse.de>

Alex

> ---
> target-ppc/cpu.h        |    6 ------
> target-ppc/mmu_helper.c |   11 ++++++-----
> 2 files changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index b34a1ff..a5e7c55 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -1141,10 +1141,6 @@ int cpu_ppc_signal_handler (int host_signum, =
void *pinfo,
> int cpu_ppc_handle_mmu_fault (CPUPPCState *env, target_ulong address, =
int rw,
>                               int mmu_idx);
> #define cpu_handle_mmu_fault cpu_ppc_handle_mmu_fault
> -#if !defined(CONFIG_USER_ONLY)
> -int get_physical_address (CPUPPCState *env, mmu_ctx_t *ctx, =
target_ulong vaddr,
> -                          int rw, int access_type);
> -#endif
> void do_interrupt (CPUPPCState *env);
> void ppc_hw_interrupt (CPUPPCState *env);
>=20
> @@ -1189,8 +1185,6 @@ void store_40x_dbcr0 (CPUPPCState *env, uint32_t =
val);
> void store_40x_sler (CPUPPCState *env, uint32_t val);
> void store_booke_tcr (CPUPPCState *env, target_ulong val);
> void store_booke_tsr (CPUPPCState *env, target_ulong val);
> -void booke206_flush_tlb(CPUPPCState *env, int flags, const int =
check_iprot);
> -hwaddr booke206_tlb_to_page_size(CPUPPCState *env, ppcmas_tlb_t =
*tlb);
> int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
>                      hwaddr *raddrp, target_ulong address,
>                      uint32_t pid);
> diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
> index 4a9bb5b..31aa5c9 100644
> --- a/target-ppc/mmu_helper.c
> +++ b/target-ppc/mmu_helper.c
> @@ -1276,7 +1276,8 @@ static int =
mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>     return ret;
> }
>=20
> -void booke206_flush_tlb(CPUPPCState *env, int flags, const int =
check_iprot)
> +static void booke206_flush_tlb(CPUPPCState *env, int flags,
> +                               const int check_iprot)
> {
>     int tlb_size;
>     int i, j;
> @@ -1297,8 +1298,8 @@ void booke206_flush_tlb(CPUPPCState *env, int =
flags, const int check_iprot)
>     tlb_flush(env, 1);
> }
>=20
> -hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> -                                             ppcmas_tlb_t *tlb)
> +static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> +                                        ppcmas_tlb_t *tlb)
> {
>     int tlbm_size;
>=20
> @@ -1708,8 +1709,8 @@ static inline int check_physical(CPUPPCState =
*env, mmu_ctx_t *ctx,
>     return ret;
> }
>=20
> -int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx, =
target_ulong eaddr,
> -                         int rw, int access_type)
> +static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                target_ulong eaddr, int rw, int =
access_type)
> {
>     int ret;
>=20
> --=20
> 1.7.2.5
>=20


