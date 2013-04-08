Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPIbz-00079y-69
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2013 16:24:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UPIbx-00079m-BE
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 16:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UPIbw-0004ff-Ap
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 16:24:17 -0400
Received: from mail-lb0-f178.google.com ([209.85.217.178]:57551)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UPIbw-0004fV-33
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 16:24:16 -0400
Received: by mail-lb0-f178.google.com with SMTP id q13so6162532lbi.37
	for <qemu-trivial@nongnu.org>; Mon, 08 Apr 2013 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qmRIdH4A3nvO7zjP0xzItLT7YFWri+qMTjTLaLZViuI=;
	b=Ga03BVeEWSrFGPt3Y6MoM2BVBdVyFAQ5cypWT9ObcQszSxfZ22ttaLhBPcXmJ/+145
	0QViKFb4KyBJssTzxPv5Mj8nWWgpr6x3mnyeG2pOGR1BSKfbaOMGQ/1uK1Vp5a6bKZSv
	WHb8qPt1FSJQ86u4Kbf0QlpZ9EN43sjoV9rzGUNoRqnHxglL3NESMR/aqRWMv+JnEYkW
	EGEFJ5zOt2VkvORI5MC/SfsF1mZUGbgpaSqYLDBH/3Ehbq7g/428lYx+Pnxv7sUclTjl
	zqNEU6w5HcmmbYDUb4mouW0YMfLFI1mGGdHvgLI8ejSUSBCQ4v0z8EL1OW7Aj6XxGDQ6
	KT8Q==
X-Received: by 10.112.125.33 with SMTP id mn1mr12394273lbb.89.1365452655033;
	Mon, 08 Apr 2013 13:24:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Mon, 8 Apr 2013 13:23:54 -0700 (PDT)
In-Reply-To: <1365445570-112217-1-git-send-email-petar.jovanovic@rt-rk.com>
References: <1365445570-112217-1-git-send-email-petar.jovanovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Apr 2013 21:23:54 +0100
Message-ID: <CAFEAcA9birgSLgTGyUMY+pbz3Dt6HRzu7HaZ2X47-cvaONq-hQ@mail.gmail.com>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQljRd8UOMTMx+Mk6zAxxWWW7hzyh+eZW62cI8YntlgqCg+OSWgIxllPxwlVHWsOW7A3eVzi
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.178
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
 host flags to eventfd2 call
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
X-List-Received-Date: Mon, 08 Apr 2013 20:24:18 -0000

On 8 April 2013 19:26, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote:
> This change makes conversion of TARGET_O_NONBLOCK and TARGET_O_CLOEXEC flags
> to host flags before calling eventfd for TARGET_NR_eventfd2.
>
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  linux-user/syscall.c |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ee82a2d..1f07621 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8823,8 +8823,17 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>  #endif
>  #if defined(TARGET_NR_eventfd2)
>      case TARGET_NR_eventfd2:
> -        ret = get_errno(eventfd(arg1, arg2));
> +    {
> +        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
> +        if (arg2 & TARGET_O_NONBLOCK) {
> +            host_flags |= O_NONBLOCK;
> +        }
> +        if (arg2 & TARGET_O_CLOEXEC) {
> +            host_flags |= O_CLOEXEC;
> +        }
> +        ret = get_errno(eventfd(arg1, host_flags));

I had to look it up, but this is OK because eventfd flags come
in two flavours: (a) those shared with the O_* fcntl flags, which
is just O_NONBLOCK and O_CLOEXEC at the moment and (b) those which
are not shared with the fcntl flags, which are the same value on
all targets. So it's correct to convert the two shared flags and
leave the rest alone.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

