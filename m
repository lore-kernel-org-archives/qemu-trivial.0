Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfuVg-0001nu-IZ
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 20:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuVf-0001nE-8i
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 20:10:27 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuVd-0004vh-Rm
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 20:10:26 -0400
Received: by mail-pg1-x544.google.com with SMTP id e9so3058375pgo.9
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 17:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fIKLbHoFKg+nznod2itU42c+/0e2vFiUewBNDVR2woY=;
 b=illVb5fhOxZSpL6paFF/zFih/5SCmShPxekPzVodzrtSxB8k2nAPRHKd5iQhXx5P3V
 tI2SfQAYd0wWCwOHcEYfax+tsw6bKst0Ftbj/fDM6p+3wg4IINot9hn9jbALLgLqX/Xa
 WThNjKNBIcwHhlkdFoumCncKZJkAGHtoMfCj03lfjlFutQ1COBeEuDSwdZ6af6Zliomd
 ErAql51P2F8Xp4oMCrHBTbhbwihK476K5MYUxSim/PtTxHl2tz1vO5wQtrDAv2SR/s8z
 AU/U6ayMh2jsTEid7KZVT5o0cXzDcOL788x3stLqsS8ojm5iiGrpmR3hictVDaQ5hnRl
 xO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fIKLbHoFKg+nznod2itU42c+/0e2vFiUewBNDVR2woY=;
 b=ronZ2oZY8ICgDZRzcNCq6BJNkh822AqZFqr4ouG267Ig1v2dCHa2LCPdxPKwjeDljk
 qY1YQn4eEJGrJy3NKh2OAYMBn1Sqb+Okzh1xf7o/QFa+qL6EQXayEIOs8OerlgOhp7ZF
 VIiCvZC0JoJnuD6qb0oe0uDNTPWLavxvUW9bxAGN2hRVFw5+qkMWjBTujpbvuR7nEasF
 TjbUDA/7dwfs3wBuxv9oUyrhlwWQBx2soRAX4ua84WEwm+PxXRSZesFOgj5ZfJrUnxnO
 La0ql5KvXtaPNzMHsOskMHthC0MvuUtLleMQvBW5EUlbPMpfUovyf+An5OtW8sknhnIr
 Ytqg==
X-Gm-Message-State: AOAM530RSErny6+xX4JzbB7mDHivhxgy8DCC47CZj1jDHs5CN4cGljM0
 uXfzzLApOgDzzVZoDuY0i/CZpw==
X-Google-Smtp-Source: ABdhPJy8E+dBB+B6xxH6g4XYaRfMTQDSSVQjABsveDzD7SE5UnKrgiryvqCCTdscifAd58+mzrbIdQ==
X-Received: by 2002:a62:8f45:: with SMTP id n66mr21589233pfd.276.1591056623457; 
 Mon, 01 Jun 2020 17:10:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z140sm502984pfc.135.2020.06.01.17.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:10:22 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] exec/cpu-common: Move MUSB specific typedefs to
 'hw/usb/hcd-musb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200601141536.15192-1-f4bug@amsat.org>
 <20200601141536.15192-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee8fffed-cbd0-53e2-2e94-c4c9555e81a9@linaro.org>
Date: Mon, 1 Jun 2020 17:10:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601141536.15192-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Tue, 02 Jun 2020 00:10:27 -0000

On 6/1/20 7:15 AM, Philippe Mathieu-Daudé wrote:
> The CPUReadMemoryFunc/CPUWriteMemoryFunc typedefs are legacy
> remnant from before the conversion to MemoryRegions.
> Since they are now only used in tusb6010.c and hcd-musb.c,
> move them to "hw/usb/musb.h" and rename them appropriately.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/cpu-common.h | 3 ---
>  include/hw/usb/hcd-musb.h | 9 +++++----
>  hw/usb/hcd-musb.c         | 4 ++--
>  3 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



