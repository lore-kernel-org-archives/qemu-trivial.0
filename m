Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaN3h-0006Eo-1L
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2020 12:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN3f-0006Bq-GP
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 12:58:55 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN3e-0003tF-03
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 12:58:55 -0500
Received: by mail-ej1-x643.google.com with SMTP id o21so23973676ejb.3
 for <qemu-trivial@nongnu.org>; Wed, 04 Nov 2020 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiMc1SzEb9/AlSm+lWxWCGF+8aQOAj16s2TaXghW7V4=;
 b=pegGiYYnGCYQtZMM+ZRIsr0ezlbbyMQDuvsUPE1h08A7zhWAT0W5C1RzX0wDTGSx/1
 bSkNzWInS1evWUmDjytnJNUOJnzhrDw5WSgOO51l2QXnmSAR1Zp/NwQ96DJpkUhcAsmS
 KuzUCatyIG8ANIKeWtedwViTwp+ZYZskkMBsoDkMCHHXTiZohyPrTAz7YPyw5Sm2pjdW
 j29q470gQlvMa6LWDUuKZJ7MQyYYfR5rSx1pLdAMKj5NMoPBYmKd740ir+nNXUuEgJNP
 HM7T0gA0MXkzrkhGyliX/jUUykEBlDUJx2Ectf9VgFx6jGvAxmEdmK7BSPSwAeiXgwhI
 etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiMc1SzEb9/AlSm+lWxWCGF+8aQOAj16s2TaXghW7V4=;
 b=AWEi951kGRzNMK6dXC6PKNoTC8NgYaY2JPThREQ+DQ0YuSmbkyvfQw4nVX4mjq6aFx
 nPT8O+e+S7uyntfCFR+T9QAq31M8BcrYJGWwvrJbVkRti9txP52lCW+YR+TGKiEcJMoM
 h87NDHtQ266lgt9UCeFw42QOdlWbQPwv+Bht30X7BkoJsMQumUnuinwE5UoFlh3zGDle
 IADiTO9q93ywOX6NBH8yea01lc/BQlNj6Wt0oGjyLUPP4m6GpB4dFiRtKKLw7aX1cW1m
 F8oJWvt1fDXOqzE7NK5XyckNIwm/CWabdY2ISMDCYEq6FQMEGCsHsrKs1Ok759OzeFcS
 DNnw==
X-Gm-Message-State: AOAM533EId4fa/sHqnHrmz0iCnbWXHgysewWRTgMk8lR3AMqAuJZcX7P
 z4QfYlTtxTumU7JwpF/d1psB2EaE+jvW7t9JhH7Lbw==
X-Google-Smtp-Source: ABdhPJytUjPJuz14l55SKD3uW1VPsHXkiSs+rTUgRuh5SAgtCdVQaCNjCnJ8PfE1SX00T/nWJ0eCnkD4/iauqwT6Ieo=
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr26048032ejd.250.1604512732596; 
 Wed, 04 Nov 2020 09:58:52 -0800 (PST)
MIME-Version: 1.0
References: <5FA280F5.8060902@huawei.com>
 <CAKmqyKOS4bALKNTA9wMK=HANz4Dc=fffq2pZafCxGFqsJ_LMkg@mail.gmail.com>
In-Reply-To: <CAKmqyKOS4bALKNTA9wMK=HANz4Dc=fffq2pZafCxGFqsJ_LMkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 17:58:41 +0000
Message-ID: <CAFEAcA9bq8Fs62wD6dsrRcYvSogrdzK9cDrzoVmMFcpui8=_uQ@mail.gmail.com>
Subject: Re: [PATCH] ssi: Fix bad printf format specifiers
To: Alistair Francis <alistair23@gmail.com>
Cc: AlexChen <alex.chen@huawei.com>, Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU <qemu-devel@nongnu.org>, Zhanghailiang <zhang.zhanghailiang@huawei.com>
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
X-List-Received-Date: Wed, 04 Nov 2020 17:58:55 -0000

On Wed, 4 Nov 2020 at 16:33, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 4, 2020 at 2:23 AM AlexChen <alex.chen@huawei.com> wrote:
> >
> > We should use printf format specifier "%u" instead of "%d" for
> > argument of type "unsigned int".
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>



Applied to target-arm.next, thanks.

-- PMM

