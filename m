Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1budOx-00073L-4G
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 06:38:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOu-000712-Ac
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOt-0006BB-6q
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:38:12 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budOt-0006At-30
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:38:11 -0400
Received: by mail-vk0-x22d.google.com with SMTP id 2so72624661vkb.3
	for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2016 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gxXS3tME37DWEJuNnZHrv+L+nooWK80oR2a8uNFUfHE=;
	b=SoleSRbbysTYajvNcYcS/1Mdv1TluG3w33n426hKsvm9zU84PShlVGVFOIhhMP7LrD
	FL34VoqmqgGk7vNVzgg5dTY5AVV29YPY7c3mEuC/Cr4aCK6qaBVlxGjvfJkBFho+Rr5c
	4Lrba+BnihH+pgSF8RsAF6jQVaw/z4VRq8ryM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gxXS3tME37DWEJuNnZHrv+L+nooWK80oR2a8uNFUfHE=;
	b=HJEwAr19fms4orcTmri+J17in8MLSFwmJoM2lGRlccXHeKflPJg7/kVdR69Hggi7vR
	tOgHmB7W4fDrHJ86OB9C/kUCCiv8pRwz8X9KsjiSs/TQladlSYXvfrxbfRNcQ3RJd2i+
	VDFRk/ilxzI2D8z3IVHWxAj5/qL44wgnmGRJau7yRfqVuhGYsAb+I04HGOieacfnJRL7
	qIHW92dFPv82gJg9q9m6GRg6BR5GS0UFvU6+mrl12uWJsKcbLbitt96iniaGxnNENYMK
	C6zH/WXMUCElX6HsPLYTih5XD6oXotNyTWgkvho1ynxyEgxFGnXGQGTSePJhZvHXjJP6
	H5wA==
X-Gm-Message-State: AA6/9Rm8bmDTKy1101LcsU0zA5L/ZneqjBjXspxeyDogDX6ZVjeRcwmZwtrykxL3z1RlQ4RaHAaCIYfTXWZAJBak
X-Received: by 10.31.210.130 with SMTP id j124mr4160121vkg.17.1476355090654;
	Thu, 13 Oct 2016 03:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 03:37:50 -0700 (PDT)
In-Reply-To: <1476311708-14792-4-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
	<1476311708-14792-4-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 11:37:50 +0100
Message-ID: <CAFEAcA8S6uRQ-B6nNq5jv32FuNN9=M7B5VyXfui6+OV9KAT0Nw@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-trivial] [PATCH 4/4] target-lm32: rewrite gen_compare()
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
X-List-Received-Date: Thu, 13 Oct 2016 10:38:13 -0000

On 12 October 2016 at 23:35, Michael Walle <michael@walle.cc> wrote:
> Drop the rX, rY and rZ stuff and use dc->r{0,1,2} directly. This should
> also fix the false positive in coverity CID 1005720.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  target-lm32/translate.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index 792637f..842af63 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -344,9 +344,6 @@ static void dec_calli(DisasContext *dc)
>
>  static inline void gen_compare(DisasContext *dc, int cond)
>  {
> -    int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
> -    int rY = dc->r0;
> -    int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
>      int i;
>
>      if (dc->format == OP_FMT_RI) {
> @@ -360,9 +357,9 @@ static inline void gen_compare(DisasContext *dc, int cond)
>              break;
>          }
>
> -        tcg_gen_setcondi_tl(cond, cpu_R[rX], cpu_R[rY], i);
> +        tcg_gen_setcondi_tl(cond, cpu_R[dc->r1], cpu_R[dc->r0], i);
>      } else {
> -        tcg_gen_setcond_tl(cond, cpu_R[rX], cpu_R[rY], cpu_R[rZ]);
> +        tcg_gen_setcond_tl(cond, cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
>      }
>  }
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

