Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeWa-0000JA-8K
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:39:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEeWT-0000GC-TS
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEeWL-000471-Ex
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:39:09 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:36131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WEeWL-00046b-81
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:39:01 -0500
Received: by mail-la0-f41.google.com with SMTP id mc6so10059311lab.14
	for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2014 04:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dyjqlEu7yiKIUrCYw/aKpO8tzvJx3ybpasksBRVLH+M=;
	b=lPn58IPEGfwrqKZ51GY0VfNZNNgK9Tm/brENGyAVEQp5p1hLZoRG4jN7/1j7yt4hk2
	iUIZJerqsUoSs2px+VmUNNJE/cGPaug2tgCwfCb+0eDAoVfnT1X3vkAbZlN+Qr4TnArj
	z0vWDjKFkEH2o+SPAHA/oE8KBy8ay5QerwAz6h6kClhTcY5cvQOf7ws8GVz2o1ujgVDI
	vwYH/3r39pBDznj5F5jXmYVSp7ZhvwjbP+aXXHCRu7j81/8GDGcR5bS8Fv7x+Xjda9B5
	qxa74qzK+6eFZe32HtHTmo9KuI+ca9x+Mtl94OmQvBewc9Za4VSfqNgdYX8qU+D6jb+u
	NWcg==
X-Gm-Message-State: ALoCoQlTwoF4aHcTneJPsYIyXk3cbytzRbCAexU9XbPSVOyLC3GpGVVoWY+VadsjwQtzvDlkg7Jg
X-Received: by 10.152.121.105 with SMTP id lj9mr1502548lab.37.1392467939907;
	Sat, 15 Feb 2014 04:38:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Sat, 15 Feb 2014 04:38:39 -0800 (PST)
In-Reply-To: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
References: <1392282978-19368-1-git-send-email-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Feb 2014 12:38:39 +0000
Message-ID: <CAFEAcA8Fw02CadHJ0TvBxoJgeXA5XtobSSKUf1-JaR7c22UcFg@mail.gmail.com>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/timer/grlib_gptimer:
	Avoid integer overflow
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
X-List-Received-Date: Sat, 15 Feb 2014 12:39:14 -0000

On 13 February 2014 09:16, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
> The GPTIMER uses 32-bit registers.  Use a 64-bit operation to get the
> ptimer count, otherwise we end up with a count of 0 for GPTIMER counter
> values of 0xffffffff.
> ---
>  hw/timer/grlib_gptimer.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
> index d5687f6..343563c 100644
> --- a/hw/timer/grlib_gptimer.c
> +++ b/hw/timer/grlib_gptimer.c
> @@ -106,9 +106,9 @@ static void grlib_gptimer_enable(GPTimer *timer)
>      /* ptimer is triggered when the counter reach 0 but GPTimer is triggered at
>         underflow. Set count + 1 to simulate the GPTimer behavior. */
>
> -    trace_grlib_gptimer_enable(timer->id, timer->counter + 1);
> +    trace_grlib_gptimer_enable(timer->id, timer->counter);

This change isn't mentioned in the commit message...

> -    ptimer_set_count(timer->ptimer, timer->counter + 1);
> +    ptimer_set_count(timer->ptimer, (uint64_t)timer->counter + 1);
>      ptimer_run(timer->ptimer, 1);
>  }

thanks
-- PMM

