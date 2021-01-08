Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxqAa-0001uP-Gr
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jan 2021 06:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqAZ-0001ti-Bg
 for qemu-trivial@nongnu.org; Fri, 08 Jan 2021 06:43:03 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqAX-0007Fq-4r
 for qemu-trivial@nongnu.org; Fri, 08 Jan 2021 06:43:02 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g24so10847329edw.9
 for <qemu-trivial@nongnu.org>; Fri, 08 Jan 2021 03:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FBfmz197pDsZkIONNMlw1co5B8rbv9TMRBJbAagSJY=;
 b=xBO2E1RMgAwIB6DMxKQErqiM+LWMjrn8zjuYqvx+zRCkECoytXwxxBRIsZaO97z0YW
 SCffR9PD1Vr6Ev1LSyu2fhtBUqCBI1iccQUx8IL2yhgXa+/6/BZQsavEjzq3uMzcuiJo
 9p//HA0IXlHghRkDUayZqLBiABcpCbH6cCVVynpls2NSUmP3U38eTXVByC/sYhH+GUJf
 nabIL5L4JThgq8jTKjUOwJQOeznAu5+Ba7Ya+6X6G6bKdlCEisY1cDyWDyeAOy+k9hde
 FSaqGqIiTcn4724xlln8AOZ639CbAKTkCjDdbsKLzAwWsfEHeU2/OJUNUsx37evFfDBX
 5D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FBfmz197pDsZkIONNMlw1co5B8rbv9TMRBJbAagSJY=;
 b=VAeiQM2hze0B5ZIwp5+eHtYASyynwLELT7wXEeqAkGx/1F+Kv5Zwxn9BmnLG54coxq
 Xu2nzUkySE/igZMdhAZ/au/CsEq7QH+FMWCY6BAn4tI9HeGt63IlcjxPpNBtNFzKSODy
 oEW0dTY8AKf1f7ZpLy/HfDyJQth6ErfHHB++0D6Fq7t8K6TR7x+mSHhXnLSlFigWkUtM
 6nU+0GKbeiHPWNf4kfkKiEMjn93lScy5tzF1qrOUE2n+rYinlORMMg06p/t5nkzIb2hN
 yQ2YzIvQaGuyyfmqqFwmcb6iu4/GvhdHnBzpgwj1Yz4iQMowFrSJxzTBlzd8FtB+0UnO
 bmrQ==
X-Gm-Message-State: AOAM532CaHJiZa/dai7CQv4DcWUWzBmHToQ5gcNuarcldL3QBImsk2g1
 jqDdbt4Rp4y1WLO02vvvJqtZhDsMrMEkwJN9rqI2Xw==
X-Google-Smtp-Source: ABdhPJyymzjCKTPHolDGvH8tlWsqUqaJmisS1/mPf1oPGhoqG8DvMus4gIAPVh0B5bgl0L6D3dQ2DozoLM5t9do4MRs=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr4968108edr.204.1610106179256; 
 Fri, 08 Jan 2021 03:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20201217113137.121607-1-ganqixin@huawei.com>
In-Reply-To: <20201217113137.121607-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 11:42:47 +0000
Message-ID: <CAFEAcA9Z9VDTW5GSC=R_NYF_FOoKMXQcCy3U6pctmj0jg=0-Fg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Fix some memleaks caused by ptimer_init
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 sundeep subbaraya <sundeep.lkml@gmail.com>, 
 Jan Kiszka <jan.kiszka@web.de>, "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Fri, 08 Jan 2021 11:43:03 -0000

On Thu, 17 Dec 2020 at 11:32, Gan Qixin <ganqixin@huawei.com> wrote:
>
> v1->v2:
> Changes suggested by Peter Maydell:
>     Delete the modification of unrelated whitespace.
>
> Gan Qixin (7):
>   allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   digic-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_mct: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   mss-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   musicpal: Use ptimer_free() in the finalize function to avoid memleaks

Applied to target-arm.next, thanks.

PS: something odd happened with the threading of this series --
the patch emails weren't follow-ups to the cover letter --
so the automated tools like patchew got confused and thought
the series was empty:
https://patchew.org/QEMU/20201217113137.121607-1-ganqixin@huawei.com/

You might want to look into fixing that for next time you send
a patchset.

thanks
-- PMM

