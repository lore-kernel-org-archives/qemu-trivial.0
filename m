Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rQ1AF-0006kH-4J
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jan 2024 03:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1AE-0006jx-2a
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 03:20:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1AC-0005wA-Gw
 for qemu-trivial@nongnu.org; Wed, 17 Jan 2024 03:20:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e86a76c11so11497035e9.2
 for <qemu-trivial@nongnu.org>; Wed, 17 Jan 2024 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705479643; x=1706084443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7LrgQPHbpCYKbZaSLtjO3LRr9bvKD/BTYKzEJd/knyI=;
 b=SGwI4lHXkyF3W1oz1PQ0GvIJ3RLma25LdKFLj79RNR2y05g79Xqs+xo5P6JWcApCyu
 OXB0NnK2DBFtZWaNhbWjtYwKCIYVSXbX0ggkl1ZC5HuEw5PKMw1N61i179L1OM8dhphT
 iRkmNN7xaSBAJhR0Z3tBuFKgv3AllDNr8s2hTPmmBC5yC/F2yO7BPHsk3lIVoLUZT2On
 kWpPuFQexTUugVLMVfl3daJLaxh8I26fP8BSFPV5XXard/5EzJU/zWp2dqN91jqxOzrF
 Ilih229zH2g7+h4LsGX145KtAMF/UW/yat+WNgYD4LcyM/lcdHRgg/Tk3axyz2D6J/eB
 hHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705479643; x=1706084443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LrgQPHbpCYKbZaSLtjO3LRr9bvKD/BTYKzEJd/knyI=;
 b=pQYXh1/3CipyUVPRHKSIkC+iRV7bLwAutLkmXzBG39VUuC2GO1BprfozXgYTHmvt2/
 42SceMOi0PmFVCDkcZqUqhYCthgn/L5TQE/sjhfQ7Fwd+YfwD8Jmx0qVk9WWC4NDU6G8
 tSlFxKPqVOUKR3o7XISa0l3J6QmQXVMMH7aVRioiXU7fZJePzAe2it/SUn7rdJbTHeUg
 aMhaSiv5RC22iBW1ugSuMbMvqS9zDjupCTwbD1ScJD4S1Mv7q9ehVuw1syt0jotwIYZH
 3Kz0GApGL84D2UbIPo641IsuT0mCQfB/24HAiMFZXUZIZqPTcxcjKeqWXRLwF8vT4ReL
 B2VA==
X-Gm-Message-State: AOJu0YxoJYJLyE7tUOpu6z3oZkpnEy4y4ZlpsNkICOQ4jpMa7m6eKsOs
 8j3IHm/6d7uZvaDOnuj7/+cS6nR4UjmIpA==
X-Google-Smtp-Source: AGHT+IFsxJReS9qJRaCXsrjrI09WOc7aRCJQCul//PxGhmJaIvgVVutBr+hPnwPCnP7wLqPn/vZQzw==
X-Received: by 2002:a05:600c:1709:b0:40e:3b99:6379 with SMTP id
 c9-20020a05600c170900b0040e3b996379mr3372810wmn.259.1705479643014; 
 Wed, 17 Jan 2024 00:20:43 -0800 (PST)
Received: from [192.168.69.100] ([176.176.156.199])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d51cd000000b0033673ddd81csm1033645wrv.112.2024.01.17.00.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 00:20:42 -0800 (PST)
Message-ID: <ab450fd4-5a7b-4a19-bf60-4c9f079f5357@linaro.org>
Date: Wed, 17 Jan 2024 09:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] misc: Trivial code rename cleanup
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Farman
 <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20240111120221.35072-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240111120221.35072-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Wed, 17 Jan 2024 08:20:46 -0000

On 11/1/24 13:02, Philippe Mathieu-Daudé wrote:
> Rename some code names to ease navigating / grepping
> the code.

> Philippe Mathieu-Daudé (5):
>    accel: Rename accel_init_ops_interfaces() to include 'system'
>    hw/core/cpu: Rename cpu_class_init() to include 'common'
>    hw/s390x: Rename cpu_class_init() to include 'sclp'
>    target/i386: Rename tcg_cpu_FOO() to include 'x86'
>    target/riscv: Rename tcg_cpu_FOO() to include 'riscv'

Thanks, series queued.


