Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHt5d-0004jP-Lm
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2023 16:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHt5b-0004id-J1
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 16:01:51 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHt5W-0005Ye-FZ
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 16:01:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso178518pjt.0
 for <qemu-trivial@nongnu.org>; Tue, 17 Jan 2023 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eyW4/4H5m8mM04RK0Yizhzv6HDDNEjtTKtJnCwwBPDo=;
 b=Aog/OJbcF1u60+pZp2dDOGO/drykB3FyYXavhgA1pWMJAPBRVKe2wp6iQojQMbShsf
 iQD00a6koYXDtrVa68ycdgScvPX2Gb9K24SjD13qR42tWN26EodJ3EPi9E8+pd74YOqt
 kksr/z/omHrLoJ3nq41yfI1b2AcYUHuWhHII3TONnHJGITOffgA3NDici0prT5q47Xqk
 +YQy7j3DgG/AhP8Hk9Z39VUHWMazPg08fGiZWHYAlclEN05kQeTObMl53x3BYXK5086a
 eNk2b1f4YqwQXSLJy/SZAsVKLavb8atGG7/xvxhF3bwMPkBIK+BTp3gkCm38ayfYODu7
 lybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyW4/4H5m8mM04RK0Yizhzv6HDDNEjtTKtJnCwwBPDo=;
 b=kJnIrnYzFgtgvr0ESP+u+0NBRCc+HzYa7g7wqwzm5tp+S5BgLMqciwgj37en0C0xhc
 7z2sI/lpptPM0r9e05PkAdvLdMRCGD18tZezQsvwsQIyPOg2jLEXyTO5zWx8lHyY3pRq
 8jrEB1IRawfg4Vwvi/6EYzY4R0RsMqfW5wTKgBa9CJJ+sRXJspxpJmJ/wFXP03Mhv93z
 M+pWP86+WbP7mCD0GPgBWnSwD2z/o0/1t+mwUKoWDJN5u1cTOP39XL2SjHU7Dm8eeIKz
 nxVi8V3ERLKUAFtfupZ4oyE1FDjc3SYKVWJkVGy6EUAeqP32MYVLZ5wqsAx41kArotjw
 Wahg==
X-Gm-Message-State: AFqh2koK0WlLV567nTE+gC4L3jJVNDxQ7uZL7ocedPeKc9ELdhJmbB1r
 dLVAQjGx3B6ScR7vtdpJJud7bQ==
X-Google-Smtp-Source: AMrXdXuPZFHVgIPP03bJWBJdgKSjErG5LnMRVjf0NKb0A7F45aKCO7l5p0tT26104qZCmweq4a+jkA==
X-Received: by 2002:a17:90b:394a:b0:219:9973:2746 with SMTP id
 oe10-20020a17090b394a00b0021999732746mr27557495pjb.0.1673989302068; 
 Tue, 17 Jan 2023 13:01:42 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 kx8-20020a17090b228800b00218d894fac3sm1976pjb.3.2023.01.17.13.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:01:41 -0800 (PST)
Message-ID: <6da18e97-c80e-1ac2-edca-34fb243edd81@linaro.org>
Date: Tue, 17 Jan 2023 11:01:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230117184217.83305-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230117184217.83305-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-List-Received-Date: Tue, 17 Jan 2023 21:01:51 -0000

On 1/17/23 08:42, Philippe Mathieu-Daudé wrote:
> Remove dead code:
> - unused fields in CPUTriCoreState
> - (unexisting) tricore_def_t structure
> - forward declaration of tricore_boot_info structure
>    (declared in "hw/tricore/tricore.h", used once in
>     hw/tricore/tricore_testboard.c).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Given this compiles,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

It did surprise me though, since I would have expected something to use hflags.  It turns 
out the only thing that uses TRICORE_HFLAG_* is the kernel vs user-mode bits.

Bastian, there is code missing from cpu_get_tb_cpu_state, to copy env->PSW[11:10] to 
*flags.  At present it would seem that all code effectively runs in kernel mode.


r~

