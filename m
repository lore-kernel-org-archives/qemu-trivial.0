Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbF5-0003B1-HJ
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbF1-000352-2U
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:22:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbEz-0000eI-FX
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:22:46 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbEq-0000aY-LW; Tue, 04 Aug 2015 08:22:36 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbEm-0007eM-SY; Tue, 04 Aug 2015 14:22:33 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbEm-0002Nb-6i; Tue, 04 Aug 2015 14:22:32 +0200
Date: Tue, 4 Aug 2015 14:22:32 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804122232.GA8864@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-9-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-9-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 08/11] qemu-log: dfilter-ise exec,
	out_asm, and op_opt
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
X-List-Received-Date: Tue, 04 Aug 2015 12:22:50 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> This ensures the code generation debug code will honour -dfilter if set.
> For the "exec" tracing I've added a new inline macro for efficiency's
> sake. I've not touched CPU_LOG_TB_OP as this is buried in each
> individual target.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ----
>=20
> v2
>    - checkpatch updates
>    - add qemu_log_mask_and_addr macro for inline dump for traces
>    - re-base on re-factored tcg layout
>    - include new Trace & Link lines
> ---
>  cpu-exec.c              | 13 +++++++------
>  include/exec/exec-all.h |  8 +++++---
>  include/qemu/log.h      | 15 +++++++++++++++
>  tcg/tcg.c               |  6 ++++--
>  translate-all.c         |  3 ++-
>  5 files changed, 33 insertions(+), 12 deletions(-)
>=20
> diff --git a/cpu-exec.c b/cpu-exec.c
> index a039f1a..d01d08e 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -181,8 +181,9 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *=
cpu, TranslationBlock *itb)
>      uintptr_t next_tb;
>      uint8_t *tb_ptr =3D itb->tc_ptr;
> =20
> -    qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
> -                  itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
> +    qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
> +                           "Trace %p [" TARGET_FMT_lx "] %s\n",
> +                           itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
> =20
>  #if defined(DEBUG_DISAS)
>      if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
> @@ -213,10 +214,10 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState=
 *cpu, TranslationBlock *itb)
>           */
>          CPUClass *cc =3D CPU_GET_CLASS(cpu);
>          TranslationBlock *tb =3D (TranslationBlock *)(next_tb & ~TB_EXIT=
_MASK);
> -        qemu_log_mask(CPU_LOG_EXEC,
> -                      "Abandoned execution of TB chain before %p ["
> -                      TARGET_FMT_lx "] %s\n",
> -                      itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
> +        qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
> +                               "Abandoned execution of TB chain before %=
p ["
> +                               TARGET_FMT_lx "] %s\n",
> +                               itb->tc_ptr, itb->pc, lookup_symbol(itb->=
pc));
>          if (cc->synchronize_from_tb) {
>              cc->synchronize_from_tb(cpu, tb);
>          } else {
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 361d3d2..51276ab 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -282,9 +282,11 @@ static inline void tb_add_jump(TranslationBlock *tb,=
 int n,
>  {
>      /* NOTE: this test is only needed for thread safety */
>      if (!tb->jmp_next[n]) {
> -        qemu_log_mask(CPU_LOG_EXEC, "Linking TBs %p [" TARGET_FMT_lx
> -                      "] index %d -> %p [" TARGET_FMT_lx "]\n",
> -                      tb->tc_ptr, tb->pc, n, tb_next->tc_ptr, tb_next->p=
c);
> +        qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
> +                               "Linking TBs %p [" TARGET_FMT_lx
> +                               "] index %d -> %p [" TARGET_FMT_lx "]\n",
> +                               tb->tc_ptr, tb->pc, n,
> +                               tb_next->tc_ptr, tb_next->pc);
>          /* patch the native jump address */
>          tb_set_jmp_target(tb, n, (uintptr_t)tb_next->tc_ptr);
> =20
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index ade1f76..0b0eef5 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -77,6 +77,21 @@ qemu_log_vprintf(const char *fmt, va_list va)
>          }                                               \
>      } while (0)
> =20
> +/* log only if a bit is set on the current loglevel mask
> + * and we are in the address range we care about:
> + * @mask: bit to check in the mask
> + * @addr: address to check in dfilter
> + * @fmt: printf-style format string
> + * @args: optional arguments for format string
> + */
> +#define qemu_log_mask_and_addr(MASK, ADDR, FMT, ...)    \
> +    do {                                                \
> +        if (unlikely(qemu_loglevel_mask(MASK)) &&       \
> +                     qemu_log_in_addr_range(ADDR)) {    \
> +            qemu_log(FMT, ## __VA_ARGS__);              \
> +        }                                               \
> +    } while (0)
> +
>  /* Special cases: */
> =20
>  /* cpu_dump_state() logging functions: */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 587bd89..ed42204 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2305,7 +2305,8 @@ static inline int tcg_gen_code_common(TCGContext *s=
, TranslationBlock *tb,
>       g_assert(tb->tc_size =3D=3D 0 || search_pc > 0);
> =20
>  #ifdef DEBUG_DISAS
> -    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
> +    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
> +                 && qemu_log_in_addr_range(tb->pc))) {
>          qemu_log("OP:\n");
>          tcg_dump_ops(s);
>          qemu_log("\n");
> @@ -2332,7 +2333,8 @@ static inline int tcg_gen_code_common(TCGContext *s=
, TranslationBlock *tb,
>  #endif
> =20
>  #ifdef DEBUG_DISAS
> -    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT))) {
> +    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
> +                 && qemu_log_in_addr_range(tb->pc))) {
>          qemu_log("OP after optimization and liveness analysis:\n");
>          tcg_dump_ops(s);
>          qemu_log("\n");
> diff --git a/translate-all.c b/translate-all.c
> index e8072d8..facd516 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -205,7 +205,8 @@ void cpu_gen_code(CPUArchState *env, TranslationBlock=
 *tb)
> =20
>      tb_write_perfmap(tb->tc_ptr, tb->tc_size, tb->pc);
>  #ifdef DEBUG_DISAS
> -    if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
> +    if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
> +        qemu_log_in_addr_range(tb->pc)) {
>          qemu_log("OUT: [size=3D%d]\n", tb->tc_size);
>          log_disas(tb->tc_ptr, tb->tc_size);
>          qemu_log("\n");
> --=20
> 2.5.0

Reviewed-by: Aurelien Jarno <aurelien@aureL32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

