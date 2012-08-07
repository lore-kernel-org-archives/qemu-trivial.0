Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SycTd-0006OG-LW
	for mharc-qemu-trivial@gnu.org; Tue, 07 Aug 2012 01:37:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SycTa-0006Lt-JO
	for qemu-trivial@nongnu.org; Tue, 07 Aug 2012 01:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SycTX-0007Nr-Qy
	for qemu-trivial@nongnu.org; Tue, 07 Aug 2012 01:37:06 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:46181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SycTX-0007Ni-L6
	for qemu-trivial@nongnu.org; Tue, 07 Aug 2012 01:37:03 -0400
Received: by yenm4 with SMTP id m4so854464yen.4
	for <qemu-trivial@nongnu.org>; Mon, 06 Aug 2012 22:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:from:to:cc:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding
	:x-gm-message-state;
	bh=1Srydmk/SMULYK3IEQvj6y3R6P0ZOX8eJAfnGU9lV9c=;
	b=NM/5gff2bs3dzi7yo0Q3if0BmI9EOjw9JQqTgYQpxPZgjwgIyQ3HNlhX6MHLMm7k2L
	UQ9Kv5xVCFHCk/RLO/Gor2+pIDiADnbvBdCNcOgNWS3p4Hgl7kDDk7BFcmQyihftYcoM
	7CmwFWBFPPRCGFM4wjT0JvOpkCwEM8c+dwj3GigFbVS/ZH0uTYfuXcn4Oc6u9sqoJyoa
	/ZdLeiyJLjVjzTHcf0rDMMk7FXCkHaL499u897hCDeICUhIRPuuCHL4b8zX+k+Y0UcLm
	Ppr4XtM1PyaxFwSLwqZpBfW5GNV2PtXs8Zq/UiRFnn/p40RDj6i5D/EcsnzWUbLhDJQI
	NJgg==
Received: by 10.66.81.232 with SMTP id d8mr23481308pay.66.1344317822315;
	Mon, 06 Aug 2012 22:37:02 -0700 (PDT)
Received: from [192.168.1.15] ([124.148.20.9])
	by mx.google.com with ESMTPS id gh9sm10445314pbc.20.2012.08.06.22.36.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 22:37:01 -0700 (PDT)
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1344271338-17688-1-git-send-email-peter.maydell@linaro.org>
References: <1344271338-17688-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Aug 2012 15:36:11 +1000
Message-ID: <1344317771.14961.0.camel@PetaLogix-ws2>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQnARvl0taD9AZr1PY6OwZaFh5um2y4xN8slJcN0h2ScgDO6RE1hfUjqYXmpqyUQkj3qTG/8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] target-arm: Fix typos in comments
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
X-List-Received-Date: Tue, 07 Aug 2012 05:37:08 -0000

On Mon, 2012-08-06 at 17:42 +0100, Peter Maydell wrote:
> Fix a variety of typos in comments in target-arm files.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@petalogix.com>

