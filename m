Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg7rg-0001fu-CU
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 12:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7re-0001Ym-KQ
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:02:50 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7rc-0005Jt-Vi
 for qemu-trivial@nongnu.org; Thu, 28 Oct 2021 12:02:50 -0400
Received: by mail-pf1-x436.google.com with SMTP id x7so1403197pfh.7
 for <qemu-trivial@nongnu.org>; Thu, 28 Oct 2021 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uw/xP20y7Tu/zA4i+uHZWSLhMwGIeYrK2aCLZQfEntA=;
 b=NyWrvmg1v00ajaboclHPDULt3LH8ItetWm1KqZNZ1Y28bkBjkMy6HV3lBiq/8ljy/y
 WONv2nthq+HJ+8gz2fppFCv7ovoywEMK+es+C8yLRPyq5c0crD+BUBTtv6eXYSalbtyh
 pf2PaB9znMYfmEScB9raCe7RrlyStjrFkq2HuIal0jtuIeylOw0FkmvuXRNiH4zJhbQx
 WsqynIXGeL/GBr+eqipxZEokNpL8OBU7qC1OyY9r/pUBoZkgku19B/ZT8xAw60WV8QSD
 HBJ9ZkqlkmmiUKAT7fhLHhwNgG7fCTFPeOQaald+XCzB1kKsusHseO7+eg+upg1C5pPP
 S8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uw/xP20y7Tu/zA4i+uHZWSLhMwGIeYrK2aCLZQfEntA=;
 b=dI3OfVwgFNq/TOwiThGyox46qtRadPfB/OWLyKZo8jtAWEHppUkBsl2swScKGcJI5+
 dPipFe7/oPyhZ5BwUf6kDiE1GupkE8U+MXOq6RGeRf/5+2nRQ97wqxXYGIjLUqcHTbR3
 BXSkKXAzEu+HOP/YF542BmVPuPpLtD0Dg+jn9pGl00JOyoiG3JCRMmsjRITOT1Iqub1P
 /CFOFC2ouaQralrS8nSRrXB4/wRor5qaT6ktxLsizIZUbGo3oG7HuxWG/Py8iG6wufQC
 7e83E+h5ZR4N0SuiHgsfIpdTHsasaNo+YIiCdwH9B4KOGL+I+rgV/mxyr7DSdI7ufZlO
 nR5A==
X-Gm-Message-State: AOAM530zyjLM5F+eAjCU1G7No0ackGaC4CeJiEOngd8ZeNsVb4ryvk90
 w8Z/LsnDb1fUjcxKvW+cJ5e+Sw==
X-Google-Smtp-Source: ABdhPJx1X+hmYe1ZEWCdpQp+mnFRsDSSR4RqnW+LwXshpJfopL8ngQytweD7y00Fq4WETD3do6zBHA==
X-Received: by 2002:a63:7416:: with SMTP id p22mr3757507pgc.327.1635436966859; 
 Thu, 28 Oct 2021 09:02:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d14sm3120096pgt.64.2021.10.28.09.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:02:46 -0700 (PDT)
Subject: Re: [PATCH 14/24] bsd-user/arm/target_arch_elf.h: arm defines for ELF
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3fe89f1-ec09-0d5c-37d2-70c9fc1b2c49@linaro.org>
Date: Thu, 28 Oct 2021 09:02:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 16:02:51 -0000

On 10/19/21 9:44 AM, Warner Losh wrote:
> Basic set of defines needed for arm ELF file activation.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_elf.h | 36 ++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch_elf.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

