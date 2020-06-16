Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlDgp-0007rE-GX
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2020 11:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlDgo-0007pK-0a
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 11:39:54 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlDgk-0007jr-5J
 for qemu-trivial@nongnu.org; Tue, 16 Jun 2020 11:39:53 -0400
Received: by mail-oo1-xc42.google.com with SMTP id 127so1869991ooc.9
 for <qemu-trivial@nongnu.org>; Tue, 16 Jun 2020 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQjhk2kW5iuW9MHP9wBoBAZ1jJ2lH2MO8EKv2KNe6zo=;
 b=w0szmhycnCTpx7bWpj/ia6KqpVs5mfvgZamu0MBn6YwR+5MXnbbBCWbjFkru57++nL
 LGsGJaKJDIpryHMwD2v5DnwCPTXdqHD4ONybd64QdHlIjJzDVMxV6H/k6pv8Xl8YwQen
 Sguv5STI+I9zym0SJvTwJZA1LpNPOV0ke3KZ+W3eh97sNgv3qhEGHDDIo2Xb+zH9zwec
 228NoM1jb+3jgGhqZNyuSMaebN4Wdp9cvtBaBige8Q6pT8FnEahqNZb2S4pJw1riXWPq
 bDrZb+EXp/C9us9JdjkBgp+EMroDk+Q/ogZU8Gxnr1jrSzhCAhrvHHVlZ3BUS42ApkmE
 iiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQjhk2kW5iuW9MHP9wBoBAZ1jJ2lH2MO8EKv2KNe6zo=;
 b=bDPcvQrU/mr/lCSbRRP458LYwhxmNaPlpoT5eM4PBM4A1Is2K926knaUryZtN7Un3B
 fvR6avXQHDK2wIkgClmC7zZOl7bxFnCk8wlib7PCHaiHq+UDkj4aWKTQGjmzBVvGblXf
 04BnhmNBhKuQ7TqOdHYDShyVrUbxgw5LObIFOstD69JtsGDcrofFElLFtftna4EUW9ES
 nNYC0ZuyVGe3bDAw6an9hqFjotcDYq64skom+2abjiV3B+nY3NuQPObIX39z8QeyQ9+E
 9NbYNFdtkXdUvQ88zRIpm06hgtBESpPF3GRLoxa2/+UnG6Yj6/3MHsIK4uNuY6I8lqBe
 jLIg==
X-Gm-Message-State: AOAM533zZ5g3SNnpOEEVVc4HQgFO3s+rtvEF/A+E0IghEvFm0Hv9UfNj
 trPVkJ/wLK1z7DCG8SaXo5J2OBhqDJQb1ByRrKTYbw==
X-Google-Smtp-Source: ABdhPJzsZimVol6g4a0CgVucJ3ETZVhGAa8y+gifdoWy0VsgFXdxXY02Yeub5i/+Cz/Up4d/rZJCGMb5kSuN8Kf1mEk=
X-Received: by 2002:a4a:9528:: with SMTP id m37mr2840833ooi.85.1592321988743; 
 Tue, 16 Jun 2020 08:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200611081319.1864-1-wentong.wu@intel.com>
In-Reply-To: <20200611081319.1864-1-wentong.wu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 16:39:37 +0100
Message-ID: <CAFEAcA_oQ7X9COCPnoarrKfGtXD4CVKs7MAjWq-i_8yc5jTtDA@mail.gmail.com>
Subject: Re: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE
 disabled
To: wentongw <wentong.wu@intel.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
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
X-List-Received-Date: Tue, 16 Jun 2020 15:39:54 -0000

On Thu, 11 Jun 2020 at 01:23, wentongw <wentong.wu@intel.com> wrote:
>
> Update interrupt request when external interupt pends for STATUS_PIE
> disabled. Otherwise on icount enabled nios2 target there will be cpu
> abort when guest code changes state register with wrctl instruction.
>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  hw/nios2/cpu_pic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c
> index 1c1989d5..2abc8fa8 100644
> --- a/hw/nios2/cpu_pic.c
> +++ b/hw/nios2/cpu_pic.c
> @@ -42,6 +42,8 @@ static void nios2_pic_cpu_handler(void *opaque, int irq=
, int level)
>          } else if (!level) {
>              env->irq_pending =3D 0;
>              cpu_reset_interrupt(cs, type);
> +        } else {
> +            cs->interrupt_request |=3D type;
>          }

Thanks for the clarification in your other email about the
issue you're trying to address:

> I=E2=80=99m running icount mode on qemu_nios2 with customized platform
> but cpu abort happened(qemu: fatal: Raised interrupt while not
> in I/O function) when guest code changes state register with wrctl
> instruction add some debug code finding that it=E2=80=99s caused by the
> interrupt_request mismatch.

I don't think the change you've made is the correct fix.
Setting cs->interrupt_request like this is pretty much
the same thing that calling cpu_interrupt() does, so
what your patch is doing is essentially "ignore the
status.PIE bit and always deliver interrupts", which isn't
how the hardware behaves.

The assertion you've run into is saying "some instruction caused us
to take an interrupt, but it wasn't marked up to indicate that it
might cause a side effect". (This only matters in icount mode, where
we insist that we never get unexpected sideeffects like this.) If
the guest writes to status.PIE to unmask interrupts that's the kind
of thing that will cause an interrupt to be taken, so the problem
really here is that the nios2 translate.c code hasn't indicated
that this insn can do this.

The right fix here will be that target/nios2/translate.c
needs to do this:
    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
        gen_io_start();
    }
before generating code for an insn like this one, and then
    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
        gen_io_end();
    }
after it. (Compare the xtensa target which does a similar
kind of thing for its interrupt handling.)
For wrctl to STATUS it should I think also end the TB,
because we want to actually take any pending interrupt
now, not in a few instructions time when the next branch
comes along.

The fact that the current nios2 code has no calls to
gen_io_start() in it at all (apart from one in boilerplate
code) suggests to me that this target is simply broken
for use with -icount at the moment. There may well be
other bugs of a similar kind where particular insns that
cause interrupts or touch devices (any equivalent to the
x86 in/out insns, for instance) also need to be marked up
as IO.

(Beyond that, the way that nios2_check_interrupts() works
looks weird; in an ideal world it would be rewritten to
work in a way that's more in line with how we'd write that
kind of code today. It should be possible to get it to work with
icount without getting into that kind of refactoring/rework,
though.)

thanks
-- PMM

