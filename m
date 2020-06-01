Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jftxM-00082C-BT
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 19:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftxL-00081o-Fo
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:34:59 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftxJ-0003wY-Lb
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 19:34:59 -0400
Received: by mail-pf1-x441.google.com with SMTP id 64so4158036pfg.8
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SPELmbQOfJIxeMT9yjj8Ttxr0aEkF6JZGwDFAGf+QKo=;
 b=XeMGKj7BghBcp2AERgXZ3nTBeIoAIUH/QQeOWQNC1SpyJ1js2QYbZMbRSOUVUAt0j2
 ncfOpuATtAdTP94XpGcKXfdqMoTdPJsi9CRR9fGsJS8NL4hIycPoqMeHTRJwkCJb1Zx4
 qTobAVKXDsJVkVIa0rs0QP7WdEF+1We/S+eRQIVQrhP1cR2+K+gyzRvDFA73xoeeGgXl
 iTgkw5DkIVCBy8zLij67PnioIDXU2T4w1kxMyCiTDq66i2GWAKeGYCn5nyQXZu8vLT2p
 Ovw2B7DeBa0jZl6OU8E71U4mhttPCzWLF0KBArl4wt2PIgJ5xh4fsMTTeEp/PFZmfcgq
 ZTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPELmbQOfJIxeMT9yjj8Ttxr0aEkF6JZGwDFAGf+QKo=;
 b=qNU/rhv4RFJPgSAOAlphgMU2POBY0ksyRK3O7ymHMAhNY4bUIJnqDZBNMGe9JpKmBw
 zgBgxImGTvRd/+ub7Xw5CnMh+xzC+8Vl7+OSTBOztaI+64UjZLEL4AJfs5vVBqaAud0K
 ucgiDu+VXfwbgpJo9JwX6GMMxPxHRKvwAj73trewbcu96APJ/15KK4CcfhjqHizy7Ofx
 7Hr51bE9o2MwkFTlGt0qIilFQw8fVuTYu+8CbA2b3z3w9w09kf/866vIdah69MgsOp42
 yC+SEFLtqooUIoWg7gD6P/j7p2YKUoM5DHMxpkwX2dZ9ITgje47oZhB2d8e5td7b3VM7
 2h8Q==
X-Gm-Message-State: AOAM531Wbor67gX59welXE8+D7okZyhZcGiUTJm1C+g2t3FQnk4F4ax6
 x1u8zu59SxzxCo1VHSdMsBocyw==
X-Google-Smtp-Source: ABdhPJy70MClJTNM3/F9rCQwlfST2nkGKHtgtJ3ON+z7WX0Mf7Rk+9MNvB5hr4p0gshkq+RehqkyPA==
X-Received: by 2002:a63:d54b:: with SMTP id v11mr8829615pgi.198.1591054495930; 
 Mon, 01 Jun 2020 16:34:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p8sm477466pgs.29.2020.06.01.16.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:34:54 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Helge Deller <deller@gmx.de>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c840231-813a-20a4-62c0-a3d42c33914f@linaro.org>
Date: Mon, 1 Jun 2020 16:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Mon, 01 Jun 2020 23:34:59 -0000

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the aspeed-ram-container
> MemoryRegion ends up missing 1 byte:
> 
>  $ qemu-system-arm -M ast2600-evb -S -monitor stdio
>  (qemu) info mtree
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Fix by using the correct value. We now have:
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


