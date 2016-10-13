Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1budOD-0006TG-Fa
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 06:37:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOB-0006S2-DK
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOA-0005d1-Ft
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:27 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOA-0005cp-BB
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:26 -0400
Received: by mail-vk0-x22e.google.com with SMTP id 83so49399896vkd.0
	for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2016 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/velosxWmcqblZlYTiq/6m1mgcpV+meR8khGn1/rrcI=;
	b=f4pA4UJ2s9698daNOdFy9Veg9BOlhNUXc/M63MBEUXuH+WuukBDfWPSGBT7FxUGPpz
	OTA2S84Jumip8BmChuOMi0kWMMbSdMT68+WzeD+pFAogIHIQ9++BEH70CcErOUbStGQd
	xSQeDl+lOUNXbW5dINIH6m7GZjgfdUJ/km940=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/velosxWmcqblZlYTiq/6m1mgcpV+meR8khGn1/rrcI=;
	b=RbWRfh6j2RbKBP0+ZHk4J5zK9kOhVfIKqLf+Puk1tXUf8AfLz50E9FLmSGIaFBR/jv
	Q2E9gE0a6eV0kjFYVnYWOvVyl+Eb8swlbquR6OemMka7wzAYrjxsavRYCIyf4XpwXy4g
	i9u+zy/4cQd8j0s5RpXF6rESu1flM7GIroUvTLPJO7cWw+QOvBAoBeIFBXfoz16H5ke+
	iGyCQsC0NenHbW+pxWela9SYetHGvAF0wrt3s8ts4+x+41f3xjItVwOGFfMDbL+kVYdA
	xektLtz9Z/7G7Sgkvm7irfc2sOXA36XFx4aeYeqHUbtUdhTn5migizR7/n9O7QfRlj9/
	BKng==
X-Gm-Message-State: AA6/9RlXDdsqPWk4K1upoz9j4YApmTgcECkymqunk4Q1nU22EJ2j+pgBgUZKw+tIRL0RISXuzQFq0uoMF4hOnBe1
X-Received: by 10.31.11.82 with SMTP id 79mr2528790vkl.165.1476355045973; Thu,
	13 Oct 2016 03:37:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 03:37:05 -0700 (PDT)
In-Reply-To: <1476311708-14792-3-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
	<1476311708-14792-3-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 11:37:05 +0100
Message-ID: <CAFEAcA-_BeR06Vmzj_ndh6pS+mXNe9L5cy_YPz-8GrsAoVwfvA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-trivial] [PATCH 3/4] lm32: milkymist-tmu2: fix integer
 overflow
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
X-List-Received-Date: Thu, 13 Oct 2016 10:37:28 -0000

On 12 October 2016 at 23:35, Michael Walle <michael@walle.cc> wrote:
> Don't truncate the multiplication and do a 64 bit one instead because
> because the result is stored in a 64 bit variable.
>
> Spotted by coverity, CID 1167561.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  hw/display/milkymist-tmu2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
> index 9c00184..5c666f9 100644
> --- a/hw/display/milkymist-tmu2.c
> +++ b/hw/display/milkymist-tmu2.c
> @@ -213,7 +213,7 @@ static void tmu2_start(MilkymistTMU2State *s)
>      /* Read the QEMU source framebuffer into an OpenGL texture */
>      glGenTextures(1, &texture);
>      glBindTexture(GL_TEXTURE_2D, texture);
> -    fb_len = 2*s->regs[R_TEXHRES]*s->regs[R_TEXVRES];
> +    fb_len = 2ULL * s->regs[R_TEXHRES] * s->regs[R_TEXVRES];
>      fb = cpu_physical_memory_map(s->regs[R_TEXFBUF], &fb_len, 0);
>      if (fb == NULL) {
>          glDeleteTextures(1, &texture);
> --
> 2.1.4
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

