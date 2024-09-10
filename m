Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1so6NM-0000Le-Aq
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 15:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1so6NL-0000KN-4M
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 15:18:07 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1so6NJ-0006Ev-HH
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 15:18:06 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7d4f8a1626cso4664868a12.3
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725995883; x=1726600683; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bp+Lb4jAA1TZLo5WsOFnHJj8Ljjy5esPyPspHtQk5fI=;
 b=HmE9n2PmlyXBg9VKiT+3+yCryDiTkJel1a6kOFyM+Jl9Ol5dTjetX8wQxVjclv8Fzq
 etu6vTcjC1rNkWR3qwQhT2+ZY9zb4CNeibpt0WL4l1SvNyyGSl4Jx26oa9cp4+Denlx0
 Xk7CkYqm94/bE5+ggtCqUb6Uns3xJeRYS5Kv9ungGCFvv+dJ06eCbnK6iQYChonlKz5N
 qYHQ0t8F33yo7Qu8Tii+buNJ78k7HpNLuNsodYCWnHsIjInhzZCCm9+hXnQF1uo7tau+
 vF7w52xAy9pp2YEKssqvGH1G1hY1LQBmBu5oL3BkCY+0TVWIDI/Tb+UGlfpxuei12KER
 9/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725995883; x=1726600683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bp+Lb4jAA1TZLo5WsOFnHJj8Ljjy5esPyPspHtQk5fI=;
 b=Ja4dYaw9rAkR7/9vCSxDPyHyZfe8TJPO0I68oyMdvYycPod/SLeENWtBmtfxw9Yh0m
 l+eaejKNaPmD+LNsMyiKNu6e8ilcL4UvUazyoDmc2ZduewWwbYRboXekSBWQn6+SYUF/
 bhLhhKwsopfMYGorlKIBNSgY0oh18QKzXS/tV9BXqa+dFrHlu4K4DlFxcvlPhYBOGgJd
 rkrEbJANRHiuWaRH7AEQpKzmtqobyDeoA8SWLlwgH5WeCtnKh8IvROExFvMn3rCfLKyP
 puGdwIkUAv4Dub6Z5jIjO4rUdIRz8ui58iwwDNNjFAREPg8eZGECNkogKztfSZ+vop3k
 Aahw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC8+1GYy0RhyyotyNQV8KjSsURx5mJycVTzDKdod0ZGi/Eu6hmhjSlNPtyRGpQXzqrvAfRzp9wvsRVHH0=@nongnu.org
X-Gm-Message-State: AOJu0YzyaSFnUjO6hDyx+9rDWEVgMJk0d9ohisFEOL2gxw0GxNVjWUX2
 9b31Xuil7JHbiu2DqrVMgaGl1uFErrgLcLPNWl5eP7xwNiy/GiUsg7U91TtRB8U=
X-Google-Smtp-Source: AGHT+IFKXjge7M8V7+RkCRLG+dE2atytHHkmQCqSFSYPTaCuyeooA5Ut9pL0wSxdDDWpFcn0hlhFUw==
X-Received: by 2002:a05:6a20:43a0:b0:1cf:206e:3dd1 with SMTP id
 adf61e73a8af0-1cf5e136f62mr2520875637.25.1725995882634; 
 Tue, 10 Sep 2024 12:18:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-719090c7c22sm1687231b3a.203.2024.09.10.12.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 12:18:02 -0700 (PDT)
Message-ID: <ec1f551c-d30f-42f3-ad7d-aca593d492b2@linaro.org>
Date: Tue, 10 Sep 2024 12:18:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] misc: Rename included template headers using '.inc'
 suffix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brian Cain <bcain@quicinc.com>, qemu-trivial@nongnu.org,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240910112833.27594-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240910112833.27594-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 19:18:07 -0000

On 9/10/24 04:28, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>    target/hexagon: Rename macros.inc -> macros.h.inc
>    tests/bench: Rename test_akcipher_keys.inc -> test_akcipher_keys.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

