Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjs1N-00071r-F9
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:33:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs1J-00070p-Ix
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:33:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs1I-0007PI-RN
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:33:37 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:37258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjs1I-0007NV-Lt
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:33:36 -0500
Received: by mail-wm0-x236.google.com with SMTP id n11so22017102wma.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nez2f4b3jKRXeWeFqfrmTfFuFmY2U/bFcHisq/GeOIg=;
	b=AIeEF2Y8xziO5r/RlyslHplrmTRf9lTdTHMpRn2m+Y6itAg/KmZyc5KDe+3SdE9t3v
	jHO/c4ileS1ImOqDn9LrMMu1eWimMrgaLK+KXkVnHHryvc5VP5nB0X3xqrLfBkwbTSCU
	x9w8d7E3FPxiwTvjUyS2cxLmNWRyqWUuwfM98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nez2f4b3jKRXeWeFqfrmTfFuFmY2U/bFcHisq/GeOIg=;
	b=oQ3mPUIUBK7SyvHLl9IMrb3kOJ35uzhV0q0Vk+fjPCr8rSZcz+0W492sZ33c97Ugu1
	h7qTcK/YWNYb3Gub3S+5QsOhGBzPWlbOIzPOixP/q+tVJpbOFqUA/rk2WF8S28yq04/w
	XtUmljlskxi1vU8CpnN/1sMurtjKnA2AWN3bayfvyz3P/rJlW11KDjWURRq+05uWFyvJ
	LQMLcKoTF3CGHx/bdShLc2qBVRB7ja+yfzT1jBha4j0Z5k+AuYxhSV7BrpzaEm3mAYii
	5rgs++Di/z7yrQYFZKOZMLPDvRq9Rqjxkqq9FNG1Plerf60Um9R/7CuoVa9XAgfoh2ea
	U1OQ==
X-Gm-Message-State: AMke39lCYexT/7AIroWQu+Pjqxx2w7vxvIQBSXymCnHjrPjGtIyMJRAaYjw0Sj6Xn5ibasxX75llxnFh+eRjmWrt
X-Received: by 10.28.150.194 with SMTP id y185mr2731576wmd.92.1488566015382;
	Fri, 03 Mar 2017 10:33:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:33:14 -0800 (PST)
In-Reply-To: <7be6454441c7b61a02e22aa2d6f81f0c047d4312.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<7be6454441c7b61a02e22aa2d6f81f0c047d4312.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:33:14 +0000
Message-ID: <CAFEAcA-qq_5A4p364Faz-Ms57HjmbbrSOa64ZGmtb336MATzyQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-trivial] [PATCH v3 11/13] sm501: Add some more missing
 registers
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
X-List-Received-Date: Fri, 03 Mar 2017 18:33:40 -0000

On 10 December 2016 at 02:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This is to allow clients to initialise these without failing as long
> as no 2D engine function is called that would use the written value.
> Saved values are not used yet (may get used when more of 2D engine is
> added sometimes) and clients normally only write to most of these
> registers, nothing is known to ever read them but they are documented
> as read/write so also implement read for these.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v2: Fixed mask of video_control register for a read only bit
>     Changed IRQ status register to write ignored as IRQ is not implemented
> v3: Squashed read implementation into this patch
>
>  hw/display/sm501.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>

> @@ -1454,6 +1558,7 @@ static void sm501_reset(SM501State *s)
>      s->misc_timing = 0;
>      s->power_mode_control = 0;
>      s->dc_panel_control = 0x00010000; /* FIFO level 3 */
> +    s->dc_video_control = 0;
>      s->dc_crt_control = 0x00010000;
>      s->twoD_control = 0;
>  }

You want to reset all these new fields, not just one of them.
If you do that then you can add
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

