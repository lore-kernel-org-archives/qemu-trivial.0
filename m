Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1si1YM-0006lX-GE
	for mharc-qemu-trivial@gnu.org; Sat, 24 Aug 2024 20:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1si1YK-0006g1-AI
 for qemu-trivial@nongnu.org; Sat, 24 Aug 2024 20:56:20 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1si1YI-0005Eu-HR
 for qemu-trivial@nongnu.org; Sat, 24 Aug 2024 20:56:20 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-709339c91f9so2590141a34.0
 for <qemu-trivial@nongnu.org>; Sat, 24 Aug 2024 17:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724547376; x=1725152176; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o4OOby9xhVQ9Is9uyFNgofdcb1TLkEOYfYzBf8KU3Ck=;
 b=spgnTFKrrJbxQ6HaKUL4adciEiU4u7bUB+tSYtg1myhrrQsAET4qJ7W6gEg1g67AG+
 nBHt0yxUiBa+T5GrR+VSdatHbDprrIRuMKwxJvRRtabNLyjGPsJI7I15nqAha3oFlDd1
 6YBtOvSk08MqphiZBVKnVMJNpYKcXiS/GJEOFXowehHz4ixnicKUtSSmv/HyYfP9DOfX
 eyKWXkf2v51XKvBiw7PROWgUr/1U/GxjUukQUdgFbbAqRGtGUNWIg3ra5XLiyQGrAR1g
 4Ir6NecJAWSxPIiB6mfRliwuwuHd/jgR8uEMz3EONoNl/WeTS2liMtxL8IS5CeStgXIY
 MYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724547376; x=1725152176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o4OOby9xhVQ9Is9uyFNgofdcb1TLkEOYfYzBf8KU3Ck=;
 b=ihTBh+U7En2KUc802AUJgWYHVhP0T9LDtdX0zo4j3PE9QTiH4ywD3yb17fXnkqzyKi
 hg3iLsGu5kT9aOylOO1vMxtGbvXda9sSMgQGvO+r1VlXSfpIPJ7/iQYD3C1FfCMy0y96
 T6kqenUaBf+Hqq5Lf+49cvn0792Piq+oX5u2t97t2sTlTcdfL64PGdi5+JvkYQAVrddw
 Him/uCCrEwhcLLKvkaPkLOSTXlSrx0GgjwDjp4YsHcmI9502ulGmW2DFRxxCzRw9q1v6
 n13WguFwyV7bY8XMBSy9SREQkTCt3NLHHh0AW/FknyjYp5CZkK3s1PhE4/upAMoC9mRk
 bBUg==
X-Gm-Message-State: AOJu0YwiQn/JVmQN9fvm6lRrigF+7y1yp1ph+7jxNm/DGtE0Mjx1qrVj
 n8blzOHeTLP5Zb0LLbGEIQZBrH+5EmoOS6VqO51ao/PaWye1VBEnLx6feJLCZUZTTdHSMW4HIhp
 y
X-Google-Smtp-Source: AGHT+IEv5x9NVcQo/5dEKyO7C3j6DeylNXXoAT7eGIEKmehQH+H9Auh74qva8RSetwHpuoxWSQbhBg==
X-Received: by 2002:a05:6830:7318:b0:708:9433:3574 with SMTP id
 46e09a7af769-70e0eb2b6a3mr7249265a34.16.1724547376420; 
 Sat, 24 Aug 2024 17:56:16 -0700 (PDT)
Received: from [192.168.98.227] ([172.58.111.146])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70e03b85c97sm1314932a34.65.2024.08.24.17.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Aug 2024 17:56:16 -0700 (PDT)
Message-ID: <15121255-37bf-46f8-8ccf-277ea231df8b@linaro.org>
Date: Sun, 25 Aug 2024 10:56:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL for-9.1 0/3] Trivial patches for 2024-08-23
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240823141542.1411594-1-mjt@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240823141542.1411594-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 25 Aug 2024 00:56:20 -0000

On 8/24/24 00:15, Michael Tokarev wrote:
> The following changes since commit 407f9a4b121eb65166375c410e14d7b704bc1106:
> 
>    Update version for v9.1.0-rc3 release (2024-08-22 15:07:32 +1000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
> 
> for you to fetch changes up to d6192f3f7593536a4285e8ab6c6cf3f34973ce62:
> 
>    hw/display/vhost-user-gpu.c: fix vhost_user_gpu_chr_read() (2024-08-23 12:10:28 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2024-08-23
> 
> There are just 3 patches in here, one adding a comment (no code changes)
> and two fixing bugs (one is a regression bug).  I think it's suitable for
> 9.1


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.

r~

