Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knkfH-0004eW-Hq
	for mharc-qemu-trivial@gnu.org; Fri, 11 Dec 2020 10:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkfD-0004ce-TM
 for qemu-trivial@nongnu.org; Fri, 11 Dec 2020 10:48:59 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:36217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkfA-0005sV-Qz
 for qemu-trivial@nongnu.org; Fri, 11 Dec 2020 10:48:59 -0500
Received: by mail-ej1-x641.google.com with SMTP id lt17so12979424ejb.3
 for <qemu-trivial@nongnu.org>; Fri, 11 Dec 2020 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=QUQsmgL+aM1wJcvfqUNVi78K3d7Ize+HqhM66f7EyCvdpm7bzNyNYk/aEihuwyc2BB
 F0FboP7o9rZ7TbE4H6vjUSD45Wf1iNL3CMwo8h5gZRboMEIHZN+Fsf3WRW6bCMBZujdm
 e4xVyGjoHF3Ph8xIT6rVbVYXDb8yhJ6pwOxSZGaHcepIRtbcszHfMo7ZaIX1BUAAtvlC
 THHH7px41KXU/zo7KEuzaxZ2raW1xFZDfthi8NMbmgPlCgizwBUAO536laA7Cz/L5CWu
 00YUJpQsfF8qCfvoNoWNQrZEPbXy4gyV6HdYPR4NPbeGfKDYHQ6jbnwd9/GxmpgZS3uF
 OK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=OD9e10VnqhaW1BhSd4v1uPihC1/rO3A2xk4PXVrhVzkga32gh31cihUX1Cr4f4ltwh
 fRXQl4dEodFioxYvm+SRPHk8ZrTa2QK5naKHxSLcOGepnYiIwOlwzC6JPFrEXwF+bnFM
 YKPCGR9Knam7EPhskhjzS1RfkYHMtOMaQcMPXtw8spunbbbug9gY6DgGa/xPgjwDjWkX
 4dR5ygiMZyB93Oy0QaGq8LAjmoFbvNERWJzrGKrHvC+Dj2XZFC0MZ/kLu4MU0Hzsg+/v
 fW0jIc6wZ2x+A2LW649o8iIcEdIkC3K0kRhjhGoIl7hIl+dCmwEc+nBNchsQ/Aj0zz1n
 fEzQ==
X-Gm-Message-State: AOAM530s+QHy02xRLqy3hUlpVyp+7zKTfG+P40w5kHymfISxDnSanOT7
 KsCfElo8V8xbWT4kIftWEUC1oOv5Y6EGC8jmQ9pqbg==
X-Google-Smtp-Source: ABdhPJxTYAbIpQdoZByVxXJF2HKKruXAbGNQbPKFhvvj3f2H01Oncg+741dYm0iNF4n0/900sPBwl/r1JSWsSKgKEhs=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11784274eja.250.1607701732526; 
 Fri, 11 Dec 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201211154605.511714-1-f4bug@amsat.org>
In-Reply-To: <20201211154605.511714-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:48:41 +0000
Message-ID: <CAFEAcA-uv+5yoPNRDY0n69Amhqi_LiamVoBAP-Ui7yD1gGXYWQ@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/twl92230: Add missing 'break'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Andrzej Zaborowski <balrogg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
X-List-Received-Date: Fri, 11 Dec 2020 15:49:00 -0000

On Fri, 11 Dec 2020 at 15:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add missing 'break' to fix:
>
>   hw/rtc/twl92230.c: In function =E2=80=98menelaus_write=E2=80=99:
>   hw/rtc/twl92230.c:713:5: error: label at end of compound statement
>     713 |     default:
>         |     ^~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I noticed Thomas "Compile QEMU with -Wimplicit-fallthrough" series
> and remembered this old patch.
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/rtc/twl92230.c | 1 +
>  1 file changed, 1 insertion(+)

I guess the compiler doesn't care about missing 'break' in
the last case in a switch statement. But I think putting in
the 'break' is better style anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

