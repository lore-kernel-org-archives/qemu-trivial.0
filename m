Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1js88C-0008Mu-H2
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jul 2020 13:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1js88A-0008Mb-Pr
 for qemu-trivial@nongnu.org; Sun, 05 Jul 2020 13:08:42 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1js889-0006ve-6o
 for qemu-trivial@nongnu.org; Sun, 05 Jul 2020 13:08:42 -0400
Received: by mail-oo1-xc42.google.com with SMTP id k47so3528685ool.2
 for <qemu-trivial@nongnu.org>; Sun, 05 Jul 2020 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGYzV59vme40syEGC5eDxUkPe3o472q55eMhraZGah4=;
 b=QqXg4TqDavrpd92pq40EWW8T/JB5rwtx0WCwdRCCysJtsVnUvF3+PFUD/0oAFC/6Wm
 lU1BabkQodnbFzzSJp71sAprXtf78yq+p/UjvHq3VmGjwj8iEBL0CtzruJSXzunNmXOR
 Mdy2/7FQLgGXn15rBa1vs4wRRknBF9BUShkSPmTM2kPKpa83UbKFc2TbZpJ57DQeBaib
 nWE5686DH1NYNXbL74UZYCPcnSWvkCHQlLvPRZguIw489TJ8MMY8WELgnjsW3A7W2sGJ
 zTUgbTLLjisywKOWuqz1ds5lfFqsP4y3VnL1EElxoxU4WAi4uB9Z4bDiTF7sGDVdlIg0
 geNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGYzV59vme40syEGC5eDxUkPe3o472q55eMhraZGah4=;
 b=Bg9O2gc+1EzKLLe/zQ/QfHWgj27PDWNeeZdpUcSk95TpL2Gw7bUJ/hDenfDdyfdwUr
 7dZ3AL4cOjsB02/0ImdVs16jUg/Cr+LlUJKU/B6rlICyw2gVolDG4meN+S63L5txITMk
 TeqsOrGtLKQ/Cwe+aMikn83hQTpvQZ68i/iKeWrtZ5u4NKS8xktnmRjDkqX/eZbPWuPC
 xSv1d3/Iq/AwA0hzZjfvVYEGupVDxpse0nALO+Kjx0TKYQAkS3/yN/ylze4tA4PfRYQz
 Lv7KtYbrqXN9DMX/XKziKwey22g07PZRkXPufz7ZCxoefRcF3ct7xra1e1JdJo3TBK5s
 LY3Q==
X-Gm-Message-State: AOAM5338Q8fxg4Pu+G5IlqoqiooZIymszTznla0uNIuc3iqdJXQ/W3ls
 7ROfqd2Eldg3o8qUUam+Tybt4scLFbddB6Mb+2Jvlg==
X-Google-Smtp-Source: ABdhPJw6mrmhpHxvCu8uaPKTSYmGxhA9st27SGjuEGjgFVt3M/eIo2prnukoaDf8WwqQncaFJFj0Y6PT4OyrjSNrWKo=
X-Received: by 2002:a05:6820:172:: with SMTP id
 k18mr31107564ood.69.1593968919369; 
 Sun, 05 Jul 2020 10:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200629160535.3910-1-wentong.wu@intel.com>
 <20200629160535.3910-3-wentong.wu@intel.com>
 <3260735e-05ab-2d42-f7e4-914ad804f543@linaro.org>
In-Reply-To: <3260735e-05ab-2d42-f7e4-914ad804f543@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Jul 2020 18:08:28 +0100
Message-ID: <CAFEAcA_+e7hrA5GRGb=gv3GxJRL77ARP34vyudRbiqhdsNVKwg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/nios2: Use gen_io_start around wrctl
 instruction
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Wentong Wu <wentong.wu@intel.com>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Marek Vasut <marex@denx.de>,
 Chris Wulff <crwulff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 05 Jul 2020 17:08:43 -0000

On Thu, 2 Jul 2020 at 19:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
> This isn't right.  Not so much the gen_io_start portion, but the entire
> existence of helper_check_interrupt.

I agree that it looks bogus (xtensa has a similar helper as well, incidentally),
but fixing all that stuff up is more effort than the relatively small job
of getting the icount handling right for the code we have today, which
is why I suggested to Wentong that we could just do this bit for now.

thanks
-- PMM

