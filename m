Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtZB5-0005v4-Uv
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2020 12:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtZB4-0005tA-5c
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 12:13:38 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtZB1-0002Bz-VI
 for qemu-trivial@nongnu.org; Thu, 09 Jul 2020 12:13:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id q17so1214039pfu.8
 for <qemu-trivial@nongnu.org>; Thu, 09 Jul 2020 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4NJXxUlKii+vxrQ6oZHz5sOoMFRNxDPI8rm2z+fpA3g=;
 b=rhO3aO/Wi7Z5Azf4N41HQLGSbMTRwG98iKeWWJ7iIJWlFNcJg7GVASC2xAt2KSoJvX
 hoixXl2oyIzsgSFLXaeAqTo4AVIFVibw+CHBPy/1/JlpJt6LBxr/XcBCQdx83nLSjrcG
 W3fgWl+FuP84xOlDBH3I8vKRdAwNcMqRKkUTrfk23qKs6dz0BMc3A8Ym8NjBCwbWwSFN
 zTHDr4T+YGNNe4KX9AWEiBAZpr9Idtbqlj+Cinff8Iza5pG2Vnr6AymYFmI61rcbEb7X
 3dOXDCc7dqQbbVc96qSeTq0fI8+GPdqC82n7PoMYeJchb6gPUpFfwUdRmNA/WHOSf+xM
 IYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4NJXxUlKii+vxrQ6oZHz5sOoMFRNxDPI8rm2z+fpA3g=;
 b=IfBIUH4tNpEJ6PwAnNH1XorlbSJOJ6Qy2pbVaGEcUyLbVD+B2QNAnO/lv4mQzXvmTw
 oo5jCN2+OTmc0EkZsdtiKP9yC97x/RrHvtT9SX2Bt5db8yvmF43JPM1/MLYpbmPiaTbB
 foJHr5u2TCazbBsET4GGINC4PCfJmBqTXZP0Rw9k4rEKtIdCrsn0EGiC0eNCobYGpPML
 LZYubug6XviEL7fCVpCekpH1piFWbv9cbsy3ktpI4AMcI1EpXC3l6drjjI83GdRZoIj8
 A439svbInESO5mZdYyyu5vB2IbXSD9HXoDhmyUT8t3qzvp9XtzOZuPK4pYlx/QNyVijL
 U7Lw==
X-Gm-Message-State: AOAM530D3NGsJRu1cgQ0vAUqkxNDGWV4GyCbBu9Krs8Zej1Q+N6ztYF2
 uwrFMUsLqpoCI8EXKb0bjwAlLOcryeA=
X-Google-Smtp-Source: ABdhPJw95tLGVBLc9Dfd8Mi00GzCklLXbSM2rPiiI13qsHUW5rdds7VY9skuQAPG71d1Toedz/uDqA==
X-Received: by 2002:a65:60d4:: with SMTP id r20mr50602078pgv.436.1594311213810; 
 Thu, 09 Jul 2020 09:13:33 -0700 (PDT)
Received: from [192.168.7.121] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id j26sm3009409pfe.200.2020.07.09.09.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 09:13:33 -0700 (PDT)
Subject: Re: [PATCH] disas/sh4: Add missing fallthrough annotations
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: qemu-trivial@nongnu.org
References: <20200630055953.9309-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8267e832-ef6d-6ed2-cc70-5a17d5577ee3@linaro.org>
Date: Thu, 9 Jul 2020 09:13:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200630055953.9309-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 09 Jul 2020 16:13:38 -0000

On 6/29/20 10:59 PM, Thomas Huth wrote:
> Add fallthrough annotations to be able to compile the code without
> warnings with -Wimplicit-fallthrough. Looking at the code, it seems
> like the fallthrough is indeed intended here, so the comments should
> be appropriate.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: The new lines use TABs since all the surounding code uses TABs, too.
>  Please ignore the checkpatch warnings.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

