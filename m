Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iycBt-0006a3-Nm
	for mharc-qemu-trivial@gnu.org; Mon, 03 Feb 2020 08:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBq-0006YU-Jl
 for qemu-trivial@nongnu.org; Mon, 03 Feb 2020 08:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBp-000800-Hp
 for qemu-trivial@nongnu.org; Mon, 03 Feb 2020 08:55:02 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45452)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iycBp-0007xu-Ao
 for qemu-trivial@nongnu.org; Mon, 03 Feb 2020 08:55:01 -0500
Received: by mail-oi1-x244.google.com with SMTP id v19so14754030oic.12
 for <qemu-trivial@nongnu.org>; Mon, 03 Feb 2020 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=I6OvhEtTBXf/k/urycen3rNiNJkDhm7QZYr/60K9fI8oWjqbBmByxTo5bXmY23u34G
 EiexG9EwpjmtpV7l8mARfZGflh3XGxpLKAl3Ll6JTsRYlcyP+x35PecapqE+klps34eO
 7xXr0RPCdRWBCITTcrlhDJZAlQVxyCbTkINaBXde8fNkiZJssezaQgdXHP2pXO4CSKce
 vLxHvE6XVADOPsOgyy1ez2xofvEMrQX8/Fs5Ni++prqLM6r6Bc84yOSTKl22UiRxGvxK
 l+JOM1Vgl4EkWZbiOvTf5pyd6GOfGZBIIp4ZSoY5ezMmXeHtBc2GkLKLtChRB+rsjnsz
 MJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=d71FE2ANrP8miTSYIEBzK+ARn4QdXFMmusnmvXrz1bvnrXdvLIFTg4s2LWU8OpGaUU
 k/zVs16dgc1G/YiQkiko/hLr1D3wDJHMAwWsFdRz0/oKAF1/30FL/dKukfo5I0pZP42F
 rc1HG8d9LCLatNjBlzJXMEJDk2CmdViKx/5VESLmsgEblc/tM+sh+l3lrxVd3CjiwVzN
 Anf+VEZElc8bNeMHb0fzvoB3xnpE4SDmL+E/DlPNO0TV2wgyeErYVA0h/eEpQjG675EI
 BGGYhT76UTQ8JJUK2seuJd9sh4VksFPNv+7CNsvG0dss/RIRLvJYbRyfmh7r0jm2Czn1
 ECuQ==
X-Gm-Message-State: APjAAAWEuxeU++uGcZ5/B8fuI7RBMs6NjkXG/MjMlsyJG0F1hdrHziPU
 5k5btqUGtfpDsoUCltJ31165zvlxV9nbnjOizQVfhw==
X-Google-Smtp-Source: APXvYqzQraWc2TLciyjPjGHKCApOC6cA4XuHWCUNLP1/9vFisa1uCTr8o5LYE0hOWKhY4cHrYyCICeZpPOUQurBrk0s=
X-Received: by 2002:aca:b2c5:: with SMTP id
 b188mr14899401oif.163.1580738100327; 
 Mon, 03 Feb 2020 05:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20200203134251.12986-1-lyan@suse.com>
In-Reply-To: <20200203134251.12986-1-lyan@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 13:54:49 +0000
Message-ID: <CAFEAcA-CcNwozBBFWenjnBpRPYhxe_sDiKffwO+SZk38xtY4VA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm/monitor: query-cpu-model-expansion crashed
 qemu when using machine type none
To: Liang Yan <lyan@suse.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Mon, 03 Feb 2020 13:55:03 -0000

On Mon, 3 Feb 2020 at 13:44, Liang Yan <lyan@suse.com> wrote:
>
> Commit e19afd566781 mentioned that target-arm only supports queryable
> cpu models 'max', 'host', and the current type when KVM is in use.
> The logic works well until using machine type none.
>
> For machine type none, cpu_type will be null if cpu option is not
> set by command line, strlen(cpu_type) will terminate process.
> So We add a check above it.
>
> This won't affect i386 and s390x since they do not use current_cpu.
>
> Signed-off-by: Liang Yan <lyan@suse.com>
> ---
>  v4: change code style based on the review from Andrew Jones
>  v3: change git commit message
>  v2: fix code style issue

If a reviewer says "with these changes, reviewed-by:", or
"otherwise, reviewed-by...", then you should add those tags to
your commit message, assuming you've only made the changes
they asked for. That saves them having to look at and reply
to the patchset again.

In this case I'll just add them as I add this patch to
target-arm.next, but if you could handle tags across versions
for future patchset submissions it makes life a little
easier for us.

Applied to target-arm.next, thanks.

thanks
-- PMM

