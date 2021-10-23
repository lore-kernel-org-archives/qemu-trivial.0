Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meQLG-00062z-Bo
	for mharc-qemu-trivial@gnu.org; Sat, 23 Oct 2021 19:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQLF-000625-IU
 for qemu-trivial@nongnu.org; Sat, 23 Oct 2021 19:22:21 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meQLC-0003Te-CV
 for qemu-trivial@nongnu.org; Sat, 23 Oct 2021 19:22:21 -0400
Received: by mail-pf1-x436.google.com with SMTP id 187so6970495pfc.10
 for <qemu-trivial@nongnu.org>; Sat, 23 Oct 2021 16:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JlEd7L5mIZV85VxDWrRYcS9At90Io6zRb25Py7kAKu8=;
 b=JK9Dre0dX6Sz0YH+Ash1TM/KCAdaGtmftvr0iway05ySRxj8AUdSbKj3E/qSvzwoBZ
 yLY3Eako2fbCjjv4OQc6j5OgZFxCnbBazCC60pDYhba7Z+Hgnk2aF7BbUzyIoMcdXXhg
 94G1Zuffzi4fUlAB1FvcQwG3d0u0YI06ml+ZR1WdZmQgFvbdS2fabw7lxB/JbuCOE1T7
 QufHAuH1zDt/KePYxLJ1KQHLHX6ESGKtQ4Kkvexx4OkO43xXzkP8TVGw+UOQ6P+xaJqo
 47q+msz7r7w0X5cPRyoha7hGI49kd0VLHUJgv0vf9Kuc6FNx4Tn6Cuo//79n3Khgzxrw
 igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlEd7L5mIZV85VxDWrRYcS9At90Io6zRb25Py7kAKu8=;
 b=7B/LSjJsTXLuChtzHt116mn2xVxPssns+44U+IREbHtctt9XppiekR7NGSh9h4/TU/
 bG+8PuD0PXR9KAKhEdnvWMHBYd9QASBOXUFcPmpgxi+Q7GxAcmBfy3BHX2nPeMVGGFXk
 zcAOL0ptbBJOTHfOf0BCevKRXpprcxNRR24KNuhP2vbFrsvIwSKrOlEjO8CiwxqT04kc
 DNfqMux6JRtTvzlDTgYVA8hTmc18l0KUmkthvppARPMc7nqjrmEHrHc++NcvnhfF3RuC
 n5c42ANuuAq59jtBvCfUMJxYPw9xXgCp8fHTXCimUr8ZBl8eD7OQWID2zqQS67d94sRg
 BZyg==
X-Gm-Message-State: AOAM533FAl1HO+UoTGeN+5GOIbRbiUdGERaUGhzsYWJN5Jy6XEvR/MRO
 Lg5w5o/FiTLJGcS5vAeGMdK7Dm7XozAJeQ==
X-Google-Smtp-Source: ABdhPJyAAn/zibXBeuU+tDepH7T+2k0VV9s3bcPPez4DUYV83ZgkgqL32yKi1dXS7u35msi/rTPTPA==
X-Received: by 2002:a63:b203:: with SMTP id x3mr6504449pge.239.1635031335808; 
 Sat, 23 Oct 2021 16:22:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v9sm14328206pfc.23.2021.10.23.16.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 16:22:15 -0700 (PDT)
Subject: Re: [PULL 00/11] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20211023183123.813116-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24f16c0d-a021-25ba-75d8-656d85e54f88@linaro.org>
Date: Sat, 23 Oct 2021 16:22:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
X-List-Received-Date: Sat, 23 Oct 2021 23:22:21 -0000

On 10/23/21 11:31 AM, Laurent Vivier wrote:
> The following changes since commit 1dafe7656a9c2770065e91208edd4c073f5f98a9:
> 
>    Merge remote-tracking branch 'remotes/vivier-m68k/tags/q800-pull-request' into staging (2021-10-22 07:47:13 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to 2c92be50bcfa8b7529a39fc99078ef14dcfc71aa:
> 
>    analyze-migration.py: fix extract contents ('-x') errors (2021-10-23 20:28:56 +0200)
> 
> ----------------------------------------------------------------
> Trivial patches pull request 20211023
> 
> ----------------------------------------------------------------
> 
> Greg Kurz (2):
>    softmmu/physmem.c: Fix typo in comment
>    README: Fix some documentation URLs
> 
> Laurent Vivier (2):
>    analyze-migration.py: fix a long standing typo
>    analyze-migration.py: fix extract contents ('-x') errors
> 
> Oğuz Ersen (1):
>    po: update turkish translation
> 
> Philippe Mathieu-Daudé (3):
>    disas/nios2: Fix style in print_insn_nios2()
>    disas/nios2: Simplify endianess conversion
>    MAINTAINERS: Add myself as reviewer of 'Machine core' API
> 
> Tong Ho (3):
>    hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
>    hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
>    hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
> 
>   MAINTAINERS                       |  1 +
>   README.rst                        | 14 +++---
>   disas/nios2.c                     | 73 ++++++++++++-------------------
>   hw/nvram/xlnx-efuse.c             |  9 ++--
>   hw/nvram/xlnx-versal-efuse-ctrl.c | 20 ++++++---
>   hw/nvram/xlnx-zynqmp-efuse.c      | 18 +++++---
>   include/disas/dis-asm.h           |  3 +-
>   po/tr.po                          | 25 +++++------
>   scripts/analyze-migration.py      |  6 +--
>   softmmu/physmem.c                 |  2 +-
>   target/nios2/cpu.c                |  6 +--
>   11 files changed, 87 insertions(+), 90 deletions(-)

Applied, thanks.

r~


