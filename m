Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUrDw-0005t0-3d
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 10:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUrDs-0005oP-W5
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 10:03:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUrDr-0007gT-4G
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 10:03:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so676500wmi.5
 for <qemu-trivial@nongnu.org>; Mon, 27 Sep 2021 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e79KqByijb1H8rLvqIqlFOX4oAkqkV8I/eBFpk7GgMQ=;
 b=InP6OhmePV6Gk6Zm/173aNwyIEgWLi0MMVKA4rJ70DmYOlcIYpoHVLJ2fZqr8AhpJl
 cl/2VjKBEtlxloQ1W4uCMVBWykN8vAXx+GBZigCaBIBq9LGq6SBRo85GN+X5hx11xxeQ
 VGfCSjYu2KF52AI1Ff0x1U8ijagfnmhwdsMLfDTI6QHqJ710zWTKZP/sZ9bMJL0sfmXW
 l0n6usRJvp8NJkrY0TF5tifFjGCAQ95NLa+7BKwp79q27H/7IBcsO0xUOiIIyqjP8OUL
 YjBB+qsWNas5nzt72el2she9kc5wOFXyEoOOFJj1k4nSpKiOQ/1GM2V3AjpFKnP7vwi2
 LPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e79KqByijb1H8rLvqIqlFOX4oAkqkV8I/eBFpk7GgMQ=;
 b=lpqrua+WvBGoiViirlmB890tHMR7BMRSb5UZNq8j9GXT3m9gzPltnEf5rur96LMP2V
 OWvhvGVZP8OtMgWQL1qRYhwFAzk5U3ClCkoE+2XyjHycZ45xhCewJXdgfPNKhuVsMXWX
 IHhlU5rwEQavTlLM1sKHjYCk5ByJUbqIHCv3wlUVh2BEFhwWDwy+BgNA/vms3IeIY0mJ
 OJ+i8WgF2qmUKmZf9qUqhv64Iz/3EmI3LQAci0SuOblrfOkS6r9wz6o55UyPdqcGhXAz
 BELTiE1BVS3h9jSgvKHoNHR6KiNJKTrMRLPOzAOow4yPXvoPXYbKWFB+PV1iIxf7H6CM
 a5xw==
X-Gm-Message-State: AOAM531aXB5SWS8MvfTUi2mchFIRwYJ51BMYnRi3e+G9DvzWLCPRLxZI
 gFawvn8zyhsCcluYzh7EM1KgsNgNg//Sd103ICPcvA==
X-Google-Smtp-Source: ABdhPJwlYdRAIInYJtX3al9Ors1bsLkY0O17GsLPaKohgw7EYZLCz17cz9Blixn25pVx4r/kDEld3n6eP9QObTyayIg=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr4945332wmc.126.1632751385612; 
 Mon, 27 Sep 2021 07:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210927095252.2374148-1-laurent@vivier.eu>
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 15:02:12 +0100
Message-ID: <CAFEAcA_wQCbGUCX8gEWJzDBpPzPDSahJCRUXJA+M_1uGNk5pSQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 14:03:14 -0000

On Mon, 27 Sept 2021 at 11:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
>
> for you to fetch changes up to 45b09cb12f5440971b321fc255e3930f38366ace:
>
>   multi-process: fix usage information (2021-09-27 10:57:21 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210927
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

