Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jom3Y-0003kb-4c
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 06:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom3V-0003iv-Sb
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 06:58:01 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom3Q-0005MK-Ut
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 06:58:01 -0400
Received: by mail-oi1-x241.google.com with SMTP id j11so5024541oiw.12
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2020 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=anOpxB80ATNlOQn3eLckhfrVMdcal6uh7okRHELTG2g=;
 b=ymYrsVav+jGuiIHBSBLgrOzlV1pWfxJZibWGtv1SDYTROumJxJw8TIjwTq9D+LhuiB
 ZbolJQR188Ju9H6mOdj+qQM79Idutnh9KxuBXpS0mdCSEsEXGKkrlHAn3RsOYqHoUq2j
 YQKpYA+Ybzys1F3q07OIXP4abmXs4vjx1i9maZHVzXRk9b5lmz0mem/PYjtO3jB014Aq
 PfiyAFfH79VNXqBR5oWJE3dz2WDgExfybBrVpmUMXz9gm5KvCA24/LIvVpv1LiRPp3nw
 enmv06J32l9Xl1fVLInKad68/EqowRK3fOvqeHm0ZTRj02z3bWkJ+0GB5Dj3EVo3USEV
 HWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=anOpxB80ATNlOQn3eLckhfrVMdcal6uh7okRHELTG2g=;
 b=o60hhWwBl4W2ecg81yj0Zyp8MNTcCJLAkDIs0bzNfI3gUEnhJSddOPwkCUEr2BlYjK
 zT9S43eVLVjAzIYj5mnEXejv39fTSpCde4xaDFlXV2e1GlrTWIG6fwbHvGKNXrzpvnC4
 llrfG1gZj8utbqdD69/a6WGtqA2mFTYz7zpcv8Vp++taDNyPJpOn5YwV3tM6kQcQpMgP
 ls0OzcABjjg4XnxtosH4PxHC2DW4Es3Y1okJex4cOOiRj8fow6qDqjcDFoX+Z/Npn43J
 yOxTD6tYowXz4RkhXeoyRX/w1naWTUkLAUsdfxaakzuSVvhyIDUFbSrF01d+6Y/JXVRc
 z7ZA==
X-Gm-Message-State: AOAM533UBTb3B05rWYjwITQUTCFNgO0pSyuZyFXprKKyxXAntbdaCcmS
 lsj5OvQc9wK7LoerMMlpkTvCdiqJ/JnwLI2OUC8a2A==
X-Google-Smtp-Source: ABdhPJxlK2t/VzKwI1Pr7uzLCoGzhCW1C/qhZ1UFrDiYE0LyIa3ea4/pgJbJzo11IrHYbxntfSfPYgSI9937gmOoDeI=
X-Received: by 2002:aca:568c:: with SMTP id k134mr1792595oib.48.1593169075815; 
 Fri, 26 Jun 2020 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxRDPotkG6ioYipzZNMLj-w1CbFbz2cd6BPet8GQ4r8oA@mail.gmail.com>
In-Reply-To: <CA+XhMqxRDPotkG6ioYipzZNMLj-w1CbFbz2cd6BPet8GQ4r8oA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 11:57:44 +0100
Message-ID: <CAFEAcA9fGG93SbNk9ASyzdy=QOt59JbeG1joTDgco=3bbZg=Qw@mail.gmail.com>
Subject: Re: [ PATCH 2/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
X-List-Received-Date: Fri, 26 Jun 2020 10:58:02 -0000

On Fri, 26 Jun 2020 at 11:10, David CARLIER <devnexen@gmail.com> wrote:
>
> From 19a41d406eda976001827d248398d7fb172d140b Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 10:38:17 +0000
> Subject: [PATCH 2/5] Enable *pty API.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  configure           | 9 +++++++++
>  util/qemu-openpty.c | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

