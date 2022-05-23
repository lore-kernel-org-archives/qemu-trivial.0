Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nt9Gf-0002x6-0h
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2022 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Gd-0002wR-4Y
 for qemu-trivial@nongnu.org; Mon, 23 May 2022 10:42:43 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Gb-0004q4-Jk
 for qemu-trivial@nongnu.org; Mon, 23 May 2022 10:42:42 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id x2so25451637ybi.8
 for <qemu-trivial@nongnu.org>; Mon, 23 May 2022 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YiRb+fGlgZc6cGlzEb+eSUJ1KHmUNE2xKzuTpao1dCY=;
 b=Bjbfz324VszbmsoXmFRI0u2S+IsojGT12KaYyZGBEUDk/LjMoSp1zOyIzdkbhFxaL4
 VziEzvEA7s78m5Hpb99qcWMF7DLc0W+7xc5Y+g3LKn+OEXTjdz6AX7NmxGUZfnTy2/ci
 1tsxNAzBN1CG3dOFZGLKSaRrWDSxVxA9ikIfErmqXO/nOJuPSGhFCcXbDo/LdimOiltS
 IPUFBnKtx7qVwRCyo8Przxh51DLvQx11iMAeRwgfGSr0RAu0+qyejwSTOe5SnVW/IxaR
 VpJwmh87U+93uARLTkGmPtZ3PQREmuWmK0Vo+9JG67ey1dcSSUfKYGCU3PRcyC6N5jQ3
 3CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiRb+fGlgZc6cGlzEb+eSUJ1KHmUNE2xKzuTpao1dCY=;
 b=jklFBmef5vwL5WXNj2TMQZ5dOIEpwxo9zSOSUaRrhPIoDBQ+r/JhbUw6qk2P6NOTMo
 NxsVC4abTB3RxWSAvMJ93eeZ0zOonWJm+TDaE960io+6L2KX0kOxEaavskwtIAi5zo6x
 tLjRBLPgYK26DDXIE1Z61O3V1/tYDQUFYLF0klLQml5x5TOVrwKuLffd8+V0oACnlAkf
 jLHg8kWlKrYxupg7uS92fy/RBx3aZV2nzfUo4XRtSEngOKEjtti+Z/GnT8zqdefwRRUz
 7OB5XWr15vSxo0MW3716i6yo+gkckmYdkh+8BF2xuRT+b/II+inIicsCdgysb3NSB5g+
 8kwQ==
X-Gm-Message-State: AOAM533+TLW9fmEqFInzeSC9MEg8UofJOvaMICnDaCQM9+I1IuXenHPa
 dSpw8Tl4d2HdqykIRtqK7iwYr0ksv5Z8wsWpjz/8eHg9V2w=
X-Google-Smtp-Source: ABdhPJx9Zny8kl8Vv8SsO6JxjYEtlPrcD+GnnUzikLyjq87RgoJM0IBWNSj1B+wk+Rc7xMf+LO4mCc6CsCv5o9PKVgA=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr21090188ybu.140.1653316960440; Mon, 23
 May 2022 07:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220505095015.2714666-1-peter.maydell@linaro.org>
In-Reply-To: <20220505095015.2714666-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 15:42:29 +0100
Message-ID: <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix 'writeable' typos
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2022 14:42:43 -0000

Ping for qemu-trivial? Or I can take it through the arm queue
if you prefer.

thanks
-- PMM

On Thu, 5 May 2022 at 10:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We have about 30 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.
>
> Change produced with:
>
>   sed -i -e 's/\([Ww][Rr][Ii][Tt]\)[Ee]\([Aa][Bb][Ll][Ee]\)/\1\2/g' $(git grep -il writeable)
>
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
>
> Most of these changes are in comments or documentation; the
> exceptions are:
>  * a local variable in accel/hvf/hvf-accel-ops.c
>  * a local variable in accel/kvm/kvm-all.c
>  * the PMCR_WRITABLE_MASK macro in target/arm/internals.h
>  * the EPT_VIOLATION_GPA_WRITABLE macro in target/i386/hvf/vmcs.h
>    (which is never used anywhere)
>  * the AR_TYPE_WRITABLE_MASK macro in target/i386/hvf/vmx.h
>    (which is never used anywhere)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * commit regenerated with new rune to be case-insensitive; now
>    includes fixes for 'WRITEABLE' and 'Writeable'

