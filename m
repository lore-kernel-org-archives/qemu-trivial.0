Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMb9x-0005zb-Os
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:17:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9q-0005od-JM
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9o-0006P5-Vx
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:26 -0400
Received: from hall.aurel32.net ([195.154.112.97]:39124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb9o-0006Oe-Nb
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:17:24 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9l-0007T0-Vm; Tue, 04 Aug 2015 14:17:22 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb9l-0002Hz-92; Tue, 04 Aug 2015 14:17:21 +0200
Date: Tue, 4 Aug 2015 14:17:21 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804121721.GA8358@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-6-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 05/11] qemu-log: Improve the "exec" TB
 execution logging
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
X-List-Received-Date: Tue, 04 Aug 2015 12:17:32 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Improve the TB execution logging so that it is easier to identify
> what is happening from trace logs:
>  * move the "Trace" logging of executed TBs into cpu_tb_exec()
>    so that it is emitted if and only if we actually execute a TB,
>    and for consistency for the CPU state logging
>  * log when we link two TBs together via tb_add_jump()
>  * log when cpu_tb_exec() returns early from a chain of TBs
>=20
> The new style logging looks like this:
>=20
> Trace 0x7fb7cc822ca0 [ffffffc0000dce00]
> Linking TBs 0x7fb7cc822ca0 [ffffffc0000dce00] index 0 -> 0x7fb7cc823110 [=
ffffffc0000dce10]
> Trace 0x7fb7cc823110 [ffffffc0000dce10]
> Trace 0x7fb7cc823420 [ffffffc000302688]
> Trace 0x7fb7cc8234a0 [ffffffc000302698]
> Trace 0x7fb7cc823520 [ffffffc0003026a4]
> Trace 0x7fb7cc823560 [ffffffc0000dce44]
> Linking TBs 0x7fb7cc823560 [ffffffc0000dce44] index 1 -> 0x7fb7cc8235d0 [=
ffffffc0000dce70]
> Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
> Abandoned execution of TB chain before 0x7fb7cc8235d0 [ffffffc0000dce70]
> Trace 0x7fb7cc8235d0 [ffffffc0000dce70]
> Trace 0x7fb7cc822fd0 [ffffffc0000dd52c]
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> [AJB: reword patch title]
> ---
>  cpu-exec.c              | 20 +++++++++++---------
>  include/exec/exec-all.h |  3 +++
>  2 files changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/cpu-exec.c b/cpu-exec.c
> index 75694f3..a039f1a 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -175,10 +175,14 @@ void cpu_reload_memory_map(CPUState *cpu)
>  #endif
> =20
>  /* Execute a TB, and fix up the CPU state afterwards if necessary */
> -static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, uint8_t *tb_pt=
r)
> +static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlo=
ck *itb)
>  {
>      CPUArchState *env =3D cpu->env_ptr;
>      uintptr_t next_tb;
> +    uint8_t *tb_ptr =3D itb->tc_ptr;
> +
> +    qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
> +                  itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
> =20
>  #if defined(DEBUG_DISAS)
>      if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
> @@ -209,6 +213,10 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState =
*cpu, uint8_t *tb_ptr)
>           */
>          CPUClass *cc =3D CPU_GET_CLASS(cpu);
>          TranslationBlock *tb =3D (TranslationBlock *)(next_tb & ~TB_EXIT=
_MASK);
> +        qemu_log_mask(CPU_LOG_EXEC,
> +                      "Abandoned execution of TB chain before %p ["
> +                      TARGET_FMT_lx "] %s\n",
> +                      itb->tc_ptr, itb->pc, lookup_symbol(itb->pc));
>          if (cc->synchronize_from_tb) {
>              cc->synchronize_from_tb(cpu, tb);
>          } else {
> @@ -247,7 +255,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_c=
ycles,
>      cpu->current_tb =3D tb;
>      /* execute the generated code */
>      trace_exec_tb_nocache(tb, tb->pc);
> -    cpu_tb_exec(cpu, tb->tc_ptr);
> +    cpu_tb_exec(cpu, tb);
>      cpu->current_tb =3D NULL;
>      tb_phys_invalidate(tb, -1);
>      tb_free(tb);
> @@ -356,7 +364,6 @@ int cpu_exec(CPUState *cpu)
>  #endif
>      int ret, interrupt_request;
>      TranslationBlock *tb;
> -    uint8_t *tc_ptr;
>      uintptr_t next_tb;
>      SyncClocks sc;
> =20
> @@ -491,10 +498,6 @@ int cpu_exec(CPUState *cpu)
>                      next_tb =3D 0;
>                      tcg_ctx.tb_ctx.tb_invalidated_flag =3D 0;
>                  }
> -                if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
> -                    qemu_log("Trace %p [" TARGET_FMT_lx "] %s\n",
> -                             tb->tc_ptr, tb->pc, lookup_symbol(tb->pc));
> -                }
>                  /* see if we can patch the calling TB. When the TB
>                     spans two pages, we cannot safely do a direct
>                     jump. */
> @@ -513,9 +516,8 @@ int cpu_exec(CPUState *cpu)
>                  barrier();
>                  if (likely(!cpu->exit_request)) {
>                      trace_exec_tb(tb, tb->pc);
> -                    tc_ptr =3D tb->tc_ptr;
>                      /* execute the generated code */
> -                    next_tb =3D cpu_tb_exec(cpu, tc_ptr);
> +                    next_tb =3D cpu_tb_exec(cpu, tb);
>                      switch (next_tb & TB_EXIT_MASK) {
>                      case TB_EXIT_REQUESTED:
>                          /* Something asked us to stop executing
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 7ac8e7e..361d3d2 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -282,6 +282,9 @@ static inline void tb_add_jump(TranslationBlock *tb, =
int n,
>  {
>      /* NOTE: this test is only needed for thread safety */
>      if (!tb->jmp_next[n]) {
> +        qemu_log_mask(CPU_LOG_EXEC, "Linking TBs %p [" TARGET_FMT_lx
> +                      "] index %d -> %p [" TARGET_FMT_lx "]\n",
> +                      tb->tc_ptr, tb->pc, n, tb_next->tc_ptr, tb_next->p=
c);
>          /* patch the native jump address */
>          tb_set_jmp_target(tb, n, (uintptr_t)tb_next->tc_ptr);
> =20

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

