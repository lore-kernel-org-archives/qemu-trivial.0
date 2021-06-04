Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lp5kH-0006XT-8T
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jun 2021 05:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5kF-0006Vr-ON
 for qemu-trivial@nongnu.org; Fri, 04 Jun 2021 05:03:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5kA-0001YJ-OB
 for qemu-trivial@nongnu.org; Fri, 04 Jun 2021 05:03:59 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v12so4302859plo.10
 for <qemu-trivial@nongnu.org>; Fri, 04 Jun 2021 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMXi9vHXpchxUon/pDdTEr1IO0c6b/Xo3Am4EQsqEB4=;
 b=FryNAoGKkQDLCNAazAJdd8f0K7jSxi7Zeb0WrhKGp6n61H6XSYXwTwV3/RHwiMgw0V
 b3LbpnMRK25Vvc20NN5j2I/fzyY7NOjDNsxvYVbvn5ALTsdBNsKGO2L0h5W8AUSAc3ZK
 StMGDm1A5rsCtlc2+iSFhtBvmKJzEULREplBOHHBlOD83R9HJuToY/uPJJpeN6f4MXk2
 sISjJI5ryYUaOgb+X6N0C9uxOAI7eam9gTXGnjWpXkHvDn7L47ZqeoTjpSs32/chkT3+
 piO0Re87MN0mFJSu30JLQhqdpbMnDqtyPZWR/BNrakhzXqkmNj0w3NW1u2LLDy8v7H34
 LHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMXi9vHXpchxUon/pDdTEr1IO0c6b/Xo3Am4EQsqEB4=;
 b=Kcnm0ffsOysn2aPrIFXkz86CJ4Md6KiXm+WB5QWBHVxaGHDwOcDQWF63IcJSzjd/Cq
 zY37rkvXBWh9KbS59nLbdhMEMahSDwGM+8dx2BYE7glLw1bATHKfejTRHb2aGINOxn6B
 O4meGcXKHkn+Ztr17rwoLeThyCAvuHogqppKwipCIvhIrYZWSalyIP041xBsuGRZ37F5
 thVgI9swqK3vRywKqELa97Ncgjumg11kUhE0bn6+he43GUwCFPDufMLbUvnzQJ8E6R4+
 2pWbsz4vrElgaY1+oibzCu9ZhrcbKD8RXzR+6sAEp2ZWF6KEl4f1JoDNSmlsijJbRXl3
 0JNg==
X-Gm-Message-State: AOAM532NUjVchS5pP9FJsmXPwnSYu/hzr1pRpggQL/3YZ58feGqS9ZQB
 yQBz0PT6g8X/4rpmTvrw2dCDulISoYJnKB57ZE2o/A==
X-Google-Smtp-Source: ABdhPJxREXPcn8pd0hBe7FkMk1MWJSUjjx8yeuP/812HVYhhwIKrKot/0JF8ioOqIqOQvrBDm8gybAJfE7Q1st8wVa8=
X-Received: by 2002:a17:902:c403:b029:106:7793:3fcc with SMTP id
 k3-20020a170902c403b029010677933fccmr3290089plk.81.1622797433383; Fri, 04 Jun
 2021 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
 <CALf2nm+LFqM2=vDs8=YfyxQSUT-0xxaCiVmcQzrKoOa+zaTtdg@mail.gmail.com>
 <CAFEAcA-oX0JR80UYzYKvczHsfxWG6oH3Pg4pbM6ByDe57XEHHw@mail.gmail.com>
 <CALf2nmKhPaWJa944dR+kFAQ1hCLXF0XPwXaHTqJQ-C6EW7ACKg@mail.gmail.com>
 <CAFEAcA9E4s3dST0GJkdg24DDAn90WU1FEmXwoKD6oQmNSB1vVA@mail.gmail.com>
 <CABSBigR1L9sE36eYA0Mq4smx1E9A4umTOKTe_x97foSMkryRnw@mail.gmail.com>
 <CALf2nmLOqtwacgrQ91TTz9_QRUmFS9ZNii2Kk7-tQ7LNp9vw2Q@mail.gmail.com>
 <CAFEAcA8oAtjVom+BXtcgao4O252ipmFzv-iNTSzDaJChcQkr9g@mail.gmail.com>
 <CALf2nmKgaZiBOfEWpMt4Yq-NyCYrsFNPwb1hZ0adwoXUs4T6pA@mail.gmail.com>
 <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
In-Reply-To: <CALf2nmLLZ5smxqYJyA+_MPunaQqaM7-Ub9CVurTE1pM0ErOS+w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 10:03:19 +0100
Message-ID: <CAFEAcA9GM72tvOLDZfW=TmvV=DN1cAeXJ_MScWb3oivAR7X9LQ@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Fri, 04 Jun 2021 09:04:00 -0000

On Fri, 4 Jun 2021 at 06:26, Swetha Joshi <swethajoshi139@gmail.com> wrote:
>
> Hello, I have tested this patch with our qemu and it works, thank you.

Thanks for testing.

> What are the next steps for this patch? So is it approved and ready to go in mainline?

It will go in once it has been code-reviewed.

-- PMM

