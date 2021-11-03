Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi6eK-0006Ze-Q4
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6eJ-0006ZO-GQ
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:09:15 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6eH-0006zX-HJ
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:09:15 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id a24so1349021qvb.5
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SWAWNiABe9ewit8ahsexjqamAFe5TvNwMXkxMutiRuQ=;
 b=mlR/M5bTQ+UpCV0k2EXWgLi3ScE/M2duKdftrkyupVU6+iekbqQJxrsdvXMAnUiQFq
 wLbH983etyZjzBLNf+bMOpKuiYdfFYPmsgEwMtccpu/evokyD+pYu4NnZ6YfgD4HayMl
 yyacE4MfdT4jCqfn10KUZDtLVY4vQBIaPxW4bfrJ7twkMmvRHsMW2PrIohKeN8oNhDax
 v60ZTntHj0xerft+Mv0R8FFyFpE9ajiHbDmhZ+tUFcWN3owmxYLbwHA2buTwzY1xNVZQ
 0SBD9bfEImrMITGWiSug5185ZlcE74yceuc5Gv4V3NpoYbgvlSepomIecia5ltlZjQGf
 VCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWAWNiABe9ewit8ahsexjqamAFe5TvNwMXkxMutiRuQ=;
 b=lSP/YD2miFHNR5pcdqNt9iO+VLRt5Qgja3lZgan180p7GNlijQkrDMSnh4LtY1pwoj
 4GzIX2iITJ2yW33Pi7VtQhQSaci0bwKatO/ndPhrZNFTpoohio4MfOJSRmrJfOWmBSow
 nSYPYBdLr3dC5oxZlDQxGoCJnXgIoBH6750aYX2by9GV8ds6Yda/JSv9eSuRLRkcVFbu
 LC1nkSVURn8TpHMvDl/nfNCfTcQGbpqVTzaOpxU6WvqluUkbXLCPwgJxmTb0WaJWtK1X
 q11LIo2h/V5NNE3ieIuf0FFx9M6AGKr0PX4P4iUS5wjCwFZmVCAMTKDhrVS7IcX/l6xH
 9Bzw==
X-Gm-Message-State: AOAM530iTHZlodE8HUb7yuKqIxiWU/1cwvBIZ0N/9Wg531fdMDIHIeK4
 8rdoYp5dwka07YyYOGG9/rpSLA==
X-Google-Smtp-Source: ABdhPJwUEUj/hMaGVFGDa30jaRou6LrR8qaGXYfd/NQqU0XffvP8dnHTLc6gIxjSg8xTFT1IKR/RDw==
X-Received: by 2002:ad4:5966:: with SMTP id eq6mr40349493qvb.64.1635908952432; 
 Tue, 02 Nov 2021 20:09:12 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id e10sm665997qtx.66.2021.11.02.20.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:09:11 -0700 (PDT)
Subject: Re: [PATCH v2 05/30] bsd-user/arm/target_arch_cpu.h: CPU Loop
 definitions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Olivier Houchard <cognet@ci0.org>,
 Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c99c8d10-2b57-09a3-8175-69901877faa1@linaro.org>
Date: Tue, 2 Nov 2021 23:09:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Nov 2021 03:09:15 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> target_arch_cpu.h is for CPU loop definitions. Create the file and
> define target_cpu_init and target_cpu_reset for arm.
> 
> Signed-off-by: Olivier Houchard<cognet@ci0.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Kyle Evans<kevans@FreeBSD.org>
> ---
>   bsd-user/arm/target_arch_cpu.h | 43 ++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch_cpu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

