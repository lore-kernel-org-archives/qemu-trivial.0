Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVXGd-0000Ph-Vl
	for mharc-qemu-trivial@gnu.org; Sat, 19 Mar 2022 07:29:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVXGc-0000P6-Cj
 for qemu-trivial@nongnu.org; Sat, 19 Mar 2022 07:29:06 -0400
Received: from [2607:f8b0:4864:20::112c] (port=46213
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVXGS-0008Lz-4r
 for qemu-trivial@nongnu.org; Sat, 19 Mar 2022 07:28:57 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e5e176e1b6so36504357b3.13
 for <qemu-trivial@nongnu.org>; Sat, 19 Mar 2022 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnZ5MYtwdpYDnsHIJTtKI+IfMhev7Rj/cTI2+g2lhiI=;
 b=faKutP9L4nxik/NLay3DSrqPIMDeR+Aci0c7FdJZ1X2uPjuEzsem0YH5ihAaWUFeMT
 pxRG1XBclCPwRwQK8pVPdMse9XzRIDe+zhUHSsWEULXSl6LDfad7W4hBQk2zfrXsPDOr
 uTPU4UP7ZqdqV5rnmJ109YhWN7fzigiqhc/RkIOB+i3+YyyKZUw8C96//JIyD+I7k+Ot
 rgku/skPP6tYBXO3ByIVn7yNlc97/4QAEBXTyCQJ60AlNbsdJhWRFuNd95L8Ijy17O2j
 P26OoH97y65X+ijKv+Seiet/S2IMmESkhCVeCM+H+ZntGUyiXh+TBQP/JbAyQaDiYDbI
 P5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnZ5MYtwdpYDnsHIJTtKI+IfMhev7Rj/cTI2+g2lhiI=;
 b=k9iDgo+arOcBr1NtNP6wb+dCTtaqdwORjdH0UtGoALzup6jllnn/v+IuUPAsrDjwEE
 rQ5v2K+87f5rXWymaU51yalZGT0fRi+H70et4L9Pi+ZZAkCLoQjqJj+fOPKo93SYv5KU
 5t5loStS2WHfZMgMhK8Ruq/mqw3+x+poWZLKpmCrEGL8mXWI1A5QC+Jf+O6f8wy/uPfc
 WPBPabAWBVQu0hwn3uSJ6D2a6L/Qvw2YGPxeUZE6wqYJ+2cVuhUl/2+P3GHETNyZ1DqJ
 lmrfVic2Wvj9mxwBnPaYL0vDy4b/TzaoELjYEo03PvqKSKRfYXrGpSgjEKbhdCsk2I9n
 8LVg==
X-Gm-Message-State: AOAM532+SuB7R/QtwZScatwoYYmGa6/NWDqpT+1eWILpNZY/EePqoeYe
 jRksdlGVstJ9Sv6vhMT96wdScQsthlUne4H4GnwI+x5cc9gutQ==
X-Google-Smtp-Source: ABdhPJzNM2O0jatTwuKDuxSoQWifQRyKTCewmyRJ2Jtw7kLcFiRcFMT9IYPmHWgmSs7JnZ1T5cp1B3iZxzgXFqBhjAc=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr15496519ywf.10.1647689334893; Sat, 19
 Mar 2022 04:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220318134333.2901052-1-laurent@vivier.eu>
In-Reply-To: <20220318134333.2901052-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Mar 2022 11:28:42 +0000
Message-ID: <CAFEAcA9N__jByE16Q9ih5emX-WBtzQKgz5UxR_in8p27qkgM3w@mail.gmail.com>
Subject: Re: [PULL 0/2] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-List-Received-Date: Sat, 19 Mar 2022 11:29:06 -0000

On Fri, 18 Mar 2022 at 14:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
>
>   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to a2d860bb546aa766f6c28a47fabedafbfa191cc2:
>
>   virtio/virtio-balloon: Prefer Object* over void* parameter (2022-03-18 13:57:50 +0100)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20220318


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

