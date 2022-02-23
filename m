Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMo0V-0006yi-Qd
	for mharc-qemu-trivial@gnu.org; Wed, 23 Feb 2022 04:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMo0U-0006x2-Li
 for qemu-trivial@nongnu.org; Wed, 23 Feb 2022 04:32:22 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=41940
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMo0S-0005s6-Oj
 for qemu-trivial@nongnu.org; Wed, 23 Feb 2022 04:32:22 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id j12so46629686ybh.8
 for <qemu-trivial@nongnu.org>; Wed, 23 Feb 2022 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0MuX52Q+muXKaiQy3XFqF8eMrYwugIxgvBoFwop9AA=;
 b=WWoTJTAGygDay3JxOTJVX2W9WL6XBn5oJPsGjktOPFspmyT3aDPI8+lkmZOjHe1340
 U7upoVbm9vB1YH1YjgrQ5zYCFoJ2ErborzQ3d+BjE0p4YLtJENdJVOgDRabPmCy4H5q6
 Yql22OPmuoJdVSTsczvJGH5pWKLONZCU2GX3W0z4Np3EErNFqAYdFm0V94EzSKHvQIFs
 nbpjNhpjTE4oJTgAnCHkV+GaH+pFoILMNHtAX0iHB9YxWbl2DRQ5Lk3SxkSHpeC0/U+N
 IOq+ygo/aWnuMHE3faVVZhGFYHqfvqtO8tU47bFJhfANxGbq3WZO+0txvdkqG5fu7/je
 iMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0MuX52Q+muXKaiQy3XFqF8eMrYwugIxgvBoFwop9AA=;
 b=od6LlUbKaqsDy9U9q9NHWmPO5TPNLAN3EZZPwg829fQje5A50uf8SlLIv2Ef1BHhAa
 dm0asRfqugjZKInE7VZTKx0Q1PuF15ELOqsq73TKBybW9Cbos9dhmZIkcDQfaC5QeCsh
 HLngLikwvhl1jvwIkh7c/U461vNaHcLowbBFdbYrHyA6Dfq7iJlrr+4Z+1oCga59Ubb1
 HCyYzf5Z0MK/9+kfrL+xGJuBKohY5JSWnwoJdwnR72BXdGFSxv9v8+uGYVMrFLd4rOtg
 5Jc3T+WldIRLNJIynREOeQ0DB01B21Ui+8j0SjdGTS/CxIQP/AQABt5eUjN2h8t7G4H3
 jq5Q==
X-Gm-Message-State: AOAM53333vR1U52k/RMRDx9vOEmsTtfFXJ4zoiYcovRFN4V+E9FhkyI1
 lpm0V8x9lv6zLc3KgqZao27QiccPJt+aJNMwlqJniMMToks=
X-Google-Smtp-Source: ABdhPJwOtHSOgtM8dMzxPMMh+3YTa03PCntT3j2ixJtX62Fva4qtdKt5mATvmYxFr1D4bG48beKl61BbNUyhe2EziUA=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr28287357ywh.329.1645608296376; Wed, 23
 Feb 2022 01:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20220222161624.382218-1-laurent@vivier.eu>
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 09:24:45 +0000
Message-ID: <CAFEAcA_pPdzydMyua_95OHW7FJ-JTiJF5dgmyxPMFuF+6HesRA@mail.gmail.com>
Subject: Re: [PULL 0/7] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2022 09:32:23 -0000

On Tue, 22 Feb 2022 at 16:35, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' into staging (2022-02-20 15:05:41 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to 1e2d555846226a9e5fb1052fe8ba6f30480f33a9:
>
>   hid: Implement support for side and extra buttons (2022-02-22 17:15:36 +0100)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20220222
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

