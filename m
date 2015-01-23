Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbMh-0005Mk-W7
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:21:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbMe-0005Ju-Q3
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:21:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbMW-00084U-NW
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:21:20 -0500
Received: from mail-lb0-f173.google.com ([209.85.217.173]:41428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbMW-00084M-G6
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:21:12 -0500
Received: by mail-lb0-f173.google.com with SMTP id p9so1936976lbv.4
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 02:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X01klX2lSVdkG6Z0QO2HedRpDHDdFXqhBVv5aGLgfQ0=;
	b=ZlF79/RNt7mwHmcCAlbA/YJ3BOqqCVlQfA9Qi7oUxPYciKwWjVbRpqkiS9I959EqVy
	rHJs41PcHWQGLe40Hegk16dViAMBHTQCuUAxXpoQK/k9/axTT+bwtUghJ2WQ42JYDSBF
	ikwHneoVPALnHtYdUZG8ztcAKfypsjjMTnW3WFdbnoCU4q3zBxtCznSt+lNshq3bVkas
	4Fxhvgf57di6WwZxHDxSvHXV1FeujD2kzVgPmFjbSVWWu0U2gl3GmY9yw5q/3bOCM5Sq
	Cy35gULlvGVrcDmx8ESUljY6lYcYOj/HbZz/LgYv6g0mcry22ZorywaEtWejI/H/pMS6
	XU7w==
X-Gm-Message-State: ALoCoQn0xI0s54EKMoGMezwlP4JVrXrJ+bAIm6jgTL7tt9JXsls2NOMa7BXmwYVD49+RadMR/vD8
X-Received: by 10.152.120.97 with SMTP id lb1mr6451150lab.76.1422008471625;
	Fri, 23 Jan 2015 02:21:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 02:20:51 -0800 (PST)
In-Reply-To: <54C21FB2.1050603@sunrus.com.cn>
References: <54C21FB2.1050603@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 10:20:51 +0000
Message-ID: <CAFEAcA-_D_yD2mYE_HC0+Dnz5QnFEo3cHcfkYZTZbKwS4QZNXQ@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/main.c: Remove
	redundant end_exclusive()
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
X-List-Received-Date: Fri, 23 Jan 2015 10:21:21 -0000

On 23 January 2015 at 10:17, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> start/end_exclusive() need be pairs, except the start_exclusive() in
> stop_all_tasks() which is only used by force_sig(), which will be abort.
> So at present, start_exclusive() in stop_all_task() need not be paired.
>
> So need remove end_exclusive() after queue_signal(). If could really
> return from queue_signal(), which meant stop_all_task() is not called (
> at least, not called in time), the next end_exclusive() would be issue.
>
> Also use TARGET_SIGSEGV instead of SIGSEGV, since queue_signal() is for
> TARGET_*, at present, queue_signal() is a normal function which may call
> force_sig(), or return (may kill pid or queue signal, then return).

It would be helpful to mention the affected target architecture
(and/or function name) in the commit message, because main.c covers
a lot of ground.

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/main.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 8c70be4..a410a17 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -517,14 +517,12 @@ segv:
>      end_exclusive();
>      /* We get the PC of the entry address - which is as good as anything,
>         on a real kernel what you get depends on which mode it uses. */
> -    info.si_signo = SIGSEGV;
> +    info.si_signo = TARGET_SIGSEGV;

I think this is a correct bug fix, but it's not really related
to the main point of the patch (fixing end_exclusive()) and
there are actually a lot of instances of it in this file and
possibly others. Could you fix it (and those others) in a separate
patch, please?

>      info.si_errno = 0;
>      /* XXX: check env->error_code */
>      info.si_code = TARGET_SEGV_MAPERR;
>      info._sifields._sigfault._addr = env->exception.vaddress;
>      queue_signal(env, info.si_signo, &info);
> -
> -    end_exclusive();
>  }

This change is correct.

thanks
-- PMM