> ---
> Changes v1->v2: s/inputs values/input values/
> 
>  target-arm/arm-semi.c    |    2 +-
>  target-arm/cpu.h         |    2 +-
>  target-arm/helper.c      |    6 +++---
>  target-arm/neon_helper.c |   26 +++++++++++++-------------
>  target-arm/op_helper.c   |    2 +-
>  target-arm/translate.c   |   10 +++++-----
>  6 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
> index 88ca9bb..2495206 100644
> --- a/target-arm/arm-semi.c
> +++ b/target-arm/arm-semi.c
> @@ -281,7 +281,7 @@ uint32_t do_arm_semihosting(CPUARMState *env)
>              return len - ret;
>          }
>      case TARGET_SYS_READC:
> -       /* XXX: Read from debug cosole. Not implemented.  */
> +       /* XXX: Read from debug console. Not implemented.  */
>          return 0;
>      case TARGET_SYS_ISTTY:
>          if (use_gdb_syscalls()) {
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 191895c..d7f93d9 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -79,7 +79,7 @@ struct arm_boot_info;
>  typedef struct CPUARMState {
>      /* Regs for current mode.  */
>      uint32_t regs[16];
> -    /* Frequently accessed CPSR bits are stored separately for efficiently.
> +    /* Frequently accessed CPSR bits are stored separately for efficiency.
>         This contains all the other bits.  Use cpsr_{read,write} to access
>         the whole CPSR.  */
>      uint32_t uncached_cpsr;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 5727da2..dceaa95 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -988,7 +988,7 @@ static void ttbr164_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>  }
>  
>  static const ARMCPRegInfo lpae_cp_reginfo[] = {
> -    /* NOP AMAIR0/1: the override is because these clash with tha rather
> +    /* NOP AMAIR0/1: the override is because these clash with the rather
>       * broadly specified TLB_LOCKDOWN entry in the generic cp_reginfo.
>       */
>      { .name = "AMAIR0", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 0,
> @@ -2899,8 +2899,8 @@ uint32_t HELPER(logicq_cc)(uint64_t val)
>      return (val >> 32) | (val != 0);
>  }
>  
> -/* VFP support.  We follow the convention used for VFP instrunctions:
> -   Single precition routines have a "s" suffix, double precision a
> +/* VFP support.  We follow the convention used for VFP instructions:
> +   Single precision routines have a "s" suffix, double precision a
>     "d" suffix.  */
>  
>  /* Convert host exception flags to vfp form.  */
> diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
> index e0b9dbf..8bb5129 100644
> --- a/target-arm/neon_helper.c
> +++ b/target-arm/neon_helper.c
> @@ -530,7 +530,7 @@ NEON_VOP(rshl_s16, neon_s16, 2)
>  #undef NEON_FN
>  
>  /* The addition of the rounding constant may overflow, so we use an
> - * intermediate 64 bits accumulator.  */
> + * intermediate 64 bit accumulator.  */
>  uint32_t HELPER(neon_rshl_s32)(uint32_t valop, uint32_t shiftop)
>  {
>      int32_t dest;
> @@ -547,8 +547,8 @@ uint32_t HELPER(neon_rshl_s32)(uint32_t valop, uint32_t shiftop)
>      return dest;
>  }
>  
> -/* Handling addition overflow with 64 bits inputs values is more
> - * tricky than with 32 bits values.  */
> +/* Handling addition overflow with 64 bit input values is more
> + * tricky than with 32 bit values.  */
>  uint64_t HELPER(neon_rshl_s64)(uint64_t valop, uint64_t shiftop)
>  {
>      int8_t shift = (int8_t)shiftop;
> @@ -590,7 +590,7 @@ NEON_VOP(rshl_u16, neon_u16, 2)
>  #undef NEON_FN
>  
>  /* The addition of the rounding constant may overflow, so we use an
> - * intermediate 64 bits accumulator.  */
> + * intermediate 64 bit accumulator.  */
>  uint32_t HELPER(neon_rshl_u32)(uint32_t val, uint32_t shiftop)
>  {
>      uint32_t dest;
> @@ -608,8 +608,8 @@ uint32_t HELPER(neon_rshl_u32)(uint32_t val, uint32_t shiftop)
>      return dest;
>  }
>  
> -/* Handling addition overflow with 64 bits inputs values is more
> - * tricky than with 32 bits values.  */
> +/* Handling addition overflow with 64 bit input values is more
> + * tricky than with 32 bit values.  */
>  uint64_t HELPER(neon_rshl_u64)(uint64_t val, uint64_t shiftop)
>  {
>      int8_t shift = (uint8_t)shiftop;
> @@ -817,7 +817,7 @@ NEON_VOP_ENV(qrshl_u16, neon_u16, 2)
>  #undef NEON_FN
>  
>  /* The addition of the rounding constant may overflow, so we use an
> - * intermediate 64 bits accumulator.  */
> + * intermediate 64 bit accumulator.  */
>  uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shiftop)
>  {
>      uint32_t dest;
> @@ -846,8 +846,8 @@ uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shiftop
>      return dest;
>  }
>  
> -/* Handling addition overflow with 64 bits inputs values is more
> - * tricky than with 32 bits values.  */
> +/* Handling addition overflow with 64 bit input values is more
> + * tricky than with 32 bit values.  */
>  uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop)
>  {
>      int8_t shift = (int8_t)shiftop;
> @@ -914,7 +914,7 @@ NEON_VOP_ENV(qrshl_s16, neon_s16, 2)
>  #undef NEON_FN
>  
>  /* The addition of the rounding constant may overflow, so we use an
> - * intermediate 64 bits accumulator.  */
> + * intermediate 64 bit accumulator.  */
>  uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t valop, uint32_t shiftop)
>  {
>      int32_t dest;
> @@ -942,8 +942,8 @@ uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t valop, uint32_t shift
>      return dest;
>  }
>  
> -/* Handling addition overflow with 64 bits inputs values is more
> - * tricky than with 32 bits values.  */
> +/* Handling addition overflow with 64 bit input values is more
> + * tricky than with 32 bit values.  */
>  uint64_t HELPER(neon_qrshl_s64)(CPUARMState *env, uint64_t valop, uint64_t shiftop)
>  {
>      int8_t shift = (uint8_t)shiftop;
> @@ -1671,7 +1671,7 @@ uint64_t HELPER(neon_negl_u64)(uint64_t x)
>      return -x;
>  }
>  
> -/* Saturnating sign manuipulation.  */
> +/* Saturating sign manipulation.  */
>  /* ??? Make these use NEON_VOP1 */
>  #define DO_QABS8(x) do { \
>      if (x == (int8_t)0x80) { \
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 490111c..d77bfab 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -99,7 +99,7 @@ void tlb_fill(CPUARMState *env1, target_ulong addr, int is_write, int mmu_idx,
>  }
>  #endif
>  
> -/* FIXME: Pass an axplicit pointer to QF to CPUARMState, and move saturating
> +/* FIXME: Pass an explicit pointer to QF to CPUARMState, and move saturating
>     instructions into helper.c  */
>  uint32_t HELPER(add_setq)(uint32_t a, uint32_t b)
>  {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 29008a4..985e007 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -53,7 +53,7 @@ typedef struct DisasContext {
>      int condjmp;
>      /* The label that will be jumped to when the instruction is skipped.  */
>      int condlabel;
> -    /* Thumb-2 condtional execution bits.  */
> +    /* Thumb-2 conditional execution bits.  */
>      int condexec_mask;
>      int condexec_cond;
>      struct TranslationBlock *tb;
> @@ -77,7 +77,7 @@ static uint32_t gen_opc_condexec_bits[OPC_BUF_SIZE];
>  #endif
>  
>  /* These instructions trap after executing, so defer them until after the
> -   conditional executions state has been updated.  */
> +   conditional execution state has been updated.  */
>  #define DISAS_WFI 4
>  #define DISAS_SWI 5
>  
> @@ -155,7 +155,7 @@ static void load_reg_var(DisasContext *s, TCGv var, int reg)
>  {
>      if (reg == 15) {
>          uint32_t addr;
> -        /* normaly, since we updated PC, we need only to add one insn */
> +        /* normally, since we updated PC, we need only to add one insn */
>          if (s->thumb)
>              addr = (long)s->pc + 2;
>          else
> @@ -4897,7 +4897,7 @@ static int disas_neon_data_insn(CPUARMState * env, DisasContext *s, uint32_t ins
>                      size--;
>              }
>              shift = (insn >> 16) & ((1 << (3 + size)) - 1);
> -            /* To avoid excessive dumplication of ops we implement shift
> +            /* To avoid excessive duplication of ops we implement shift
>                 by immediate using the variable shift operations.  */
>              if (op < 8) {
>                  /* Shift by immediate:
> @@ -6402,7 +6402,7 @@ static void gen_logicq_cc(TCGv_i64 val)
>  
>  /* Load/Store exclusive instructions are implemented by remembering
>     the value/address loaded, and seeing if these are the same
> -   when the store is performed. This should be is sufficient to implement
> +   when the store is performed. This should be sufficient to implement
>     the architecturally mandated semantics, and avoids having to monitor
>     regular stores.
>  



