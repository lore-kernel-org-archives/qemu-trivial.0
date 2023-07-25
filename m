Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qONOP-0007Mw-Vw
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2023 15:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qONOO-0007KG-BB
 for qemu-trivial@nongnu.org; Tue, 25 Jul 2023 15:08:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qONOM-0007Vy-NV
 for qemu-trivial@nongnu.org; Tue, 25 Jul 2023 15:08:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so48281265e9.0
 for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2023 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690312097; x=1690916897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WU0d74iNPA+1F6v5LuUUyes2rcfsaNFUn8ADDAwNbqQ=;
 b=daR7B53fE9cAPTyk/h9CfSaj1betCIMfFgZiWt/Y1K+fAfNtBeGiqYYUf8J66Ym+PL
 1StomptMDSi2gAMYBi7W/LdrHianYRiqm/V2cFHyRpP8uvHhMghXiJ3Vxa0w/NVJ/chu
 IllzdWufTBaFdpDUnuH4YeJEPaFSnbr15TOEsgDwex71p6NjEUho/kfh35sLNMmiiT9L
 rurrRnwWMVsbRNMs9E8oX0pUlrqpCFtcg8a3HbiYdSOWkAoRMu7CGEwc6Ms2qk5vGG29
 Z7IccNdU8U97rmvsPt38NkH9WXdUf+sBG1v6MchyHRsJ5YexHxO3dBe+wRIY97vq3D4b
 hMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690312097; x=1690916897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WU0d74iNPA+1F6v5LuUUyes2rcfsaNFUn8ADDAwNbqQ=;
 b=eJCk3cjOBrHuCyXpH0RHnsMnpf/7lPdwKDnwIAeJs8W5rGrEJBMf70b06ug0LrW5AH
 8+YCg6XMlyjqUcJ60H371rLCj8EM0+P6yElyTbssTqQE/rus8LDAuEOL8tJmNqJz5eyU
 nXyJw5CoTrMg/KscCfPqLjacc6IQ2lTnmhCMVP2miYRNV5wdegIfrq28onXwBQBokMEk
 FjKsurqqx3ClNDLxt7XA1VeCh34LFFDkyWJ85GrCOsQ29S7zAbYhLG9ftZskH+11F7CH
 K1ojk36fjopIlac5ifKiuyeveFVcQSsJi7Fj3kmmOYQi2YBd8IH1yW7HGYahn93+de4N
 qG6g==
X-Gm-Message-State: ABy/qLa1Es1ui5sh/rdwZ6ztXSBzYvCeuJ5351jqElXezaUgG24NJY2p
 67uhDQNeAl0oIqYX6HesQVD2V/CCR+AMkTbZ4C2hQA==
X-Google-Smtp-Source: APBJJlHI1G7j5wDKTKYXdhis7zKtMRI3YBoeAvuF4bWk92TIzMuR6M0ffslSqySfVhsCh/LNT9sVe6zWmhuC+JHU6eQ=
X-Received: by 2002:a05:6000:11d2:b0:317:6189:fe7a with SMTP id
 i18-20020a05600011d200b003176189fe7amr3954586wrx.58.1690312096424; Tue, 25
 Jul 2023 12:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690294956.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1690294956.git.mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jul 2023 20:08:05 +0100
Message-ID: <CAFEAcA8x3UjJ6MV3Gf3bk+LA9ZCLB+MWm1JNANoFUbORUBahJg@mail.gmail.com>
Subject: Re: [PULL 0/8] trivial-patches 25-07-2023
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Tue, 25 Jul 2023 19:08:20 -0000

On Tue, 25 Jul 2023 at 15:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 3ee44ec72753ec0ff05ad1569dfa609203d722b2:
>
>   Merge tag 'pull-request-2023-07-24' of https://gitlab.com/thuth/qemu into staging (2023-07-24 18:06:36 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git/ tags/pull-trivial-patches
>
> for you to fetch changes up to ff62c210165cf61b15f18c8a9835a5a5ce6c5a53:
>
>   qapi: Correct "eg." to "e.g." in documentation (2023-07-25 17:20:32 +0300)
>
> ----------------------------------------------------------------
> trivial-patches 25-07-2023
> ----------------------------------------------------------------
>
> Ani Sinha (1):
>       hw/pci: add comment to explain checking for available function 0 in pci hotplug
>
> Bastian Koppelmann (1):
>       target/tricore: Rename tricore_feature
>
> Markus Armbruster (1):
>       qapi: Correct "eg." to "e.g." in documentation
>
> Michael Tokarev (5):
>       migration: spelling fixes
>       s390x: spelling fixes
>       arm: spelling fixes
>       other architectures: spelling fixes
>       hw/9pfs: spelling fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.1
for any user-visible changes.

-- PMM

