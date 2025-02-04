Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfQiZ-0007Jd-Op
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2025 16:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQiX-0007Il-Eq
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2025 16:44:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfQiV-0004lF-V1
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2025 16:44:25 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso42106445e9.2
 for <qemu-trivial@nongnu.org>; Tue, 04 Feb 2025 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738705462; x=1739310262; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HirS+efXtai9AWrBSdUYOL4632DOxcexEWe1FcNRPEU=;
 b=Wa/jap2glH772d6/zNQnvORKikctfySTOKYPa/xi953csovg49iJrBWf1VITViJzid
 3zAV7F1HznBuIF+0ODwT2nahX2hXiDi9uDgzqGgBxKAfjo9Qsft3eSVjCjOv2kK2ImYh
 CodO/qJp8+vs1Hzc7/Yv4VvDNN+Rrq8E5dG2MG4fZfXAVA94xvaVx5vPT6W1YNKxJEwr
 aFALCgiGkxFdzouROnI3hTQtqJp7r5zVKxWUhokevjqw6wOfGSRgV1vRcndVWngaasX8
 QNRdK7g+V9tpXYSZ858Ij08kGKg2CZa9dLo6C3ogEKh/+BkmSiDhoO4y8P1ul9EDLqch
 SIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738705462; x=1739310262;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HirS+efXtai9AWrBSdUYOL4632DOxcexEWe1FcNRPEU=;
 b=Jws5lJYR4M7gM1v+JdcWAOJfb/x/RjOkU5pOF6WN2Lx0jV0BrYjSriheaTKFv7kOJj
 9QxwWbdfw5dX2mx7WB/VcrMPJ7TrjQ9fyh2+yazVBxoS/PvNBcH3Iz9LOjWMdUJtgLln
 0ttOaEAy5tPs+7stRZ3ynAgV9deSd4vitYlBiMo0pKNDmSeilMWwB/PUy9GYhvlrND7X
 SwJXuoMAoNpTluuf/3d8hvH19j0EjH2BJqoPqnlQT/VaBL0I1pLWE1LoCcth6kHIxDcl
 rNiY3X9f+JBMsjpeMqjMyotUSKNUcoLYy8oVaZWWZAyQApm8tQ7cpbsFj3o5C1VW/Os3
 8E/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR3K8B3d7CRYZRxNWVZn02zI68ylkhlNhNt9+MxbhqFJkPg+Gt8SwpuCzfjVQeYOe0dzg/24mY1lcSgcs=@nongnu.org
X-Gm-Message-State: AOJu0YxT9qJWSkaSwkKlXcaO1RKHWRpMAxZhAUbviapr4hjQWXR2UuvV
 BqYPXsWVxVXMo6fqEx+V+JrCZ8C7LqyM+v4oZBQyADvrod2RCAZBWfFvusWV9OVcjKXJzURBAKr
 K5Rs=
X-Gm-Gg: ASbGnct7cMUZXT3arAj0Qs0eR4iMl4hub1eklIgzDuGeydqCYuBToJWE4k0NxuKY8gX
 28axU6SxpCabSpqWzwnYcCw8KlMFNR1ss600oGfKtzjACsujoL8NVT6JRJhOP4u3eOJB+cAVI9X
 yqGx9CQntzrSsnqYX0JeNxiTogt2Iv3dnfL5MSpKcvW18ALhOruueQBwWKJ0tYknEaIMKA3f2xQ
 dMLgvPfZSmOWdindsoWy7Y6lmFuxpzzqhEJuWlMZ0RTMWPeQMPKB3Ev7dSf5SkVSqvtD7V5Npsp
 FMIz9O2iJ9c7qvWPy1QXfia10+WI8h8ZwZXzUuWoIM3186rAMeuzSOJxc8E=
X-Google-Smtp-Source: AGHT+IEupuehcIzdd6BClMcxRHmBrlRjx+wigeto+VouGkFQap9cClTbhIKJNqTe1MhYU0kzAKkYNA==
X-Received: by 2002:a05:600c:3111:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4390d43ddddmr1848395e9.16.1738705462187; 
 Tue, 04 Feb 2025 13:44:22 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dadca52e6sm2580134f8f.0.2025.02.04.13.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 13:44:21 -0800 (PST)
Message-ID: <0e30640c-1dcc-4b83-b69f-305821714151@linaro.org>
Date: Tue, 4 Feb 2025 22:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qemu/timer: Clarify QEMUTimer new/free API
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250125182425.59708-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250125182425.59708-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Tue, 04 Feb 2025 21:44:25 -0000

ping?

On 25/1/25 19:24, Philippe Mathieu-Daudé wrote:
> Update few QEMUTimer docstring and add a
> sanity check during timer initialization.
> 
> Noticed trying to understand leaks in QDev
> Realize -> Unrealize -> Realize transition.
> 
> Philippe Mathieu-Daudé (2):
>    qemu/timer: Clarify timer_new*() must be freed with timer_free()
>    qemu/timer: Sanity check timer_list in timer_init_full()
> 
>   include/qemu/timer.h | 12 +++++++++++-
>   util/qemu-timer.c    |  1 +
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 


