Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buMVq-0006eV-Tb
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 12:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buMVo-0006cc-G2
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buMVn-0003gN-GP
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:36:12 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buMVn-0003fs-4g
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 12:36:11 -0400
Received: by mail-vk0-x235.google.com with SMTP id 192so50479236vkl.2
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d26DWh7iOIjnFeQOBUI60BWoE9PfLsLcfulksuVkyis=;
	b=bzDUd7u8lIy8hgBQF96y7ZUSI7S/vL5MFAORSHGsVfb2/ItFGWL5d0QMb6Ah1iJsaS
	SVvZgg8rwHX/iH5gBr9SI4A/v/VvLG39hXb89bSY4wG9VPZ9MmK3HOlw9IpQK7RlnGJy
	an4VAB2h3sM0XNtWExnZ2yg2idy3Df9mKytpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d26DWh7iOIjnFeQOBUI60BWoE9PfLsLcfulksuVkyis=;
	b=LAKUhK3gnOF1rxY4Esu0BVWueySmoLo5ykdiqMTVFZrHEU6GuPcG6R1Qs58Mjh3BgZ
	Mkw2LLSrZsL0nWme97Laxejy21CsSMdZPnu8uxBKd+1/13Uo87lwVDakownQE7Ln1YYc
	lar+oLmD7LAKratLWUTtBW5w3WY9mCru3EYTnW2iGv1qNYXqHbPmwPuG5+9QU5w0itgb
	4521gyXU7FfdLl/Fmv1n5uSJbsxUWSq1D3paI8lvAWns2zhHK/PoyCU5s5vI6cdTFgY6
	yd1y5m7Yx7cEJwAxFgzF//Mgc/UWMs19zFmhlTsBMj1CPbekxtc5c8AOL4pTVoGRKsd5
	P7og==
X-Gm-Message-State: AA6/9RnUQqQDR37jmhOr71wV4yBHvrLbW93QvjpuGyb3Gmit1XavFLL+2+FZ2srnz9wA06tPfoR9lR0aGvpkhSFm
X-Received: by 10.31.206.198 with SMTP id e189mr985794vkg.51.1476290170630;
	Wed, 12 Oct 2016 09:36:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 09:35:50 -0700 (PDT)
In-Reply-To: <1476289396-10780-1-git-send-email-michael@walle.cc>
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 17:35:50 +0100
Message-ID: <CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <huth@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-lm32: fix style issue
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
X-List-Received-Date: Wed, 12 Oct 2016 16:36:13 -0000

On 12 October 2016 at 17:23, Michael Walle <michael@walle.cc> wrote:
> Both branches of the ternary operator have the same expressions. Drop the
> operator.
>
> This fixes: https://bugs.launchpad.net/qemu/+bug/1414293
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  target-lm32/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index 2d8caeb..534c17c 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -343,7 +343,7 @@ static void dec_calli(DisasContext *dc)
>  static inline void gen_compare(DisasContext *dc, int cond)
>  {
>      int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
> -    int rY = (dc->format == OP_FMT_RR) ? dc->r0 : dc->r0;
> +    int rY = dc->r0;
>      int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
>      int i;

This checks against the processor reference manual, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but I noticed while doing the review that our LOG_DIS
is wrong for the compare-immediates:

        LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
                sign_extend(dc->imm16, 16));

but the processor reference manual says cmpei's mnemonic
should have dc->r1 first and dc->r0 second.

(Similarly for the logging for the other immediate compares.)

thanks
-- PMM

