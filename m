Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHBwz-0002d1-KJ
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 16:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHBwy-0002bj-7g
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 16:16:44 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kHBwu-0005H1-JP
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 16:16:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id z23so17889571ejr.13
 for <qemu-trivial@nongnu.org>; Sat, 12 Sep 2020 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Nv+nnFHayGUqocJ17Nj1h3AM02fuHY983oGcb2kjXo=;
 b=wgaPhZR3mHfE+BsYHrc3+6YC62fGqjOVO7ye0DazbFRLRPu73Mgq16LoAwPHNNbeCS
 /5AexJ1GXhRBh2GR1JxG/p6GNwxuaCj2dEdYjXmNIsIPsMq3UUd2phkLYbR194DfhVkB
 fULE0PKEm4c3zgsQMSp47jBF9maLYXh2aU2zTXEGYW3tXHdIWql75fHoLbyabxt1Qd+M
 xrG3G2vQ99acDM92CGRJvUXpgPaLfYk0ayr9ReOYY8ncsLj23vRsXpgJQEfWNMpQdNNt
 2sh6xANubTlDsTmkorkyyjNV6KN5P9XMnOent7UN5Hrmlism7+0iqsniVsKOJTpJ75Cc
 pEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Nv+nnFHayGUqocJ17Nj1h3AM02fuHY983oGcb2kjXo=;
 b=kC8KOLy3KoEs3j7mtSzB6iebJNFPV+aPQmZfoZpiLGVLKy98WMjEg9IpCzbjNjUnOH
 3dfjkUqxw49I4aGJica0cCKdPjOohyISNDUokJlSB3DuBBroGxSqU95yGIGLCtmZXOcI
 zoZJPCQ9JD8ERVaMinblb220aPh7Orn1yZRgEb2nwSRUJwWWyP29da8+MFajzTyEEsik
 ZhrTRkFo3iKEap67BnC5hdhK1wooYbDBKvmw+vEX9H0qPgDcqulEEoL4EBldv3P9QIgw
 KcIax5Wb2fwze1FEhJGg6qJhO8HYeJkEn0Jd7RWHxunknJZhm47z6JypoSodLb0MftFa
 ERAQ==
X-Gm-Message-State: AOAM531aPI+oAPzetqJsoKaf8T5D0h1EpZOjhex1mqIbm9ctu3jSEIJP
 n5G/3C+3p+HCROzDA+pG8D2YmGVw3/M4f6JMZFhHog==
X-Google-Smtp-Source: ABdhPJyd6yQZ97x8GmDCVr97wyPCCOx/fwhW88a0hjUkCdFK5lI5Rw0E4tuLC1f72dAY8psmVdhu+nMsqarfXIsXKq0=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr7172890ejk.407.1599941799044; 
 Sat, 12 Sep 2020 13:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200911193330.1148942-1-laurent@vivier.eu>
In-Reply-To: <20200911193330.1148942-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Sep 2020 21:16:28 +0100
Message-ID: <CAFEAcA_-jdWSB+uFa6BmO9Fn5Ksnbp8hqw0VqS9iHGBSFS-hAg@mail.gmail.com>
Subject: Re: [PULL 00/18] Trivial branch for 5.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-List-Received-Date: Sat, 12 Sep 2020 20:16:44 -0000

On Fri, 11 Sep 2020 at 20:35, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/sirius/ipxe-20200908-pull=
> -request' into staging (2020-09-08 21:21:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.2-pull-request
>
> for you to fetch changes up to 8821e21414468b1810f0ccf38bcbfa5c0bd1d56b:
>
>   target/i386/kvm: Add missing fallthrough comment (2020-09-11 21:25:59 +0200)
>
> ----------------------------------------------------------------
> trivial patches pull request 20200911
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

