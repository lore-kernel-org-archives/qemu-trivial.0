Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUpbi-000476-Io
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 07:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUpbd-00045k-UB
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 07:15:06 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUpbb-0008Lg-VA
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 07:15:05 -0400
Received: by mail-ej1-x641.google.com with SMTP id u8so2102755ejg.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTBTM6kZdyting9dnwCgnfuL7yXsGIQ9CBVlep2Z6Us=;
 b=gE5GIkdqzL6orVBKg3zUhZGYN4flOeAZi2nlpDjgUAuA1IbSyfh6zlm0PjA1TeNtSZ
 Azn8K2vumwvLzf99y8Wmt8jjHNrIon9OzZf6A6nsRgFbMhri459GWF9upZKP0Lo7IC6u
 NEmMozFmr0Aezu0Hwbvqrq2i3C4AmUd9/TalzVx+Ji0eEq4o/ayJbZaXqQv1cASKikna
 zxvaLk8cAKAwpX1kjjgHQ1vyAeiQAFE4vXsgwyTCbMT/ummx6PHWw//TzXOSMvvwxDJd
 NXNDiMp0/oJkZgwT8k222Bbw5o2xRCdUz32I3qJxbnbv2tqIzuOMrbVfxo+Cl16rUWRP
 Mzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTBTM6kZdyting9dnwCgnfuL7yXsGIQ9CBVlep2Z6Us=;
 b=sOq1Ljb1jIb07YspduvmVp260EV0//LwWx6x7ntJ3dVzeKv9yaHSIkW4IAo1dlhGo4
 qL/LOlSZvdaTuTPGwqpSvCkSrpThYYdMnYzg33j3jDUuRZbUnZpvY+GKPVavYb8uXO0X
 D1yK9nm4H3DR3sjMuDDy/oPVFRdIujzGaugBuEv2YIyAztH4pUlkgomp5fLeH53nJ8A7
 HeBvnFkKqcZerjIygfUrdRODupD0yr1CkkZnapLut6M+ObcdZur932c99yfvwwasXBtx
 bpAEKlHsPw4kEN7rMGdQ1t/Ttq/6XGUkox1crbUb0SuYcxzEIOLWCR0SxP4UknYeQ5ny
 M1ag==
X-Gm-Message-State: AOAM533TnB4mB2d/oYUPcCDgHLTxlALC9EmeyRU7ouJuln7zwO7TugOg
 h7Bdp30C+L24jAHz0CzOEua+m5okOQleZY0iPVhv5A==
X-Google-Smtp-Source: ABdhPJwNGtqheOecRNSzzNj0gcnZ9M0CyUlaELiqjp2Kjr94XKhwTh6Xug7/DKXgwCzPjR9y+qEkkWKs6b9VvqDULCw=
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr2556236ejb.482.1603192502132; 
 Tue, 20 Oct 2020 04:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201019203023.658555-1-ganqixin@huawei.com>
In-Reply-To: <20201019203023.658555-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 12:14:51 +0100
Message-ID: <CAFEAcA-NPcXxh7QPtUtY5CornQjb-vTb_kCzRUSwMCZqkVVkBg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Fix line over 80 characters warning
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <lvivier@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Tue, 20 Oct 2020 11:15:06 -0000

On Tue, 20 Oct 2020 at 12:03, Gan Qixin <ganqixin@huawei.com> wrote:
>
> Hi all,
>     I used scripts/checkpatch.pl to find that many files in the hw directory
> contain lines with more than 80 characters. Therefore, I splited some lines to
> fix this warning.

I personally have come round to the idea that we should instead
adjust checkpatch so that it doesn't have a hard 80 character
complaint limit.

Compare the kernel coding style change:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144

whose rationale I agree with. We should *prefer* 80 character
wrapping, but there are some places where an 85-character
line is much more readable and sensible style than inserting
a line break just to please checkpatch.

thanks
-- PMM

