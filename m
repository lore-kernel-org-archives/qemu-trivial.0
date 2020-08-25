Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAYDv-0000Wj-NF
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 08:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYDu-0000TW-7n
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:38:46 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYDs-00076x-Mw
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 08:38:45 -0400
Received: by mail-ed1-x541.google.com with SMTP id u1so906537edi.4
 for <qemu-trivial@nongnu.org>; Tue, 25 Aug 2020 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDG5L3tmh46vTBVfQ/EIwrsUYYSiNhJWo3VzF7A1D1I=;
 b=AiIuX5l3ntBuAlXo70yYuJf8yvChAMDx1Z4Y7wvIe54MPU4rHCqHa/Dd68RngNGD8w
 AOHzNmmr69vX7CyHG+J+w+q1Vjiq9Fq4eFV2v5pZDIPq8GdcQp1SRbOEvmNI+0qYoodM
 9Fb+KzteYmA53A5V12dQ6yjPjO3BaWxRq2WkjWFDa3o92QZQDv/yHDRYPLLRwSdOc2lf
 umPDAtYEBfelTUpQOkcYP/+GNS74pNsescAwtzaBuLUve0f4b0kM6FbBSxLTDSHEJw2D
 Du3HM4zvPw3RH8CdSSd9fVWZr0C9qhzMfQSPcZLc7/AxjPReP2UEvg8dxjzu48zCJKx+
 8mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDG5L3tmh46vTBVfQ/EIwrsUYYSiNhJWo3VzF7A1D1I=;
 b=d13K45ITVVG1qCbnHbx66q1XI/yZuca0xSQVOOwreafN/eHnsnKX4TEwboSjl4qIQW
 KWC2WaHQlCXq+sxH14DxMIxSEqOaTrEKdoL+XBZFr2ofyxMOGXxNO3O/nai909Hr7aci
 wk7JkkAAI7lawZGdemgRXTCHHLAWcQPAnkxP/g5CmXYe3B1Vl1gISIb8xM8zmvOgwYRk
 2WNtkYe/pvoYwk+t1XU7aVipb3J9rP8tX6fhAowSjsnqocxDY2jdV6I9SaC65qpKGa++
 5HK/ojbk6xfu5/64I7Ody5b6WNzd3uTKujGexp5MV0SN+08Ic9RbJmMSE9XFpFMlWS+C
 aS3w==
X-Gm-Message-State: AOAM532q0jfVij30VF7ynxmwG4fTy6qrczkwaxjncdfmUzcaWGUvYezW
 krkkdbwvDc2ih0PcqRXpD/vde20OiREMFGcDC2vt6A==
X-Google-Smtp-Source: ABdhPJwTWAtOrWlucsSPYm/WjLnJC7+NJCEo/fdjLbbPIaUp4NAi0TierA5jvjr/Yhk5Ad5ltKuOKyIwvbeHs05cQY8=
X-Received: by 2002:a50:da44:: with SMTP id a4mr10308200edk.36.1598359123316; 
 Tue, 25 Aug 2020 05:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-5-kuhn.chenqun@huawei.com>
In-Reply-To: <20200825112447.126308-5-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 13:38:32 +0100
Message-ID: <CAFEAcA9OYmEmN23v5vpVmbmwYUbzN8m=stpu41wGLFmeVe9yvw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] target/arm/translate-a64:Remove redundant
 statement in disas_simd_two_reg_misc_fp16()
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Pan Nengyuan <pannengyuan@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Aug 2020 12:38:46 -0000

On Tue, 25 Aug 2020 at 12:26, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Clang static code analyzer show warning:
> target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
>     rd = extract32(insn, 0, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
> target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
>     rn = extract32(insn, 5, 5);
>     ^    ~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>  target/arm/translate-a64.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c83bb85e4e..47cce160d8 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>      fpop = deposit32(opcode, 5, 1, a);
>      fpop = deposit32(fpop, 6, 1, u);
>
> -    rd = extract32(insn, 0, 5);
> -    rn = extract32(insn, 5, 5);
> -

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

