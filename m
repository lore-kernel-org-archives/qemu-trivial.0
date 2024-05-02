Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s2dFF-0003jR-Oy
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2024 16:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s2dFD-0003j2-4o
 for qemu-trivial@nongnu.org; Thu, 02 May 2024 16:41:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s2dFA-00062g-Lv
 for qemu-trivial@nongnu.org; Thu, 02 May 2024 16:41:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f447260f9dso539964b3a.0
 for <qemu-trivial@nongnu.org>; Thu, 02 May 2024 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714682487; x=1715287287; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGr5QKFKQFwONddBFWKxjfgRAWmjWFd1tP9q1rdl3iQ=;
 b=AiMjgKaf6oK0WEg9pGP1W2KhnSgIrGXkJ2/LMusmuJrxkq8tULPjTHbfQTD4Yw2GH9
 kpcV7l2BdSTqFip4RBawfPz/8jVekgc816vEI6c0kHZhQWrfi9te2Kw0DfyiTJ4byfAu
 6f3ha21sMsTuvkVUNQSKMUBNT26KMDHJDozMAtubW5+xBKWIY4H8nL9BZbbFAMjwrmll
 FtAnybH6OiiHexvB9rWahyZdz0N4HN0Mcmhcx+3EcNHCKlwmhkSY2J+1SpnaHed+QfTg
 qlk6ThP8mGFAqF8O+nBtk93inOUb5JwABJix8BxJyV4fPtVOVlwZCQ1Jv/iFMRqCwjB2
 725A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714682487; x=1715287287;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGr5QKFKQFwONddBFWKxjfgRAWmjWFd1tP9q1rdl3iQ=;
 b=Q51lzBCzLPiTJBj073KVx17lGVcMg9zAAQ/b2nUvf5TTqj40jTA3/2EvRZKCjADmY+
 EFtfOCbOaFEeCkF6d8ZwSuLFi44vdrJ3yw07geQR6wCXq6K+bMsgSFbSWLmMCAaRMmdW
 0mMeCCFthfNG+Q9nVjiWz5FZQIrtbMztvqgi5ansN21fnsAPsUM0aLUrWq961GE7Gyfp
 CJXmf2K2buGf1v8ahBlODB2AjBZ6l8p0rZ1bcSHXP6YuFcDHPSDUdA03wwCwj+b5v/23
 EhMlsQRc0PzKM2wMrWt6pKHHAyv4Sb8s4B4S91ydcXG9gI1A/8PMOGk2UF1ozBuhJdYd
 9HlQ==
X-Gm-Message-State: AOJu0YxNQLRH7tod3r5bFcZ6E+cQSBVY5NWgYR1ZMJs55xw0cAWmLrQ8
 NeVpDRJ4ZHPxWi3dsXskc+vnVk3Yl6cHlmCav2u8mubdCJ16hOcKFNrkLLKwyF4=
X-Google-Smtp-Source: AGHT+IEUPPbngYl2q4IhxI7jjEVfqqt9TWQQlxcoXVh89FouW2vACjaxjrr6wfhMczAxQCGMHS2LCw==
X-Received: by 2002:a05:6a00:2287:b0:6e6:970f:a809 with SMTP id
 f7-20020a056a00228700b006e6970fa809mr810459pfe.20.1714682486954; 
 Thu, 02 May 2024 13:41:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 k22-20020aa788d6000000b006edcceffcb0sm1683563pff.161.2024.05.02.13.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 13:41:26 -0700 (PDT)
Message-ID: <2cdaeac2-d57b-4daa-826e-d57d55d5dad0@linaro.org>
Date: Thu, 2 May 2024 13:41:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Re-enable riscv64-debian-cross-container (debian riscv64
 is finally usable again!)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240502194046.830825-1-mjt@tls.msk.ru>
 <3ce937fb-afb9-4ea2-97ab-b8dc0952e9be@linaro.org>
 <9969663a-0f00-435b-b507-fb6a429cb4db@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9969663a-0f00-435b-b507-fb6a429cb4db@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 May 2024 20:41:31 -0000

On 5/2/24 13:08, Michael Tokarev wrote:
> This thing works now with sid/unstable, this is what this patch is about.

It worked when first introduced, then failed, then worked...
Sid is too unstable for our usage as a gating test.


r~

