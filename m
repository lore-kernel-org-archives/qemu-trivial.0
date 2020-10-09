Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQtAe-0004kZ-Ad
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2020 10:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQtAc-0004io-AJ
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 10:14:54 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQtAa-0004n1-3t
 for qemu-trivial@nongnu.org; Fri, 09 Oct 2020 10:14:54 -0400
Received: by mail-oi1-x243.google.com with SMTP id m128so10324300oig.7
 for <qemu-trivial@nongnu.org>; Fri, 09 Oct 2020 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i9LyY563dyk+VeLh1PfeD2P5rMx+jlsmbVOzgw8XLXQ=;
 b=WmWQOV6HQIPssuDu6kG8N9u+QqS+fh4rOFtIXJhi7ZVC+wosGNBv9MlKhl3CLkYs/7
 kmSlg74nwBDsVq6jTQa61fULGfgrDxXU72KCv/ijpGAMM2p5E7KXJMXonzCE1Ry/r9Lu
 kEavOZrgq3ilnTxGohw3q10Ta+e9HsZr1nvbpFwj3qozYzUUlJ1GmYdtL55DGGXQAODc
 QT5v5Do+kL3HnIubP04UDI3wtPG/IXRafCeUUoSw/RgPr9X1U0Jxnyh5Un8w8OrM0Dcx
 o+/hrMB3b1rONcDNQ30XGXw/slgeCEhUo6PAzjuwP12g8jeeHnwDX2K2QcqCEkgnrBvA
 aMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i9LyY563dyk+VeLh1PfeD2P5rMx+jlsmbVOzgw8XLXQ=;
 b=AG3+VhvdFNjaHCIpN60gWZcu45qVF0hT5Cm4MyVAeFelZo9wbaGh5cAUW+0WvCrHo6
 Ld5iHn79U2v4f6PcNUFbHQ2bTOb0GC2LE5i7N/JotnSN7+1rEm4Ob6d7m+eSBd5m8j7e
 SZKsYfAAP2ocnIYiEycCaiWscQzK8LJVaatNdRF6/T9C5rjvqQXEUAx8VxJvKygvuSRf
 85Sy0Ri5bCIMloYVkUECdNja5kbpM91Pv78nNGy9EBDHqZ+LTCDVIAi7iCplPsDpYkLj
 JOCtSaGqQcQNNACF/EYFlTkFwkqBwqze3epoU7brpG8kSxs+j/6BMSp2h9v4LapHwOeO
 oFwQ==
X-Gm-Message-State: AOAM5338jN/WxXAkQqStVnfxQIzfZ2TBsdQjxWwtqh4PHm+zSbXt2++I
 BZs4ODj0yhBIO9iLGIIkSZ/1IVqkuMHd6+lT
X-Google-Smtp-Source: ABdhPJx34/qvIo8/NbsjYltNsmH3l536bzjxEDMnyzAT/O5l7EE4B13P+SvXQxaWqDgMMSUUTTjGYQ==
X-Received: by 2002:a05:6808:3bc:: with SMTP id
 n28mr903550oie.171.1602252890179; 
 Fri, 09 Oct 2020 07:14:50 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a82sm7432220oii.44.2020.10.09.07.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:14:49 -0700 (PDT)
Subject: Re: [PATCH] hw/net: move allocation to the heap due to very large
 stack frame
To: Elena Afanasova <eafanasova@gmail.com>, david@gibson.dropbear.id.au,
 jasowang@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <8f07132478469b35fb50a4706691e2b56b10a67b.camel@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5c2c746-e648-a2b6-e09c-069423c752cb@linaro.org>
Date: Fri, 9 Oct 2020 09:14:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f07132478469b35fb50a4706691e2b56b10a67b.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
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
X-List-Received-Date: Fri, 09 Oct 2020 14:14:54 -0000

On 10/9/20 9:02 AM, Elena Afanasova wrote:
> From 09905773a00e417d3a37c12350d9e55466fdce8a Mon Sep 17 00:00:00 2001
> From: Elena Afanasova <eafanasova@gmail.com>
> Date: Fri, 9 Oct 2020 06:41:36 -0700
> Subject: [PATCH] hw/net: move allocation to the heap due to very large stack
>  frame
> 
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  hw/net/spapr_llan.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

