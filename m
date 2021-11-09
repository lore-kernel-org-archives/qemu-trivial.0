Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkQ17-0003D8-RN
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 07:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkQ16-000389-9J
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 07:14:20 -0500
Received: from [2a00:1450:4864:20::42b] (port=41569
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkQ0t-0003fU-H9
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 07:14:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d3so32588312wrh.8
 for <qemu-trivial@nongnu.org>; Tue, 09 Nov 2021 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BTHG+IHioR9XckfE607EcSZwJKlKt7tdKJYmzr/90Lk=;
 b=h/hjxf2A8HrwYBgmLk9geoNcFlrWyQrqoRm4G2xNsfGHr9AWX54AkmqJ5otghyIBjW
 A+FNm9GpLiA257FOt4SKn7OjEH7WlQnNBZg6TWXsO79X+N50W0qcMYq64RL7Qd70bmOx
 JBWQOAmC7HO1zm3UZm5qdGsh5Kw3TH0qO2XF+XdLtOQucg8a0qZpFrDkfyL87v5xvLzx
 GhbbIi1I36RkPYShEqzPoZ86qNwE68CoRyf6jjDr/NwzINeTgEqVxBsbxGZVB6Hb2GIf
 +SbFPEP2eUSTLyVBZthUFFZO/UTUZeWWAwh+3mdRf+z+XXq6yiRCHd6SLAEu+1hM8+nc
 Ojgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTHG+IHioR9XckfE607EcSZwJKlKt7tdKJYmzr/90Lk=;
 b=ztWvJZe4J+RRvQ1N6u8rxvnbgPlYK61tUTbul2oVROV6gRbszqH4Dot0hEwPbx28Ne
 g/OCfCBKfuG9ZrOVKZCKuduIgxt2we5m5nF9Kd5LHhXZTLOgt2FkMM5XTK9lt3iBe2hu
 93M1DG7kiqQmyCVQeh6NH7Odbh4c7iTB6tSv3muJIgBd8D3+PHTpU5HlEapnBzkSPxr5
 DbMTumEmj+4JGxOT0mmzAFnS1t9Bx3kmD1tMPiih33XpTyXb+yBvNoD0FHEyUKmk/1g4
 czY/DQmRF0bf90PcIyqEKICyNVGOjyKdnma3ew57JnKb4/Mn8sgaWhsSLuDysfVBy1mb
 CFZQ==
X-Gm-Message-State: AOAM532g4df88+2stxmEqLZZon+NiofIUnBLwNCE3RIR5Ko4pD8UCOKu
 x0JdAR31acGDNaavhpPBeYGuabcYYmrj5Gfcf0E=
X-Google-Smtp-Source: ABdhPJzjqq2NFK2z8tOpRRN9ODkv2sE4OX28Sf3nLayGSwWu0EWN3ph0D4l/3st/3jjVSpHL4DSoWw==
X-Received: by 2002:a5d:5303:: with SMTP id e3mr8645036wrv.73.1636460045190;
 Tue, 09 Nov 2021 04:14:05 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id t4sm2295435wmi.48.2021.11.09.04.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:14:04 -0800 (PST)
Subject: Re: [PULL 0/6] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20211109091238.817997-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fce90156-5bfb-5d39-a96d-10125ddbee9a@linaro.org>
Date: Tue, 9 Nov 2021 13:14:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 12:14:20 -0000

On 11/9/21 10:12 AM, Laurent Vivier wrote:
> The following changes since commit f10e7b9f6fc18be390b3bc189e04b5147eb8dbf8:
> 
>    Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-6.2-20211109' into staging (2021-11-09 07:18:33 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to 66d96a1901b7d9cfdbc454d407710ca8bfb90947:
> 
>    docs/about/deprecated: Remove empty 'related binaries' section (2021-11-09 10:11:27 +0100)
> 
> ----------------------------------------------------------------
> Trivial branch patches pull request 20211109
> 
> ----------------------------------------------------------------
> 
> BALATON Zoltan (1):
>    hmp: Add shortcut to stop command to match cont
> 
> Laurent Vivier (1):
>    tests/qtest/virtio-net: fix hotplug test case
> 
> Philippe Mathieu-Daudé (4):
>    hw/m68k: Fix typo in SPDX tag
>    .mailmap: Fix more contributor entries
>    meson: Fix 'interpretor' typo
>    docs/about/deprecated: Remove empty 'related binaries' section
> 
>   .mailmap                       | 4 ++++
>   docs/about/deprecated.rst      | 3 ---
>   hmp-commands.hx                | 4 ++--
>   hw/char/goldfish_tty.c         | 2 +-
>   hw/intc/goldfish_pic.c         | 2 +-
>   hw/intc/m68k_irqc.c            | 2 +-
>   hw/m68k/virt.c                 | 2 +-
>   hw/misc/virt_ctrl.c            | 2 +-
>   include/hw/char/goldfish_tty.h | 2 +-
>   include/hw/intc/goldfish_pic.h | 2 +-
>   include/hw/intc/m68k_irqc.h    | 2 +-
>   include/hw/misc/virt_ctrl.h    | 2 +-
>   meson.build                    | 2 +-
>   tests/qtest/virtio-net-test.c  | 2 +-
>   14 files changed, 17 insertions(+), 16 deletions(-)

Applied, thanks.

r~


