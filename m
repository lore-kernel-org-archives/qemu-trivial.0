Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsMug-0003xs-Q6
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jul 2020 04:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsMue-0003rp-R9
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2020 04:55:44 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsMub-0002Ip-RB
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2020 04:55:44 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so31110504otc.3
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2020 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Mc6QkVGztUHRVv7JVFrwV2ydiuq16uYtp70AA4SOLI=;
 b=LBzm+oYaap+xrpETICMJOA2s5usV9WEZWaxDwWheQb9/XkPZi7C88FNeugw6qoMdX2
 XuyPxKvwFZirSB5xl+LYgcpXzjMdR8PE7FbN6o9yVntXRVAkDiHCBDlQ7Bc2C4G9p+Ve
 /dwebyYgatu7uYl4BKuysevjnSolHzEP2mDflBY9uFoxASLMvDHc3FAzV3AZmrQWu/jT
 CtoJrcnSVUbBQy1JEl8TsGFXv4FYBODUG8/4G1o5KcHXMEdgzuoWkSUW9a+rybfA7Gt6
 eCU3cGkTfEirZXuaNldKV/y/Xzjkm5lD80gtrgGqI2lza6owWPAuo8n3dEe045b7wJe5
 ysbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Mc6QkVGztUHRVv7JVFrwV2ydiuq16uYtp70AA4SOLI=;
 b=F0I6aYmeGyeNxYnhKtlRVNyokshL+yJPrfMoiTjIIproSLKV5Q3wGt3U15SDjd+wu4
 G63vPdwTYRuwkQvTUI8UBQVUCrymXXSO7EjM1WF8+ZMiK1QbSKxvEgwvNmeHGYfI/sm3
 yhotliJLQ+B8gkVpUvtGh7R9nGoBgs9IdVNQFOWjXh92wFhxvURO1tuKTzItaoNO86K/
 UDLx638DDK0D2MgGhHRBxkbPGYE/q/DCAby6beuZUfV8QfaPmtnil6c8moooQliel7f/
 8p2sZqojw1AVmUt6PF5/xRhE5mbTv7jrrPkk/O0KzsQsGCOisUdrUPMaAJpeFI8PY7C+
 3bpQ==
X-Gm-Message-State: AOAM533SGBMCmRa0bWWtH8kqi2ZcQdo0C6+CsMcCgUl7Z+Bu5KfUD9Yp
 kXRuJ9fWAa31jEhGDxr6xMV3rcJNmQgE9nRZdrL/yg==
X-Google-Smtp-Source: ABdhPJxJdxNdMWiihVU6OjTkg6NmcLtQAEo4p4odUyPUQ22VkN7YW41/aPGBnIMJsUFTsujhIGK8PAs+81jTOwjkIXA=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr37933392ota.91.1594025740325; 
 Mon, 06 Jul 2020 01:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200629160535.3910-1-wentong.wu@intel.com>
 <20200629160535.3910-3-wentong.wu@intel.com>
 <3260735e-05ab-2d42-f7e4-914ad804f543@linaro.org>
 <CAFEAcA_+e7hrA5GRGb=gv3GxJRL77ARP34vyudRbiqhdsNVKwg@mail.gmail.com>
 <CAMo8BfLVDEFCXWNffVJaRb31UOTPO1iXNz5StexoKvWqQYzg6g@mail.gmail.com>
 <CAMo8Bf+Fk32dYH6GV6Z6OWLsnpJy4Sw_ny+8yviQc6MjGD+mRw@mail.gmail.com>
In-Reply-To: <CAMo8Bf+Fk32dYH6GV6Z6OWLsnpJy4Sw_ny+8yviQc6MjGD+mRw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 09:55:29 +0100
Message-ID: <CAFEAcA_nLDvPs-X-3krwC183f8hwm5kYYpxgz4f2r-Z4BKByQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/nios2: Use gen_io_start around wrctl
 instruction
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Marek Vasut <marex@denx.de>, Wentong Wu <wentong.wu@intel.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Wulff <crwulff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
X-List-Received-Date: Mon, 06 Jul 2020 08:55:45 -0000

On Sun, 5 Jul 2020 at 21:54, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Sun, Jul 5, 2020 at 11:16 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Sun, Jul 5, 2020 at 10:09 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On Thu, 2 Jul 2020 at 19:53, Richard Henderson
> > > <richard.henderson@linaro.org> wrote:
> > > > This isn't right.  Not so much the gen_io_start portion, but the entire
> > > > existence of helper_check_interrupt.
> > > I agree that it looks bogus (xtensa has a similar helper as well, incidentally),
> > I think there was a reason for it.
>
> ...and the reason is that this helper calls cpu_[re]set_interrupt
> to update CPU_INTERRUPT_HARD, which makes exit to the
> main CPU loop do something to handle IRQ.
> Maybe 'check_interrupt' is not a good name for that, but the
> action taken there seems right to me.

Usually I would expect that CPU_INTERRUPT_HARD would be
set by whatever was setting the interrupt (often a handler
for an inbound qemu_irq line to the CPU). Then the
cpu_exec_interrupt hook only actually does something if
both the INTERRUPT_HARD bit is set and the CPU register
says "and interrupts are unmasked". If you have a design
like that then "unmasking interrupts just means going out
to the main loop" will work.

thanks
-- PMM

