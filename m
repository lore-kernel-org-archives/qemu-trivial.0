Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT34P-0003e2-Bv
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT34M-0003cb-VA
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:59:16 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT34L-0001aT-Ds
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:59:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33926ccbc80so4487318f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706201952; x=1706806752; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vka6V+I0jujOnJ86XivQ3Lv7IXgrTpTt635vd9F7zmk=;
 b=bls5+cTXjecLobYStxOu/s3B8ilFy5UgBVxwMQPUO2mYiYLZVOasRv99xXEG9bQ/a0
 E83q+dt4mpcvLP7EhKoaq9+rdmW+HgE1gcuwwin3gfFjM+CP/FDh6Z8Ac9y+FkWN0L4U
 FHCCaRKytDnGpSrCP124TazOXd0nsGERBws6VsqNy3jKL7UJGxVrsEoQsoitQKNqO0zN
 IwaARrpjRQYqDa7XZpJBM8ccuTtVBn0PO280hFI4k6BgQ3O9OT/W/Uipvu/AfsZMz1Zu
 fYxS4ssebtIzV4hR6uBRMu5vzkKs297n1mT0n6qb63MTccPP/5vNYr/1gOIPRdnYfNU/
 OBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706201952; x=1706806752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vka6V+I0jujOnJ86XivQ3Lv7IXgrTpTt635vd9F7zmk=;
 b=in+popU5LHUIBukN4OTkxFAAmQCP4ckzxx+OXfWyv9s2XHVoaEhEfS3fvxO3iX0Sxm
 Q40KY7J1kW5Qo/m/AW+f1Y7vTdW+NdoBYOsYB+A+QbyGpoQ95Tb1qULDLUEo7qfdrKMJ
 Nwrhq6Vq4fPc5Mpw2E60TNKRxMO2uMpAxHXmUpomIFf5f13rDBLEx07NPFlomcKmZOPo
 aDnef9p2KCV0vRUwnlLe0Md77PxtlLJNQaS4SLxJTSqg/PhzBuYFqy+BxjIBI0S5V+DZ
 zFVgqYuKj4q7/cJkgz358SSGhRc86gUEb0MbthJQQKApc3hndAgQd03Xa/8QrPsS4oMj
 RbYQ==
X-Gm-Message-State: AOJu0YzntiBDmPKtGCVGNml133278hwGz9akZOby2SSAm5UfZqbZaSyL
 L8YRAaO89N4KXRMNB3nyxieR2jl82Duzv/WyT1d88ME9v0ZafEuPLwvbigferlajG4RaweFfCQ6
 +
X-Google-Smtp-Source: AGHT+IFOfjqRe2HR8tebvt/OWu6NtB/MGiG/udzy5HeaqpTU+dihYvEOT97Avnnk3RAMF2VhKA9Y9w==
X-Received: by 2002:a5d:624b:0:b0:337:c595:88f5 with SMTP id
 m11-20020a5d624b000000b00337c59588f5mr1231784wrv.16.1706201951847; 
 Thu, 25 Jan 2024 08:59:11 -0800 (PST)
Received: from [192.168.69.100] (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b003392bcd6c48sm12913879wrv.79.2024.01.25.08.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:59:11 -0800 (PST)
Message-ID: <7ef0c6d5-195b-4ced-bceb-73e3965e4374@linaro.org>
Date: Thu, 25 Jan 2024 17:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] disas/riscv: Clean up includes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240125163408.1595135-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 25 Jan 2024 16:59:16 -0000

On 25/1/24 17:34, Peter Maydell wrote:
> This commit was created with scripts/clean-includes:
>   ./scripts/clean-includes --git disas/riscv disas/riscv*[ch]
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>    it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>    Drop these, too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   disas/riscv.h          | 1 -
>   disas/riscv-xthead.c   | 1 +
>   disas/riscv-xventana.c | 1 +
>   3 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


