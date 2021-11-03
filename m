Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miJhb-0002Bk-Ac
	for mharc-qemu-trivial@gnu.org; Wed, 03 Nov 2021 13:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miJhZ-00028L-Fv
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 13:05:29 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miJhX-0003QE-CN
 for qemu-trivial@nongnu.org; Wed, 03 Nov 2021 13:05:29 -0400
Received: by mail-qt1-x831.google.com with SMTP id h14so1531038qtb.3
 for <qemu-trivial@nongnu.org>; Wed, 03 Nov 2021 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7GJPJ5F5CPOpXGiRPp1id20pW9l/mmMgvo5y5S9nrZU=;
 b=fyOdiTayF9W4vJM48lPYtv/fFzyy1inflMj9jsgy3xwNMsq2VrFSI+ZrS2YfMKDhLD
 /KRKAYP7MMTkDSm18gjml4Yl7UW8VF6ZqxcFGGAnkCZGywDA91GzE+jWe2fCB0XPAf+g
 8EL/BuW9zZocJ4B7zKoI4BkdLj/nZVbFvD5wwfvzdXC7b4fWJ6ash+UORmGX4uaVVQIt
 qKuxoAC7B2m3bo3Exa646pzSTzzlpwh6v28hpHwTQRAOqZ//yzHcKKuBuVdaaWX4YSt2
 4AT6BiHOaDnLcPEj8yVxupECs8fvf09Qcql7Hv2PPunFtlCED/RoQ/6FKFNX/GG16B9m
 nyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7GJPJ5F5CPOpXGiRPp1id20pW9l/mmMgvo5y5S9nrZU=;
 b=tvZ6U6jGuOV0X8glWK8ec/s0oGWQhDuM2GkWKGEGucH/qiy97Kd1wCW0xSVYI3eTcO
 KCm8OScbBIPjNC6OuoAnrAehyjC3kATs6wS5wXV852iLz3m7HAEyevm3RMhlHkijCTuh
 Hw0L+lusFQRjQ0NGSi9BHZzh+1ApBtdpDU1RrpqFvziQPN/FojzVX9zokyf+mcnvHmwO
 oGBbnOAzDhonRQqGCKwgmXZ+u7f1cKG5VNiesJjBfowpa2+m4AZ6Ru+xJEcY23vBm3OX
 Kvd3JwLEc2H3MehI89hYCEn8KxrL9Ixnb1yZi9zp+HPCiKKwfiX1inEbTGZ5b6QziGWo
 SnKg==
X-Gm-Message-State: AOAM530YKIArpa2imdRvCgm+eppzm9k201kWVRpmxHtzzosfFkmBxIyw
 TdN07lNq52uDdFcDmLQ50qRKuRL7RsTS1g==
X-Google-Smtp-Source: ABdhPJzpd2XtrATquAnIGM4XJLhV1MgVXHi9TOjw4xDkMgVdKELREPbdELcmcR3SVNb6c89PEUMMxQ==
X-Received: by 2002:a05:622a:18a8:: with SMTP id
 v40mr46282486qtc.263.1635959123988; 
 Wed, 03 Nov 2021 10:05:23 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id e10sm1966754qte.57.2021.11.03.10.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:05:23 -0700 (PDT)
Subject: Re: [PULL 0/4] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20211102232212.2911638-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21d0b71b-da9f-5004-0d5c-ab3813922e91@linaro.org>
Date: Wed, 3 Nov 2021 13:05:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 03 Nov 2021 17:05:29 -0000

On 11/2/21 7:22 PM, Laurent Vivier wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
> 
> for you to fetch changes up to 5d2bd73588d14b5868129ace9c7912a777f06753:
> 
>    hw/input/lasips2: Fix typos in function names (2021-10-31 21:05:40 +0100)
> 
> ----------------------------------------------------------------
> Trivial patches branch pull request 20211101 v2
> 
> ----------------------------------------------------------------
> 
> Markus Armbruster (1):
>    monitor: Trim some trailing space from human-readable output
> 
> Philippe Mathieu-Daudé (2):
>    MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
>    hw/input/lasips2: Fix typos in function names
> 
> Yanan Wang (1):
>    hw/core/machine: Add the missing delimiter in cpu_slot_to_string()
> 
>   MAINTAINERS                | 5 ++---
>   hw/core/machine.c          | 3 +++
>   hw/input/lasips2.c         | 8 ++++----
>   monitor/hmp-cmds.c         | 2 +-
>   target/i386/cpu-dump.c     | 4 ++--
>   target/i386/cpu.c          | 2 +-
>   target/ppc/cpu_init.c      | 2 +-
>   target/s390x/cpu_models.c  | 4 ++--
>   target/xtensa/mmu_helper.c | 2 +-
>   9 files changed, 17 insertions(+), 15 deletions(-)

Applied, thanks.

r~


