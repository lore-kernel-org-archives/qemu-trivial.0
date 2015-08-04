Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbSe-00027f-6w
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbSY-00020z-OG
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbST-0006xK-Q8
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:36:46 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbSM-0006v9-HD; Tue, 04 Aug 2015 08:36:34 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbSH-0008AP-GO; Tue, 04 Aug 2015 14:36:29 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbSG-0002Wi-R3; Tue, 04 Aug 2015 14:36:28 +0200
Date: Tue, 4 Aug 2015 14:36:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804123628.GA6780@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-3-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-3-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 02/11] tcg: light re-factor and pass
 down TranslationBlock
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
X-List-Received-Date: Tue, 04 Aug 2015 12:36:51 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> My later debugging patches need access to the origin PC. At the same
> time we have a slightly clumsy pass-by-reference access to the size of
> the translated block again for debugging purposes.
>=20
> To simplify the code I have expanded the TranslationBlock structure to
> include a tc_size variable to compliment the tc_ptr (and the subject pc,
> block size). This is set on code generation and then accessed directly
> by all the people that need it.
>=20
> I've also cleaned up some comments and removed un-used return variables.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ---
> v1
>  - checkpatch fixes
> ---
>  include/exec/exec-all.h |  4 ++--
>  tcg/tcg.c               | 22 +++++++++++++---------
>  tcg/tcg.h               |  5 ++---
>  translate-all.c         | 43 ++++++++++++++++++-------------------------
>  4 files changed, 35 insertions(+), 39 deletions(-)
>=20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index a6fce04..7ac8e7e 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -78,8 +78,7 @@ void restore_state_to_opc(CPUArchState *env, struct Tra=
nslationBlock *tb,
>                            int pc_pos);
> =20
>  void cpu_gen_init(void);
> -int cpu_gen_code(CPUArchState *env, struct TranslationBlock *tb,
> -                 int *gen_code_size_ptr);
> +void cpu_gen_code(CPUArchState *env, struct TranslationBlock *tb);
>  bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc);
>  void page_size_init(void);
> =20
> @@ -153,6 +152,7 @@ struct TranslationBlock {
>  #define CF_USE_ICOUNT  0x20000
> =20
>      void *tc_ptr;    /* pointer to the translated code */
> +    uint32_t tc_size;/* size of translated code */
>      /* next matching tb for physical address. */
>      struct TranslationBlock *phys_hash_next;
>      /* first and second physical page containing code. The lower bit

What's the impact on the memory here? Given the alignement, we add 8
bytes to the structure on a 64-bit host.

> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 0892a9b..587bd89 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2295,12 +2295,15 @@ void tcg_dump_op_count(FILE *f, fprintf_function =
cpu_fprintf)
>  #endif
> =20
> =20
> -static inline int tcg_gen_code_common(TCGContext *s,
> -                                      tcg_insn_unit *gen_code_buf,
> +static inline int tcg_gen_code_common(TCGContext *s, TranslationBlock *t=
b,
>                                        long search_pc)
>  {
>      int oi, oi_next;
> =20
> +    /* if we are coming via cpu_restore_state we already have a
> +       generated block */
> +     g_assert(tb->tc_size =3D=3D 0 || search_pc > 0);

In TCG code, you should use tcg_debug_assert.

> +
>  #ifdef DEBUG_DISAS
>      if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP))) {
>          qemu_log("OP:\n");
> @@ -2338,8 +2341,8 @@ static inline int tcg_gen_code_common(TCGContext *s,
> =20
>      tcg_reg_alloc_start(s);
> =20
> -    s->code_buf =3D gen_code_buf;
> -    s->code_ptr =3D gen_code_buf;
> +    s->code_buf =3D tb->tc_ptr;
> +    s->code_ptr =3D tb->tc_ptr;
> =20
>      tcg_out_tb_init(s);
> =20
> @@ -2402,7 +2405,7 @@ static inline int tcg_gen_code_common(TCGContext *s,
>      return -1;
>  }
> =20
> -int tcg_gen_code(TCGContext *s, tcg_insn_unit *gen_code_buf)
> +void tcg_gen_code(TCGContext *s, TranslationBlock *tb)
>  {
>  #ifdef CONFIG_PROFILER
>      {
> @@ -2422,22 +2425,23 @@ int tcg_gen_code(TCGContext *s, tcg_insn_unit *ge=
n_code_buf)
>      }
>  #endif
> =20
> -    tcg_gen_code_common(s, gen_code_buf, -1);
> +    tcg_gen_code_common(s, tb, -1);
> =20
>      /* flush instruction cache */
>      flush_icache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_ptr);
> =20
> -    return tcg_current_code_size(s);
> +    tb->tc_size =3D tcg_current_code_size(s);
> +    return;
>  }
> =20
>  /* Return the index of the micro operation such as the pc after is <
>     offset bytes from the start of the TB.  The contents of gen_code_buf =
must
>     not be changed, though writing the same values is ok.
>     Return -1 if not found. */
> -int tcg_gen_code_search_pc(TCGContext *s, tcg_insn_unit *gen_code_buf,
> +int tcg_gen_code_search_pc(TCGContext *s, TranslationBlock *tb,
>                             long offset)
>  {
> -    return tcg_gen_code_common(s, gen_code_buf, offset);
> +    return tcg_gen_code_common(s, tb, offset);
>  }
> =20
>  #ifdef CONFIG_PROFILER
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index 231a781..e4f9f97 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -613,9 +613,8 @@ void tcg_context_init(TCGContext *s);
>  void tcg_prologue_init(TCGContext *s);
>  void tcg_func_start(TCGContext *s);
> =20
> -int tcg_gen_code(TCGContext *s, tcg_insn_unit *gen_code_buf);
> -int tcg_gen_code_search_pc(TCGContext *s, tcg_insn_unit *gen_code_buf,
> -                           long offset);
> +void tcg_gen_code(TCGContext *s, TranslationBlock *tb);
> +int  tcg_gen_code_search_pc(TCGContext *s, TranslationBlock *tb, long of=
fset);
> =20
>  void tcg_set_frame(TCGContext *s, int reg, intptr_t start, intptr_t size=
);
> =20
> diff --git a/translate-all.c b/translate-all.c
> index c05e2a5..e8072d8 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -157,17 +157,12 @@ void cpu_gen_init(void)
>      tcg_context_init(&tcg_ctx);=20
>  }
> =20
> -/* return non zero if the very first instruction is invalid so that
> -   the virtual CPU can trigger an exception.
> -
> -   '*gen_code_size_ptr' contains the size of the generated code (host
> -   code).
> +/* code generation. On return tb->tc_size will reflect the size of
> + * generated code.
>  */
> -int cpu_gen_code(CPUArchState *env, TranslationBlock *tb, int *gen_code_=
size_ptr)
> +void cpu_gen_code(CPUArchState *env, TranslationBlock *tb)
>  {
>      TCGContext *s =3D &tcg_ctx;
> -    tcg_insn_unit *gen_code_buf;
> -    int gen_code_size;
>  #ifdef CONFIG_PROFILER
>      int64_t ti;
>  #endif
> @@ -184,7 +179,6 @@ int cpu_gen_code(CPUArchState *env, TranslationBlock =
*tb, int *gen_code_size_ptr
>      trace_translate_block(tb, tb->pc, tb->tc_ptr);
> =20
>      /* generate machine code */
> -    gen_code_buf =3D tb->tc_ptr;
>      tb->tb_next_offset[0] =3D 0xffff;
>      tb->tb_next_offset[1] =3D 0xffff;
>      s->tb_next_offset =3D tb->tb_next_offset;
> @@ -201,24 +195,23 @@ int cpu_gen_code(CPUArchState *env, TranslationBloc=
k *tb, int *gen_code_size_ptr
>      s->interm_time +=3D profile_getclock() - ti;
>      s->code_time -=3D profile_getclock();
>  #endif
> -    gen_code_size =3D tcg_gen_code(s, gen_code_buf);
> -    *gen_code_size_ptr =3D gen_code_size;
> +   tcg_gen_code(s, tb);

Watch the indentation here.

> +
>  #ifdef CONFIG_PROFILER
>      s->code_time +=3D profile_getclock();
>      s->code_in_len +=3D tb->size;
> -    s->code_out_len +=3D gen_code_size;
> +    s->code_out_len +=3D tb->tc_size;
>  #endif
> =20
> -    tb_write_perfmap(gen_code_buf, gen_code_size, tb->pc);
> +    tb_write_perfmap(tb->tc_ptr, tb->tc_size, tb->pc);
>  #ifdef DEBUG_DISAS
>      if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
> -        qemu_log("OUT: [size=3D%d]\n", gen_code_size);
> -        log_disas(tb->tc_ptr, gen_code_size);
> +        qemu_log("OUT: [size=3D%d]\n", tb->tc_size);
> +        log_disas(tb->tc_ptr, tb->tc_size);
>          qemu_log("\n");
>          qemu_log_flush();
>      }
>  #endif
> -    return 0;
>  }
> =20
>  /* The cpu state corresponding to 'searched_pc' is restored.
> @@ -229,7 +222,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, T=
ranslationBlock *tb,
>      CPUArchState *env =3D cpu->env_ptr;
>      TCGContext *s =3D &tcg_ctx;
>      int j;
> -    uintptr_t tc_ptr;
>  #ifdef CONFIG_PROFILER
>      int64_t ti;
>  #endif
> @@ -249,9 +241,9 @@ static int cpu_restore_state_from_tb(CPUState *cpu, T=
ranslationBlock *tb,
>      }
> =20
>      /* find opc index corresponding to search_pc */
> -    tc_ptr =3D (uintptr_t)tb->tc_ptr;
> -    if (searched_pc < tc_ptr)
> +    if (searched_pc < (uintptr_t) tb->tc_ptr) {
>          return -1;
> +    }
> =20
>      s->tb_next_offset =3D tb->tb_next_offset;
>  #ifdef USE_DIRECT_JUMP
> @@ -261,8 +253,8 @@ static int cpu_restore_state_from_tb(CPUState *cpu, T=
ranslationBlock *tb,
>      s->tb_jmp_offset =3D NULL;
>      s->tb_next =3D tb->tb_next;
>  #endif
> -    j =3D tcg_gen_code_search_pc(s, (tcg_insn_unit *)tc_ptr,
> -                               searched_pc - tc_ptr);
> +    j =3D tcg_gen_code_search_pc(s, tb,
> +                               searched_pc - (uintptr_t) tb->tc_ptr);
>      if (j < 0)
>          return -1;
>      /* now find start of instruction before */
> @@ -1029,7 +1021,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      TranslationBlock *tb;
>      tb_page_addr_t phys_pc, phys_page2;
>      target_ulong virt_page2;
> -    int code_gen_size;
> =20
>      phys_pc =3D get_page_addr_code(env, pc);
>      if (use_icount) {
> @@ -1045,12 +1036,14 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          tcg_ctx.tb_ctx.tb_invalidated_flag =3D 1;
>      }
>      tb->tc_ptr =3D tcg_ctx.code_gen_ptr;
> +    tb->tc_size =3D 0;
>      tb->cs_base =3D cs_base;
>      tb->flags =3D flags;
>      tb->cflags =3D cflags;
> -    cpu_gen_code(env, tb, &code_gen_size);
> -    tcg_ctx.code_gen_ptr =3D (void *)(((uintptr_t)tcg_ctx.code_gen_ptr +
> -            code_gen_size + CODE_GEN_ALIGN - 1) & ~(CODE_GEN_ALIGN - 1));
> +    cpu_gen_code(env, tb);
> +    tcg_ctx.code_gen_ptr =3D (void *) (
> +        ((uintptr_t) tcg_ctx.code_gen_ptr + tb->tc_size + CODE_GEN_ALIGN=
 - 1)
> +        & ~(CODE_GEN_ALIGN - 1));
> =20
>      /* check next page if needed */
>      virt_page2 =3D (pc + tb->size - 1) & TARGET_PAGE_MASK;
> --=20
> 2.5.0
>=20
>=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

