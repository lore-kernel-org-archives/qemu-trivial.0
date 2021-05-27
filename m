Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmD5L-0003bL-Kb
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 06:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmD59-0003Uu-L2
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 06:17:40 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmD4z-0000pH-0r
 for qemu-trivial@nongnu.org; Thu, 27 May 2021 06:17:39 -0400
Received: by mail-ej1-x634.google.com with SMTP id e12so714703ejt.3
 for <qemu-trivial@nongnu.org>; Thu, 27 May 2021 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VSTSTaRAyRm4bQIpYIBj7B8Ir3wehYFEmAzYB6Ak1+g=;
 b=KXErUrG6mMI5qL36h10PGqqPc044jcxv0YwpNcC/wOMxVI/f5DvU50Ot+NnK/ausPv
 RQcu5+wtB8jbZEQGn3INuhS5nrOisghaiEP2tGWy9zxiH7gCq+hbns53aKnFoRDQrjkY
 d0H6hIJiX+hbaYa6p5803pNhZ9G8B750TS47tK16R6oO/b0udZYW8KA7CE7twwxBdIUA
 XpcyUGjlMovjtDjC49+wvqMKHgBpv7fH+/p174WHbe6axPLwr1v7E6exj+pEBj5UW/7d
 k5vbpLv5w3/L/sVHX3IVpQPj+az06R2CQs/Lm75uAeuCjMBt66WUiUtJAyU01Qt1i+XS
 Nw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VSTSTaRAyRm4bQIpYIBj7B8Ir3wehYFEmAzYB6Ak1+g=;
 b=X5Kre9tvn4FOPgWO5VYseUEoa8YhyteEDgHljiwuCc9hLKeMfpguiis/awFOH5NBzc
 dN4U6w4QBFJ83MWOlTLD/X9Z3lPpF56oluy7BO2P9iEXDxGfTHGFgN5xt+wVZZ2brGHq
 B1wR871z5vZgeYOODYRTagaXuXeRWwpzMlV4saxWYaoEw8U0lFUeMUqxRDGii56fRgn1
 bJP20AcbTIUy47CRM3dvsEgdYUP4LpHVYzeah4EkOyxZSOash6hCNwaWYS4AT8JT7lj3
 w4QB5nbLJYhYZdRn9i4jwTS2EpN1UGPS27G99STXs/HDNK/BJ3RespgorZLfFNo7nqiu
 IYeA==
X-Gm-Message-State: AOAM530RaCmfLs86OxH9ryswx4XWhweqF+ZBjVP604SYKAQbvFY6NPR4
 jkZhWawXYWezCsdXlLVQ+5pi2Ksdb3HCxYXHx0SOxA==
X-Google-Smtp-Source: ABdhPJy/KhsI4FYe1CZrdR6P1RZin3+aCjSe62t3qSNnzQYkRs3/o40J2qJHnAZNH7TOaZEnu13Knt2YkDA7QPEaP5E=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr2968148ejc.382.1622110641569; 
 Thu, 27 May 2021 03:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210524024655.11115-1-someguy@effective-light.com>
In-Reply-To: <20210524024655.11115-1-someguy@effective-light.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 11:16:56 +0100
Message-ID: <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 May 2021 10:17:40 -0000

On Mon, 24 May 2021 at 03:48, Hamza Mahfooz <someguy@effective-light.com> wrote:
>
> Use pthread_sigmask instead of sigprocmask inside process_pending_signals
> to ensure that race conditions aren't possible.
>
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  linux-user/signal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 7eecec46c4..81ff753c01 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1005,9 +1005,8 @@ void process_pending_signals(CPUArchState *cpu_env)
>      sigset_t *blocked_set;
>
>      while (qatomic_read(&ts->signal_pending)) {
> -        /* FIXME: This is not threadsafe.  */
>          sigfillset(&set);
> -        sigprocmask(SIG_SETMASK, &set, 0);
> +        pthread_sigmask(SIG_SETMASK, &set, 0);

We use sigprocmask() in plenty more places than this one in linux-user,
so it seems unlikely that the FIXME comment is simply noting that we've
used sigprocmask() rather than pthread_sigmask(). Indeed, the comment
dates back to before this function called sigprocmask() at all (the
sigprocmask() call was added in commit 3d3efba020da which just preserves
the FIXME comment.

So I think we cannot remove this FIXME comment like this: we need to
more carefully analyze the code/dig through the history to identify
what race condition/threadsafety issue the comment is attempting to
point out, because it's not "we didn't use pthread_sigmask()".

(As it happens, on Linux/glibc sigprocmask() is implemented as simply
calling pthread_sigmask():
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/sigprocmask.c;h=9dfd8076d12aff9014fa40f7e93111760a1a8bad;hb=HEAD
If we do want to change from sigprocmask() to pthread_sigmask(), we
should be consistent about doing that, not just change this call only.)

thanks
-- PMM

