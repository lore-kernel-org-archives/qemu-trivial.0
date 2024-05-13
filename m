Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s6Rsn-0003Wy-HV
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2024 05:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Rsl-0003WJ-9L
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 05:22:07 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Rsi-0004Ot-Re
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 05:22:07 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51ffff16400so6660331e87.2
 for <qemu-trivial@nongnu.org>; Mon, 13 May 2024 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715592122; x=1716196922; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZrQWtxU52idxp5eYbhcQHiiBGL/BJdP6x1q+TfBDHU=;
 b=kG9GSI+BwDElSSoEzNyH1b3a4p8fpX+wb5RDnYL2w25wmr427ZUq1Hozmh7JpHCx+O
 M3yZJa33DECzzq3mloCuyOu2INIdoZNP0cLa97k1HElHOnDueGFhHDa2R41K65gYbeSr
 Bz1NKuPlR7WaMZwe5Ud3PMB0ttvbXkA1w5Ghh9DXOwQOWIhuA1nwZl6IkOJUPPGUJql0
 2wmJaKge8E7Bfj/m50xx1HXpEwhqcyhJoVHZhzmD89fLNGQa+vwAZYPR0jMLm2ZbAnEc
 2zAv0d7t+2m7YMdjnCgxnLYM75gaW9jgHPtFoDNkDmH18DCgVGK1KfFUH4+FqWUs7XQE
 WeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715592122; x=1716196922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZrQWtxU52idxp5eYbhcQHiiBGL/BJdP6x1q+TfBDHU=;
 b=FWNnszXqjVh4H/kwkW6HAnobvOMxk2NTK5RB2LfX5gnIbGzDN8KTMvijdLhsBsEuh8
 lV239v8lR22Swp0Zz/1Dg1XSIqdMoZUAOMBM5ctNPP2w5cqTQPpdzO54Oj4nwTAoILAM
 OEpPy1qe6AOZm/r4vH0UUOmVX8mO4U+hbTWGI6ZsYQDG5SJYmmnX6Z2qIjieRcv2WwKW
 Fiq6KnUK4PpfuyDwv/4Dcawd9tx8ks4XlWXrvMlJMOSwq+XZIpNRn4Y819JHmWMcte+7
 +gNIndd1yc52Ca09nEtWeBYTjzrVtBz+rJ4O0FbIcCMBeWC2K9owpJhYAcKUwoTR1X+W
 C5Xg==
X-Gm-Message-State: AOJu0YzA243ir32PS5qqEsvFmS4DOy/orSvyKMQEWV/4T1gamBjC+KOR
 jIqLbATjQWBfGxKCzuMI0/5JT41uICORAizIP4J/ht6HHWiVV8+ShunuJvwbYyw=
X-Google-Smtp-Source: AGHT+IGiteA84IGmFjZ9bQl5x4IbBwzqk4HlaAadFJhLHxUVeKqjgLxN+4TZLwlCeYtSkYOKYHrRwg==
X-Received: by 2002:a05:6512:149:b0:51d:4c8a:bbdb with SMTP id
 2adb3069b0e04-5220fc7d133mr7285327e87.3.1715592121768; 
 Mon, 13 May 2024 02:22:01 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba739sm1702167e87.101.2024.05.13.02.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 02:22:01 -0700 (PDT)
Message-ID: <1ffddbe0-12eb-4220-9920-28310ce55a46@linaro.org>
Date: Mon, 13 May 2024 11:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system: Remove ADC from raspi documentation
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
References: <20240512085716.222326-1-rayhan.faizel@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240512085716.222326-1-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 13 May 2024 09:22:07 -0000

On 12/5/24 10:57, Rayhan Faizel wrote:
> None of the RPi boards have ADC on-board. In real life, an external ADC chip
> is required to operate on analog signals.

Oops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   docs/system/arm/raspi.rst | 1 -
>   1 file changed, 1 deletion(-)




