Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH97R-0007wj-2q
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 06:52:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH97N-0007sS-O0
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 06:52:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH97M-0004Bc-L0
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 06:52:37 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aH97M-0004BJ-HO
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 06:52:36 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k1so172393777vkb.2
	for <qemu-trivial@nongnu.org>; Thu, 07 Jan 2016 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6Qz1pykjB57CYbiRK5lbeiYzEVkFbOrl8s0lidRffx4=;
	b=YXXwFCK/iP+4ml5FtlyV7LYNnhnW4M98AEPSAnBEXz8zNyi97chFcrXiIEcojYPSW4
	ieGRj5GF3MXo0NYzm0uPhbYufWQnp8iDj5Axjtcm65Q3R8o3xGIE47AuExSvtkxggOIo
	SWsDiK9O+E8g7EMhL/VIXEh4aUg0Op+fntSLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6Qz1pykjB57CYbiRK5lbeiYzEVkFbOrl8s0lidRffx4=;
	b=cspGSvlzLPnIhhO5zAvj4DTzGvZVGqcbrnFWzmoCAg5hXstGULdg/ys3sCtrCT10HK
	tXP0V3BwudMGCpmUMYj5ZlrHZCLXKW159BMQjyy2VNKnrwmiiHWyP9Mo/qYfHqCv304L
	Cf9/Qr/3nl05AYH09aaczwdiJf3ZrlfCqQsOD6sSm7y5/cDpYCzL8T1EcVvYcWu325x2
	/53DOmANUlqgkFucJkBkBOCkXrLdGUmryHQ0uusdpa7ENE+gKT6UxordjkE7YY+AdtQ5
	+78Lns125diGjXYz9l3uhOT5+L56j9KbcyV5Nyg4WDXsdMN0rDWqS0ozfXtAQKDNJvJ1
	jU5Q==
X-Gm-Message-State: ALoCoQkRMT7HvOCI9AcA+zNbJ9P87AXjnMZgoNyZefxE2NjDSJbMlysScaJDxJfnc/CtbhajZcQyUBaq+/Qld+epeO0xm8iOvyosJ0kaUcIAVUh0kzz2dyo=
X-Received: by 10.31.107.138 with SMTP id k10mr68435323vki.27.1452167556065;
	Thu, 07 Jan 2016 03:52:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 03:52:16 -0800 (PST)
In-Reply-To: <1451382673-5345-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1451382673-5345-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 11:52:16 +0000
Message-ID: <CAFEAcA8Vd8q5JXSwUaD6-i+Z4aHkO2NiXJ2TMSG3rfyXJijoQw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] linux-user: enable
 sigaltstack for all architectures
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
X-List-Received-Date: Thu, 07 Jan 2016 11:52:39 -0000

On 29 December 2015 at 09:51, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There is no reason to limit sigaltstack syscall to just a few
> architectures and pretend it is not implemented for others.
>
> If some architecture is not ready for this, that architecture
> should be fixed instead.
>
> This fixes LP#1516408.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> This patch depends on a previous patch I sent, "unicore32: convert
> get_sp_from_cpustate from macro to inline", or else unicore32-user
> wont build.
> ---
>  linux-user/syscall.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 6c64ba6..3ceb3e2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8292,14 +8292,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>          break;
>      }
>      case TARGET_NR_sigaltstack:
> -#if defined(TARGET_I386) || defined(TARGET_ARM) || defined(TARGET_MIPS) || \
> -    defined(TARGET_SPARC) || defined(TARGET_PPC) || defined(TARGET_ALPHA) || \
> -    defined(TARGET_M68K) || defined(TARGET_S390X) || defined(TARGET_OPENRISC)
>          ret = do_sigaltstack(arg1, arg2, get_sp_from_cpustate((CPUArchState *)cpu_env));
>          break;
> -#else
> -        goto unimplemented;
> -#endif
>
>  #ifdef CONFIG_SENDFILE
>      case TARGET_NR_sendfile:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

