Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDqXS-0004yu-Ah
	for mharc-qemu-trivial@gnu.org; Sun, 21 Feb 2021 10:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDqXQ-0004vC-Ig
 for qemu-trivial@nongnu.org; Sun, 21 Feb 2021 10:20:48 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDqXN-0004yf-Sj
 for qemu-trivial@nongnu.org; Sun, 21 Feb 2021 10:20:48 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g3so18691686edb.11
 for <qemu-trivial@nongnu.org>; Sun, 21 Feb 2021 07:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfHarvDWY5VbLwrzh8DDcLCGIArEg5v/3WA8vYvBUu0=;
 b=mATd59X23H92sQFkNNaKiWUd6nE/DLp2NTz5Uw2k1+d7a+x142MQieFEfYZhjVNU/g
 N1HLOiY4dKwqfcu3SxCA6FpPrgQx0nuRF1bdMClwRnfI8R7PdSCdglXsRKcJZZ+f6O5p
 k7x3Vb+tDz2eVFLKYSLK4HThfXqC3NEBXZhonmIhK2iAtYZt5XERgiukbii1NgDhKQcf
 rzpR5jubyvcjNpi3TC98G0PihQAZoeoqWPL2ySUsuFHTlqgeEAOMoJEXDefkEtdCdTkn
 6EQE0zh3UjgnDLQWJG+th2nR9VQeGG19VFPewCTqzFkIIMwnWTDVteCp22PUsY1Ni+Es
 2nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfHarvDWY5VbLwrzh8DDcLCGIArEg5v/3WA8vYvBUu0=;
 b=el80H0QWKGP4ls7w/3dKi4DsltVDToRutp47LNnAN6qP1ffKc+81iOJcBtX4kBxs88
 n0zeuifQ8wCHJSSYVeNkK5yIR2573wKQQpRin2foxEsO9xn018GuZVMOgfqnEeHH7vJx
 ni7Zdzk1RtH+RWzlWbb3sR6ncqvuoBd7iPMyDp6/6JEL4T3JDHys27VbybDWIKSaE8d4
 g7JWA6fztzDl+H4JELCD1MAAkLr+pr1yzuTKL8xYNp9cBtH9GKzjWFDRrb9FEWFFHe+E
 KJy0p45UxLYoe6zetkGziBxj35aTZzVo1bjWE3emLxx7rSlgndCTMWUSgxFtY/1XpkY0
 Rs5Q==
X-Gm-Message-State: AOAM532qsIgu7t8RnqsXAo/mrv71a8vFwFpVnJT3+ejGnv/Q76/nxGab
 On90thuNvQmjDg09EZxrJmcHU+xMfGaOrRrAesmUxQ==
X-Google-Smtp-Source: ABdhPJyKLzG7YYe1K4IXYCNKI57UpYByBZ6kMVxBqd7oyhtFuamWksK/UAQ7tcksO4daaPV5NKhjK+yUR3hbsLCNWW8=
X-Received: by 2002:aa7:c144:: with SMTP id r4mr6456963edp.251.1613920843428; 
 Sun, 21 Feb 2021 07:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20210220123525.1353731-1-laurent@vivier.eu>
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 15:20:32 +0000
Message-ID: <CAFEAcA8eoJ-2ghhmqnh2vWMQH=cf1ysnbgfyHz2UP939LxRovA@mail.gmail.com>
Subject: Re: [PULL 00/12] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Sun, 21 Feb 2021 15:20:48 -0000

On Sat, 20 Feb 2021 at 12:37, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e90ef02389dc8b57eaea22b290244609d720a8bf:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-18' int=
> o staging (2021-02-19 17:22:42 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request
>
> for you to fetch changes up to 1cb428356beec30cd5067add76e51e01d0f6f680:
>
>   MAINTAINERS: Fix default-configs/ entries (2021-02-20 12:36:19 +0100)
>
> ----------------------------------------------------------------
> Pull request trivial patches 20210220




Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

