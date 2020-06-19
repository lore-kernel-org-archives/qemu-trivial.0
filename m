Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jmGKf-0002FS-PB
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jun 2020 08:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmGKe-0002Dg-6s
 for qemu-trivial@nongnu.org; Fri, 19 Jun 2020 08:41:20 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmGKc-0005P5-FD
 for qemu-trivial@nongnu.org; Fri, 19 Jun 2020 08:41:19 -0400
Received: by mail-ot1-x344.google.com with SMTP id k15so7149379otp.8
 for <qemu-trivial@nongnu.org>; Fri, 19 Jun 2020 05:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FgOloYroh81hNXQQf34Zmg1+3Jofiehb+dLqymRoUY=;
 b=O/zdCdgSLJt7ZNMitSI02DaND9GeqR7Q3ZuusmJVSY2VFbx4e8fVPdd9Di6FjNJlbj
 HFfTn7ZSsa7PnVwzwhZuLGgCYTSK8/D7ATYIxhQx6ohHbJQGf7sDI6OCtuyKLf/FQJSo
 93zrlQiTrJn5fcSB7KLOIYqZ6zQQg/BNyw7YnJDWt1CDprQa+ceLrrup6J52w+4cQQ1x
 1NUna8eSbBfdWvN7gk6vpNQH+rLUDiLPJT+YYpaTCMr70X3Dpn1s7YwYJSRl/dKTtTU2
 BsJLtlYSDo6ZCtmHzUsQw5YvC20MhVFdj0pO1Bb2LEjFqp/veBB63seYy/19pOd4d7Y9
 Uzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FgOloYroh81hNXQQf34Zmg1+3Jofiehb+dLqymRoUY=;
 b=POH04h7R/ptElkNLwPjlW5SiJdve08cUOI0BzG6J2t/TG8S6xfPoFR2ZYfQjE/QbMw
 r9DsBwpqhS/gKp9oQ1IC0mwDAOLS0M9NlIu6OFXOTlZwFU9K+hoDgxCkbUwZWuAiC/5x
 kZfUPdYhym+djn7xHCdF0LZP0YKTMdAzvKSaU4d96evgyQqJ+o9x4RpzBOWKgG4RD7pg
 4Wpm05Q7FZWGVORQoQL6+Ox7MbWkTkaVouKRSwhqlZu64bak6OfLeVwRiM48st8q7f+6
 FIptz3tSeMoLJ6IMu6dy51FojEDYE72B9gv1hEECHy/1myQYsPx5bM665DQq/r+WnsmR
 h6Yw==
X-Gm-Message-State: AOAM530oAi81udqQL56ergG3rpaFLbd0MKw/gM46NCxgYEQjj5RGGtYu
 Z2CcjncFmL5NipALF54Z8WIuD423HffFPvb1juRbbw==
X-Google-Smtp-Source: ABdhPJyfNUeY8MWsrQVmvWsMzjHZGnOSRvocsxg6bndRuz3PJ2+PuvbQPN51tjl147eA5bGPdtW64Y5NlYF4uUaPPwE=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr2787032oto.91.1592570477338; 
 Fri, 19 Jun 2020 05:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200618114129.5636-1-wentong.wu@intel.com>
 <CAFEAcA9-HH44cXohDGAVeidN48n8LgDEkhbnmcnqKVTsEN=hOg@mail.gmail.com>
In-Reply-To: <CAFEAcA9-HH44cXohDGAVeidN48n8LgDEkhbnmcnqKVTsEN=hOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 13:41:06 +0100
Message-ID: <CAFEAcA_FQy+hMkGf-gkgm=AEBk3HS1R0WT0maQ83fHw6M0WPRw@mail.gmail.com>
Subject: Re: [PATCH] target/nios2: Use gen_io_start/end around wrctl
 instruction.
To: wentongw <wentong.wu@intel.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Fri, 19 Jun 2020 12:41:20 -0000

On Thu, 18 Jun 2020 at 18:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Jun 2020 at 04:50, wentongw <wentong.wu@intel.com> wrote:
> >
> > From: Wentong Wu <wentong.wu@intel.com>
> >
> > wrctl instruction on nios2 target will cause checking cpu interrupt,
> > but tcg_handle_interrupt() will call cpu_abort() if the CPU gets an
> > interrupt while it's not in a 'can do IO' state, so around wrctl
> > instruction add gen_io_start/end.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > ---
> >  target/nios2/translate.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> > index e17656e6..deaefcaf 100644
> > --- a/target/nios2/translate.c
> > +++ b/target/nios2/translate.c
> > @@ -32,6 +32,7 @@
> >  #include "exec/cpu_ldst.h"
> >  #include "exec/translator.h"
> >  #include "qemu/qemu-print.h"
> > +#include "exec/gen-icount.h"
> >
> >  /* is_jmp field values */
> >  #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
> > @@ -518,7 +519,13 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
> >      /* If interrupts were enabled using WRCTL, trigger them. */
> >  #if !defined(CONFIG_USER_ONLY)
> >      if ((instr.imm5 + CR_BASE) == CR_STATUS) {
> > +        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
> > +            gen_io_start();
> > +        }
> >          gen_helper_check_interrupts(dc->cpu_env);
> > +        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
> > +            gen_io_end();
> > +        }
>
> You also need to end the TB, which we should do whether
> we're using icount or not. This is awkward because nios2 has
> not correctly implemented the DISAS_UPDATE that is the right
> way to do that.

After some further discussion with other maintainers abotu
the gen_io_start/gen_io_end semantics, it turns out that
I was wrong about the need for gen_io_end -- if you are
going to end the TB after the I/O instruction (which you are
in this case) then you do not need the gen_io_end() call,
it is handled automatically for you by common code. So
you can drop that bit from the next version of this patch.

Sorry for the confusion.

thanks
-- PMM

