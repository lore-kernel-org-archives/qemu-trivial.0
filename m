Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zfaep-0001fD-Aj
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 17:35:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfaem-0001dl-9p
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfaej-0008DZ-3x
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:35:52 -0400
Received: from mail-vk0-f50.google.com ([209.85.213.50]:34389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zfaei-0008D5-T1
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 17:35:48 -0400
Received: by vkhf67 with SMTP id f67so63913331vkh.1
	for <qemu-trivial@nongnu.org>; Fri, 25 Sep 2015 14:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FLrYs/bDLQiWnDvmUDQh5xEvez+RtZQ5YkEWAi7RJRM=;
	b=cGVRvmDd+UtmguLFeGt1SDwveINHNgpMRBHj8Nt61s2lSaVSCsFHpQcGYIgyNt2ky9
	bmdJR9bWLi387B8MZRolZKY1cLpS5UXYqvRzjbo90n4Q1X1McxejRYXYbMalM2Dd/MV1
	Mo0OrHa3BqY08E83uWlobK7xEhrgFjsuBufAjJJzFwtQPQcyVyvCnbW37ThNdSXKILS3
	rQ8NaIpV6FU0JGa2ju1h/zJMLw0wDrU6WBi9GeKQiS2nCAAdRL7fVbX7xtsJlbnthSUl
	fIsc/65RqzOLLvoCGsU0oz6COANKL/Ee2qWVVQg2+b4iOLUPi8k4Qw24w9FICazoYrdN
	cwbQ==
X-Gm-Message-State: ALoCoQmA5fCGnr6mhif0qqfQQsDo6fzRXLZOQJF9RJxs+kgUQ7fBR9vyJ750JxG6kUuulf/G15kO
X-Received: by 10.31.131.141 with SMTP id f135mr4612377vkd.37.1443216948416;
	Fri, 25 Sep 2015 14:35:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 25 Sep 2015 14:35:29 -0700 (PDT)
In-Reply-To: <1443170278-9318-2-git-send-email-shraddha.6596@gmail.com>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<1443170278-9318-2-git-send-email-shraddha.6596@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2015 14:35:29 -0700
Message-ID: <CAFEAcA_nyj0km+a4OV6aCRFXS-i-LY0z2jwR8=6UUrD8Lr_6fg@mail.gmail.com>
To: Shraddha Barke <shraddha.6596@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.50
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
	kvm-devel <kvm@vger.kernel.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] Hw: timer: Remove
	unnecessary variable
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
X-List-Received-Date: Fri, 25 Sep 2015 21:35:53 -0000

On 25 September 2015 at 01:37, Shraddha Barke <shraddha.6596@gmail.com> wrote:
> Compress lines and remove the variable ret.
>
> Change made using Coccinelle script

> diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
> index 459c748..ba01050 100644
> --- a/hw/timer/tusb6010.c
> +++ b/hw/timer/tusb6010.c
> @@ -321,7 +321,6 @@ static uint32_t tusb_async_readw(void *opaque, hwaddr addr)
>      TUSBState *s = (TUSBState *) opaque;
>      int offset = addr & 0xfff;
>      int epnum;
> -    uint32_t ret;
>
>      switch (offset) {
>      case TUSB_DEV_CONF:
> @@ -338,12 +337,11 @@ static uint32_t tusb_async_readw(void *opaque, hwaddr addr)
>          return 0x00;   /* TODO */
>
>      case TUSB_DEV_OTG_STAT:
> -        ret = s->otg_status;
>  #if 0
>          if (!(s->prcm_mngmt & TUSB_PRCM_MNGMT_OTG_VBUS_DET_EN))
>              ret &= ~TUSB_DEV_OTG_STAT_VBUS_VALID;
>  #endif
> -        return ret;
> +        return s->otg_status;
>      case TUSB_DEV_OTG_TIMER:
>          return s->otg_timer_val;
>

This change would break the #if-0'd out code if we ever reenabled it.

-- PMM

