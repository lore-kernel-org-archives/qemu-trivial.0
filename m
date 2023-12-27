Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rIPxy-00014h-IF
	for mharc-qemu-trivial@gnu.org; Wed, 27 Dec 2023 04:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rIPxv-00014B-55
 for qemu-trivial@nongnu.org; Wed, 27 Dec 2023 04:12:39 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rIPxt-00071h-NG
 for qemu-trivial@nongnu.org; Wed, 27 Dec 2023 04:12:38 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so48145015e9.0
 for <qemu-trivial@nongnu.org>; Wed, 27 Dec 2023 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703668356; x=1704273156; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lF43izCFYe6+UtOqcYS1FmnlxepPjHK+oESfAhRkar8=;
 b=fZhcB8T2TQ8kZIxxCFlH2W+etZ2KujpJonUCCONxWB4z5YKsdZoZvhCa12vTF6pQQh
 RXQJrc/xGFDp2Iw73Kl5iiPDuSXoZE3DZaMIlyf+GXQbFIlGrFqXowl3CCH5XeN/Rj8g
 w1LwrMDvwUzNjBipxGuVnRbWHaubIzXrhozjhgkkZwcsFeoD8uWsGxoqj1WuNsZm/SGS
 nATVNj7NjPci31MeMwf+Z82zapSq07RkS8ggDPkpYouOOQr/t1ODTQrjKF3Q2pPzudZj
 G3xyxrxyumWrRm9dMdAmbb5ABhEzWRcnner+b+FRnmOIA69uzaHaqu7X0BTAupPpKE+h
 937w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703668356; x=1704273156;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lF43izCFYe6+UtOqcYS1FmnlxepPjHK+oESfAhRkar8=;
 b=lOnl8o0to54zZrRiuRrV2rdbzCjIUCleYYQ13r/6PEHh9SvyyAtlECNfHDgIz33c1z
 BbCJ1v78OJwuuSoy6qf3tVOaXQSxe6punExN+fGBYUBjxkL8XTskHbAyI4ZEOWvPUdXy
 CSMI9YWTr0ecMPy1DWX42YakAVclM139uC5mZVzvrDq9dEtxZ6L2ufwOFPcMj8hktpD8
 ND95eu2RR4adVOkJk5XK6nLUBpOGfJOYh6yN213qsx9knAUQ1RqIEaW9Cdftj4d9N0yT
 TOm+0U0UmyiCUtMkUEMwTyzOnlZ59kTqZiUXZo7pH6i1cN6oJ8ZwAzomxnfGxh2m843t
 j1YA==
X-Gm-Message-State: AOJu0YxinwodsscDxEj+UCPp7zGNedB1+tgEOb1tjchSSs+DAA2kQ1/d
 GZUat9PfnRLtS7tCJeKlPu20cgtgTjcohA==
X-Google-Smtp-Source: AGHT+IFIZ7/WBmJ2mr7OOPUwSQdO/kaA9RLHCskrCFl3oTFOFUGy70T3YutNl5ehK7U3R2TRIK+Fmw==
X-Received: by 2002:a05:600c:4593:b0:40d:343d:2e0d with SMTP id
 r19-20020a05600c459300b0040d343d2e0dmr5751659wmo.32.1703668356244; 
 Wed, 27 Dec 2023 01:12:36 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.122])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b0040c411da99csm31284831wmq.48.2023.12.27.01.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 01:12:35 -0800 (PST)
Message-ID: <9d66b444-d0c8-495a-8555-5b70af07bea9@linaro.org>
Date: Wed, 27 Dec 2023 10:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap: Fix Stefan Weil author email again
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
References: <20231227085934.18158-1-philmd@linaro.org>
 <92d0751b-fa39-4fc2-8e55-3b07aa3b3ed4@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <92d0751b-fa39-4fc2-8e55-3b07aa3b3ed4@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 27 Dec 2023 09:12:39 -0000

On 27/12/23 10:09, Michael Tokarev wrote:
> 27.12.2023 11:59, Philippe Mathieu-Daudé:
>> Commit 5204b499a6 ("mailmap: Fix Stefan Weil author email")
>> corrected authorship for patch received at qemu-devel@nongnu.org,
>> correct now for patch received at qemu-trivial@nongnu.org.
>>
>> Fixes: d819fc9516 ("virtio-blk: Fix potential nullptr read access")
> 
> Do you think a single commit warrants an entry in mailmap?

If I cared enough to write and post a patch, I suppose so...

In the past the only limitation was whether someone was willing
to do the work and send a patch, not the size of the .mailmap
file.

