Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jojvh-0003e8-SN
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 04:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jojvf-0003d7-Sg
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 04:41:47 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jojve-0002ea-6x
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 04:41:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id 72so7923101otc.3
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2020 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SsTvBpbwybEyIsD0H2iogbmMxh3V5KkHtsx+ZVpJJs=;
 b=cNzHfOtvOAChWB6RrIrTG7ZcJl/KhF40rOHe3R4ckrI5O8ReYziFSHto8xEsBtDO8V
 6RMd45+LZnJ9Vcqltb+Jrz5YJOVIvnkGev2EyzwKrQVj87E3eSQFXqdcgwBrERG8/dUn
 +kwoK0FvMKuvxfaam9BEZCKyPngIgryei1+GktVPbIV3v/7jBEsGOHBceQCO9pJVf2u+
 D/lvqcFooLi6FBAnlE5gMOEucaz3Ao4OkZWcAGjW2B8SspLgEHRHVVj8HACJbf1L+5OL
 dnOG/4mnpUSkSyv4SJ8Uukp+05VFau1Vr8szQQHZfby2dNCaHf5RKFdSPTLe78rpvNho
 FfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SsTvBpbwybEyIsD0H2iogbmMxh3V5KkHtsx+ZVpJJs=;
 b=DFMCvyWwlZwzEIFEPcylHTvtrmQaZk5vbm4euOQh7WIv2j4ZZlxN55NoAm1/hbd+67
 FNVrNoU6LmrzUtH4+laIxL0wat4HZmGntVqrvxALNb1H0AeAguc+OTUONCOg2k54k/iR
 cS6sbiYMV2IQKw+rYv1IsRzW0s/hzRptfCPms4+KbcSZw7/tLOI8F8MSTu/rB0NMtFOq
 wMVbbTJnF1R4KGCgSNeUS/+dOvQOi0QA9WLW+4WAv1ay2tE2G14K8DsDTEUGw0AGRYdj
 H3J7dq+0TNZ/UrE8TqOztJMXeCNxSWaohJVlV8JvzGdUM/NgKuF3Xx7l2a+OpsfywEmx
 GIeQ==
X-Gm-Message-State: AOAM531G9a4M/QNd/7FIyb0sY2lPpUlECnDJrmq1UkpBbHBgMGBWENTX
 TSFtKhWCQlBI+fNY41jQiidKtAqCU82xg4jsSruK2A==
X-Google-Smtp-Source: ABdhPJxvJi25JNMssilulm1e/sKTUMLsCrHNi3KLukIH+SRwVNjH299WekkerjqOmeWOE0C6y4KzXg+juR0zRZNC4pc=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr1399153otn.221.1593160905002; 
 Fri, 26 Jun 2020 01:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzX=OaRgxQbHKU82K2WhTBwL44sr+wpGKSjZWqaehLyJQ@mail.gmail.com>
In-Reply-To: <CA+XhMqzX=OaRgxQbHKU82K2WhTBwL44sr+wpGKSjZWqaehLyJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 09:41:34 +0100
Message-ID: <CAFEAcA8RJZi-r9VwOzH0Rr=YWdxL5jJBw4JZzA5q=qmP4TvaXw@mail.gmail.com>
Subject: Re: [PATCH v3] build: Haiku build fix
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Fri, 26 Jun 2020 08:41:48 -0000

On Thu, 25 Jun 2020 at 22:31, David CARLIER <devnexen@gmail.com> wrote:
>
> From 78706a28c6aa8b5e522b5781588b38961d79d6f6 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Thu, 25 Jun 2020 19:32:42 +0000
> Subject: [PATCH] build: haiku system build fix
>
> Most of missing features resides in the bsd library.
> Also defining constant equivalence.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  configure            | 34 ++++++++++++++++++++++++++++++++--
>  include/qemu/bswap.h |  2 ++
>  include/qemu/osdep.h |  4 ++++
>  os-posix.c           |  4 ++++
>  util/Makefile.objs   |  2 +-
>  util/compatfd.c      |  2 ++
>  util/main-loop.c     |  1 +
>  util/oslib-posix.c   | 20 ++++++++++++++++++++
>  util/qemu-openpty.c  |  2 +-
>  9 files changed, 67 insertions(+), 4 deletions(-)

Would you mind splitting this into a patchset which has
one patch for each fix, please? So a patch which makes
configure probe for openpty-in-pty.h and use it,
another patch for the mlockall change, another patch
for haiku-implementation-of-qemu_init_exec_dir, and so on.
We generally prefer each commit to do one thing; it's
easier to review.

thanks
-- PMM

