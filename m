Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bL6Sf-00012n-Ud
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 06:23:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6Sc-00010N-UM
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 06:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6Sa-0007jS-SJ
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 06:23:09 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36562)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bL6Sa-0007jJ-NR
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 06:23:08 -0400
Received: by mail-vk0-x231.google.com with SMTP id m127so14264266vkb.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Jul 2016 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OezllrtH5rd/iDne6ssTcTSyZ/jzeQVDNAYqqOMQifY=;
	b=L2Wju7Lfdsn/DNTbI2Iinfg9TOTKlrhk+bIHBdFWurOBHtES5QeXbk4lJfBnJhDe9x
	dnGpCBMUJGmMdZtp0TrQi8lsSpokjtRfXJ27Nc10wZiceWR39Zv78OnKD6HUkHdSKHnd
	xUG28ZBTGIF5KkpwflgRQxLXWPNu1inIUr7yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OezllrtH5rd/iDne6ssTcTSyZ/jzeQVDNAYqqOMQifY=;
	b=IgFUu3PnQYK3BYexCSt0zhL6Tm5Hfg0VXd8PL1ES0m/fMRVmQweM1SSqeKUocDXda5
	qNYLLatHo3JRwhCfpWUSPbfFHGzAW83OEzh/kR4qQyPlbvnbNxS9ppHVXyDBXECGmvGR
	Y7NvIRTohnhVzxobE0VcKtFdLI1YXtBWThUyNdGcPbQqPH7MBbeM1dhCnex/DhudIcv7
	PeqNQ/uKHNBkNEzCoPoAGCq0NGAf1OYSb+5FJC6V2Rz/fx/5jotzu9AIFA9NY3GGkT0f
	JR9mzSzgEQMUNFfuJvvpWks+fZrTtBiaBUzqmalc+V+jpbIOII85ZNX3UFOtBV2bhl7B
	Tiew==
X-Gm-Message-State: ALyK8tLNC6kufu+7bhEhKpmh/t83Nlw9xyEGY/kSs/vs2Yxuf3gcZ2XxGG5WmrpDzyV6TpMLyEiqYxre9njBi8Oq
X-Received: by 10.31.96.207 with SMTP id u198mr9752587vkb.50.1467886987984;
	Thu, 07 Jul 2016 03:23:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Thu, 7 Jul 2016 03:22:48 -0700 (PDT)
In-Reply-To: <1467886558-4110-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1467886558-4110-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2016 11:22:48 +0100
Message-ID: <CAFEAcA8Ce--79Nr9fXAW5vDrCz1LHAPVgKeaATeRHgBUCKNBmA@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] timer.h: fix typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2016 10:23:12 -0000

On 7 July 2016 at 11:15, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  include/qemu/timer.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 309f3d0..41e8325 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -179,7 +179,7 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType type);
>   * qemu_clock_get_main_loop_timerlist:
>   * @type: the clock type
>   *
> - * Return the default timer list assocatiated with a clock.
> + * Return the default timer list associated with a clock.
>   *
>   * Returns: the default timer list
>   */
> @@ -509,7 +509,7 @@ static inline void timer_init_ms(QEMUTimer *ts, QEMUClockType type,
>   * @cb: the callback to be called when the timer expires
>   * @opaque: the opaque pointer to be passed to the callback
>   *
> - * Creeate a new timer and associate it with @timer_list.
> + * Create a new timer and associate it with @timer_list.
>   * The memory is allocated by the function.
>   *
>   * This is not the preferred interface unless you know you
> @@ -534,7 +534,7 @@ static inline QEMUTimer *timer_new_tl(QEMUTimerList *timer_list,
>   * @cb: the callback to be called when the timer expires
>   * @opaque: the opaque pointer to be passed to the callback
>   *
> - * Creeate a new timer and associate it with the default
> + * Create a new timer and associate it with the default
>   * timer list for the clock type @type.
>   *
>   * Returns: a pointer to the timer

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

