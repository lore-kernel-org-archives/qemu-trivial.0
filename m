Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFMVv-0002kd-14
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 07:42:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMVs-0002hY-Pk
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:42:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMVm-0004YB-PL
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:42:00 -0500
Received: from mail-la0-f48.google.com ([209.85.215.48]:45778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMVm-0004Xv-I1
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:41:54 -0500
Received: by mail-la0-f48.google.com with SMTP id pv20so3973109lab.7
	for <qemu-trivial@nongnu.org>; Sun, 25 Jan 2015 04:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k7wcsMqpENFHniUObqrlwIfaRdlawP+kKB7JR0JnDhk=;
	b=Iev9dij8J7icqVBaJg5iErxP39SbWOOhefmZihLbMl/k8PH4GVCUddWfCVO24UhxbJ
	3wD7cAb79UF2thlAd9/BgsovU7ylmKolcAid+Map4qBg8yfKDgOUBTr3YJ5ae7C+68CP
	5kmOQxcRka+oYC7b0WyWuKXQdyD9ivYkAr2ggFdORCsHhZKP5OK1DDzUAMRpj/id4nL1
	CyPkb2c5W1rP2/skpZpFtftlA9TBCLAdKis6ugHl9IxnZwLm6S9wJBuJZAVS3wnFbVxt
	B0JXfG2qZbNwTSRoPaXHwGybGNZjE5+mPPnE2QlrVhkrBjQukyDltL402VMIPtF2CgHI
	mRQQ==
X-Gm-Message-State: ALoCoQloZCe2u1VTgX6jEVE9bn8shT2ZUuU4diV3wMQVfLYXwziyY1iQIohqdVFhXAvk0myEjhXK
X-Received: by 10.152.26.98 with SMTP id k2mr16558379lag.53.1422189713628;
	Sun, 25 Jan 2015 04:41:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Sun, 25 Jan 2015 04:41:33 -0800 (PST)
In-Reply-To: <54C4CD81.10503@sunrus.com.cn>
References: <54C4CD81.10503@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jan 2015 12:41:33 +0000
Message-ID: <CAFEAcA-eDC=KCDV9n2w=Jwq9Z0so0V9Gagqja6GP++PyAe027w@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	David Gilbert <david.gilbert@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/main.c: Remove redundant
	end_exclusive() in arm_kernel_cmpxchg64_helper()
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
X-List-Received-Date: Sun, 25 Jan 2015 12:42:01 -0000

On 25 January 2015 at 11:03, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> start/end_exclusive() need be pairs, except the start_exclusive() in
> stop_all_tasks() which is only used by force_sig(), which will be abort.
> So at present, start_exclusive() in stop_all_task() need not be paired.
>
> queue_signal() may call force_sig(), or return after kill pid (or queue
> signal). If could return from queue_signal(), stop_all_task() would not
> be called in time, the next end_exclusive() would be issue.
>
> So in arm_kernel_cmpxchg64_helper() for ARM, need remove end_exclusive()
> after queue_signal(). The related commit: "97cc756 linux-user: Implement
> new ARM 64 bit cmpxchg kernel helper".
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/main.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 8c70be4..2d52c1f 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -523,8 +523,6 @@ segv:
>      info.si_code = TARGET_SEGV_MAPERR;
>      info._sifields._sigfault._addr = env->exception.vaddress;
>      queue_signal(env, info.si_signo, &info);
> -
> -    end_exclusive();
>  }
>
>  /* Handle a jump to the kernel code page.  */

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

