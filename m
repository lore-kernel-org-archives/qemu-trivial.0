Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbPb-0000j4-DR
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:33:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbPY-0000ex-2M
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbPW-0005lG-QO
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:33:40 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbPT-0005im-OK; Tue, 04 Aug 2015 08:33:35 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbPQ-000808-M6; Tue, 04 Aug 2015 14:33:32 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbPQ-0002UO-0K; Tue, 04 Aug 2015 14:33:32 +0200
Date: Tue, 4 Aug 2015 14:33:31 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804123331.GB8960@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 11/11] cputlb: modernise the debug
	support
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
X-List-Received-Date: Tue, 04 Aug 2015 12:33:42 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> To avoid cluttering the code with #ifdef legs we wrap up the print
> statements into a tlb_debug() macro. As access to the virtual TLB can
> get quite heavy defining DEBUG_TLB_LOG will ensure all the logs go to
> the qemu_log target of CPU_LOG_MMU instead of stderr.
>=20
> I've also removed DEBUG_TLB_CHECK which wasn't used.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ---
> v2
>   - ensure the compiler checks format strings even if debug is optimised =
out
> ---
>  cputlb.c | 54 +++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 19 deletions(-)
>=20
> diff --git a/cputlb.c b/cputlb.c
> index a506086..7095e6f 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -30,8 +30,30 @@
>  #include "exec/ram_addr.h"
>  #include "tcg/tcg.h"
> =20
> -//#define DEBUG_TLB
> -//#define DEBUG_TLB_CHECK
> +/* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target =
*/
> +/* #define DEBUG_TLB */
> +/* #define DEBUG_TLB_LOG */
> +
> +#ifdef DEBUG_TLB
> +# define DEBUG_TLB_GATE 1
> +# ifdef DEBUG_TLB_LOG
> +#  define DEBUG_TLB_LOG_GATE 1
> +# else
> +#  define DEBUG_TLB_LOG_GATE 0
> +# endif
> +#else
> +# define DEBUG_TLB_GATE 0
> +# define DEBUG_TLB_LOG_GATE 0
> +#endif
> +
> +#define tlb_debug(fmt, ...) do { \
> +    if (DEBUG_TLB_LOG_GATE) { \
> +        qemu_log_mask(CPU_LOG_MMU, "%s: " fmt, __func__, \
> +                      ## __VA_ARGS__); \
> +    } else if (DEBUG_TLB_GATE) { \
> +        fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__); \
> +    } \
> +} while (0)

Do we really want to support sending debug logs to either the logfile or
stderr? It's already possible to send the debug logs through stderr when
not specifying -D file.

>  /* statistics */
>  int tlb_flush_count;
> @@ -52,9 +74,8 @@ void tlb_flush(CPUState *cpu, int flush_global)
>  {
>      CPUArchState *env =3D cpu->env_ptr;
> =20
> -#if defined(DEBUG_TLB)
> -    printf("tlb_flush:\n");
> -#endif
> +    tlb_debug("(%d)\n", flush_global);
> +
>      /* must reset current TB so that interrupts cannot modify the
>         links while we are modifying them */
>      cpu->current_tb =3D NULL;
> @@ -87,16 +108,14 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
>      int i;
>      int mmu_idx;
> =20
> -#if defined(DEBUG_TLB)
> -    printf("tlb_flush_page: " TARGET_FMT_lx "\n", addr);
> -#endif
> +    tlb_debug("page :" TARGET_FMT_lx "\n", addr);
> +
>      /* Check if we need to flush due to large pages.  */
>      if ((addr & env->tlb_flush_mask) =3D=3D env->tlb_flush_addr) {
> -#if defined(DEBUG_TLB)
> -        printf("tlb_flush_page: forced full flush ("
> -               TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
> -               env->tlb_flush_addr, env->tlb_flush_mask);
> -#endif
> +        tlb_debug("forcing full flush ("
> +                  TARGET_FMT_lx "/" TARGET_FMT_lx ")\n",
> +                  env->tlb_flush_addr, env->tlb_flush_mask);
> +
>          tlb_flush(cpu, 1);
>          return;
>      }
> @@ -271,12 +290,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_u=
long vaddr,
>      section =3D address_space_translate_for_iotlb(cpu, paddr, &xlat, &sz=
);
>      assert(sz >=3D TARGET_PAGE_SIZE);
> =20
> -#if defined(DEBUG_TLB)
> -    qemu_log_mask(CPU_LOG_MMU,
> -           "tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET_F=
MT_plx
> -           " prot=3D%x idx=3D%d\n",
> -           vaddr, paddr, prot, mmu_idx);
> -#endif
> +    tlb_debug("tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGE=
T_FMT_plx
> +              " prot=3D%x idx=3D%d\n",
> +              vaddr, paddr, prot, mmu_idx);
> =20
>      address =3D vaddr;
>      if (!memory_region_is_ram(section->mr) && !memory_region_is_romd(sec=
tion->mr)) {
> --=20
> 2.5.0
>=20
>=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

