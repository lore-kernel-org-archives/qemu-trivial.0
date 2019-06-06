Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZ2H9-0003Ye-Gk
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 19:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hZ2Gy-0003Xe-S5
 for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 19:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hZ2Gp-0004m3-GC
 for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 19:58:20 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hZ2Gn-0004gO-Jt; Thu, 06 Jun 2019 19:58:10 -0400
Received: by mail-ot1-x32a.google.com with SMTP id z24so276902oto.1;
 Thu, 06 Jun 2019 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cQ0n+3AzPPDTM18o1FQR4CvjHVRnlg3NFWp/b5Ck1Wk=;
 b=Vt1W1FR7Ujdcu7EFXieKOwRnziXKyAbRVD/Nft8zKfVhZi0oLv6D8SC725fUHuHOqG
 BQKBgLb53bVXcxIJqPHS2eUh0FqfgI8JVcYLdjzSItfd42rjatU2bSuwTkjMu/9dwHbg
 jt0qQTWb5QsCzM0eBqvnYOusRGOHiERcr247bVU50L6k3KdPD0ydRzmyojlBTKd6AStX
 2RsSNXk1ux9bm1JhtOmMIyIpUKognMNvLu6CrzCD4AahajihlkovVtX7Ra3q1GWZZFfc
 9JdlEuXkq6R+Co6hTKXMeMYd8lgOTKSI3cFprCeMJlVQThvEe2OYLi0qHlCtoSZY3Hx6
 prFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cQ0n+3AzPPDTM18o1FQR4CvjHVRnlg3NFWp/b5Ck1Wk=;
 b=rcAb1G00Bweot79rAgvKwfBqjGWYX4eo3rZdF4I/0h47CJ1GbfJMb9Ynj65C654ebo
 KyhulCF4lFBZPALNXtJgEYuqCrhQ9CzmlnxIqH0IbFERACuEGKyjVa3g4MpnGzredvBb
 VyD/CvY/0V4prLxP5B/zEtr1kgzL3tIkhcraQISIe/rzC2qZBkGfFvbcP5Uk1RxJCuJm
 jDxA/29NesTQhIqnPpFCJw3JUHULiq5p/Kf8mXEOpZkmrKrdQoWZLrOxxIizg2xM9+JG
 /EcZGvaFpvTdmNQBElk0yUew7yC9AKG/KBEs6Y6fII5h7Ea4rRLUz6EVIPgim+NAoobH
 fWeg==
X-Gm-Message-State: APjAAAVcFLTjtyvStIifffcnOqsuACEIvAeUncGI77Jz0OYDomCI88k8
 ypurmLxweA1K3nn+nVzltg1Z4v+aQ9fdqKrKuYIpdRSs
X-Google-Smtp-Source: APXvYqwE6PddIXMHtFUCS4rEUn4+rQWWMV8wgJAYEbRWQ59h/a1uiQl8wVCChZOGyxrUUmdBVap/Ox7WIXzs1W861mk=
X-Received: by 2002:a05:6830:c6:: with SMTP id
 x6mr10678110oto.64.1559865486793; 
 Thu, 06 Jun 2019 16:58:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
 Thu, 6 Jun 2019 16:58:05 -0700 (PDT)
Received: by 2002:a9d:20e4:0:0:0:0:0 with HTTP;
 Thu, 6 Jun 2019 16:58:05 -0700 (PDT)
In-Reply-To: <20190606234125.GA4830@localhost.localdomain>
References: <20190606234125.GA4830@localhost.localdomain>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 7 Jun 2019 01:58:05 +0200
Message-ID: <CAL1e-=i7WfrHq7k266grEs1xyf_FKVG_4JcvCbrrSZt66c4ftQ@mail.gmail.com>
To: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000003cde4e058ab07cfd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] m68k comments break
 patch submission due to being incorrectly formatted
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2019 23:58:30 -0000

--0000000000003cde4e058ab07cfd
Content-Type: text/plain; charset="UTF-8"

On Jun 7, 2019 1:42 AM, "Lucien Murray-Pitts" <lucienmp.qemu@gmail.com>
wrote:
>
> Altering all comments in target/m68k to match Qemu coding styles so that
future
> patches wont fail due to style breaches.
>

Are you saying that patches fail checkpatch checks even if the new code has
only correct comment format? (Or, in other words, that checkpatch detects
comment-related errors in  unchanged code, and reports them as the
errors/warnings in the patch in question?) I just want to understand what
is the obstacle you are trying to remove.

Thanks, Aleksandar

> Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
> ---
>
> Notes:
>     v1->v2
>      - incorrectly made split-single line comments multiple single lines
>      - added corrections for /** comments as well as /*----...
>      - caught some other malformed comments that had been missed out
>
>  target/m68k/cpu-qom.h               |   2 +-
>  target/m68k/cpu.c                   |   6 +-
>  target/m68k/cpu.h                   |  32 ++--
>  target/m68k/fpu_helper.c            |   6 +-
>  target/m68k/gdbstub.c               |   6 +-
>  target/m68k/helper.c                |  16 +-
>  target/m68k/m68k-semi.c             |  24 ++-
>  target/m68k/op_helper.c             |  58 ++++---
>  target/m68k/softfloat.c             | 181 ++++++++++----------
>  target/m68k/softfloat.h             |   3 +-
>  target/m68k/softfloat_fpsp_tables.h |   3 +-
>  target/m68k/translate.c             | 246 ++++++++++++++++++----------
>  12 files changed, 355 insertions(+), 228 deletions(-)
>
> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
> index 9885bba317..0c157251a2 100644
> --- a/target/m68k/cpu-qom.h
> +++ b/target/m68k/cpu-qom.h
> @@ -31,7 +31,7 @@
>  #define M68K_CPU_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(M68kCPUClass, (obj), TYPE_M68K_CPU)
>
> -/**
> +/*
>   * M68kCPUClass:
>   * @parent_realize: The parent class' realize handler.
>   * @parent_reset: The parent class' reset handler.
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index b16957934a..c144278661 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -204,8 +204,10 @@ static void any_cpu_initfn(Object *obj)
>      m68k_set_feature(env, M68K_FEATURE_CF_ISA_APLUSC);
>      m68k_set_feature(env, M68K_FEATURE_BRAL);
>      m68k_set_feature(env, M68K_FEATURE_CF_FPU);
> -    /* MAC and EMAC are mututally exclusive, so pick EMAC.
> -       It's mostly backwards compatible.  */
> +    /*
> +     * MAC and EMAC are mututally exclusive, so pick EMAC.
> +     * It's mostly backwards compatible.
> +     */
>      m68k_set_feature(env, M68K_FEATURE_CF_EMAC);
>      m68k_set_feature(env, M68K_FEATURE_CF_EMAC_B);
>      m68k_set_feature(env, M68K_FEATURE_USP);
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 9deff9e234..3c4d7de017 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -112,9 +112,11 @@ typedef struct CPUM68KState {
>      float_status fp_status;
>
>      uint64_t mactmp;
> -    /* EMAC Hardware deals with 48-bit values composed of one 32-bit and
> -       two 8-bit parts.  We store a single 64-bit value and
> -       rearrange/extend this when changing modes.  */
> +    /*
> +     * EMAC Hardware deals with 48-bit values composed of one 32-bit and
> +     * two 8-bit parts.  We store a single 64-bit value and
> +     * rearrange/extend this when changing modes.
> +     */
>      uint64_t macc[4];
>      uint32_t macsr;
>      uint32_t mac_mask;
> @@ -154,7 +156,7 @@ typedef struct CPUM68KState {
>      uint32_t features;
>  } CPUM68KState;
>
> -/**
> +/*
>   * M68kCPU:
>   * @env: #CPUM68KState
>   *
> @@ -186,9 +188,11 @@ int m68k_cpu_gdb_write_register(CPUState *cpu,
uint8_t *buf, int reg);
>
>  void m68k_tcg_init(void);
>  void m68k_cpu_init_gdb(M68kCPU *cpu);
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> +/*
> + * you can call this signal handler from your SIGBUS and SIGSEGV
> + * signal handlers to inform the virtual CPU of exceptions. non zero
> + * is returned if the signal was handled by the virtual CPU.
> + */
>  int cpu_m68k_signal_handler(int host_signum, void *pinfo,
>                             void *puc);
>  uint32_t cpu_m68k_get_ccr(CPUM68KState *env);
> @@ -197,7 +201,8 @@ void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);
>  void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val);
>
>
> -/* Instead of computing the condition codes after each m68k instruction,
> +/*
> + * Instead of computing the condition codes after each m68k instruction,
>   * QEMU just stores one operand (called CC_SRC), the result
>   * (called CC_DEST) and the type of operation (called CC_OP). When the
>   * condition codes are needed, the condition codes can be calculated
> @@ -462,9 +467,11 @@ void m68k_switch_sp(CPUM68KState *env);
>
>  void do_m68k_semihosting(CPUM68KState *env, int nr);
>
> -/* There are 4 ColdFire core ISA revisions: A, A+, B and C.
> -   Each feature covers the subset of instructions common to the
> -   ISA revisions mentioned.  */
> +/*
> + * There are 4 ColdFire core ISA revisions: A, A+, B and C.
> + * Each feature covers the subset of instructions common to the
> + * ISA revisions mentioned.
> + */
>
>  enum m68k_features {
>      M68K_FEATURE_M68000,
> @@ -502,7 +509,8 @@ void m68k_cpu_list(void);
>
>  void register_m68k_insns (CPUM68KState *env);
>
> -/* Coldfire Linux uses 8k pages
> +/*
> + * Coldfire Linux uses 8k pages
>   * and m68k linux uses 4k pages
>   * use the smallest one
>   */
> diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
> index b35489ba4e..9b039c856d 100644
> --- a/target/m68k/fpu_helper.c
> +++ b/target/m68k/fpu_helper.c
> @@ -25,7 +25,8 @@
>  #include "exec/cpu_ldst.h"
>  #include "softfloat.h"
>
> -/* Undefined offsets may be different on various FPU.
> +/*
> + * Undefined offsets may be different on various FPU.
>   * On 68040 they return 0.0 (floatx80_zero)
>   */
>
> @@ -611,7 +612,8 @@ void HELPER(fcos)(CPUM68KState *env, FPReg *res,
FPReg *val)
>  void HELPER(fsincos)(CPUM68KState *env, FPReg *res0, FPReg *res1, FPReg
*val)
>  {
>      floatx80 a = val->d;
> -    /* If res0 and res1 specify the same floating-point data register,
> +    /*
> +     * If res0 and res1 specify the same floating-point data register,
>       * the sine result is stored in the register, and the cosine
>       * result is discarded.
>       */
> diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
> index fd2bb46c42..6bcf1a9b9f 100644
> --- a/target/m68k/gdbstub.c
> +++ b/target/m68k/gdbstub.c
> @@ -41,8 +41,10 @@ int m68k_cpu_gdb_read_register(CPUState *cs, uint8_t
*mem_buf, int n)
>              return gdb_get_reg32(mem_buf, env->pc);
>          }
>      }
> -    /* FP registers not included here because they vary between
> -       ColdFire and m68k.  Use XML bits for these.  */
> +    /*
> +     * FP registers not included here because they vary between
> +     * ColdFire and m68k.  Use XML bits for these.
> +     */
>      return 0;
>  }
>
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 6db93bdd81..b0bb579403 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -972,9 +972,11 @@ void HELPER(set_sr)(CPUM68KState *env, uint32_t val)
>  }
>
>  /* MAC unit.  */
> -/* FIXME: The MAC unit implementation is a bit of a mess.  Some helpers
> -   take values,  others take register numbers and manipulate the contents
> -   in-place.  */
> +/*
> + * FIXME: The MAC unit implementation is a bit of a mess.  Some helpers
> + * take values,  others take register numbers and manipulate the contents
> + * in-place.
> + */
>  void HELPER(mac_move)(CPUM68KState *env, uint32_t dest, uint32_t src)
>  {
>      uint32_t mask;
> @@ -1054,9 +1056,11 @@ void HELPER(macsats)(CPUM68KState *env, uint32_t
acc)
>      if (env->macsr & MACSR_V) {
>          env->macsr |= MACSR_PAV0 << acc;
>          if (env->macsr & MACSR_OMC) {
> -            /* The result is saturated to 32 bits, despite overflow
occurring
> -               at 48 bits.  Seems weird, but that's what the hardware
docs
> -               say.  */
> +            /*
> +             * The result is saturated to 32 bits, despite overflow
occurring
> +             * at 48 bits.  Seems weird, but that's what the hardware
docs
> +             * say.
> +             */
>              result = (result >> 63) ^ 0x7fffffff;
>          }
>      }
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index 1402145c8f..4f9f4355a6 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -131,7 +131,8 @@ static void m68k_semi_return_u32(CPUM68KState *env,
uint32_t ret, uint32_t err)
>      target_ulong args = env->dregs[1];
>      if (put_user_u32(ret, args) ||
>          put_user_u32(err, args + 4)) {
> -        /* The m68k semihosting ABI does not provide any way to report
this
> +        /*
> +         * The m68k semihosting ABI does not provide any way to report
this
>           * error to the guest, so the best we can do is log it in qemu.
>           * It is always a guest error not to pass us a valid argument
block.
>           */
> @@ -160,8 +161,10 @@ static void m68k_semi_cb(CPUState *cs, target_ulong
ret, target_ulong err)
>      CPUM68KState *env = &cpu->env;
>
>      if (m68k_semi_is_fseek) {
> -        /* FIXME: We've already lost the high bits of the fseek
> -           return value.  */
> +        /*
> +         * FIXME: We've already lost the high bits of the fseek
> +         * return value.
> +         */
>          m68k_semi_return_u64(env, ret, err);
>          m68k_semi_is_fseek = 0;
>      } else {
> @@ -169,7 +172,8 @@ static void m68k_semi_cb(CPUState *cs, target_ulong
ret, target_ulong err)
>      }
>  }
>
> -/* Read the input value from the argument block; fail the semihosting
> +/*
> + * Read the input value from the argument block; fail the semihosting
>   * call if the memory read fails.
>   */
>  #define GET_ARG(n) do {                                 \
> @@ -441,14 +445,18 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
>              }
>              ts->heap_limit = base + size;
>          }
> -        /* This call may happen before we have writable memory, so return
> -           values directly in registers.  */
> +        /*
> +         * This call may happen before we have writable memory, so return
> +         * values directly in registers.
> +         */
>          env->dregs[1] = ts->heap_limit;
>          env->aregs[7] = ts->stack_base;
>          }
>  #else
> -        /* FIXME: This is wrong for boards where RAM does not start at
> -           address zero.  */
> +        /*
> +         * FIXME: This is wrong for boards where RAM does not start at
> +         * address zero.
> +         */
>          env->dregs[1] = ram_size;
>          env->aregs[7] = ram_size;
>  #endif
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index bde2d551ff..9d9b9438dc 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -494,10 +494,12 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int
interrupt_request)
>
>      if (interrupt_request & CPU_INTERRUPT_HARD
>          && ((env->sr & SR_I) >> SR_I_SHIFT) < env->pending_level) {
> -        /* Real hardware gets the interrupt vector via an IACK cycle
> -           at this point.  Current emulated hardware doesn't rely on
> -           this, so we provide/save the vector when the interrupt is
> -           first signalled.  */
> +        /*
> +         * Real hardware gets the interrupt vector via an IACK cycle
> +         * at this point.  Current emulated hardware doesn't rely on
> +         * this, so we provide/save the vector when the interrupt is
> +         * first signalled.
> +         */
>          cs->exception_index = env->pending_vector;
>          do_interrupt_m68k_hardirq(env);
>          return true;
> @@ -537,7 +539,8 @@ void HELPER(divuw)(CPUM68KState *env, int destr,
uint32_t den)
>      env->cc_c = 0; /* always cleared, even if overflow */
>      if (quot > 0xffff) {
>          env->cc_v = -1;
> -        /* real 68040 keeps N and unset Z on overflow,
> +        /*
> +         * real 68040 keeps N and unset Z on overflow,
>           * whereas documentation says "undefined"
>           */
>          env->cc_z = 1;
> @@ -564,7 +567,8 @@ void HELPER(divsw)(CPUM68KState *env, int destr,
int32_t den)
>      if (quot != (int16_t)quot) {
>          env->cc_v = -1;
>          /* nothing else is modified */
> -        /* real 68040 keeps N and unset Z on overflow,
> +        /*
> +         * real 68040 keeps N and unset Z on overflow,
>           * whereas documentation says "undefined"
>           */
>          env->cc_z = 1;
> @@ -647,7 +651,8 @@ void HELPER(divull)(CPUM68KState *env, int numr, int
regr, uint32_t den)
>      env->cc_c = 0; /* always cleared, even if overflow */
>      if (quot > 0xffffffffULL) {
>          env->cc_v = -1;
> -        /* real 68040 keeps N and unset Z on overflow,
> +        /*
> +         * real 68040 keeps N and unset Z on overflow,
>           * whereas documentation says "undefined"
>           */
>          env->cc_z = 1;
> @@ -681,7 +686,8 @@ void HELPER(divsll)(CPUM68KState *env, int numr, int
regr, int32_t den)
>      env->cc_c = 0; /* always cleared, even if overflow */
>      if (quot != (int32_t)quot) {
>          env->cc_v = -1;
> -        /* real 68040 keeps N and unset Z on overflow,
> +        /*
> +         * real 68040 keeps N and unset Z on overflow,
>           * whereas documentation says "undefined"
>           */
>          env->cc_z = 1;
> @@ -838,14 +844,18 @@ static struct bf_data bf_prep(uint32_t addr,
int32_t ofs, uint32_t len)
>          addr -= 1;
>      }
>
> -    /* Compute the number of bytes required (minus one) to
> -       satisfy the bitfield.  */
> +    /*
> +     * Compute the number of bytes required (minus one) to
> +     * satisfy the bitfield.
> +     */
>      blen = (bofs + len - 1) / 8;
>
> -    /* Canonicalize the bit offset for data loaded into a 64-bit
big-endian
> -       word.  For the cases where BLEN is not a power of 2, adjust ADDR
so
> -       that we can use the next power of two sized load without crossing
a
> -       page boundary, unless the field itself crosses the boundary.  */
> +    /*
> +     * Canonicalize the bit offset for data loaded into a 64-bit
big-endian
> +     * word.  For the cases where BLEN is not a power of 2, adjust ADDR
so
> +     * that we can use the next power of two sized load without crossing
a
> +     * page boundary, unless the field itself crosses the boundary.
> +     */
>      switch (blen) {
>      case 0:
>          bofs += 56;
> @@ -937,8 +947,10 @@ uint64_t HELPER(bfextu_mem)(CPUM68KState *env,
uint32_t addr,
>      struct bf_data d = bf_prep(addr, ofs, len);
>      uint64_t data = bf_load(env, d.addr, d.blen, ra);
>
> -    /* Put CC_N at the top of the high word; put the zero-extended value
> -       at the bottom of the low word.  */
> +    /*
> +     * Put CC_N at the top of the high word; put the zero-extended value
> +     * at the bottom of the low word.
> +     */
>      data <<= d.bofs;
>      data >>= 64 - d.len;
>      data |= data << (64 - d.len);
> @@ -1016,15 +1028,18 @@ uint64_t HELPER(bfffo_mem)(CPUM68KState *env,
uint32_t addr,
>      uint64_t n = (data & mask) << d.bofs;
>      uint32_t ffo = helper_bfffo_reg(n >> 32, ofs, d.len);
>
> -    /* Return FFO in the low word and N in the high word.
> -       Note that because of MASK and the shift, the low word
> -       is already zero.  */
> +    /*
> +     * Return FFO in the low word and N in the high word.
> +     * Note that because of MASK and the shift, the low word
> +     * is already zero.
> +     */
>      return n | ffo;
>  }
>
>  void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)
>  {
> -    /* From the specs:
> +    /*
> +     * From the specs:
>       *   X: Not affected, C,V,Z: Undefined,
>       *   N: Set if val < 0; cleared if val > ub, undefined otherwise
>       * We implement here values found from a real MC68040:
> @@ -1054,7 +1069,8 @@ void HELPER(chk)(CPUM68KState *env, int32_t val,
int32_t ub)
>
>  void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, int32_t ub)
>  {
> -    /* From the specs:
> +    /*
> +     * From the specs:
>       *   X: Not affected, N,V: Undefined,
>       *   Z: Set if val is equal to lb or ub
>       *   C: Set if val < lb or val > ub, cleared otherwise
> diff --git a/target/m68k/softfloat.c b/target/m68k/softfloat.c
> index b45a5e8690..591a6f1dce 100644
> --- a/target/m68k/softfloat.c
> +++ b/target/m68k/softfloat.c
> @@ -14,7 +14,8 @@
>   * the Softfloat-2a license unless specifically indicated otherwise.
>   */
>
> -/* Portions of this work are licensed under the terms of the GNU GPL,
> +/*
> + * Portions of this work are licensed under the terms of the GNU GPL,
>   * version 2 or later. See the COPYING file in the top-level directory.
>   */
>
> @@ -41,10 +42,10 @@ static floatx80 propagateFloatx80NaNOneArg(floatx80
a, float_status *status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Returns the modulo remainder of the extended double-precision
floating-point
> - | value `a' with respect to the corresponding value `b'.
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Returns the modulo remainder of the extended double-precision
floating-point
> + * value `a' with respect to the corresponding value `b'.
> + */
>
>  floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
>  {
> @@ -124,10 +125,10 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b,
float_status *status)
>              80, zSign, bExp + expDiff, aSig0, aSig1, status);
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Returns the mantissa of the extended double-precision floating-point
> - | value `a'.
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Returns the mantissa of the extended double-precision floating-point
> + * value `a'.
> + */
>
>  floatx80 floatx80_getman(floatx80 a, float_status *status)
>  {
> @@ -158,10 +159,10 @@ floatx80 floatx80_getman(floatx80 a, float_status
*status)
>                                  0x3FFF, aSig, 0, status);
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Returns the exponent of the extended double-precision floating-point
> - | value `a' as an extended double-precision value.
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Returns the exponent of the extended double-precision floating-point
> + * value `a' as an extended double-precision value.
> + */
>
>  floatx80 floatx80_getexp(floatx80 a, float_status *status)
>  {
> @@ -191,13 +192,13 @@ floatx80 floatx80_getexp(floatx80 a, float_status
*status)
>      return int32_to_floatx80(aExp - 0x3FFF, status);
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Scales extended double-precision floating-point value in operand `a'
by
> - | value `b'. The function truncates the value in the second operand 'b'
to
> - | an integral value and adds that value to the exponent of the operand
'a'.
> - | The operation performed according to the IEC/IEEE Standard for Binary
> - | Floating-Point Arithmetic.
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Scales extended double-precision floating-point value in operand `a'
by
> + * value `b'. The function truncates the value in the second operand 'b'
to
> + * an integral value and adds that value to the exponent of the operand
'a'.
> + * The operation performed according to the IEC/IEEE Standard for Binary
> + * Floating-Point Arithmetic.
> + */
>
>  floatx80 floatx80_scale(floatx80 a, floatx80 b, float_status *status)
>  {
> @@ -282,26 +283,26 @@ floatx80 floatx80_move(floatx80 a, float_status
*status)
>                                  aExp, aSig, 0, status);
>  }
>
>
-/*----------------------------------------------------------------------------
> -| Algorithms for transcendental functions supported by MC68881 and
MC68882
> -| mathematical coprocessors. The functions are derived from FPSP library.
>
-*----------------------------------------------------------------------------*/
> +/*
> + * Algorithms for transcendental functions supported by MC68881 and
MC68882
> + * mathematical coprocessors. The functions are derived from FPSP
library.
> + */
>
>  #define one_exp     0x3FFF
>  #define one_sig     LIT64(0x8000000000000000)
>
>
-/*----------------------------------------------------------------------------
> - | Function for compactifying extended double-precision floating point
values.
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Function for compactifying extended double-precision floating point
values.
> + */
>
>  static int32_t floatx80_make_compact(int32_t aExp, uint64_t aSig)
>  {
>      return (aExp << 16) | (aSig >> 48);
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Log base e of x plus 1
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Log base e of x plus 1
> + */
>
>  floatx80 floatx80_lognp1(floatx80 a, float_status *status)
>  {
> @@ -498,9 +499,9 @@ floatx80 floatx80_lognp1(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Log base e
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Log base e
> + */
>
>  floatx80 floatx80_logn(floatx80 a, float_status *status)
>  {
> @@ -666,9 +667,9 @@ floatx80 floatx80_logn(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Log base 10
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Log base 10
> + */
>
>  floatx80 floatx80_log10(floatx80 a, float_status *status)
>  {
> @@ -723,9 +724,9 @@ floatx80 floatx80_log10(floatx80 a, float_status
*status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Log base 2
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Log base 2
> + */
>
>  floatx80 floatx80_log2(floatx80 a, float_status *status)
>  {
> @@ -790,9 +791,9 @@ floatx80 floatx80_log2(floatx80 a, float_status
*status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | e to x
> -
*----------------------------------------------------------------------------*/
> +/*
> + * e to x
> + */
>
>  floatx80 floatx80_etox(floatx80 a, float_status *status)
>  {
> @@ -848,7 +849,8 @@ floatx80 floatx80_etox(floatx80 a, float_status
*status)
>              j = n & 0x3F; /* J = N mod 64 */
>              m = n / 64; /* NOTE: this is really arithmetic right shift
by 6 */
>              if (n < 0 && j) {
> -                /* arithmetic right shift is division and
> +                /*
> +                 * arithmetic right shift is division and
>                   * round towards minus infinity
>                   */
>                  m--;
> @@ -973,9 +975,9 @@ floatx80 floatx80_etox(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | 2 to x
> -
*----------------------------------------------------------------------------*/
> +/*
> + * 2 to x
> + */
>
>  floatx80 floatx80_twotox(floatx80 a, float_status *status)
>  {
> @@ -1051,14 +1053,16 @@ floatx80 floatx80_twotox(floatx80 a, float_status
*status)
>          j = n & 0x3F;
>          l = n / 64; /* NOTE: this is really arithmetic right shift by 6
*/
>          if (n < 0 && j) {
> -            /* arithmetic right shift is division and
> +            /*
> +             * arithmetic right shift is division and
>               * round towards minus infinity
>               */
>              l--;
>          }
>          m = l / 2; /* NOTE: this is really arithmetic right shift by 1 */
>          if (l < 0 && (l & 1)) {
> -            /* arithmetic right shift is division and
> +            /*
> +             * arithmetic right shift is division and
>               * round towards minus infinity
>               */
>              m--;
> @@ -1121,9 +1125,9 @@ floatx80 floatx80_twotox(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | 10 to x
> -
*----------------------------------------------------------------------------*/
> +/*
> + * 10 to x
> + */
>
>  floatx80 floatx80_tentox(floatx80 a, float_status *status)
>  {
> @@ -1200,14 +1204,16 @@ floatx80 floatx80_tentox(floatx80 a, float_status
*status)
>          j = n & 0x3F;
>          l = n / 64; /* NOTE: this is really arithmetic right shift by 6
*/
>          if (n < 0 && j) {
> -            /* arithmetic right shift is division and
> +            /*
> +             * arithmetic right shift is division and
>               * round towards minus infinity
>               */
>              l--;
>          }
>          m = l / 2; /* NOTE: this is really arithmetic right shift by 1 */
>          if (l < 0 && (l & 1)) {
> -            /* arithmetic right shift is division and
> +            /*
> +             * arithmetic right shift is division and
>               * round towards minus infinity
>               */
>              m--;
> @@ -1274,9 +1280,9 @@ floatx80 floatx80_tentox(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Tangent
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Tangent
> + */
>
>  floatx80 floatx80_tan(floatx80 a, float_status *status)
>  {
> @@ -1484,9 +1490,9 @@ floatx80 floatx80_tan(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Sine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Sine
> + */
>
>  floatx80 floatx80_sin(floatx80 a, float_status *status)
>  {
> @@ -1723,9 +1729,9 @@ floatx80 floatx80_sin(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Cosine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Cosine
> + */
>
>  floatx80 floatx80_cos(floatx80 a, float_status *status)
>  {
> @@ -1960,9 +1966,9 @@ floatx80 floatx80_cos(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Arc tangent
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Arc tangent
> + */
>
>  floatx80 floatx80_atan(floatx80 a, float_status *status)
>  {
> @@ -2157,9 +2163,9 @@ floatx80 floatx80_atan(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Arc sine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Arc sine
> + */
>
>  floatx80 floatx80_asin(floatx80 a, float_status *status)
>  {
> @@ -2222,9 +2228,9 @@ floatx80 floatx80_asin(floatx80 a, float_status
*status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Arc cosine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Arc cosine
> + */
>
>  floatx80 floatx80_acos(floatx80 a, float_status *status)
>  {
> @@ -2291,9 +2297,9 @@ floatx80 floatx80_acos(floatx80 a, float_status
*status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Hyperbolic arc tangent
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Hyperbolic arc tangent
> + */
>
>  floatx80 floatx80_atanh(floatx80 a, float_status *status)
>  {
> @@ -2356,9 +2362,9 @@ floatx80 floatx80_atanh(floatx80 a, float_status
*status)
>      return a;
>  }
>
>
-/*----------------------------------------------------------------------------
> - | e to x minus 1
> -
*----------------------------------------------------------------------------*/
> +/*
> + * e to x minus 1
> + */
>
>  floatx80 floatx80_etoxm1(floatx80 a, float_status *status)
>  {
> @@ -2410,7 +2416,8 @@ floatx80 floatx80_etoxm1(floatx80 a, float_status
*status)
>              j = n & 0x3F; /* J = N mod 64 */
>              m = n / 64; /* NOTE: this is really arithmetic right shift
by 6 */
>              if (n < 0 && j) {
> -                /* arithmetic right shift is division and
> +                /*
> +                 * arithmetic right shift is division and
>                   * round towards minus infinity
>                   */
>                  m--;
> @@ -2607,9 +2614,9 @@ floatx80 floatx80_etoxm1(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Hyperbolic tangent
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Hyperbolic tangent
> + */
>
>  floatx80 floatx80_tanh(floatx80 a, float_status *status)
>  {
> @@ -2722,9 +2729,9 @@ floatx80 floatx80_tanh(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Hyperbolic sine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Hyperbolic sine
> + */
>
>  floatx80 floatx80_sinh(floatx80 a, float_status *status)
>  {
> @@ -2811,9 +2818,9 @@ floatx80 floatx80_sinh(floatx80 a, float_status
*status)
>      }
>  }
>
>
-/*----------------------------------------------------------------------------
> - | Hyperbolic cosine
> -
*----------------------------------------------------------------------------*/
> +/*
> + * Hyperbolic cosine
> + */
>
>  floatx80 floatx80_cosh(floatx80 a, float_status *status)
>  {
> diff --git a/target/m68k/softfloat.h b/target/m68k/softfloat.h
> index 602661d5a8..365ef6ac7a 100644
> --- a/target/m68k/softfloat.h
> +++ b/target/m68k/softfloat.h
> @@ -14,7 +14,8 @@
>   * the Softfloat-2a license unless specifically indicated otherwise.
>   */
>
> -/* Portions of this work are licensed under the terms of the GNU GPL,
> +/*
> + * Portions of this work are licensed under the terms of the GNU GPL,
>   * version 2 or later. See the COPYING file in the top-level directory.
>   */
>
> diff --git a/target/m68k/softfloat_fpsp_tables.h
b/target/m68k/softfloat_fpsp_tables.h
> index 3f1419ee6e..2ccd9e8bc3 100644
> --- a/target/m68k/softfloat_fpsp_tables.h
> +++ b/target/m68k/softfloat_fpsp_tables.h
> @@ -14,7 +14,8 @@
>   * the Softfloat-2a license unless specifically indicated otherwise.
>   */
>
> -/* Portions of this work are licensed under the terms of the GNU GPL,
> +/*
> + * Portions of this work are licensed under the terms of the GNU GPL,
>   * version 2 or later. See the COPYING file in the top-level directory.
>   */
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index f0534a4ba0..9b0ca4c14c 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -248,8 +248,10 @@ static void set_cc_op(DisasContext *s, CCOp op)
>      s->cc_op = op;
>      s->cc_op_synced = 0;
>
> -    /* Discard CC computation that will no longer be used.
> -       Note that X and N are never dead.  */
> +    /*
> +     * Discard CC computation that will no longer be used.
> +     * Note that X and N are never dead.
> +     */
>      dead = cc_op_live[old_op] & ~cc_op_live[op];
>      if (dead & CCF_C) {
>          tcg_gen_discard_i32(QREG_CC_C);
> @@ -306,8 +308,10 @@ static inline void gen_addr_fault(DisasContext *s)
>      gen_exception(s, s->base.pc_next, EXCP_ADDRESS);
>  }
>
> -/* Generate a load from the specified address.  Narrow values are
> -   sign extended to full register width.  */
> +/*
> + * Generate a load from the specified address.  Narrow values are
> + *  sign extended to full register width.
> + */
>  static inline TCGv gen_load(DisasContext *s, int opsize, TCGv addr,
>                              int sign, int index)
>  {
> @@ -360,8 +364,10 @@ typedef enum {
>      EA_LOADS
>  } ea_what;
>
> -/* Generate an unsigned load if VAL is 0 a signed load if val is -1,
> -   otherwise generate a store.  */
> +/*
> + * Generate an unsigned load if VAL is 0 a signed load if val is -1,
> + * otherwise generate a store.
> + */
>  static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
>                       ea_what what, int index)
>  {
> @@ -426,8 +432,10 @@ static TCGv gen_addr_index(DisasContext *s, uint16_t
ext, TCGv tmp)
>      return add;
>  }
>
> -/* Handle a base + index + displacement effective addresss.
> -   A NULL_QREG base means pc-relative.  */
> +/*
> + * Handle a base + index + displacement effective addresss.
> + * A NULL_QREG base means pc-relative.
> + */
>  static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv
base)
>  {
>      uint32_t offset;
> @@ -714,8 +722,10 @@ static inline int ext_opsize(int ext, int pos)
>      }
>  }
>
> -/* Assign value to a register.  If the width is less than the register
width
> -   only the low part of the register is set.  */
> +/*
> + * Assign value to a register.  If the width is less than the register
width
> + * only the low part of the register is set.
> + */
>  static void gen_partset_reg(int opsize, TCGv reg, TCGv val)
>  {
>      TCGv tmp;
> @@ -743,8 +753,10 @@ static void gen_partset_reg(int opsize, TCGv reg,
TCGv val)
>      }
>  }
>
> -/* Generate code for an "effective address".  Does not adjust the base
> -   register for autoincrement addressing modes.  */
> +/*
> + * Generate code for an "effective address".  Does not adjust the base
> + * register for autoincrement addressing modes.
> + */
>  static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
>                           int mode, int reg0, int opsize)
>  {
> @@ -817,9 +829,11 @@ static TCGv gen_lea(CPUM68KState *env, DisasContext
*s, uint16_t insn,
>      return gen_lea_mode(env, s, mode, reg0, opsize);
>  }
>
> -/* Generate code to load/store a value from/into an EA.  If WHAT > 0
this is
> -   a write otherwise it is a read (0 == sign extend, -1 == zero extend).
> -   ADDRP is non-null for readwrite operands.  */
> +/*
> + * Generate code to load/store a value from/into an EA.  If WHAT > 0
this is
> + * a write otherwise it is a read (0 == sign extend, -1 == zero extend).
> + * ADDRP is non-null for readwrite operands.
> + */
>  static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode,
int reg0,
>                          int opsize, TCGv val, TCGv *addrp, ea_what what,
>                          int index)
> @@ -1012,7 +1026,8 @@ static void gen_load_fp(DisasContext *s, int
opsize, TCGv addr, TCGv_ptr fp,
>          tcg_gen_st_i64(t64, fp, offsetof(FPReg, l.lower));
>          break;
>      case OS_PACKED:
> -        /* unimplemented data type on 68040/ColdFire
> +        /*
> +         * unimplemented data type on 68040/ColdFire
>           * FIXME if needed for another FPU
>           */
>          gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
> @@ -1066,7 +1081,8 @@ static void gen_store_fp(DisasContext *s, int
opsize, TCGv addr, TCGv_ptr fp,
>          tcg_gen_qemu_st64(t64, tmp, index);
>          break;
>      case OS_PACKED:
> -        /* unimplemented data type on 68040/ColdFire
> +        /*
> +         * unimplemented data type on 68040/ColdFire
>           * FIXME if needed for another FPU
>           */
>          gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
> @@ -1212,7 +1228,8 @@ static int gen_ea_mode_fp(CPUM68KState *env,
DisasContext *s, int mode,
>                  tcg_temp_free_i64(t64);
>                  break;
>              case OS_PACKED:
> -                /* unimplemented data type on 68040/ColdFire
> +                /*
> +                 * unimplemented data type on 68040/ColdFire
>                   * FIXME if needed for another FPU
>                   */
>                  gen_exception(s, s->base.pc_next, EXCP_FP_UNIMP);
> @@ -1299,9 +1316,11 @@ static void gen_cc_cond(DisasCompare *c,
DisasContext *s, int cond)
>          goto done;
>      case 14: /* GT (!(Z || (N ^ V))) */
>      case 15: /* LE (Z || (N ^ V)) */
> -        /* Logic operations clear V, which simplifies LE to (Z || N),
> -           and since Z and N are co-located, this becomes a normal
> -           comparison vs N.  */
> +        /*
> +         * Logic operations clear V, which simplifies LE to (Z || N),
> +         * and since Z and N are co-located, this becomes a normal
> +         * comparison vs N.
> +         */
>          if (op == CC_OP_LOGIC) {
>              c->v1 = QREG_CC_N;
>              tcond = TCG_COND_LE;
> @@ -1549,9 +1568,11 @@ DISAS_INSN(undef_fpu)
>
>  DISAS_INSN(undef)
>  {
> -    /* ??? This is both instructions that are as yet unimplemented
> -       for the 680x0 series, as well as those that are implemented
> -       but actually illegal for CPU32 or pre-68020.  */
> +    /*
> +     * ??? This is both instructions that are as yet unimplemented
> +     * for the 680x0 series, as well as those that are implemented
> +     * but actually illegal for CPU32 or pre-68020.
> +     */
>      qemu_log_mask(LOG_UNIMP, "Illegal instruction: %04x @ %08x\n",
>                    insn, s->base.pc_next);
>      gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
> @@ -1655,7 +1676,8 @@ static void bcd_add(TCGv dest, TCGv src)
>  {
>      TCGv t0, t1;
>
> -    /*  dest10 = dest10 + src10 + X
> +    /*
> +     * dest10 = dest10 + src10 + X
>       *
>       *        t1 = src
>       *        t2 = t1 + 0x066
> @@ -1667,7 +1689,8 @@ static void bcd_add(TCGv dest, TCGv src)
>       *        return t3 - t7
>       */
>
> -    /* t1 = (src + 0x066) + dest + X
> +    /*
> +     * t1 = (src + 0x066) + dest + X
>       *    = result with some possible exceding 0x6
>       */
>
> @@ -1680,20 +1703,23 @@ static void bcd_add(TCGv dest, TCGv src)
>
>      /* we will remove exceding 0x6 where there is no carry */
>
> -    /* t0 = (src + 0x0066) ^ dest
> +    /*
> +     * t0 = (src + 0x0066) ^ dest
>       *    = t1 without carries
>       */
>
>      tcg_gen_xor_i32(t0, t0, dest);
>
> -    /* extract the carries
> +    /*
> +     * extract the carries
>       * t0 = t0 ^ t1
>       *    = only the carries
>       */
>
>      tcg_gen_xor_i32(t0, t0, t1);
>
> -    /* generate 0x1 where there is no carry
> +    /*
> +     * generate 0x1 where there is no carry
>       * and for each 0x10, generate a 0x6
>       */
>
> @@ -1704,7 +1730,8 @@ static void bcd_add(TCGv dest, TCGv src)
>      tcg_gen_add_i32(dest, dest, t0);
>      tcg_temp_free(t0);
>
> -    /* remove the exceding 0x6
> +    /*
> +     * remove the exceding 0x6
>       * for digits that have not generated a carry
>       */
>
> @@ -1716,7 +1743,8 @@ static void bcd_sub(TCGv dest, TCGv src)
>  {
>      TCGv t0, t1, t2;
>
> -    /*  dest10 = dest10 - src10 - X
> +    /*
> +     *  dest10 = dest10 - src10 - X
>       *         = bcd_add(dest + 1 - X, 0x199 - src)
>       */
>
> @@ -1741,7 +1769,8 @@ static void bcd_sub(TCGv dest, TCGv src)
>
>      tcg_gen_xor_i32(t0, t1, t2);
>
> -    /* t2 = ~t0 & 0x110
> +    /*
> +     * t2 = ~t0 & 0x110
>       * t0 = (t2 >> 2) | (t2 >> 3)
>       *
>       * to fit on 8bit operands, changed in:
> @@ -2029,8 +2058,10 @@ DISAS_INSN(movem)
>              /* pre-decrement is not allowed */
>              goto do_addr_fault;
>          }
> -        /* We want a bare copy of the address reg, without any
pre-decrement
> -           adjustment, as gen_lea would provide.  */
> +        /*
> +         * We want a bare copy of the address reg, without any
pre-decrement
> +         * adjustment, as gen_lea would provide.
> +         */
>          break;
>
>      default:
> @@ -2072,7 +2103,8 @@ DISAS_INSN(movem)
>                      tcg_gen_sub_i32(addr, addr, incr);
>                      if (reg0 + 8 == i &&
>                          m68k_feature(s->env, M68K_FEATURE_EXT_FULL)) {
> -                        /* M68020+: if the addressing register is the
> +                        /*
> +                         * M68020+: if the addressing register is the
>                           * register moved to memory, the value written
>                           * is the initial value decremented by the size
of
>                           * the operation, regardless of how many actual
> @@ -2413,7 +2445,8 @@ DISAS_INSN(cas)
>
>      cmp = gen_extend(s, DREG(ext, 0), opsize, 1);
>
> -    /* if  <EA> == Dc then
> +    /*
> +     * if  <EA> == Dc then
>       *     <EA> = Du
>       *     Dc = <EA> (because <EA> == Dc)
>       * else
> @@ -2466,7 +2499,8 @@ DISAS_INSN(cas2w)
>          addr2 = DREG(ext2, 12);
>      }
>
> -    /* if (R1) == Dc1 && (R2) == Dc2 then
> +    /*
> +     * if (R1) == Dc1 && (R2) == Dc2 then
>       *     (R1) = Du1
>       *     (R2) = Du2
>       * else
> @@ -2516,7 +2550,8 @@ DISAS_INSN(cas2l)
>          addr2 = DREG(ext2, 12);
>      }
>
> -    /* if (R1) == Dc1 && (R2) == Dc2 then
> +    /*
> +     * if (R1) == Dc1 && (R2) == Dc2 then
>       *     (R1) = Du1
>       *     (R2) = Du2
>       * else
> @@ -2597,7 +2632,8 @@ DISAS_INSN(negx)
>
>      gen_flush_flags(s); /* compute old Z */
>
> -    /* Perform substract with borrow.
> +    /*
> +     * Perform substract with borrow.
>       * (X, N) =  -(src + X);
>       */
>
> @@ -2609,7 +2645,8 @@ DISAS_INSN(negx)
>
>      tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
>
> -    /* Compute signed-overflow for negation.  The normal formula for
> +    /*
> +     * Compute signed-overflow for negation.  The normal formula for
>       * subtraction is (res ^ src) & (src ^ dest), but with dest==0
>       * this simplies to res & src.
>       */
> @@ -2844,8 +2881,10 @@ DISAS_INSN(mull)
>
>          set_cc_op(s, CC_OP_FLAGS);
>      } else {
> -        /* The upper 32 bits of the product are discarded, so
> -           muls.l and mulu.l are functionally equivalent.  */
> +        /*
> +         * The upper 32 bits of the product are discarded, so
> +         * muls.l and mulu.l are functionally equivalent.
> +         */
>          tcg_gen_mul_i32(DREG(ext, 12), src1, DREG(ext, 12));
>          gen_logic_cc(s, DREG(ext, 12), OS_LONG);
>      }
> @@ -2938,8 +2977,10 @@ DISAS_INSN(jump)
>  {
>      TCGv tmp;
>
> -    /* Load the target address first to ensure correct exception
> -       behavior.  */
> +    /*
> +     * Load the target address first to ensure correct exception
> +     * behavior.
> +     */
>      tmp = gen_lea(env, s, insn, OS_LONG);
>      if (IS_NULL_QREG(tmp)) {
>          gen_addr_fault(s);
> @@ -2976,8 +3017,10 @@ DISAS_INSN(addsubq)
>      dest = tcg_temp_new();
>      tcg_gen_mov_i32(dest, src);
>      if ((insn & 0x38) == 0x08) {
> -        /* Don't update condition codes if the destination is an
> -           address register.  */
> +        /*
> +         * Don't update condition codes if the destination is an
> +         * address register.
> +         */
>          if (insn & 0x0100) {
>              tcg_gen_sub_i32(dest, dest, val);
>          } else {
> @@ -3110,7 +3153,8 @@ static inline void gen_subx(DisasContext *s, TCGv
src, TCGv dest, int opsize)
>
>      gen_flush_flags(s); /* compute old Z */
>
> -    /* Perform substract with borrow.
> +    /*
> +     * Perform substract with borrow.
>       * (X, N) = dest - (src + X);
>       */
>
> @@ -3320,7 +3364,8 @@ static inline void gen_addx(DisasContext *s, TCGv
src, TCGv dest, int opsize)
>
>      gen_flush_flags(s); /* compute old Z */
>
> -    /* Perform addition with carry.
> +    /*
> +     * Perform addition with carry.
>       * (X, N) = src + dest + X;
>       */
>
> @@ -3404,9 +3449,11 @@ static inline void shift_im(DisasContext *s,
uint16_t insn, int opsize)
>          tcg_gen_shri_i32(QREG_CC_C, reg, bits - count);
>          tcg_gen_shli_i32(QREG_CC_N, reg, count);
>
> -        /* Note that ColdFire always clears V (done above),
> -           while M68000 sets if the most significant bit is changed at
> -           any time during the shift operation */
> +        /*
> +         * Note that ColdFire always clears V (done above),
> +         * while M68000 sets if the most significant bit is changed at
> +         * any time during the shift operation.
> +         */
>          if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
>              /* if shift count >= bits, V is (reg != 0) */
>              if (count >= bits) {
> @@ -3451,9 +3498,11 @@ static inline void shift_reg(DisasContext *s,
uint16_t insn, int opsize)
>      s64 = tcg_temp_new_i64();
>      s32 = tcg_temp_new();
>
> -    /* Note that m68k truncates the shift count modulo 64, not 32.
> -       In addition, a 64-bit shift makes it easy to find "the last
> -       bit shifted out", for the carry flag.  */
> +    /*
> +     * Note that m68k truncates the shift count modulo 64, not 32.
> +     * In addition, a 64-bit shift makes it easy to find "the last
> +     * bit shifted out", for the carry flag.
> +     */
>      tcg_gen_andi_i32(s32, DREG(insn, 9), 63);
>      tcg_gen_extu_i32_i64(s64, s32);
>      tcg_gen_extu_i32_i64(t64, reg);
> @@ -3480,7 +3529,8 @@ static inline void shift_reg(DisasContext *s,
uint16_t insn, int opsize)
>          tcg_gen_movcond_i32(TCG_COND_NE, QREG_CC_X, s32, QREG_CC_V,
>                              QREG_CC_C, QREG_CC_X);
>
> -        /* M68000 sets V if the most significant bit is changed at
> +        /*
> +         * M68000 sets V if the most significant bit is changed at
>           * any time during the shift operation.  Do this via creating
>           * an extension of the sign bit, comparing, and discarding
>           * the bits below the sign bit.  I.e.
> @@ -3576,9 +3626,11 @@ DISAS_INSN(shift_mem)
>          tcg_gen_shri_i32(QREG_CC_C, src, 15);
>          tcg_gen_shli_i32(QREG_CC_N, src, 1);
>
> -        /* Note that ColdFire always clears V,
> -           while M68000 sets if the most significant bit is changed at
> -           any time during the shift operation */
> +        /*
> +         * Note that ColdFire always clears V,
> +         * while M68000 sets if the most significant bit is changed at
> +         * any time during the shift operation
> +         */
>          if (!logical && m68k_feature(s->env, M68K_FEATURE_M68000)) {
>              src = gen_extend(s, src, OS_WORD, 1);
>              tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
> @@ -3996,9 +4048,11 @@ DISAS_INSN(bfext_reg)
>      TCGv tmp = tcg_temp_new();
>      TCGv shift;
>
> -    /* In general, we're going to rotate the field so that it's at the
> -       top of the word and then right-shift by the complement of the
> -       width to extend the field.  */
> +    /*
> +     * In general, we're going to rotate the field so that it's at the
> +     * top of the word and then right-shift by the complement of the
> +     * width to extend the field.
> +     */
>      if (ext & 0x20) {
>          /* Variable width.  */
>          if (ext & 0x800) {
> @@ -4028,8 +4082,10 @@ DISAS_INSN(bfext_reg)
>              src = tmp;
>              pos = 32 - len;
>          } else {
> -            /* Immediate offset.  If the field doesn't wrap around the
> -               end of the word, rely on (s)extract completely.  */
> +            /*
> +             * Immediate offset.  If the field doesn't wrap around the
> +             * end of the word, rely on (s)extract completely.
> +             */
>              if (pos < 0) {
>                  tcg_gen_rotli_i32(tmp, src, ofs);
>                  src = tmp;
> @@ -4890,7 +4946,8 @@ static void gen_op_fmove_fcr(CPUM68KState *env,
DisasContext *s,
>      addr = tcg_temp_new();
>      tcg_gen_mov_i32(addr, tmp);
>
> -    /* mask:
> +    /*
> +     * mask:
>       *
>       * 0b100 Floating-Point Control Register
>       * 0b010 Floating-Point Status Register
> @@ -4958,7 +5015,8 @@ static void gen_op_fmovem(CPUM68KState *env,
DisasContext *s,
>      }
>
>      if (!is_load && (mode & 2) == 0) {
> -        /* predecrement addressing mode
> +        /*
> +         * predecrement addressing mode
>           * only available to store register to memory
>           */
>          if (opsize == OS_EXTENDED) {
> @@ -4988,8 +5046,10 @@ static void gen_op_fmovem(CPUM68KState *env,
DisasContext *s,
>      tcg_temp_free(tmp);
>  }
>
> -/* ??? FP exceptions are not implemented.  Most exceptions are deferred
until
> -   immediately before the next FP instruction is executed.  */
> +/*
> + * ??? FP exceptions are not implemented.  Most exceptions are deferred
until
> + * immediately before the next FP instruction is executed.
> + */
>  DISAS_INSN(fpu)
>  {
>      uint16_t ext;
> @@ -5513,8 +5573,10 @@ DISAS_INSN(mac)
>          tmp = gen_lea(env, s, insn, OS_LONG);
>          addr = tcg_temp_new();
>          tcg_gen_and_i32(addr, tmp, QREG_MAC_MASK);
> -        /* Load the value now to ensure correct exception behavior.
> -           Perform writeback after reading the MAC inputs.  */
> +        /*
> +         * Load the value now to ensure correct exception behavior.
> +         * Perform writeback after reading the MAC inputs.
> +         */
>          loadval = gen_load(s, OS_LONG, addr, 0, IS_USER(s));
>
>          acc ^= 1;
> @@ -5635,8 +5697,10 @@ DISAS_INSN(mac)
>          TCGv rw;
>          rw = (insn & 0x40) ? AREG(insn, 9) : DREG(insn, 9);
>          tcg_gen_mov_i32(rw, loadval);
> -        /* FIXME: Should address writeback happen with the masked or
> -           unmasked value?  */
> +        /*
> +         * FIXME: Should address writeback happen with the masked or
> +         * unmasked value?
> +         */
>          switch ((insn >> 3) & 7) {
>          case 3: /* Post-increment.  */
>              tcg_gen_addi_i32(AREG(insn, 0), addr, 4);
> @@ -5786,8 +5850,10 @@ register_opcode (disas_proc proc, uint16_t opcode,
uint16_t mask)
>                opcode, mask);
>        abort();
>    }
> -  /* This could probably be cleverer.  For now just optimize the case
where
> -     the top bits are known.  */
> +  /*
> +   * This could probably be cleverer.  For now just optimize the case
where
> +   * the top bits are known.
> +   */
>    /* Find the first zero bit in the mask.  */
>    i = 0x8000;
>    while ((i & mask) != 0)
> @@ -5805,17 +5871,22 @@ register_opcode (disas_proc proc, uint16_t
opcode, uint16_t mask)
>    }
>  }
>
> -/* Register m68k opcode handlers.  Order is important.
> -   Later insn override earlier ones.  */
> +/*
> + * Register m68k opcode handlers.  Order is important.
> + * Later insn override earlier ones.
> + */
>  void register_m68k_insns (CPUM68KState *env)
>  {
> -    /* Build the opcode table only once to avoid
> -       multithreading issues. */
> +    /*
> +     * Build the opcode table only once to avoid
> +     * multithreading issues.
> +     */
>      if (opcode_table[0] != NULL) {
>          return;
>      }
>
> -    /* use BASE() for instruction available
> +    /*
> +     * use BASE() for instruction available
>       * for CF_ISA_A and M68000.
>       */
>  #define BASE(name, opcode, mask) \
> @@ -6079,10 +6150,12 @@ static bool
m68k_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>
>      gen_exception(dc, dc->base.pc_next, EXCP_DEBUG);
> -    /* The address covered by the breakpoint must be included in
> -       [tb->pc, tb->pc + tb->size) in order to for it to be
> -       properly cleared -- thus we increment the PC here so that
> -       the logic setting tb->size below does the right thing.  */
> +    /*
> +     * The address covered by the breakpoint must be included in
> +     * [tb->pc, tb->pc + tb->size) in order to for it to be
> +     * properly cleared -- thus we increment the PC here so that
> +     * the logic setting tb->size below does the right thing.
> +     */
>      dc->base.pc_next += 2;
>
>      return true;
> @@ -6101,7 +6174,8 @@ static void m68k_tr_translate_insn(DisasContextBase
*dcbase, CPUState *cpu)
>      dc->base.pc_next = dc->pc;
>
>      if (dc->base.is_jmp == DISAS_NEXT) {
> -        /* Stop translation when the next insn might touch a new page.
> +        /*
> +         * Stop translation when the next insn might touch a new page.
>           * This ensures that prefetch aborts at the right place.
>           *
>           * We cannot determine the size of the next insn without
> @@ -6144,8 +6218,10 @@ static void m68k_tr_tb_stop(DisasContextBase
*dcbase, CPUState *cpu)
>          tcg_gen_lookup_and_goto_ptr();
>          break;
>      case DISAS_EXIT:
> -        /* We updated CC_OP and PC in gen_exit_tb, but also modified
> -           other state that may require returning to the main loop.  */
> +        /*
> +         * We updated CC_OP and PC in gen_exit_tb, but also modified
> +         * other state that may require returning to the main loop.
> +         */
>          tcg_gen_exit_tb(NULL, 0);
>          break;
>      default:
> --
> 2.21.0
>
>
>

--0000000000003cde4e058ab07cfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jun 7, 2019 1:42 AM, &quot;Lucien Murray-Pitts&quot; &lt;<a href=3D"mail=
to:lucienmp.qemu@gmail.com">lucienmp.qemu@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Altering all comments in target/m68k to match Qemu coding styles so th=
at future<br>
&gt; patches wont fail due to style breaches.<br>
&gt;</p>
<p dir=3D"ltr">Are you saying that patches fail checkpatch checks even if t=
he new code has only correct comment format? (Or, in other words, that chec=
kpatch detects comment-related errors in=C2=A0 unchanged code, and reports =
them as the errors/warnings in the patch in question?) I just want to under=
stand what is the obstacle you are trying to remove.</p>
<p dir=3D"ltr">Thanks, Aleksandar<br></p>
<p dir=3D"ltr">&gt; Signed-off-by: Lucien Murray-Pitts &lt;<a href=3D"mailt=
o:lucienmp.qemu@gmail.com">lucienmp.qemu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Notes:<br>
&gt; =C2=A0 =C2=A0 v1-&gt;v2<br>
&gt; =C2=A0 =C2=A0 =C2=A0- incorrectly made split-single line comments mult=
iple single lines<br>
&gt; =C2=A0 =C2=A0 =C2=A0- added corrections for /** comments as well as /*=
----...<br>
&gt; =C2=A0 =C2=A0 =C2=A0- caught some other malformed comments that had be=
en missed out<br>
&gt;<br>
&gt; =C2=A0target/m68k/cpu-qom.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; =C2=A0target/m68k/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; =C2=A0target/m68k/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++--<br>
&gt; =C2=A0target/m68k/fpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt; =C2=A0target/m68k/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; =C2=A0target/m68k/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 16 +-<br>
&gt; =C2=A0target/m68k/m68k-semi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 ++-<br>
&gt; =C2=A0target/m68k/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 58 ++++---<br>
&gt; =C2=A0target/m68k/softfloat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 181 ++++++++++----------<br>
&gt; =C2=A0target/m68k/softfloat.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt; =C2=A0target/m68k/softfloat_fpsp_tables.h |=C2=A0 =C2=A03 +-<br>
&gt; =C2=A0target/m68k/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 246 ++++++++++++++++++----------<br>
&gt; =C2=A012 files changed, 355 insertions(+), 228 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h<br>
&gt; index 9885bba317..0c157251a2 100644<br>
&gt; --- a/target/m68k/cpu-qom.h<br>
&gt; +++ b/target/m68k/cpu-qom.h<br>
&gt; @@ -31,7 +31,7 @@<br>
&gt; =C2=A0#define M68K_CPU_GET_CLASS(obj) \<br>
&gt; =C2=A0 =C2=A0 =C2=A0OBJECT_GET_CLASS(M68kCPUClass, (obj), TYPE_M68K_CP=
U)<br>
&gt;<br>
&gt; -/**<br>
&gt; +/*<br>
&gt; =C2=A0 * M68kCPUClass:<br>
&gt; =C2=A0 * @parent_realize: The parent class&#39; realize handler.<br>
&gt; =C2=A0 * @parent_reset: The parent class&#39; reset handler.<br>
&gt; diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c<br>
&gt; index b16957934a..c144278661 100644<br>
&gt; --- a/target/m68k/cpu.c<br>
&gt; +++ b/target/m68k/cpu.c<br>
&gt; @@ -204,8 +204,10 @@ static void any_cpu_initfn(Object *obj)<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_CF_ISA_APLUSC);=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_BRAL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_CF_FPU);<br>
&gt; -=C2=A0 =C2=A0 /* MAC and EMAC are mututally exclusive, so pick EMAC.<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0It&#39;s mostly backwards compatible.=C2=
=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* MAC and EMAC are mututally exclusive, so pick E=
MAC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* It&#39;s mostly backwards compatible.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_CF_EMAC);<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_CF_EMAC_B);<br>
&gt; =C2=A0 =C2=A0 =C2=A0m68k_set_feature(env, M68K_FEATURE_USP);<br>
&gt; diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h<br>
&gt; index 9deff9e234..3c4d7de017 100644<br>
&gt; --- a/target/m68k/cpu.h<br>
&gt; +++ b/target/m68k/cpu.h<br>
&gt; @@ -112,9 +112,11 @@ typedef struct CPUM68KState {<br>
&gt; =C2=A0 =C2=A0 =C2=A0float_status fp_status;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint64_t mactmp;<br>
&gt; -=C2=A0 =C2=A0 /* EMAC Hardware deals with 48-bit values composed of o=
ne 32-bit and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0two 8-bit parts.=C2=A0 We store a single 6=
4-bit value and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rearrange/extend this when changing modes.=
=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* EMAC Hardware deals with 48-bit values composed=
 of one 32-bit and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* two 8-bit parts.=C2=A0 We store a single 64-bit=
 value and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* rearrange/extend this when changing modes.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint64_t macc[4];<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t macsr;<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t mac_mask;<br>
&gt; @@ -154,7 +156,7 @@ typedef struct CPUM68KState {<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t features;<br>
&gt; =C2=A0} CPUM68KState;<br>
&gt;<br>
&gt; -/**<br>
&gt; +/*<br>
&gt; =C2=A0 * M68kCPU:<br>
&gt; =C2=A0 * @env: #CPUM68KState<br>
&gt; =C2=A0 *<br>
&gt; @@ -186,9 +188,11 @@ int m68k_cpu_gdb_write_register(CPUState *cpu, ui=
nt8_t *buf, int reg);<br>
&gt;<br>
&gt; =C2=A0void m68k_tcg_init(void);<br>
&gt; =C2=A0void m68k_cpu_init_gdb(M68kCPU *cpu);<br>
&gt; -/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
&gt; -=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions.=
 non zero<br>
&gt; -=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU=
.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * you can call this signal handler from your SIGBUS and SIGSEGV<br>
&gt; + * signal handlers to inform the virtual CPU of exceptions. non zero<=
br>
&gt; + * is returned if the signal was handled by the virtual CPU.<br>
&gt; + */<br>
&gt; =C2=A0int cpu_m68k_signal_handler(int host_signum, void *pinfo,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *puc);<br>
&gt; =C2=A0uint32_t cpu_m68k_get_ccr(CPUM68KState *env);<br>
&gt; @@ -197,7 +201,8 @@ void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);=
<br>
&gt; =C2=A0void cpu_m68k_set_fpcr(CPUM68KState *env, uint32_t val);<br>
&gt;<br>
&gt;<br>
&gt; -/* Instead of computing the condition codes after each m68k instructi=
on,<br>
&gt; +/*<br>
&gt; + * Instead of computing the condition codes after each m68k instructi=
on,<br>
&gt; =C2=A0 * QEMU just stores one operand (called CC_SRC), the result<br>
&gt; =C2=A0 * (called CC_DEST) and the type of operation (called CC_OP). Wh=
en the<br>
&gt; =C2=A0 * condition codes are needed, the condition codes can be calcul=
ated<br>
&gt; @@ -462,9 +467,11 @@ void m68k_switch_sp(CPUM68KState *env);<br>
&gt;<br>
&gt; =C2=A0void do_m68k_semihosting(CPUM68KState *env, int nr);<br>
&gt;<br>
&gt; -/* There are 4 ColdFire core ISA revisions: A, A+, B and C.<br>
&gt; -=C2=A0 =C2=A0Each feature covers the subset of instructions common to=
 the<br>
&gt; -=C2=A0 =C2=A0ISA revisions mentioned.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * There are 4 ColdFire core ISA revisions: A, A+, B and C.<br>
&gt; + * Each feature covers the subset of instructions common to the<br>
&gt; + * ISA revisions mentioned.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0enum m68k_features {<br>
&gt; =C2=A0 =C2=A0 =C2=A0M68K_FEATURE_M68000,<br>
&gt; @@ -502,7 +509,8 @@ void m68k_cpu_list(void);<br>
&gt;<br>
&gt; =C2=A0void register_m68k_insns (CPUM68KState *env);<br>
&gt;<br>
&gt; -/* Coldfire Linux uses 8k pages<br>
&gt; +/*<br>
&gt; + * Coldfire Linux uses 8k pages<br>
&gt; =C2=A0 * and m68k linux uses 4k pages<br>
&gt; =C2=A0 * use the smallest one<br>
&gt; =C2=A0 */<br>
&gt; diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c<br>
&gt; index b35489ba4e..9b039c856d 100644<br>
&gt; --- a/target/m68k/fpu_helper.c<br>
&gt; +++ b/target/m68k/fpu_helper.c<br>
&gt; @@ -25,7 +25,8 @@<br>
&gt; =C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
&gt; =C2=A0#include &quot;softfloat.h&quot;<br>
&gt;<br>
&gt; -/* Undefined offsets may be different on various FPU.<br>
&gt; +/*<br>
&gt; + * Undefined offsets may be different on various FPU.<br>
&gt; =C2=A0 * On 68040 they return 0.0 (floatx80_zero)<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; @@ -611,7 +612,8 @@ void HELPER(fcos)(CPUM68KState *env, FPReg *res, F=
PReg *val)<br>
&gt; =C2=A0void HELPER(fsincos)(CPUM68KState *env, FPReg *res0, FPReg *res1=
, FPReg *val)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0floatx80 a =3D val-&gt;d;<br>
&gt; -=C2=A0 =C2=A0 /* If res0 and res1 specify the same floating-point dat=
a register,<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If res0 and res1 specify the same floating-poin=
t data register,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * the sine result is stored in the register, and =
the cosine<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * result is discarded.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c<br>
&gt; index fd2bb46c42..6bcf1a9b9f 100644<br>
&gt; --- a/target/m68k/gdbstub.c<br>
&gt; +++ b/target/m68k/gdbstub.c<br>
&gt; @@ -41,8 +41,10 @@ int m68k_cpu_gdb_read_register(CPUState *cs, uint8_=
t *mem_buf, int n)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gdb_get_reg32(m=
em_buf, env-&gt;pc);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 /* FP registers not included here because they vary bet=
ween<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ColdFire and m68k.=C2=A0 Use XML bits for =
these.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* FP registers not included here because they var=
y between<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ColdFire and m68k.=C2=A0 Use XML bits for these=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; diff --git a/target/m68k/helper.c b/target/m68k/helper.c<br>
&gt; index 6db93bdd81..b0bb579403 100644<br>
&gt; --- a/target/m68k/helper.c<br>
&gt; +++ b/target/m68k/helper.c<br>
&gt; @@ -972,9 +972,11 @@ void HELPER(set_sr)(CPUM68KState *env, uint32_t v=
al)<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0/* MAC unit.=C2=A0 */<br>
&gt; -/* FIXME: The MAC unit implementation is a bit of a mess.=C2=A0 Some =
helpers<br>
&gt; -=C2=A0 =C2=A0take values,=C2=A0 others take register numbers and mani=
pulate the contents<br>
&gt; -=C2=A0 =C2=A0in-place.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * FIXME: The MAC unit implementation is a bit of a mess.=C2=A0 Some =
helpers<br>
&gt; + * take values,=C2=A0 others take register numbers and manipulate the=
 contents<br>
&gt; + * in-place.<br>
&gt; + */<br>
&gt; =C2=A0void HELPER(mac_move)(CPUM68KState *env, uint32_t dest, uint32_t=
 src)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t mask;<br>
&gt; @@ -1054,9 +1056,11 @@ void HELPER(macsats)(CPUM68KState *env, uint32_=
t acc)<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (env-&gt;macsr &amp; MACSR_V) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;macsr |=3D MACSR_PAV0 &lt;&l=
t; acc;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (env-&gt;macsr &amp; MACSR_OMC) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The result is saturated =
to 32 bits, despite overflow occurring<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at 48 bits.=C2=
=A0 Seems weird, but that&#39;s what the hardware docs<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0say.=C2=A0 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The result is satur=
ated to 32 bits, despite overflow occurring<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* at 48 bits.=C2=A0 S=
eems weird, but that&#39;s what the hardware docs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* say.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D (result &gt=
;&gt; 63) ^ 0x7fffffff;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c<br>
&gt; index 1402145c8f..4f9f4355a6 100644<br>
&gt; --- a/target/m68k/m68k-semi.c<br>
&gt; +++ b/target/m68k/m68k-semi.c<br>
&gt; @@ -131,7 +131,8 @@ static void m68k_semi_return_u32(CPUM68KState *env=
, uint32_t ret, uint32_t err)<br>
&gt; =C2=A0 =C2=A0 =C2=A0target_ulong args =3D env-&gt;dregs[1];<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (put_user_u32(ret, args) ||<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_user_u32(err, args + 4)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The m68k semihosting ABI does not prov=
ide any way to report this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The m68k semihosting ABI does not=
 provide any way to report this<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * error to the guest, so the best w=
e can do is log it in qemu.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * It is always a guest error not to=
 pass us a valid argument block.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; @@ -160,8 +161,10 @@ static void m68k_semi_cb(CPUState *cs, target_ulo=
ng ret, target_ulong err)<br>
&gt; =C2=A0 =C2=A0 =C2=A0CPUM68KState *env =3D &amp;cpu-&gt;env;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (m68k_semi_is_fseek) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: We&#39;ve already lost the high=
 bits of the fseek<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return value.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* FIXME: We&#39;ve already lost the=
 high bits of the fseek<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return value.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m68k_semi_return_u64(env, ret, err);=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m68k_semi_is_fseek =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -169,7 +172,8 @@ static void m68k_semi_cb(CPUState *cs, target_ulon=
g ret, target_ulong err)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Read the input value from the argument block; fail the semihosting=
<br>
&gt; +/*<br>
&gt; + * Read the input value from the argument block; fail the semihosting=
<br>
&gt; =C2=A0 * call if the memory read fails.<br>
&gt; =C2=A0 */<br>
&gt; =C2=A0#define GET_ARG(n) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt; @@ -441,14 +445,18 @@ void do_m68k_semihosting(CPUM68KState *env, int =
nr)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;heap_limit =3D =
base + size;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This call may happen before we have wr=
itable memory, so return<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0values directly in registers=
.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This call may happen before we ha=
ve writable memory, so return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* values directly in registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;dregs[1] =3D ts-&gt;heap_lim=
it;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;aregs[7] =3D ts-&gt;stack_ba=
se;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: This is wrong for boards where =
RAM does not start at<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address zero.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* FIXME: This is wrong for boards w=
here RAM does not start at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* address zero.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;dregs[1] =3D ram_size;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;aregs[7] =3D ram_size;<br>
&gt; =C2=A0#endif<br>
&gt; diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c<br>
&gt; index bde2d551ff..9d9b9438dc 100644<br>
&gt; --- a/target/m68k/op_helper.c<br>
&gt; +++ b/target/m68k/op_helper.c<br>
&gt; @@ -494,10 +494,12 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int i=
nterrupt_request)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ((env-&gt;sr &amp; SR_I) =
&gt;&gt; SR_I_SHIFT) &lt; env-&gt;pending_level) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Real hardware gets the interrupt vecto=
r via an IACK cycle<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at this point.=C2=A0 Current=
 emulated hardware doesn&#39;t rely on<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this, so we provide/save the=
 vector when the interrupt is<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0first signalled.=C2=A0 */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Real hardware gets the interrupt =
vector via an IACK cycle<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* at this point.=C2=A0 Current emul=
ated hardware doesn&#39;t rely on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* this, so we provide/save the vect=
or when the interrupt is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* first signalled.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D env-&gt;p=
ending_vector;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_interrupt_m68k_hardirq(env);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; @@ -537,7 +539,8 @@ void HELPER(divuw)(CPUM68KState *env, int destr, u=
int32_t den)<br>
&gt; =C2=A0 =C2=A0 =C2=A0env-&gt;cc_c =3D 0; /* always cleared, even if ove=
rflow */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (quot &gt; 0xffff) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_v =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* real 68040 keeps N and unset Z on over=
flow,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* real 68040 keeps N and unset Z on=
 overflow,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * whereas documentation says &quot;=
undefined&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_z =3D 1;<br>
&gt; @@ -564,7 +567,8 @@ void HELPER(divsw)(CPUM68KState *env, int destr, i=
nt32_t den)<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (quot !=3D (int16_t)quot) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_v =3D -1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* nothing else is modified */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* real 68040 keeps N and unset Z on over=
flow,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* real 68040 keeps N and unset Z on=
 overflow,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * whereas documentation says &quot;=
undefined&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_z =3D 1;<br>
&gt; @@ -647,7 +651,8 @@ void HELPER(divull)(CPUM68KState *env, int numr, i=
nt regr, uint32_t den)<br>
&gt; =C2=A0 =C2=A0 =C2=A0env-&gt;cc_c =3D 0; /* always cleared, even if ove=
rflow */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (quot &gt; 0xffffffffULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_v =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* real 68040 keeps N and unset Z on over=
flow,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* real 68040 keeps N and unset Z on=
 overflow,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * whereas documentation says &quot;=
undefined&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_z =3D 1;<br>
&gt; @@ -681,7 +686,8 @@ void HELPER(divsll)(CPUM68KState *env, int numr, i=
nt regr, int32_t den)<br>
&gt; =C2=A0 =C2=A0 =C2=A0env-&gt;cc_c =3D 0; /* always cleared, even if ove=
rflow */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (quot !=3D (int32_t)quot) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_v =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* real 68040 keeps N and unset Z on over=
flow,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* real 68040 keeps N and unset Z on=
 overflow,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * whereas documentation says &quot;=
undefined&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;cc_z =3D 1;<br>
&gt; @@ -838,14 +844,18 @@ static struct bf_data bf_prep(uint32_t addr, int=
32_t ofs, uint32_t len)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr -=3D 1;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Compute the number of bytes required (minus one) to<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0satisfy the bitfield.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Compute the number of bytes required (minus one=
) to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* satisfy the bitfield.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0blen =3D (bofs + len - 1) / 8;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Canonicalize the bit offset for data loaded into a 6=
4-bit big-endian<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0word.=C2=A0 For the cases where BLEN is no=
t a power of 2, adjust ADDR so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0that we can use the next power of two size=
d load without crossing a<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0page boundary, unless the field itself cro=
sses the boundary.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Canonicalize the bit offset for data loaded int=
o a 64-bit big-endian<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* word.=C2=A0 For the cases where BLEN is not a p=
ower of 2, adjust ADDR so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* that we can use the next power of two sized loa=
d without crossing a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* page boundary, unless the field itself crosses =
the boundary.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0switch (blen) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bofs +=3D 56;<br>
&gt; @@ -937,8 +947,10 @@ uint64_t HELPER(bfextu_mem)(CPUM68KState *env, ui=
nt32_t addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0struct bf_data d =3D bf_prep(addr, ofs, len);<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint64_t data =3D bf_load(env, d.addr, d.blen, ra)=
;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Put CC_N at the top of the high word; put the zero-e=
xtended value<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0at the bottom of the low word.=C2=A0 */<br=
>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Put CC_N at the top of the high word; put the z=
ero-extended value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* at the bottom of the low word.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0data &lt;&lt;=3D d.bofs;<br>
&gt; =C2=A0 =C2=A0 =C2=A0data &gt;&gt;=3D 64 - d.len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0data |=3D data &lt;&lt; (64 - d.len);<br>
&gt; @@ -1016,15 +1028,18 @@ uint64_t HELPER(bfffo_mem)(CPUM68KState *env, =
uint32_t addr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint64_t n =3D (data &amp; mask) &lt;&lt; d.bofs;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t ffo =3D helper_bfffo_reg(n &gt;&gt; 32, o=
fs, d.len);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Return FFO in the low word and N in the high word.<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that because of MASK and the shift, t=
he low word<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0is already zero.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Return FFO in the low word and N in the high wo=
rd.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Note that because of MASK and the shift, the lo=
w word<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* is already zero.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0return n | ffo;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0void HELPER(chk)(CPUM68KState *env, int32_t val, int32_t ub)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 /* From the specs:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* From the specs:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0X: Not affected, C,V,Z: Undefined,<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0N: Set if val &lt; 0; cleared if va=
l &gt; ub, undefined otherwise<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * We implement here values found from a real MC68=
040:<br>
&gt; @@ -1054,7 +1069,8 @@ void HELPER(chk)(CPUM68KState *env, int32_t val,=
 int32_t ub)<br>
&gt;<br>
&gt; =C2=A0void HELPER(chk2)(CPUM68KState *env, int32_t val, int32_t lb, in=
t32_t ub)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 /* From the specs:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* From the specs:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0X: Not affected, N,V: Undefined,<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0Z: Set if val is equal to lb or ub<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0C: Set if val &lt; lb or val &gt; u=
b, cleared otherwise<br>
&gt; diff --git a/target/m68k/softfloat.c b/target/m68k/softfloat.c<br>
&gt; index b45a5e8690..591a6f1dce 100644<br>
&gt; --- a/target/m68k/softfloat.c<br>
&gt; +++ b/target/m68k/softfloat.c<br>
&gt; @@ -14,7 +14,8 @@<br>
&gt; =C2=A0 * the Softfloat-2a license unless specifically indicated otherw=
ise.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; -/* Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; +/*<br>
&gt; + * Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; =C2=A0 * version 2 or later. See the COPYING file in the top-level dir=
ectory.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; @@ -41,10 +42,10 @@ static floatx80 propagateFloatx80NaNOneArg(floatx8=
0 a, float_status *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Returns the modulo remainder of the extended double-precision floa=
ting-point<br>
&gt; - | value `a&#39; with respect to the corresponding value `b&#39;.<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Returns the modulo remainder of the extended double-precision floa=
ting-point<br>
&gt; + * value `a&#39; with respect to the corresponding value `b&#39;.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *stat=
us)<br>
&gt; =C2=A0{<br>
&gt; @@ -124,10 +125,10 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, fl=
oat_status *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A080, zSign, bExp + expD=
iff, aSig0, aSig1, status);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Returns the mantissa of the extended double-precision floating-poi=
nt<br>
&gt; - | value `a&#39;.<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Returns the mantissa of the extended double-precision floating-poi=
nt<br>
&gt; + * value `a&#39;.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_getman(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -158,10 +159,10 @@ floatx80 floatx80_getman(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3FFF, aSig, 0, status);<b=
r>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Returns the exponent of the extended double-precision floating-poi=
nt<br>
&gt; - | value `a&#39; as an extended double-precision value.<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Returns the exponent of the extended double-precision floating-poi=
nt<br>
&gt; + * value `a&#39; as an extended double-precision value.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_getexp(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -191,13 +192,13 @@ floatx80 floatx80_getexp(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return int32_to_floatx80(aExp - 0x3FFF, status);<b=
r>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Scales extended double-precision floating-point value in operand `=
a&#39; by<br>
&gt; - | value `b&#39;. The function truncates the value in the second oper=
and &#39;b&#39; to<br>
&gt; - | an integral value and adds that value to the exponent of the opera=
nd &#39;a&#39;.<br>
&gt; - | The operation performed according to the IEC/IEEE Standard for Bin=
ary<br>
&gt; - | Floating-Point Arithmetic.<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Scales extended double-precision floating-point value in operand `=
a&#39; by<br>
&gt; + * value `b&#39;. The function truncates the value in the second oper=
and &#39;b&#39; to<br>
&gt; + * an integral value and adds that value to the exponent of the opera=
nd &#39;a&#39;.<br>
&gt; + * The operation performed according to the IEC/IEEE Standard for Bin=
ary<br>
&gt; + * Floating-Point Arithmetic.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_scale(floatx80 a, floatx80 b, float_status *st=
atus)<br>
&gt; =C2=A0{<br>
&gt; @@ -282,26 +283,26 @@ floatx80 floatx80_move(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aExp, aSig, 0, status);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; -| Algorithms for transcendental functions supported by MC68881 and MC=
68882<br>
&gt; -| mathematical coprocessors. The functions are derived from FPSP libr=
ary.<br>
&gt; -*--------------------------------------------------------------------=
--------*/<br>
&gt; +/*<br>
&gt; + * Algorithms for transcendental functions supported by MC68881 and M=
C68882<br>
&gt; + * mathematical coprocessors. The functions are derived from FPSP lib=
rary.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0#define one_exp=C2=A0 =C2=A0 =C2=A00x3FFF<br>
&gt; =C2=A0#define one_sig=C2=A0 =C2=A0 =C2=A0LIT64(0x8000000000000000)<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Function for compactifying extended double-precision floating poin=
t values.<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Function for compactifying extended double-precision floating poin=
t values.<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0static int32_t floatx80_make_compact(int32_t aExp, uint64_t aSig=
)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0return (aExp &lt;&lt; 16) | (aSig &gt;&gt; 48);<br=
>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Log base e of x plus 1<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Log base e of x plus 1<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_lognp1(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -498,9 +499,9 @@ floatx80 floatx80_lognp1(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Log base e<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Log base e<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_logn(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -666,9 +667,9 @@ floatx80 floatx80_logn(floatx80 a, float_status *s=
tatus)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Log base 10<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Log base 10<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_log10(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -723,9 +724,9 @@ floatx80 floatx80_log10(floatx80 a, float_status *=
status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Log base 2<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Log base 2<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_log2(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -790,9 +791,9 @@ floatx80 floatx80_log2(floatx80 a, float_status *s=
tatus)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | e to x<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * e to x<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_etox(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -848,7 +849,8 @@ floatx80 floatx80_etox(floatx80 a, float_status *s=
tatus)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D n &amp; 0x3F; /*=
 J =3D N mod 64 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D n / 64; /* NOTE:=
 this is really arithmetic right shift by 6 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 0 &amp;&amp=
; j) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic=
 right shift is division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arith=
metic right shift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round=
 towards minus infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m--;<br>
&gt; @@ -973,9 +975,9 @@ floatx80 floatx80_etox(floatx80 a, float_status *s=
tatus)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | 2 to x<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * 2 to x<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_twotox(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -1051,14 +1053,16 @@ floatx80 floatx80_twotox(floatx80 a, float_sta=
tus *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D n &amp; 0x3F;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D n / 64; /* NOTE: this is reall=
y arithmetic right shift by 6 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 0 &amp;&amp; j) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic right shift i=
s division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arithmetic right sh=
ift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round towards minus=
 infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l--;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D l / 2; /* NOTE: this is really=
 arithmetic right shift by 1 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (l &lt; 0 &amp;&amp; (l &amp; 1))=
 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic right shift i=
s division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arithmetic right sh=
ift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round towards minus=
 infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m--;<br>
&gt; @@ -1121,9 +1125,9 @@ floatx80 floatx80_twotox(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | 10 to x<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * 10 to x<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_tentox(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -1200,14 +1204,16 @@ floatx80 floatx80_tentox(floatx80 a, float_sta=
tus *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D n &amp; 0x3F;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D n / 64; /* NOTE: this is reall=
y arithmetic right shift by 6 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 0 &amp;&amp; j) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic right shift i=
s division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arithmetic right sh=
ift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round towards minus=
 infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l--;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D l / 2; /* NOTE: this is really=
 arithmetic right shift by 1 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (l &lt; 0 &amp;&amp; (l &amp; 1))=
 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic right shift i=
s division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arithmetic right sh=
ift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round towards minus=
 infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m--;<br>
&gt; @@ -1274,9 +1280,9 @@ floatx80 floatx80_tentox(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Tangent<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Tangent<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_tan(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -1484,9 +1490,9 @@ floatx80 floatx80_tan(floatx80 a, float_status *=
status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Sine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Sine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_sin(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -1723,9 +1729,9 @@ floatx80 floatx80_sin(floatx80 a, float_status *=
status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Cosine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Cosine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_cos(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -1960,9 +1966,9 @@ floatx80 floatx80_cos(floatx80 a, float_status *=
status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Arc tangent<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Arc tangent<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_atan(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2157,9 +2163,9 @@ floatx80 floatx80_atan(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Arc sine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Arc sine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_asin(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2222,9 +2228,9 @@ floatx80 floatx80_asin(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Arc cosine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Arc cosine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_acos(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2291,9 +2297,9 @@ floatx80 floatx80_acos(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Hyperbolic arc tangent<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Hyperbolic arc tangent<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_atanh(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2356,9 +2362,9 @@ floatx80 floatx80_atanh(floatx80 a, float_status=
 *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return a;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | e to x minus 1<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * e to x minus 1<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_etoxm1(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2410,7 +2416,8 @@ floatx80 floatx80_etoxm1(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D n &amp; 0x3F; /*=
 J =3D N mod 64 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D n / 64; /* NOTE:=
 this is really arithmetic right shift by 6 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt; 0 &amp;&amp=
; j) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* arithmetic=
 right shift is division and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* arith=
metic right shift is division and<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * round=
 towards minus infinity<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m--;<br>
&gt; @@ -2607,9 +2614,9 @@ floatx80 floatx80_etoxm1(floatx80 a, float_statu=
s *status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Hyperbolic tangent<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Hyperbolic tangent<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_tanh(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2722,9 +2729,9 @@ floatx80 floatx80_tanh(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Hyperbolic sine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Hyperbolic sine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_sinh(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; @@ -2811,9 +2818,9 @@ floatx80 floatx80_sinh(floatx80 a, float_status =
*status)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/*-------------------------------------------------------------------=
---------<br>
&gt; - | Hyperbolic cosine<br>
&gt; - *-------------------------------------------------------------------=
---------*/<br>
&gt; +/*<br>
&gt; + * Hyperbolic cosine<br>
&gt; + */<br>
&gt;<br>
&gt; =C2=A0floatx80 floatx80_cosh(floatx80 a, float_status *status)<br>
&gt; =C2=A0{<br>
&gt; diff --git a/target/m68k/softfloat.h b/target/m68k/softfloat.h<br>
&gt; index 602661d5a8..365ef6ac7a 100644<br>
&gt; --- a/target/m68k/softfloat.h<br>
&gt; +++ b/target/m68k/softfloat.h<br>
&gt; @@ -14,7 +14,8 @@<br>
&gt; =C2=A0 * the Softfloat-2a license unless specifically indicated otherw=
ise.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; -/* Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; +/*<br>
&gt; + * Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; =C2=A0 * version 2 or later. See the COPYING file in the top-level dir=
ectory.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; diff --git a/target/m68k/softfloat_fpsp_tables.h b/target/m68k/softflo=
at_fpsp_tables.h<br>
&gt; index 3f1419ee6e..2ccd9e8bc3 100644<br>
&gt; --- a/target/m68k/softfloat_fpsp_tables.h<br>
&gt; +++ b/target/m68k/softfloat_fpsp_tables.h<br>
&gt; @@ -14,7 +14,8 @@<br>
&gt; =C2=A0 * the Softfloat-2a license unless specifically indicated otherw=
ise.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; -/* Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; +/*<br>
&gt; + * Portions of this work are licensed under the terms of the GNU GPL,=
<br>
&gt; =C2=A0 * version 2 or later. See the COPYING file in the top-level dir=
ectory.<br>
&gt; =C2=A0 */<br>
&gt;<br>
&gt; diff --git a/target/m68k/translate.c b/target/m68k/translate.c<br>
&gt; index f0534a4ba0..9b0ca4c14c 100644<br>
&gt; --- a/target/m68k/translate.c<br>
&gt; +++ b/target/m68k/translate.c<br>
&gt; @@ -248,8 +248,10 @@ static void set_cc_op(DisasContext *s, CCOp op)<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0s-&gt;cc_op =3D op;<br>
&gt; =C2=A0 =C2=A0 =C2=A0s-&gt;cc_op_synced =3D 0;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Discard CC computation that will no longer be used.<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that X and N are never dead.=C2=A0 */=
<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Discard CC computation that will no longer be u=
sed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Note that X and N are never dead.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0dead =3D cc_op_live[old_op] &amp; ~cc_op_live[op];=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (dead &amp; CCF_C) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_discard_i32(QREG_CC_C);<br>
&gt; @@ -306,8 +308,10 @@ static inline void gen_addr_fault(DisasContext *s=
)<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_exception(s, s-&gt;base.pc_next, EXCP_ADDRESS)=
;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Generate a load from the specified address.=C2=A0 Narrow values ar=
e<br>
&gt; -=C2=A0 =C2=A0sign extended to full register width.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Generate a load from the specified address.=C2=A0 Narrow values ar=
e<br>
&gt; + *=C2=A0 sign extended to full register width.<br>
&gt; + */<br>
&gt; =C2=A0static inline TCGv gen_load(DisasContext *s, int opsize, TCGv ad=
dr,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int sign, int index)<br>
&gt; =C2=A0{<br>
&gt; @@ -360,8 +364,10 @@ typedef enum {<br>
&gt; =C2=A0 =C2=A0 =C2=A0EA_LOADS<br>
&gt; =C2=A0} ea_what;<br>
&gt;<br>
&gt; -/* Generate an unsigned load if VAL is 0 a signed load if val is -1,<=
br>
&gt; -=C2=A0 =C2=A0otherwise generate a store.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Generate an unsigned load if VAL is 0 a signed load if val is -1,<=
br>
&gt; + * otherwise generate a store.<br>
&gt; + */<br>
&gt; =C2=A0static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCG=
v val,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ea_what what, int index)<br>
&gt; =C2=A0{<br>
&gt; @@ -426,8 +432,10 @@ static TCGv gen_addr_index(DisasContext *s, uint1=
6_t ext, TCGv tmp)<br>
&gt; =C2=A0 =C2=A0 =C2=A0return add;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Handle a base + index + displacement effective addresss.<br>
&gt; -=C2=A0 =C2=A0A NULL_QREG base means pc-relative.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Handle a base + index + displacement effective addresss.<br>
&gt; + * A NULL_QREG base means pc-relative.<br>
&gt; + */<br>
&gt; =C2=A0static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, =
TCGv base)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint32_t offset;<br>
&gt; @@ -714,8 +722,10 @@ static inline int ext_opsize(int ext, int pos)<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Assign value to a register.=C2=A0 If the width is less than the re=
gister width<br>
&gt; -=C2=A0 =C2=A0only the low part of the register is set.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Assign value to a register.=C2=A0 If the width is less than the re=
gister width<br>
&gt; + * only the low part of the register is set.<br>
&gt; + */<br>
&gt; =C2=A0static void gen_partset_reg(int opsize, TCGv reg, TCGv val)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv tmp;<br>
&gt; @@ -743,8 +753,10 @@ static void gen_partset_reg(int opsize, TCGv reg,=
 TCGv val)<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Generate code for an &quot;effective address&quot;.=C2=A0 Does not=
 adjust the base<br>
&gt; -=C2=A0 =C2=A0register for autoincrement addressing modes.=C2=A0 */<br=
>
&gt; +/*<br>
&gt; + * Generate code for an &quot;effective address&quot;.=C2=A0 Does not=
 adjust the base<br>
&gt; + * register for autoincrement addressing modes.<br>
&gt; + */<br>
&gt; =C2=A0static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 int mode, int reg0, int opsize)<br>
&gt; =C2=A0{<br>
&gt; @@ -817,9 +829,11 @@ static TCGv gen_lea(CPUM68KState *env, DisasConte=
xt *s, uint16_t insn,<br>
&gt; =C2=A0 =C2=A0 =C2=A0return gen_lea_mode(env, s, mode, reg0, opsize);<b=
r>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Generate code to load/store a value from/into an EA.=C2=A0 If WHAT=
 &gt; 0 this is<br>
&gt; -=C2=A0 =C2=A0a write otherwise it is a read (0 =3D=3D sign extend, -1=
 =3D=3D zero extend).<br>
&gt; -=C2=A0 =C2=A0ADDRP is non-null for readwrite operands.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Generate code to load/store a value from/into an EA.=C2=A0 If WHAT=
 &gt; 0 this is<br>
&gt; + * a write otherwise it is a read (0 =3D=3D sign extend, -1 =3D=3D ze=
ro extend).<br>
&gt; + * ADDRP is non-null for readwrite operands.<br>
&gt; + */<br>
&gt; =C2=A0static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int =
mode, int reg0,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int opsize, TCGv val, TCGv *addrp, ea_what what,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int index)<br>
&gt; @@ -1012,7 +1026,8 @@ static void gen_load_fp(DisasContext *s, int ops=
ize, TCGv addr, TCGv_ptr fp,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_st_i64(t64, fp, offsetof(FPR=
eg, l.lower));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case OS_PACKED:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unimplemented data type on 68040/ColdF=
ire<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unimplemented data type on 68040/=
ColdFire<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME if needed for another FPU<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exception(s, s-&gt;base.pc_next,=
 EXCP_FP_UNIMP);<br>
&gt; @@ -1066,7 +1081,8 @@ static void gen_store_fp(DisasContext *s, int op=
size, TCGv addr, TCGv_ptr fp,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st64(t64, tmp, index);<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case OS_PACKED:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unimplemented data type on 68040/ColdF=
ire<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unimplemented data type on 68040/=
ColdFire<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME if needed for another FPU<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exception(s, s-&gt;base.pc_next,=
 EXCP_FP_UNIMP);<br>
&gt; @@ -1212,7 +1228,8 @@ static int gen_ea_mode_fp(CPUM68KState *env, Dis=
asContext *s, int mode,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp=
_free_i64(t64);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case OS_PACKED:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* unimplemen=
ted data type on 68040/ColdFire<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unimp=
lemented data type on 68040/ColdFire<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME=
 if needed for another FPU<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exce=
ption(s, s-&gt;base.pc_next, EXCP_FP_UNIMP);<br>
&gt; @@ -1299,9 +1316,11 @@ static void gen_cc_cond(DisasCompare *c, DisasC=
ontext *s, int cond)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 14: /* GT (!(Z || (N ^ V))) */<br>
&gt; =C2=A0 =C2=A0 =C2=A0case 15: /* LE (Z || (N ^ V)) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Logic operations clear V, which simpli=
fies LE to (Z || N),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and since Z and N are co-loc=
ated, this becomes a normal<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comparison vs N.=C2=A0 */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Logic operations clear V, which s=
implifies LE to (Z || N),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and since Z and N are co-located,=
 this becomes a normal<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* comparison vs N.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op =3D=3D CC_OP_LOGIC) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c-&gt;v1 =3D QREG_CC_N=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcond =3D TCG_COND_LE;=
<br>
&gt; @@ -1549,9 +1568,11 @@ DISAS_INSN(undef_fpu)<br>
&gt;<br>
&gt; =C2=A0DISAS_INSN(undef)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 /* ??? This is both instructions that are as yet unimpl=
emented<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for the 680x0 series, as well as those tha=
t are implemented<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0but actually illegal for CPU32 or pre-6802=
0.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ??? This is both instructions that are as yet u=
nimplemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* for the 680x0 series, as well as those that are=
 implemented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* but actually illegal for CPU32 or pre-68020.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;Illegal instruction=
: %04x @ %08x\n&quot;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nsn, s-&gt;base.pc_next);<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_exception(s, s-&gt;base.pc_next, EXCP_ILLEGAL)=
;<br>
&gt; @@ -1655,7 +1676,8 @@ static void bcd_add(TCGv dest, TCGv src)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv t0, t1;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /*=C2=A0 dest10 =3D dest10 + src10 + X<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* dest10 =3D dest10 + src10 + X<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D src<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2 =3D t1 + 0x066<br=
>
&gt; @@ -1667,7 +1689,8 @@ static void bcd_add(TCGv dest, TCGv src)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 return t3 - t7<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* t1 =3D (src + 0x066) + dest + X<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* t1 =3D (src + 0x066) + dest + X<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =3D result with some possible exce=
ding 0x6<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -1680,20 +1703,23 @@ static void bcd_add(TCGv dest, TCGv src)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* we will remove exceding 0x6 where there is no c=
arry */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* t0 =3D (src + 0x0066) ^ dest<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* t0 =3D (src + 0x0066) ^ dest<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =3D t1 without carries<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_xor_i32(t0, t0, dest);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* extract the carries<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* extract the carries<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * t0 =3D t0 ^ t1<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =3D only the carries<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_xor_i32(t0, t0, t1);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* generate 0x1 where there is no carry<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* generate 0x1 where there is no carry<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * and for each 0x10, generate a 0x6<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -1704,7 +1730,8 @@ static void bcd_add(TCGv dest, TCGv src)<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_add_i32(dest, dest, t0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_temp_free(t0);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* remove the exceding 0x6<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* remove the exceding 0x6<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * for digits that have not generated a carry<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -1716,7 +1743,8 @@ static void bcd_sub(TCGv dest, TCGv src)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv t0, t1, t2;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /*=C2=A0 dest10 =3D dest10 - src10 - X<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 dest10 =3D dest10 - src10 - X<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bcd_add(de=
st + 1 - X, 0x199 - src)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -1741,7 +1769,8 @@ static void bcd_sub(TCGv dest, TCGv src)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_xor_i32(t0, t1, t2);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* t2 =3D ~t0 &amp; 0x110<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* t2 =3D ~t0 &amp; 0x110<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * t0 =3D (t2 &gt;&gt; 2) | (t2 &gt;&gt; 3)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * to fit on 8bit operands, changed in:<br>
&gt; @@ -2029,8 +2058,10 @@ DISAS_INSN(movem)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* pre-decrement is no=
t allowed */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto do_addr_fault;<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We want a bare copy of the address reg=
, without any pre-decrement<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adjustment, as gen_lea would=
 provide.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We want a bare copy of the addres=
s reg, without any pre-decrement<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* adjustment, as gen_lea would prov=
ide.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; @@ -2072,7 +2103,8 @@ DISAS_INSN(movem)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tcg_gen_sub_i32(addr, addr, incr);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (reg0 + 8 =3D=3D i &amp;&amp;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0m68k_feature(s-&gt;env, M68K_FEATURE_EXT_FULL)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* M68020+: if the addressing register is the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0* M68020+: if the addressing register is the<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * register moved to memory, the value written<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * is the initial value decremented by the size of<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * the operation, regardless of how many actual<br>
&gt; @@ -2413,7 +2445,8 @@ DISAS_INSN(cas)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0cmp =3D gen_extend(s, DREG(ext, 0), opsize, 1);<br=
>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* if=C2=A0 &lt;EA&gt; =3D=3D Dc then<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* if=C2=A0 &lt;EA&gt; =3D=3D Dc then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0&lt;EA&gt; =3D Du<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0Dc =3D &lt;EA&gt; (because &=
lt;EA&gt; =3D=3D Dc)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * else<br>
&gt; @@ -2466,7 +2499,8 @@ DISAS_INSN(cas2w)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr2 =3D DREG(ext2, 12);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* if (R1) =3D=3D Dc1 &amp;&amp; (R2) =3D=3D Dc2 then<b=
r>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* if (R1) =3D=3D Dc1 &amp;&amp; (R2) =3D=3D Dc2 t=
hen<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0(R1) =3D Du1<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0(R2) =3D Du2<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * else<br>
&gt; @@ -2516,7 +2550,8 @@ DISAS_INSN(cas2l)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr2 =3D DREG(ext2, 12);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* if (R1) =3D=3D Dc1 &amp;&amp; (R2) =3D=3D Dc2 then<b=
r>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* if (R1) =3D=3D Dc1 &amp;&amp; (R2) =3D=3D Dc2 t=
hen<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0(R1) =3D Du1<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0(R2) =3D Du2<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * else<br>
&gt; @@ -2597,7 +2632,8 @@ DISAS_INSN(negx)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_flush_flags(s); /* compute old Z */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Perform substract with borrow.<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Perform substract with borrow.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * (X, N) =3D=C2=A0 -(src + X);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -2609,7 +2645,8 @@ DISAS_INSN(negx)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Compute signed-overflow for negation.=C2=A0 The norm=
al formula for<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Compute signed-overflow for negation.=C2=A0 The=
 normal formula for<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * subtraction is (res ^ src) &amp; (src ^ dest), =
but with dest=3D=3D0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * this simplies to res &amp; src.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; @@ -2844,8 +2881,10 @@ DISAS_INSN(mull)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_cc_op(s, CC_OP_FLAGS);<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The upper 32 bits of the product are d=
iscarded, so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muls.l and mulu.l are functi=
onally equivalent.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The upper 32 bits of the product =
are discarded, so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* muls.l and mulu.l are functionall=
y equivalent.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mul_i32(DREG(ext, 12), src1,=
 DREG(ext, 12));<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_logic_cc(s, DREG(ext, 12), OS_LO=
NG);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -2938,8 +2977,10 @@ DISAS_INSN(jump)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv tmp;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Load the target address first to ensure correct exce=
ption<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0behavior.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Load the target address first to ensure correct=
 exception<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* behavior.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0tmp =3D gen_lea(env, s, insn, OS_LONG);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (IS_NULL_QREG(tmp)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_addr_fault(s);<br>
&gt; @@ -2976,8 +3017,10 @@ DISAS_INSN(addsubq)<br>
&gt; =C2=A0 =C2=A0 =C2=A0dest =3D tcg_temp_new();<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_i32(dest, src);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((insn &amp; 0x38) =3D=3D 0x08) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t update condition codes if th=
e destination is an<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0address register.=C2=A0 */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Don&#39;t update condition codes =
if the destination is an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* address register.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (insn &amp; 0x0100) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_sub_i32(dest, =
dest, val);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -3110,7 +3153,8 @@ static inline void gen_subx(DisasContext *s, TCG=
v src, TCGv dest, int opsize)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_flush_flags(s); /* compute old Z */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Perform substract with borrow.<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Perform substract with borrow.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * (X, N) =3D dest - (src + X);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -3320,7 +3364,8 @@ static inline void gen_addx(DisasContext *s, TCG=
v src, TCGv dest, int opsize)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_flush_flags(s); /* compute old Z */<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Perform addition with carry.<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Perform addition with carry.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * (X, N) =3D src + dest + X;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;<br>
&gt; @@ -3404,9 +3449,11 @@ static inline void shift_im(DisasContext *s, ui=
nt16_t insn, int opsize)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shri_i32(QREG_CC_C, reg, bit=
s - count);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shli_i32(QREG_CC_N, reg, cou=
nt);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note that ColdFire always clears V (do=
ne above),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while M68000 sets if the mos=
t significant bit is changed at<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any time during the shift op=
eration */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that ColdFire always clears =
V (done above),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* while M68000 sets if the most sig=
nificant bit is changed at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any time during the shift operati=
on.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!logical &amp;&amp; m68k_feature=
(s-&gt;env, M68K_FEATURE_M68000)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if shift count &gt;=
=3D bits, V is (reg !=3D 0) */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &gt;=3D bits=
) {<br>
&gt; @@ -3451,9 +3498,11 @@ static inline void shift_reg(DisasContext *s, u=
int16_t insn, int opsize)<br>
&gt; =C2=A0 =C2=A0 =C2=A0s64 =3D tcg_temp_new_i64();<br>
&gt; =C2=A0 =C2=A0 =C2=A0s32 =3D tcg_temp_new();<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* Note that m68k truncates the shift count modulo 64, =
not 32.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0In addition, a 64-bit shift makes it easy =
to find &quot;the last<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bit shifted out&quot;, for the carry flag.=
=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Note that m68k truncates the shift count modulo=
 64, not 32.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* In addition, a 64-bit shift makes it easy to fi=
nd &quot;the last<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* bit shifted out&quot;, for the carry flag.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_i32(s32, DREG(insn, 9), 63);<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_extu_i32_i64(s64, s32);<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_extu_i32_i64(t64, reg);<br>
&gt; @@ -3480,7 +3529,8 @@ static inline void shift_reg(DisasContext *s, ui=
nt16_t insn, int opsize)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_movcond_i32(TCG_COND_NE, QRE=
G_CC_X, s32, QREG_CC_V,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QREG_CC_C, QREG_CC_X);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* M68000 sets V if the most significant =
bit is changed at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* M68000 sets V if the most signifi=
cant bit is changed at<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * any time during the shift operati=
on.=C2=A0 Do this via creating<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * an extension of the sign bit, com=
paring, and discarding<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the bits below the sign bit.=C2=
=A0 I.e.<br>
&gt; @@ -3576,9 +3626,11 @@ DISAS_INSN(shift_mem)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shri_i32(QREG_CC_C, src, 15)=
;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_shli_i32(QREG_CC_N, src, 1);=
<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note that ColdFire always clears V,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while M68000 sets if the mos=
t significant bit is changed at<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any time during the shift op=
eration */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that ColdFire always clears =
V,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* while M68000 sets if the most sig=
nificant bit is changed at<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* any time during the shift operati=
on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!logical &amp;&amp; m68k_feature=
(s-&gt;env, M68K_FEATURE_M68000)) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D gen_extend(s, =
src, OS_WORD, 1);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_xor_i32(QREG_C=
C_V, QREG_CC_N, src);<br>
&gt; @@ -3996,9 +4048,11 @@ DISAS_INSN(bfext_reg)<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv tmp =3D tcg_temp_new();<br>
&gt; =C2=A0 =C2=A0 =C2=A0TCGv shift;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* In general, we&#39;re going to rotate the field so t=
hat it&#39;s at the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0top of the word and then right-shift by th=
e complement of the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0width to extend the field.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* In general, we&#39;re going to rotate the field=
 so that it&#39;s at the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* top of the word and then right-shift by the com=
plement of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* width to extend the field.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (ext &amp; 0x20) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Variable width.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ext &amp; 0x800) {<br>
&gt; @@ -4028,8 +4082,10 @@ DISAS_INSN(bfext_reg)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D tmp;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos =3D 32 - len;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Immediate offset.=C2=A0 =
If the field doesn&#39;t wrap around the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end of the wor=
d, rely on (s)extract completely.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Immediate offset.=
=C2=A0 If the field doesn&#39;t wrap around the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* end of the word, re=
ly on (s)extract completely.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pos &lt; 0) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_=
rotli_i32(tmp, src, ofs);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D =
tmp;<br>
&gt; @@ -4890,7 +4946,8 @@ static void gen_op_fmove_fcr(CPUM68KState *env, =
DisasContext *s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0addr =3D tcg_temp_new();<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_i32(addr, tmp);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* mask:<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* mask:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * 0b100 Floating-Point Control Register<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * 0b010 Floating-Point Status Register<br>
&gt; @@ -4958,7 +5015,8 @@ static void gen_op_fmovem(CPUM68KState *env, Dis=
asContext *s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (!is_load &amp;&amp; (mode &amp; 2) =3D=3D 0) {=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* predecrement addressing mode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* predecrement addressing mode<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * only available to store register =
to memory<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opsize =3D=3D OS_EXTENDED) {<br>
&gt; @@ -4988,8 +5046,10 @@ static void gen_op_fmovem(CPUM68KState *env, Di=
sasContext *s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0tcg_temp_free(tmp);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* ??? FP exceptions are not implemented.=C2=A0 Most exceptions are d=
eferred until<br>
&gt; -=C2=A0 =C2=A0immediately before the next FP instruction is executed.=
=C2=A0 */<br>
&gt; +/*<br>
&gt; + * ??? FP exceptions are not implemented.=C2=A0 Most exceptions are d=
eferred until<br>
&gt; + * immediately before the next FP instruction is executed.<br>
&gt; + */<br>
&gt; =C2=A0DISAS_INSN(fpu)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0uint16_t ext;<br>
&gt; @@ -5513,8 +5573,10 @@ DISAS_INSN(mac)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D gen_lea(env, s, insn, OS_LON=
G);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D tcg_temp_new();<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_and_i32(addr, tmp, QREG_MAC_=
MASK);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Load the value now to ensure correct e=
xception behavior.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Perform writeback after read=
ing the MAC inputs.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Load the value now to ensure corr=
ect exception behavior.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Perform writeback after reading t=
he MAC inputs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loadval =3D gen_load(s, OS_LONG, add=
r, 0, IS_USER(s));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acc ^=3D 1;<br>
&gt; @@ -5635,8 +5697,10 @@ DISAS_INSN(mac)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv rw;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rw =3D (insn &amp; 0x40) ? AREG(insn=
, 9) : DREG(insn, 9);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mov_i32(rw, loadval);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: Should address writeback happen=
 with the masked or<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unmasked value?=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* FIXME: Should address writeback h=
appen with the masked or<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unmasked value?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((insn &gt;&gt; 3) &amp; 7) {=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 3: /* Post-increment.=C2=A0 */<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_addi_i32(AREG(=
insn, 0), addr, 4);<br>
&gt; @@ -5786,8 +5850,10 @@ register_opcode (disas_proc proc, uint16_t opco=
de, uint16_t mask)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opcode, mask);<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
&gt; =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 /* This could probably be cleverer.=C2=A0 For now just optimiz=
e the case where<br>
&gt; -=C2=A0 =C2=A0 =C2=A0the top bits are known.=C2=A0 */<br>
&gt; +=C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0* This could probably be cleverer.=C2=A0 For now just op=
timize the case where<br>
&gt; +=C2=A0 =C2=A0* the top bits are known.<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0/* Find the first zero bit in the mask.=C2=A0 */<br>
&gt; =C2=A0 =C2=A0i =3D 0x8000;<br>
&gt; =C2=A0 =C2=A0while ((i &amp; mask) !=3D 0)<br>
&gt; @@ -5805,17 +5871,22 @@ register_opcode (disas_proc proc, uint16_t opc=
ode, uint16_t mask)<br>
&gt; =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* Register m68k opcode handlers.=C2=A0 Order is important.<br>
&gt; -=C2=A0 =C2=A0Later insn override earlier ones.=C2=A0 */<br>
&gt; +/*<br>
&gt; + * Register m68k opcode handlers.=C2=A0 Order is important.<br>
&gt; + * Later insn override earlier ones.<br>
&gt; + */<br>
&gt; =C2=A0void register_m68k_insns (CPUM68KState *env)<br>
&gt; =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 /* Build the opcode table only once to avoid<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0multithreading issues. */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Build the opcode table only once to avoid<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* multithreading issues.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (opcode_table[0] !=3D NULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* use BASE() for instruction available<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* use BASE() for instruction available<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * for CF_ISA_A and M68000.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0#define BASE(name, opcode, mask) \<br>
&gt; @@ -6079,10 +6150,12 @@ static bool m68k_tr_breakpoint_check(DisasCont=
extBase *dcbase, CPUState *cpu,<br>
&gt; =C2=A0 =C2=A0 =C2=A0DisasContext *dc =3D container_of(dcbase, DisasCon=
text, base);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0gen_exception(dc, dc-&gt;base.pc_next, EXCP_DEBUG)=
;<br>
&gt; -=C2=A0 =C2=A0 /* The address covered by the breakpoint must be includ=
ed in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[tb-&gt;pc, tb-&gt;pc + tb-&gt;size) in or=
der to for it to be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0properly cleared -- thus we increment the =
PC here so that<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0the logic setting tb-&gt;size below does t=
he right thing.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* The address covered by the breakpoint must be i=
ncluded in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* [tb-&gt;pc, tb-&gt;pc + tb-&gt;size) in order t=
o for it to be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* properly cleared -- thus we increment the PC he=
re so that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the logic setting tb-&gt;size below does the ri=
ght thing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0dc-&gt;base.pc_next +=3D 2;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; @@ -6101,7 +6174,8 @@ static void m68k_tr_translate_insn(DisasContextB=
ase *dcbase, CPUState *cpu)<br>
&gt; =C2=A0 =C2=A0 =C2=A0dc-&gt;base.pc_next =3D dc-&gt;pc;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (dc-&gt;base.is_jmp =3D=3D DISAS_NEXT) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Stop translation when the next insn mi=
ght touch a new page.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Stop translation when the next in=
sn might touch a new page.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This ensures that prefetch aborts=
 at the right place.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We cannot determine the size of t=
he next insn without<br>
&gt; @@ -6144,8 +6218,10 @@ static void m68k_tr_tb_stop(DisasContextBase *d=
cbase, CPUState *cpu)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_lookup_and_goto_ptr();<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case DISAS_EXIT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We updated CC_OP and PC in gen_exit_tb=
, but also modified<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0other state that may require=
 returning to the main loop.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We updated CC_OP and PC in gen_ex=
it_tb, but also modified<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* other state that may require retu=
rning to the main loop.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_exit_tb(NULL, 0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; -- <br>
&gt; 2.21.0<br>
&gt;<br>
&gt;<br>
&gt;<br>
</p>

--0000000000003cde4e058ab07cfd--

