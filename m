Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myP5m-000701-Q2
	for mharc-qemu-trivial@gnu.org; Fri, 17 Dec 2021 21:04:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP5l-0006zk-RH
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 21:04:57 -0500
Received: from [2607:f8b0:4864:20::636] (port=42925
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP5k-0006Kp-9D
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 21:04:57 -0500
Received: by mail-pl1-x636.google.com with SMTP id u17so3317769plg.9
 for <qemu-trivial@nongnu.org>; Fri, 17 Dec 2021 18:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8BImtmORCeyBvU3qIkh1U/H6HH3pznp4F+8gXavgocE=;
 b=nAiZ1pBsL4iM6NlmFF7XuiX3TX7DfRQsQtJJR8O6P4SIB1EJ2cdU3XUK1XweQ4EZwq
 UO0PjZ9JONMdOaGSx6sUf0qq69dtOG0/k3JHN3Fx4Qp8diNC5zxX2I/Anp2xcdjHUuZF
 z7UwX6x469b2WDGOvTITepyexFNGl03mt69mU1qn094U7zbuRP2ctd/r+fBZNgS6Na1c
 WKUGB3IE1azz0bQcJy+lEs3LUAv5hDxjCl+V+sVYZKwdZZEAVoiZUXZNzFOAjjHgI2/n
 YPHsdpv7M5N1BKOCcuRFrlbeityveWWftJsgLrq3947GflbqThXyiAmBhh8bXMT1kS1y
 CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8BImtmORCeyBvU3qIkh1U/H6HH3pznp4F+8gXavgocE=;
 b=fU6vnBHkzNNFZNtq9lTKNMGtYyjxXUml4yYeShVSxQ4nsU7+HLTDb7Gt6PSmVmA1vS
 keVze5Tvk60B2r4j33kOFUKuYFWtZm4EljvzmfpYCQFzgfkPDL+Tn0n541doENK8GLpj
 akirifMTm7zr4+T0tLHQdKLtnKev5uW2+41UMJR3Q/j1O9HFkzGBE0H8AECoDkSjqA8b
 ilw9Twcas/wLk8G9A+ZP1JaSr9WeatqF+nuE5d0VFq5ZyXJsrOvzJkC07Rcozgv6n05D
 JY+GQUp6yqVoa/LZuxjqUzvWCjYnlsq7D5jjaZupARwXxikpwQiIb1QWCHwAyNQvXQ/Y
 iu0A==
X-Gm-Message-State: AOAM532BsdD8GbNXmvVP+ABxCn6xwYcq8GnXvbrO4QDhsN16KJojkaZw
 4QZTTzh0/HyNfd9J5rLZWOK3dk95iMqtnQ==
X-Google-Smtp-Source: ABdhPJyQJnne1U/9o/Kc50y84MXAK9GopjeGMBcTxpWk/pG3UtGRBLiUZkuP4qhw0OpAiPmSWFqqEw==
X-Received: by 2002:a17:90a:c253:: with SMTP id
 d19mr518222pjx.157.1639793094639; 
 Fri, 17 Dec 2021 18:04:54 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y16sm9979040pfl.69.2021.12.17.18.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:04:54 -0800 (PST)
Subject: Re: [PULL 0/9] Trivial branch for 7.0 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20211217201019.1652798-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad2ad40d-e908-4d67-12ea-2c956603e501@linaro.org>
Date: Fri, 17 Dec 2021 18:04:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 18 Dec 2021 02:04:58 -0000

On 12/17/21 12:10 PM, Laurent Vivier wrote:
> The following changes since commit 29eb5c2c86f935b0e9700fad2ecfe8a32b011d57:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-16 08:39:20 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
> 
> for you to fetch changes up to ce2ff9cccf0c5f123f9d1e3d5e4fc07d1c2c159d:
> 
>    checkpatch: Do not allow deprecated g_memdup() (2021-12-17 11:57:35 +0100)
> 
> ----------------------------------------------------------------
> Trivial patches pull request 20211217
> 
> ----------------------------------------------------------------
> 
> Leonardo Garcia (1):
>    hw/virtio/vhost: Fix typo in comment.
> 
> Philippe Mathieu-Daudé (7):
>    configure: Symlink binaries using .exe suffix with MinGW
>    target/i386/kvm: Replace use of __u32 type
>    qemu-keymap: Add license in generated files
>    hw/avr: Realize AVRCPU qdev object using qdev_realize()
>    glib-compat: Introduce g_memdup2() wrapper
>    tests/qtest: Replace g_memdup() by g_memdup2()
>    checkpatch: Do not allow deprecated g_memdup()
> 
> Zhang Chen (1):
>    docs/block-replication.txt: Fix replication top-id command demo
> 
>   configure                   |  2 +-
>   docs/block-replication.txt  |  2 +-
>   hw/avr/atmega.c             |  2 +-
>   hw/virtio/vhost.c           |  2 +-
>   include/glib-compat.h       | 37 +++++++++++++++++++++++++++++++++++++
>   qemu-keymap.c               |  1 +
>   scripts/checkpatch.pl       |  5 +++++
>   target/i386/kvm/kvm.c       |  2 +-
>   tests/qtest/libqos/ahci.c   |  6 +++---
>   tests/qtest/libqos/qgraph.c |  2 +-
>   10 files changed, 52 insertions(+), 9 deletions(-)

Applied, thanks.


r~

