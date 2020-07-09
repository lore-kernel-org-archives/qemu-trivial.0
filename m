Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtYo7-0006Aw-Uk
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2020 11:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtYo4-00067o-TH
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 11:49:53 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtYo2-000694-T0
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 11:49:52 -0400
Received: by mail-oi1-x22f.google.com with SMTP id k4so2263108oik.2
 for <qemu-trivial@nongnu.org>; Thu, 09 Jul 2020 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+athLHJlypBKXOM0/lGRh5FSAV/t5EUtwkWl4szL8BU=;
 b=jkeB+Hh9z9j155+ml4Tj204jF4UBx+cTD3gyxWLu9KVnQbA1F2TCPhxOszhVrCSFzg
 DCieYg6mMPUKm8trhd7sZABy+yI0kHAIwaTVVrtFOQIWok+65uM4AxLgnqfSr7yl1qlJ
 t59Ffoq4et+/2YFEd5/xoNw6R1yV7ypkoDEv4E5dO5x6kiuO+ARcJaXMAkdyBEuECVB6
 Q1Ba8evWWz0ApRzEVdnUjgiJXCKZBIJVezt3ilhDFgT4sH5H7nhuBwESl9m0crWXndXx
 rlcXmaOyckbQS49EXm91SdMtQUdLY0aqIV7bIgCoASmb69uVxHup5VZvHrCScgiUjsgA
 zi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+athLHJlypBKXOM0/lGRh5FSAV/t5EUtwkWl4szL8BU=;
 b=p+FDZBFOU7jPXil7SpxidfUhU+GBcRpnpMAQ60BugNFBCeswWRzShKLJ1sosaFgdn/
 CHyqxc4BgvWS63xWE03Ad6JLVARIcMhnOld4HdFjxlpctfym1elXKUzjPbNC4hPK6J25
 uy0JiouVRiylREdqPJEFTEC51JUNTl0Twx/iuZS2Wcup2ai/+jIPNORJ+of5jp51G/jG
 4f6+Td6JOonlw8wQpxdLvmVObnJwi0AZ9dX950YN1KztzBNM6HQNfA7MNs8LHeQX4uiL
 zdpBNQSpqDWBWtFxmJQKrhymW1XKF5eonD/0a/JfJl4QXCeRjbJk5VBDhF6nfsp3WUtd
 +B0Q==
X-Gm-Message-State: AOAM5324OSj7pw+fcM7097xSx8J1fomBYZhMxIHnUGftxyB2pAQZA+zC
 1JQtYJLMb/+bIYLQq3iW1HAZ/RL3HAxuap1L133zcw==
X-Google-Smtp-Source: ABdhPJxQM39T0e1yKgxZwm/nPf2fTICgyGxKkLs7lOEAS1KssEIp1NMNs9c0edyrWyEjzWXX8iWAobX8uwlkjRLpMxc=
X-Received: by 2002:aca:1706:: with SMTP id j6mr593058oii.146.1594309789694;
 Thu, 09 Jul 2020 08:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200707105255.362318-1-laurent@vivier.eu>
In-Reply-To: <20200707105255.362318-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 16:49:38 +0100
Message-ID: <CAFEAcA-vONFb05kPMMR_3f+M_xJ5ag-HgbHaxPU0oC_eiX-eJg@mail.gmail.com>
Subject: Re: [PULL 0/7] Trivial branch for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Thu, 09 Jul 2020 15:49:53 -0000

On Tue, 7 Jul 2020 at 11:54, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit eb6490f544388dd24c0d054a96dd304bc7284450:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-2020070=
> 3' into staging (2020-07-04 16:08:41 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.1-pull-request
>
> for you to fetch changes up to 89615cfef57e04da0e5a1bd212a62f8696468e79:
>
>   net/tap-solaris.c: Include qemu-common.h for TFR macro (2020-07-07 12:38:50=
>  +0200)
>
> ----------------------------------------------------------------
> trivial branch patches 20200707
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

