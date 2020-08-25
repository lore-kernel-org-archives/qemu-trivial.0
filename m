Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAYH2-0002r9-HM
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 08:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYGz-0002po-Pc
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:41:57 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYGx-0007b4-Ag
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:41:57 -0400
Received: by mail-ej1-x643.google.com with SMTP id oz20so11375502ejb.5
 for <qemu-trivial@nongnu.org>; Tue, 25 Aug 2020 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKuOCtrYI1+bfbchmMVw4JJG2LSPRY5Rygktu8WTf/Q=;
 b=D1WFxhOZvERQDFkwbGWcW+r66aFMy6goaxvqUwx3Ha5PTZJh/bpc7ijVOvaMh5jtTq
 0FtkEVA6azE9Nl5zU+Fz/XdJhFHUM8jC9I0eHDbJ0sGJL5hZSE1lRtXqFfFydtoTw3r2
 aGjDI4wYs4ujagsnUkM73Pbmf2zYgwQjrbYuOWwXE94NsBuUpXzLp9UYr7Ib1MLEqUgQ
 tEDKy+Sfib6+L5msRubLhx/z7e9JasuZPRuze5BlHMpTByCIOKDFx4tNvkb5BdCt82og
 tyFvnpAYiYeHlRErQTmz21ElXhYN6JpkRtkelgWUYqjRImEoWWifGWYeoKjntsq5br60
 kMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKuOCtrYI1+bfbchmMVw4JJG2LSPRY5Rygktu8WTf/Q=;
 b=DiwfcqEE7uCzWblkv1Ju5Rh/MqC4elNwqsAhZu8haQ03uqv7Ir9cqPSRW+NLhuF/lc
 w4J9csnKPqZ6Z1FPEm2zyICACJH2w4da+gJ57QjDVJp8B3BCttmUl4VsPIwQFAdnNlPE
 6e3qAAaMRDJ2XHPr4vCjQMr8aAG27sQgcL3RRS4wxOwHmVX+U1tWvR0X9HNg9EF6BNju
 BHewOtHGur+RBADWFcW4jNl5wsO64rkjdyVLm9f2c9wCekGxTWh9uzybjGW2kiRneuKQ
 FXPO4KAa4+tXKs3BuKm0x/knqqaFoTgccdxDZA3AT2+4KV+k0OYlJH3Xa20HbGGu/vhT
 WGGg==
X-Gm-Message-State: AOAM530oyp7rW3WGfvmEsVhZmecjGCFx8Pi3bi/Vi5WbGPIBIgnEi3fy
 jAOeBbRIoStd2YGEO7w++cSZFScdLf7xlU0hkp1DzQ==
X-Google-Smtp-Source: ABdhPJzP56krYpT7iNRRTMUIv9vSOKbIgN3ReReoeRT9cutjSD8sysGtpVqznvPXqlS4LCKPMrRuFeWwD18CZqBmR4I=
X-Received: by 2002:a17:906:2b0b:: with SMTP id
 a11mr720287ejg.250.1598359313839; 
 Tue, 25 Aug 2020 05:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-10-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-10-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:41:42 +0100
Message-ID: <CAFEAcA_SLjM28bHH8WxBdHAFdLgE6zgqNAj9EpOVp77WL-iqKg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] hw/intc: Remove redundant statement in
 exynos4210_combiner_read()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Pan Nengyuan <pannengyuan@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2020 12:41:58 -0000

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> hw/intc/exynos4210_combiner.c:231:9: warning: Value stored to 'val' is never read
>         val = s->reg_set[offset >> 2];
>
> The default value of 'val' is '0', so we can break the 'default' branch and return 'val'.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/exynos4210_combiner.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
> index b8561e4180..e2e745bbaa 100644
> --- a/hw/intc/exynos4210_combiner.c
> +++ b/hw/intc/exynos4210_combiner.c
> @@ -228,8 +228,7 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
>              hw_error("exynos4210.combiner: overflow of reg_set by 0x"
>                      TARGET_FMT_plx "offset\n", offset);
>          }
> -        val = s->reg_set[offset >> 2];
> -        return 0;
> +        break;
>      }
>      return val;
>  }

The code as it stands is definitely wrong, but I'm not sure
this is the correct fix. Surely the intention must have been
to return the actual register value from the reg_set[] array,
not to return 0 ?

I suspect the correct fix here is simply to delete the
"return 0" line and leave the assignment to val as it is.
Ideally you should check the h/w datasheet to confirm.

thanks
-- PMM

