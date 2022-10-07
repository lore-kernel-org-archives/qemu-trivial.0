Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogbNl-0006Fe-Hk
	for mharc-qemu-trivial@gnu.org; Thu, 06 Oct 2022 20:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogbNi-0006EQ-0n
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 20:38:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogbNf-0006Sz-Of
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 20:38:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b2so3164417plc.7
 for <qemu-trivial@nongnu.org>; Thu, 06 Oct 2022 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gxD3bz8V1XLxh/6lskR336UF0PPNKio5ulpsblR2YkU=;
 b=UOMjFLl5kcEMAOld9vNJnYXiTSFAvSQU7jT+H6kGAB26x0m1Ed1ADauMTTmHgzqoXM
 PrQok97j7sbns4OhqF2Fxl+j3cmYVFyZD0wT6L3AZS5Kijc9EYJsXJS29SB5EXWQIqwd
 UrJ2ptDOwwlMkrSek56YqFT9TIvVqvkcMk0zVNXo6E+SMzoVZlIBlPH+w9KBgS5JbX2P
 Q9bft0n8iwN2WKhAK3HxqXGgtO7rQEfB3rGddiKFEZmXaTo1Wsps+wOSjEo06JT1sSve
 Hc36uTVWB8schxNhFEiOx4reVpeWzaeA/vdP/IaKUkuPkvZbz8QvEZKd/q0U1XBNImlS
 h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gxD3bz8V1XLxh/6lskR336UF0PPNKio5ulpsblR2YkU=;
 b=du7WsR0PHEFQABcEMupc53UK68y/5gM0BzZ81O2BkvL17x+d9XwejDoLptKztKo9J+
 2c22u/wXnCoezpZB9MuDijkow2JCZ6GJ/TM8MGgsKmcllB9CDYTyV2tvm81cYo4HdN4+
 Hx02cW0XaXEtFI17/m11e8UvVxP990cGxAtzt0yXAPKQiuhZpy3ROfxFN/TnAElYFHcY
 c87S53sDeIa7ol7zyLBN+G9poA+onXWT8KVZoYrbvIOQNETr6KIOcl4hZvAYreBJeHES
 F5+n+6hWsTjtotO3BPC1y0ew8KU2fERTU6vAWpwzsomyORpi+rk3avp11hyGg3PD/mJD
 3KUQ==
X-Gm-Message-State: ACrzQf2elJWbuHpKkuLbMQNkHlhPvzM8l5H9zKROdzEVcHEak7hQvouo
 ER1tYq7/g4P9YblnOcdHyGO1PA==
X-Google-Smtp-Source: AMsMyM5GZq3tf2YlU8gcVv6ST9GNwzHB0E/rG81rx0lubQF/oLLBn8MuMxHENEZRYk46Jp9ER6c21g==
X-Received: by 2002:a17:90b:1b0a:b0:203:3947:1a73 with SMTP id
 nu10-20020a17090b1b0a00b0020339471a73mr2431777pjb.43.1665103102167; 
 Thu, 06 Oct 2022 17:38:22 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa79498000000b0055fb19e27a8sm224772pfk.121.2022.10.06.17.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 17:38:21 -0700 (PDT)
Message-ID: <4e087808-e687-2bf5-db1d-2e4072f1c69f@linaro.org>
Date: Thu, 6 Oct 2022 17:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
Content-Language: en-US
To: Soichiro Isshiki <sisshiki@isshiki-clinic.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: sisshiki1969 <sisshiki@mac.com>
References: <20221006153841.10750-1-sisshiki@mac.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221006153841.10750-1-sisshiki@mac.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
X-List-Received-Date: Fri, 07 Oct 2022 00:38:28 -0000

On 10/6/22 08:38, Soichiro Isshiki wrote:
> From: sisshiki1969 <sisshiki@mac.com>
> 
> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
> len is 0 from a guest process.
> This behavior is incompatible with the current Linux implementation,
> which mprotect() with len = 0 does nothing and returns 0,
> although it does not appear to be explicitly described in man.

You're right that the ordering of checks differs from the kernel.
The kernel has:

(1) validate prot !(growdown && growup)
(2) validate page aligned
(3) pass len == 0
(4) validate no wraparound
(5) validate prot for arch.
(6) validate vma valid.

while we have

(1) validate page aligned
(2) validate prot for arch
(3) validate vma valid
(4) pass len == 0.

My previous answer vs guest_range_valid_untagged is incorrect considering all of this: if 
start > GUEST_ADDR_MAX, that *should* fail vma valid, but the kernel will have returned 
success before that.

Although, sorta, this smells like a kernel bug.
Why should mprotect(-4096, 0, 0) succeed while mprotect(-4096, 4096, 0) fails?

But anyway, if we're going to fix len == 0 to match, we might as well fix all 3 test 
ordering bugs at the same time.


r~

