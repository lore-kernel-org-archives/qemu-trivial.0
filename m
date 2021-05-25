Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llafD-0002St-Ar
	for mharc-qemu-trivial@gnu.org; Tue, 25 May 2021 13:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llaf4-0002MY-VD
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 13:16:12 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llaf1-0008Lb-37
 for qemu-trivial@nongnu.org; Tue, 25 May 2021 13:16:10 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t15so37179308edr.11
 for <qemu-trivial@nongnu.org>; Tue, 25 May 2021 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AiIiEAPDdf3Aw9ACm+daEGl74CzDEO+Rvmp7WJhXGBQ=;
 b=syWWEf++gSeLR5OzgRobDyVbefACXZsMMS0ExwZiXTleDA0TctIMF0rd+mUtWEkiQP
 5mfsqhAhxBzEwlV3a+d4jSnbnJXVRVdKXnqRDr7RW4IswGYeaq3SK3YAw03CXxm/sBaS
 xsoB8858yKNayoCOmhpETn+AzZLJPIUxV4XlYv65KsXGIJfdxTcpCreTHszDN7T20MxQ
 snA3TchQq14R83iABsa5+e6gYZe86nK0xZIljSIrtQTcFOTx7T0tAFB6FyjpmI4CVOVG
 Pvy2Be/lcPRkhoDzO4llqwgwjUGg8viHmx5L+6Te6XmEEqXG4O/TWYKY6vzt571X4FVC
 B5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AiIiEAPDdf3Aw9ACm+daEGl74CzDEO+Rvmp7WJhXGBQ=;
 b=ae91Ugu0zXZunFAnH1gJtxzoUhclt4PlORFupDBPf0opq0Ni1sA0CK72lUbxHdBqN8
 QBy14IAeTIyK303EU1NJhIBK3c/KUwgEGrvI+qPdP2Yfb4/cyoOXip9acpt3wAuJ6abq
 g0oclPoO79pVkUW6qvNSA/ath/mtg8GtHiAKagSVjx2CulJF5AqT6ZrlJ18Y+JdnURMM
 TCcJuwlw3ef01QiV+SA8kBy69l5ecLH1G/gXkeT39fAtnuUqzXzATK1G1gfgZzamhjqh
 s6325WHoUxgpQvOdA7lN1CIwLH64Plq6VL/NZq39NwmfpKfEORkGKlOfSsatlyY2l6Ra
 QwCg==
X-Gm-Message-State: AOAM530TllIMaFSzwggF+U744ZC5uWfrocopXmCb5er/ok5BvQ3RNKdB
 UcXrOIAoY+QvZHMm4+mecA3Y3DB/rxHX9uZdeKLoog==
X-Google-Smtp-Source: ABdhPJxSFYTKUGKrHwj2zbScxJQGbw+8rsgmX+pwc1lngH/t+B2jmrGRoYsazX9OUC8sAeC3iSsmrmYEwAA3lvXsCg8=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr32668792edu.52.1621962964967; 
 Tue, 25 May 2021 10:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
In-Reply-To: <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 18:15:40 +0100
Message-ID: <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Dongjiu Geng <gengdongjiu1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Tue, 25 May 2021 17:16:16 -0000

On Tue, 25 May 2021 at 17:28, Swetha Joshi <swethajoshi139@gmail.com> wrote=
:
>
> Hey Peter, Phil,
>
> Yeah like Peter mentioned, when KVM is enabled and we don't want VIRT ena=
bled, there are a couple of routines that are being called from virt.h and =
ghes.h, which is resulting in errors. I came up with this simple fix but if=
 you think there is a better solution to it I'll let you/ other developers =
who own it decide and fix it because I don't have much experience or visibi=
lity into what happens internally, my knowledge is restricted to just using=
 the configs.

Well, QEMU builds fine for me as-is, because the default config
always enables the virt board. Do you have repro instructions for
reproducing the build failure ?

thanks
-- PMM

