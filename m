Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cerVq-0002Ks-S1
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 18:00:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cerVn-0002Ir-K7
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 18:00:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cerVk-0006Tl-BM
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 18:00:23 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cerVk-0006Tb-7W; Fri, 17 Feb 2017 18:00:20 -0500
Received: by mail-qk0-x242.google.com with SMTP id u25so8531778qki.2;
	Fri, 17 Feb 2017 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=afjJ3XbdSy7vNVsVnO3WZrTY7iopyOtOJvgyCs4oy28=;
	b=feMDtmC2BqhVRPg600Gr0QWAGXHPiuBfJLE2spyiQj1mlqZBpt20R371gdBk9Zq42L
	yB+43NOdVrucxFB+E0DLJKdgb/qYgiMn+fzHGL/nWR3JE1KWMCNGVTyBFb+/HLclnrtJ
	aWXNmrJfBOUlN3i5oh5smEPZ2pal5y40hzltQ/u12eSMM+B4LiMPzkNQ3J0G/bQmSTJb
	EHeyOh1BbED0K4jSZNI5Muetj4bcJ/zIu6Zh3yuuUZCQthHM9wWCFKft19Gjq65RQvWT
	gQrRJBNmjasWRL3mI9MqgXAV8JiE516cLuJ4pXGLqxBbtdlP8Ik45yRi/6kKQgHuWo2Q
	m2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=afjJ3XbdSy7vNVsVnO3WZrTY7iopyOtOJvgyCs4oy28=;
	b=WRvV0ru96QAQDrComg2VskIZz8wBh9jSJwDBJm/25U9rOqdb51xbm+OjBVFRRk/RCl
	d3LMwstlHEiIPX1yPfr67yQCEoGxJupHMvfb7wUh0MNCPB2v6p0xlUraSxTDilHPk5d0
	Na+OYhJ77gH+cST+i6MGSi3wFT4G1UfJU0EOjvzABxxhqXm+M/AEcwfxotDyNMVCesHs
	LAlI0uxD97Gcd8EfOZIb42YwEizhMX05gWKeHEHwbf7GS60Ja+v2lP+JZRxmvF90nbln
	GMoAzRCzkIVVx+hPN5IRltLvVM1IYwq/TAJ2JBXbSJezFXPp0NrK4vUDd/45dEIjbSxN
	uYlQ==
X-Gm-Message-State: AMke39nLNRd0nDqdrU5IXblEZWiLVDwZBkZRM66YBk3Mmcsrmjh+qfohOmk8+uDgnOLfJg==
X-Received: by 10.55.158.79 with SMTP id h76mr3793150qke.15.1487372419672;
	Fri, 17 Feb 2017 15:00:19 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id i21sm988502qke.12.2017.02.17.15.00.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 15:00:19 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1487266008-13492-1-git-send-email-peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <920b1c87-c1d8-9f73-6dad-cd6debafadd3@amsat.org>
Date: Fri, 17 Feb 2017 20:00:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487266008-13492-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH] lm32: milkymist-tmu2: fix a third
 integer overflow
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
X-List-Received-Date: Fri, 17 Feb 2017 23:00:24 -0000

On 02/16/2017 02:26 PM, Peter Maydell wrote:
> Don't truncate the multiplication and do a 64 bit one instead
> because the result is stored in a 64 bit variable.
>
> This fixes a similar coverity warning to commits 237a8650d640 and
> 4382fa655498, in a similar way, and is the final third of the fix for
> coverity CID 1167561 (hopefully!).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> Third time lucky -- I checked and this is the last of these
> multiply lines.
>
>  hw/display/milkymist-tmu2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
> index 7528665..59120dd 100644
> --- a/hw/display/milkymist-tmu2.c
> +++ b/hw/display/milkymist-tmu2.c
> @@ -293,7 +293,7 @@ static void tmu2_start(MilkymistTMU2State *s)
>      cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
>
>      /* Write back the OpenGL framebuffer to the QEMU framebuffer */
> -    fb_len = 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
> +    fb_len = 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
>      fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 1);
>      if (fb == NULL) {
>          glDeleteTextures(1, &texture);
>

