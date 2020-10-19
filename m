Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUX0X-0002ZT-Bu
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0R-0002VU-AG
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 11:23:28 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUX0L-0003xp-Cp
 for qemu-trivial@nongnu.org; Mon, 19 Oct 2020 11:23:25 -0400
Received: by mail-ed1-x543.google.com with SMTP id t20so10640149edr.11
 for <qemu-trivial@nongnu.org>; Mon, 19 Oct 2020 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=kr5wNKDm58CZNtiJgvXFBKp9c3+gbXYA62C3UKX153CcgyvaEFH5t2Jc6JO+3O7J6I
 4BpYo4iLK1ZMb99ku2yfMys2bo5/ZtRRUdyvisTUJpr9HmIPTJxjLXBXWzLinZhPgiL0
 AIMaSw0ENxU3tEctr6sHY/E63fzbO9tXLaIsn5z5mlSWBuDLz+8Kr5ZaVqKxtMEVsHp7
 qAy08+fk9v4TZDWhsFNLFNe6ROKDTc0pLD4Ve7c678ei2f7cM5ch/l2/F+qjVuqx8OkZ
 cRnrAd6g5ZySAufzy5ziCqRBjfoTxzi016RnR9iimL6W98U6QXe4ln43PfC0tPA5TpFV
 oG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rEF8vCp0ne68s88LSiZAalVd6SH2xeZNXOAKExoOtKE=;
 b=dYQimEYJMVRsTMbNLMAaqi7AgxGegVRzlLe1AqKQ61WzA9Fw6djAvHbxf/i3Kar28W
 QVsB3/7Q3SDqFnatSRvg2IXOWeEPmCpzVwdCYsuZAJ8BO4+wa0FEyH5mESKxBNRrwJsP
 +PoCDW8OyQ7oz/cJGcvCLbtSpRPYQL27ZArbuCCxSw/fMG+1d3j8N5UbmmAuCo+eWrjx
 yMXRC/+bHL7ZH3HeAqDfPUXrHaVcWrLdl+rbZ7PgIfp9et+zQErsvS5sl0mLLSKsmXga
 OEv+EYJCt4jFqsCSSF4ITD05hkoxuMJ6fJtzfMJ24rn/d/TsrwAyARX+yuQ4wAqfcNt7
 L7eA==
X-Gm-Message-State: AOAM531MyBNOuS8uSM+B0QvguLoaodfNXiD/wAJzFB9XZfGBU23TIK35
 1hCDXIickUoG5M3etcDQ8EhXcYfdnCYC9PmpQkAK+Q==
X-Google-Smtp-Source: ABdhPJwaSQo4DgM1Frso9tKu8F1xU24jTB4teY1uN4/mTvMq+DtdJ/YnxqhkFXaUcuzRT1YsqTZUpAF1kYgnpgah4mA=
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr353827eds.44.1603120998221;
 Mon, 19 Oct 2020 08:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201014213601.205222-1-f4bug@amsat.org>
In-Reply-To: <20201014213601.205222-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:23:07 +0100
Message-ID: <CAFEAcA9GxfBR-vFeT=QdmRwD1Y_6orED1bruXEsvyD73osV2WQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/strongarm: Fix 'time to transmit a char' unit
 comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
X-List-Received-Date: Mon, 19 Oct 2020 15:23:28 -0000

On Wed, 14 Oct 2020 at 22:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The time to transmit a char is expressed in nanoseconds, not in ticks.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/strongarm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index d7133eea6f9..ca7c385f313 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -935,7 +935,7 @@ struct StrongARMUARTState {
>      uint8_t rx_start;
>      uint8_t rx_len;
>
> -    uint64_t char_transmit_time; /* time to transmit a char in ticks*/
> +    uint64_t char_transmit_time; /* time to transmit a char in nanosecon=
ds */
>      bool wait_break_end;
>      QEMUTimer *rx_timeout_timer;
>      QEMUTimer *tx_timer;



Applied to target-arm.next, thanks.

-- PMM

