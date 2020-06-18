Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlyNv-00077N-Om
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 13:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlyNu-00075y-Nj
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 13:31:30 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlyNs-000659-Ng
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 13:31:30 -0400
Received: by mail-oi1-x241.google.com with SMTP id p70so5788977oic.12
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2020 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYo/8dEkQPbznU3Hgsd/Q+vVlaDQBNLUYuA7Gg5b94o=;
 b=BctRJGFsemWIdjZOarhzxgAQNoZ56ipMhjy0chZV7rJykt1ISVj6oPbk2HiKIKhb3P
 KUUwIJjdbr6G52UGdmqdgZroszUa6q3liPQIDa6Obb6ij2Ta6/g9mTQKZvbxVkD0KevP
 xshQzoMT4hFj+D6UN4Dmg8JpRoVVaYO9soi9IGaEdlCEXaR/pfe6slX7Xxv1wUiQ3M5l
 awqPwVt09vgYvTzaX1ZTaKMV6CACT4KooqR93sbijCCjZM7eU4oi6hx603Zmqd62WHR+
 rwGfcXfxGvSDlonm2SBlGrwtlmu1qhGEo0spBBMw985eARCEMFBsEI46c+ImAUykxr7u
 QznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYo/8dEkQPbznU3Hgsd/Q+vVlaDQBNLUYuA7Gg5b94o=;
 b=R0aYx1/fdutuvg8faGzaPliQ23L2ea1OZjCDH3OLtSYA24kqnQSW0YHAjpGPIY+M6o
 C9hHMTRppWgWGS+JSPo/nKAjiAkst35Ce+xaWD35q8y3OTcRkeRu9Awk4lGZS3s5VJyb
 eFT85wKliG4ifh3N7mVNAc0VBFJTRJzLR7XBo35E1xRd4sRvonk3rqgbV8RJc61epv6r
 qYo8Ost+DuYrk2Yjf8UL7hneoRpT4pAb5aqwHJqs8azTqy9OPs/jk1sThie2X7z4TR2A
 El97JIX0ve2Zn6fab+TBQzMzPemEpcuqQ105Bluk6bw6FuiUwdRLBzPHGn8zzuD/gXdy
 QsfA==
X-Gm-Message-State: AOAM532SKL0Ol9/hk/cMJIX8DwL/H/JXzH/PYmfiMcipeFg5nWwnVzdz
 oN6v6pJFnhhwhrAex69IqPaqr9cAjyZ3sgEsPvjp9w==
X-Google-Smtp-Source: ABdhPJxjogvK7Xqv7n/JQlHZVniXRZtSqVeee/nHU76UYb7t7+qdfkUZ+stKmPitV5/41knz4YR9222cPeVWTsWQ5Kc=
X-Received: by 2002:aca:568c:: with SMTP id k134mr3713036oib.48.1592501487423; 
 Thu, 18 Jun 2020 10:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200618114129.5636-1-wentong.wu@intel.com>
In-Reply-To: <20200618114129.5636-1-wentong.wu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 18:31:16 +0100
Message-ID: <CAFEAcA9-HH44cXohDGAVeidN48n8LgDEkhbnmcnqKVTsEN=hOg@mail.gmail.com>
Subject: Re: [PATCH] target/nios2: Use gen_io_start/end around wrctl
 instruction.
To: wentongw <wentong.wu@intel.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 18 Jun 2020 17:31:31 -0000

On Thu, 18 Jun 2020 at 04:50, wentongw <wentong.wu@intel.com> wrote:
>
> From: Wentong Wu <wentong.wu@intel.com>
>
> wrctl instruction on nios2 target will cause checking cpu interrupt,
> but tcg_handle_interrupt() will call cpu_abort() if the CPU gets an
> interrupt while it's not in a 'can do IO' state, so around wrctl
> instruction add gen_io_start/end.
>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  target/nios2/translate.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index e17656e6..deaefcaf 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -32,6 +32,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "exec/translator.h"
>  #include "qemu/qemu-print.h"
> +#include "exec/gen-icount.h"
>
>  /* is_jmp field values */
>  #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
> @@ -518,7 +519,13 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
>      /* If interrupts were enabled using WRCTL, trigger them. */
>  #if !defined(CONFIG_USER_ONLY)
>      if ((instr.imm5 + CR_BASE) == CR_STATUS) {
> +        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
>          gen_helper_check_interrupts(dc->cpu_env);
> +        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
> +            gen_io_end();
> +        }

You also need to end the TB, which we should do whether
we're using icount or not. This is awkward because nios2 has
not correctly implemented the DISAS_UPDATE that is the right
way to do that. So you'll need some preliminary patches:

Patch 1: Implement and use DISAS_NORETURN
 + the current places in t_gen_helper_raise_exception() and
   gen_exception() that set dc->is_jmp = DISAS_UPDATE
   should instead set it to DISAS_NORETURN. (This is because
   they both call gen_helper_raise_exception() and at runtime
   execution will never return from that helper call.)
 + In gen_intermediate_code(), in the "switch (dc->is_jmp)"
   you need a new "case DISAS_NORETURN:" which goes with
   DISAS_TB_JUMP as another kind of "nothing more to generate".

Patch 2: Make DISAS_UPDATE write PC back to CPU state
 + Move the "case DISAS_UPDATE:" from being like DISAS_JUMP
   up so it does the same thing as DISAS_NEXT (ie explicitly
   writes the PC back into the cpu state before doing a
   tcg_gen_exit_tb()). This is OK because patch 1 removed
   the only two previous users of it, so we don't break
   anything by bringing its semantics into line with how
   most targets use it.

Patch 3: this patch to use gen_io_start/end
 + You can now put "dc->is_jmp = DISAS_UPDATE;" inside the
   "is this a CR_STATUS write" if() block, which should
   cause the wrctl to always end the TB.

thanks
-- PMM

