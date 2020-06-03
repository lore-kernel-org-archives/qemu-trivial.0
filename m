Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgXhm-0003kd-SC
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 14:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgXhl-0003kP-Lp
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 14:01:33 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgXhk-0007xX-L5
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 14:01:33 -0400
Received: by mail-pg1-x543.google.com with SMTP id 185so2245573pgb.10
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2020 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=42pG6IMp9bXf8qw+fOATEbO7Jl2jW+RQOk/P3q4RmJg=;
 b=zO0FJSfrseL8bls8uqmpgwc6SdI7z7XAkXEkZIV/SoQTw1IpyQjQGc3vrKahQDhqHv
 jtJTWblNi8ZvWzeByVk2o5wvg7H7os1XZL3sJ0qFGdMpzojri2IkWQkjsCUMuHI4yEfx
 fv60j1nnuH8yzvS5ZCUr+WTuKUBSLVDvOAXnDRwa0Lr5+u6yXwXKqlih28ItjxBDLoJn
 sGOrT6PZIGgaZk8yZdN0MokU4PIW+PLxcZeOkcuHBDoQhDoXrt823pwzLR/yvxZazj12
 wYJq/YEDPGgKu+0UHUc5RT/vSZvyi8DgSO1RP0ReJ0xsebih+7038Plg2ND69B+vowsI
 aaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=42pG6IMp9bXf8qw+fOATEbO7Jl2jW+RQOk/P3q4RmJg=;
 b=EiXIs2P/aGWZlfnfYfBQtf82HAjW8kUg2d4lpg6aTNRJTBqmlFvEzpPQ5KJJRGVybm
 JRMwUwFRdZHA9UohZmw/soUEyqAG2LGMD53HTMxAga++kv59Rb5b6JGzeDJuOc4NDquc
 KlV9Gc3fjG0ulfTL7UJADck26uUIIuA97lyrvnfs8bxYExITJsh6e7srwwBq7jWDFC9S
 yJGlAWpXuGUUcx6sv3zmgkfsFa8Q+jKvpRrRR9vXlEUS0jftb/CHdzaZvV2Sn9RTmz/f
 FuBXoJfN2U36VH2+vW8ayTfauU6XHlFF5/d96KwHPVzFWtAAGKAd5BaXW4a99/X4O+V0
 4FgQ==
X-Gm-Message-State: AOAM5318xA/fgXEMztEExP2jXiDq4sME5xyxcgWt0CkBvaPypuESRt+z
 IwdTD0cJKZ+wi/K2h2IVOUPN2A==
X-Google-Smtp-Source: ABdhPJybSg1RM2i+l2APF84h129M4wnC4EnavSuupW5T9WDk2bjHDOPV+AXy81Dqkehk529UisCVcA==
X-Received: by 2002:a17:90a:7c07:: with SMTP id
 v7mr1255592pjf.124.1591207290761; 
 Wed, 03 Jun 2020 11:01:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t17sm3009822pjo.19.2020.06.03.11.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 11:01:30 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] linux-user/mmap: Fix Clang 'type-limit-compare'
 warning
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-3-f4bug@amsat.org>
 <7529763d-1f4a-5077-14ed-98753c8db288@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <555fa273-336a-1e46-77f6-e3057dea36ca@linaro.org>
Date: Wed, 3 Jun 2020 11:01:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7529763d-1f4a-5077-14ed-98753c8db288@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 18:01:33 -0000

On 6/3/20 9:06 AM, Eric Blake wrote:
> Instead of using #if, the following suffices to shut up clang:
> 
> diff --git c/linux-user/mmap.c w/linux-user/mmap.c
> index e37803379747..8d9ba201625d 100644
> --- c/linux-user/mmap.c
> +++ w/linux-user/mmap.c
> @@ -715,7 +715,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>              host_addr = MAP_FAILED;
>          }
>          /* Check if address fits target address space */
> -        if ((unsigned long)host_addr + new_size > (abi_ulong)-1) {
> +        if ((unsigned long)host_addr > (abi_ulong)-1 - new_size) {
>              /* Revert mremap() changes */
>              host_addr = mremap(g2h(old_addr), new_size, old_size, flags);
>              errno = ENOMEM;
> 
> 
> That is, it is no longer a tautological type compare if you commute the
> operations so that neither side is a compile-time constant.

To some extent the tautological compare is a hint to the compiler that the
comparison may be optimized away.  If sizeof(abi_ulong) >= sizeof(unsigned
long), then the host *cannot* produce an out-of-range target address.

We could add the sizeof test to the if, to preserve the optimization, but that
by itself doesn't prevent the clang warning.

Which is why I have repeatedly suggested that we disable this warning globally.
 Because every single instance so far has been of this form: where we are
expecting the compiler to fold away the block of code protected by the
tautological comparison.

I will also note that there is an existing off-by-one problem wrt the final
page: with a 12-bit page,

  0xfffff000 + 0x1000 > 0xffffffff

The proper test I think is

  (uintptr_t)host_addr + new_size - 1 > (abi_ulong)-1

If we're going to use your suggestion above, this becomes

  (uintptr_t)host_addr > (abi_ulong)-new_size


r~

