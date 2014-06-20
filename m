Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WxvUi-0003cR-Rx
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jun 2014 05:52:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WxvUd-0003bl-30
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:52:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WxvUY-0003Hx-5V
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:52:23 -0400
Received: from mail-la0-f43.google.com ([209.85.215.43]:52663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WxvUX-0003Hd-Uq
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:52:18 -0400
Received: by mail-la0-f43.google.com with SMTP id e16so2226426lan.16
	for <qemu-trivial@nongnu.org>; Fri, 20 Jun 2014 02:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VGALDm4VEJyiNQA2gqfOda9sHe6o4hBfP6YBHDBz0pI=;
	b=gROGjilbdVJNWosKKPvZazJtJGkpdZ3zbA90glLZP+SN0EEIrIFLgE6uu28h31uy3a
	4l1HzYRoe1yvqtDMZMNbRSpM1d6ThS4TPwK+SbLGgNfNtZ5UsujIzC61ZelAKlLVApcQ
	eGGKX+VmIs7xlstFyyt0mI2XTHUdt3lHZ/zTEo+nKt8o3pEkPOuWo8SyN0wQvd8jtagr
	g8DfbyOwXyfKPVtmgzJuXCFMblgidgmtSEe23Mbl0RT4YH968mXZ5mnec0KcGj/bvlCd
	xXatqd/QBQAKalzSnfaFcvD3mU/wCcNFfynB4tLfDUh8DpN4LNGAX0ibVW1v5AbvZbX8
	NQ7w==
X-Gm-Message-State: ALoCoQkngpBkSCNkNjgfQxC5pcyh3UTzXSlmHS9GdUSQIYtHWz84lxv/NxC0T8NiUHRWwU88kymC
X-Received: by 10.152.6.131 with SMTP id b3mr1819798laa.9.1403257936585; Fri,
	20 Jun 2014 02:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Fri, 20 Jun 2014 02:51:56 -0700 (PDT)
In-Reply-To: <1403255644-16868-1-git-send-email-hunterlaux@gmail.com>
References: <1403255644-16868-1-git-send-email-hunterlaux@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jun 2014 10:51:56 +0100
Message-ID: <CAFEAcA_vy==mgFDUo6AMpUc_PZoZ8G=r8=ZLe1f0sGWCDhM_5Q@mail.gmail.com>
To: Hunter Laux <hunterlaux@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add support for the arm
	breakpoint syscall.
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
X-List-Received-Date: Fri, 20 Jun 2014 09:52:28 -0000

[cc'ing Riku as the linux-user maintainer.]

On 20 June 2014 10:14, Hunter Laux <hunterlaux@gmail.com> wrote:

Thanks for writing this patch. It mostly looks good
but there are some minor admin/format tweaks we need.

You need to provide a Signed-off-by: line here, or
we can't take this patch, I'm afraid. (We work the same
way as the Linux kernel for this; see
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297
for more details, but basically it says you wrote the code
and are willing to contribute it under our licensing terms.)

It could also use a little more explanation in the commit
message.

FWIW, this is an obscure syscall that dates back to before
the architecture provided an official breakpoint instruction;
apparently it's still used by Steel Bank Common Lisp.

This is the kernel implementation:
http://lxr.free-electrons.com/source/arch/arm/kernel/traps.c#L598

> ---
>  linux-user/arm/syscall.h | 1 +
>  linux-user/main.c        | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/linux-user/arm/syscall.h b/linux-user/arm/syscall.h
> index ce2c2a8..e0d2cc3 100644
> --- a/linux-user/arm/syscall.h
> +++ b/linux-user/arm/syscall.h
> @@ -29,6 +29,7 @@ struct target_pt_regs {
>  #define ARM_THUMB_SYSCALL      0
>
>  #define ARM_NR_BASE      0xf0000
> +#define ARM_NR_breakpoint (ARM_NR_BASE + 1)
>  #define ARM_NR_cacheflush (ARM_NR_BASE + 2)
>  #define ARM_NR_set_tls   (ARM_NR_BASE + 5)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a87c6f7..831b363 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -807,6 +807,9 @@ void cpu_loop(CPUARMState *env)
>                              cpu_set_tls(env, env->regs[0]);
>                              env->regs[0] = 0;
>                              break;
> +                        case ARM_NR_breakpoint:
> +                            env->regs[15] -= env->thumb ? 2 : 4;
> +                            goto excp_debug;
>                          default:
>                              gemu_log("qemu: Unsupported ARM syscall: 0x%x\n",
>                                       n);
> @@ -850,6 +853,7 @@ void cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_DEBUG:
> +            excp_debug:

The indent on this label isn't quite right; it should
be 4 columns to the left.

>              {
>                  int sig;

Those minor issues aside, the code looks right to me.

thanks
-- PMM

