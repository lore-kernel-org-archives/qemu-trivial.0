Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q11ex-0004dB-9p
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2023 05:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q11et-0004cr-JF
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 05:16:52 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q11eg-0006kV-3c
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 05:16:51 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso9942517a12.0
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684746996; x=1687338996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L3pRn/axMfoLuOpEltPeWJPhUx3egcLdSBFz0Mhn4/M=;
 b=vK1ejSAKnVUb2Fu9xbuKUepN6BZuRRwq7h1+Y1rY2HitucdW3V1po8yhPTBUnEGYE/
 GshyYWSyYJa2fOZb192J/Vc+SrBc+nCSWJSHDguz7gv13BKOGKwuHWRmfPW/9A6QVG3H
 GsRIMadF8qnKZyj9U3h8N5K60bgj2CzOhh4+CZZTuFpSK/b7Ox1lUNEgNPzHqAKMfR91
 ULHNYvOUWYvWl8uMiIVhsmNnmgWjFPZz1hc1T3AOAa+nkqMxS13JhdmPuDMu0Iu9/0Dh
 BJU+ZfMG1wwpOfHyqKjG7eMRtAroe61VsNFgIYqqLtt6r/VrVss+LR8H5M7oIPvf1EKh
 DnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684746996; x=1687338996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L3pRn/axMfoLuOpEltPeWJPhUx3egcLdSBFz0Mhn4/M=;
 b=hpuTcA5bk9v0M0EjkpYNqLBS+znxm05bsiPJdJR/HESY0SFuSBzT6w9PTrIHTUe+pZ
 lh7HWSPPAKKJXWefC1Hpb5rdestAke87HwTkQYvRDP2TuS5vUJ1OzTvxUCWcc181wybR
 d4wu1+QiVAbFtWr1gGR+cZAN4qOfwZU1ptnhRuTWqDRZ1p3PCPJCxEBN7PFkmsGL6BXD
 p2vRPjOpuoQ/uoMnaQkFPo99CBHgh+W7dDlLPBGOgmD3wIjSTCkhHLDHaS/p/n4FkHFO
 DfoqKI4Jhfu96tOB3bmDbXi9WdRJhogV7hZ0MuUgJjKCDjVTay5JbnV5IXoh9zEr6V3F
 FfyQ==
X-Gm-Message-State: AC+VfDy6o6UnwjJ3kMjuVvRXfcpih3Q+140cb6tmsMM3Nhl06/niP0bI
 zdVkBa1zISPXl3dKWAm6+YtFba3MslK7YZZvlMFr3Q==
X-Google-Smtp-Source: ACHHUZ4vHCu+sCNMLG0f6yE5bYSlbpRxmWriERJ1BEHfY7Vsy46mUt+kVU4cs1CBuC9cRGAnfPj4ZQ/d39GHO7czwoE=
X-Received: by 2002:aa7:c157:0:b0:50a:276f:a3ba with SMTP id
 r23-20020aa7c157000000b0050a276fa3bamr7157859edp.34.1684746996080; Mon, 22
 May 2023 02:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230520205444.887287457E7@zero.eik.bme.hu>
In-Reply-To: <20230520205444.887287457E7@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 May 2023 10:16:25 +0100
Message-ID: <CAFEAcA9gAYPpOJ6VyPYwCVyOhMmJMEe4QyGzB57xCbK0MOED5A@mail.gmail.com>
Subject: Re: [PATCH] bitops.h: Compile out asserts without --enable-debug
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 22 May 2023 09:16:53 -0000

On Sat, 20 May 2023 at 21:55, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> The low level extract and deposit funtions provided by bitops.h are
> used in performance critical places. It crept into target/ppc via
> FIELD_EX64 and also used by softfloat so PPC code using a lot of FPU
> where hardfloat is also disabled is doubly affected.
>
> Normally asserts should be compiled out from release builds with
> -DNDEBUG but that cannot be used in QEMU because some places still
> rely on asserts instead of proper error checking. To resolve this,
> compile out asserts from deposit/extract functions in optimised builds
> which improves performance for target/ppc and possibly others too.

Can we have some figures for performance improvements,
please? General QEMU policy is that asserts remain,
even in non-debug builds, so exceptions from that policy
should come with justification with figures attached.

thanks
-- PMM

