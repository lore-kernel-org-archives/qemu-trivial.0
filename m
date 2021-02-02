Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6w2K-0003rz-Aq
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 08:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6w2I-0003pE-Sg
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 08:48:06 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6w2H-0002CW-9R
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 08:48:06 -0500
Received: by mail-ed1-x532.google.com with SMTP id g10so4694802eds.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u6tYLc3QvI7oOyextRmlipyLgaS2zGToHBWZQm8Z1nA=;
 b=kzyD4CswHzRQpLhuZgq3STXVgLvuAQF6aBucPPmviECIhpgJKNZFKKnQgda5v5HW10
 CJW0gDluBszqd/TIV0eHJWrWIQbbknJL2mgBOwFAxEQumb6lOo4YwXe+sycbvXNFqGYH
 TfpfE/Y6p6L8KB+ciCFrpAy2ePDm23wGi7M0PwQE4ee2wU00erH3BEwboDyJ9p907MZm
 KxMgdGrXZB5623GU6u71MaIDqmeOu4YHml8V9GDRWaO2U0pXYsQMuvA8fuX1h6JvhjIx
 faEHn3P8t7Bw+92JbBuukwlIXkBq58tBLNme6AFctvdQkhnT6YaBLSQpDz7ldzHtmFC0
 n/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u6tYLc3QvI7oOyextRmlipyLgaS2zGToHBWZQm8Z1nA=;
 b=liA/abzFRBUvgyqz6IOkXeBlzjHEv/VYN7hrc+wgg6WOsD7Q25tbviG/G+cweNylKS
 TBZ+DbeXIuAYC+YI9mvoKX/tAP7A9Qld9fQx6RrTyIuzSAczTz1rQOGf6jqrvB6fmyU4
 9jRrr3kF8PxP5r01vXH3QdEu8ZrZt0isZGpW6lCJ8NpenQNzBhbi/ILFg8TUW1jl2/dB
 js5cwijKbaBxG3chanvAC6/VLY+rQKKLgRtjfNSXmkKCKlJO3hIJ9zNq92N7FjDU/Nw1
 QkSD323bCC8B6n45/hYMqMP/guxxW/jgz9BTn8N+s6mFNUH2nCrDekAcMZV/ZhIAQpeW
 d9Fw==
X-Gm-Message-State: AOAM531V/ZDM//JakVTy3g4SLOCVOa+fwLRV+ave7cJ4WS1ZLmb9sShR
 yAagxC0Yi7d1WGecNBDLZqV6vSXNb20Yd4YNr2CH/Q==
X-Google-Smtp-Source: ABdhPJzAImkBMEuC8PQ6hAYFeucsr7/mj4sPBGbc5ENhKr0SlxGhFdbkGozohToEJbyH+wi7BD28EIROYl+FjlQBgSA=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr23660437eds.204.1612273683889; 
 Tue, 02 Feb 2021 05:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
 <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
In-Reply-To: <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 13:47:52 +0000
Message-ID: <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Tue, 02 Feb 2021 13:48:07 -0000

On Tue, 2 Feb 2021 at 13:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 2/2/21 1:28 PM, Peter Maydell wrote:
> > At the moment we can reasonably
> > say "only the 'virt' board and one of the Xilinx boards are
> > security-critical".
>
> What about the SBSA-ref?

It doesn't work with KVM, and enforces it:

    if (kvm_enabled()) {
        error_report("sbsa-ref: KVM is not supported for this machine");
        exit(1);
    }

thanks
-- PMM

