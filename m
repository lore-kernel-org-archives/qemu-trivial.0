Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lC4yo-0000Ro-Gh
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2021 13:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4yj-0000Qy-4y
 for qemu-trivial@nongnu.org; Tue, 16 Feb 2021 13:21:41 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4yh-0006uH-6l
 for qemu-trivial@nongnu.org; Tue, 16 Feb 2021 13:21:40 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lu16so3253075ejb.9
 for <qemu-trivial@nongnu.org>; Tue, 16 Feb 2021 10:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dV4AiGpKRHbQ44elFAEmOGZxzbFj2njRzLNiN9yuzKs=;
 b=eU8SVgvLQwnZ1TE1K8+yHo82rwlkrQXTmGlul2QdfzZx4rhwwzRkgJyT3N9t7TMN7M
 07lT0+pjfETR1bX0mF3NA02F5QW3Q32qL+PyAT6lOEPUVak+004hSXtX6vLeURLQi8e+
 2lRWsyjsE7tgzQKJhslHbVCQchNn2RtwyQIRk6kIUo+Cbfulx6p13A8eNRAYjlW+WhT3
 erLSXgFLFojl0ArCPxXJT427kJHa37iZBK/Cul1IHwoC2GlX+TXmyVu6NQtlKGvkEsim
 UHL5stSyf1HcDMqz+wMOSowkGlW8VSg5cg3Ut/dUhlajukViPaHJusvoq9nQpQ9fSaJJ
 JJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV4AiGpKRHbQ44elFAEmOGZxzbFj2njRzLNiN9yuzKs=;
 b=A26Deh4phykA81LaIsuvczjNlJ5tbSG4//PdFTTPrGGSIYKZW/U5AYgUfTM+/8JO1T
 3nGhDHM0/0qGjrOQr1AAzT6pO13YqDPCYKxZpZIJ2czVa43Xcmd7IYvgLaYgQS4qsKTU
 GNz/lB4RY9lqsAOLrBBNa9WR+B54BnKzY3G9BMoUCoOS3yyS4iDlLc5x6lVcR8iMMmQU
 l7/T6zb1ELc7WvXvgRH22zJZdtmXuy2dcpRa9Mh9Ht9X/n8iomCoYDZXb742dTq65jLq
 8dbuEopxzTPpKxdCCt4sxDRcrzqyAmhMKcCw2A7Twxy2GAEy3RP/M8jed/PZ2KSsekiL
 4pFA==
X-Gm-Message-State: AOAM532uQFzKXuoVFVSXkWR1ckoFUPd/bwwh5SnP7UeLWy6QpNp22r/1
 xLI4500bS2Ekj5Y9qXGWT+wYaqerB1WTKmFY3W39hA==
X-Google-Smtp-Source: ABdhPJzu7KCt/LDIUqvD4WSSaPiYwBGQFCPUjJ2E0WuHgl9x605IYTX/T7g1uCJnvfUu4rR03YTqvmFKRBC675uJitw=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr21894564ejh.85.1613499697158; 
 Tue, 16 Feb 2021 10:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20210216181316.794276-1-alxndr@bu.edu>
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 18:21:25 +0000
Message-ID: <CAFEAcA_reLPQzjN9PJOC3n=iC0W96aF0qzPZtcO3xpCt_1kOKw@mail.gmail.com>
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Tue, 16 Feb 2021 18:21:41 -0000

On Tue, 16 Feb 2021 at 18:13, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

