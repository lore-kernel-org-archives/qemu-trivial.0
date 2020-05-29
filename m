Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeeg9-0006UC-E5
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 09:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jeeg7-0006Tl-A5
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 09:04:03 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jeeg6-0002EZ-2e
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 09:04:02 -0400
Received: by mail-oi1-x243.google.com with SMTP id 23so2455069oiq.8
 for <qemu-trivial@nongnu.org>; Fri, 29 May 2020 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iC5m7M0pMiRfhlYPJA7LJN22SuRDWQ/dAo6Ln1ruTyo=;
 b=w8IbJiPg/KmlmEW0ot5jPvBi55SiLra+fXU08XVvdTQPFM86Ovgqg3siEs6b53Cnu8
 xOomPEFEL+H33MaqbLNyUVlfk69T6mNqQ2badjpORCwjbY1MNm16U5P7OhGF50k2MoHj
 uC5onHQwmCOA6Kiiv7Z8qlUUClLyfJ0MbdHX6W+sPQfJugBWRqzdZ72B+GrW5uSDaMgL
 SRu1qt6qQlcAz5Xy19NfbvYjtQeISg2kUyKJGEq15kjOtAC8lX0ZoyT19qFwTOHW/0G5
 CUWdD58xnkW/gsKCzIM3HQ5fOkbvKDXZkreC8QDKpJ4l/OKmstuu8s+MCPeHDsnUdA40
 h6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iC5m7M0pMiRfhlYPJA7LJN22SuRDWQ/dAo6Ln1ruTyo=;
 b=Y0Gkk6whkWG5Tgkc0y7GE+FBIIA9okyqYF8PKMz8QKhBPUF1ITYgeAuxm97QqEQEy9
 1pU6V8XGWzmmlUbZNidL9jxKsbd1WU0Odm+xQzExUoKs1JgrnWBv5dKx9ED6uenDtEPA
 Y/ZC+bIm9lHfFssAvIhJE6SmdSQjdqakD19siKUSqWUT/dDOLkMV+Wj1FH6yohiaMJsF
 3EQMnKKa1DQMmsyyLdrCCq1YkMqb15ExaNhHwfcgNE53hVlxGQ8vA+e2IXKNNEHdIEhT
 brfz3aEXokhjZw97RQBswtGnr77OsFe8Se/I1D79fT4wEM67GGtdqgQ7Y0vMpab83vK8
 MF9g==
X-Gm-Message-State: AOAM531jPuWsqfcgg83PZCo/zAKph1/OTlQYEaEbZqz79B9MjJewj3E/
 EAtdOkDwJ2wW6PEKipMUBubHMoXARFOjTw2O2hN/7Q==
X-Google-Smtp-Source: ABdhPJxwk9JDts+7nF2avf2lzAsAKmlrMBDYBXqIA8prIS1XtXIDeKcMsjQiKRBSHB5TiTF4GrMaVFLuBZMSVybuYLo=
X-Received: by 2002:aca:ed16:: with SMTP id l22mr5378325oih.146.1590757440595; 
 Fri, 29 May 2020 06:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
 <20200522115036.31516-1-e.mikitas@gmail.com>
In-Reply-To: <20200522115036.31516-1-e.mikitas@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 14:03:49 +0100
Message-ID: <CAFEAcA8uRypZhccZ=ce6u28ii8ZBE1qEKC7OnmJfCLM351pD2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/ssi/imx_spi: 2 Fixes to flush txfifo function in
 imx_spi
To: Eden Mikitas <e.mikitas@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 29 May 2020 13:04:03 -0000

On Fri, 22 May 2020 at 12:50, Eden Mikitas <e.mikitas@gmail.com> wrote:
>
>
> This patch series contains 2 fixes to the imx_spi_flush_txfifo function.
>
> The first fix prevents a case in which calling imx_spi_flush_txfifo while the
> controller is configured (by the guest driver) to use a burst length that isn't
> a multiple of 8 will cause an infinite loop.
>
> The second fix makes the spi controller compatible with slaves + guest drivers
> that expect to make transaction larger than 8 bits by removing an unnecessary
> cast.



Applied to target-arm.next, thanks.

-- PMM

