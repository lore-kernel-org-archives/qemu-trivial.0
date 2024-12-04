Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tIl1c-0003qJ-M6
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2024 03:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIl1T-0003lV-LW
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2024 03:46:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIl1Q-0007Un-LC
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2024 03:46:14 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa5302a0901so771305366b.0
 for <qemu-trivial@nongnu.org>; Wed, 04 Dec 2024 00:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733301971; x=1733906771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WpKDDl1qaZvj6mo/KodYZv8nziE2WfA+UfGelVOv52s=;
 b=kVJ2ObyXBVs3fhD5pTvL6ZkCtOeuZcO0pF/+JpHXPZrRbdozVahNlStsnsMIzuiYe6
 WMfKsmhYwlHxAjqFN13QEGOd/T9F0osiGQmS5mJ4UngZ5IJSJnAA3hq84iqPN6ZbIeY+
 pLZVuurQvuw1EO/NsfPHQZio02JuV2qdZ6OHTCqNKpZkAG3UlHCxUQYnl0PLdbKN8JUU
 upj9ovW5Kk7D8cOiSgvQ7f+J/l0ry3n++8aGSkOWP4eyh77mcsG6R5auJ2yBH7JzXdvF
 j6a08B9/+Di9rhKKgyOwrf8FzN4Ybciw8qiHli4D2V0qrRyVtWbRBgbCwO3M/RO5tmbZ
 VKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733301971; x=1733906771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WpKDDl1qaZvj6mo/KodYZv8nziE2WfA+UfGelVOv52s=;
 b=I8Nkj3R9m0A4aVw301aPEn0bu56K57c1kDzU8WE95rKTPmrBQXAaTERRH7bJgrgYUe
 85efoZG0sSd6LQ1GSXRlpBp+yZO2KwLGrlOHdKn2O1DDORKt32DukJlx83j3YPIFfQr9
 VhqL3JiIQo6xQJeXefZpPlVz/J+u9Z6QJIMaUF5ZM7NuPF0f8ZAmPvEzYLDvbuA8Hu3n
 kHpeVjY3j+NByXjZWVeFP0kbgV/XPZq+LFDTlwDNNRydsn3ew2DU3F9TDyr8lY78VZ/m
 JGaa4NwAz559MndGPjQ1087C3y3RdH+DoDEL5rACCaJy6z5ct7rFklBml/bLQC8kXiob
 mlRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPbbwsBXMn/YP8FjNAY/4G0xVMQ4bT92B675nsLiH0ZbWjPYUcwk+47g66Ix/S57lNdiImsGLa40td4aQ=@nongnu.org
X-Gm-Message-State: AOJu0YybQ+/ZidNUv6roT1VuN7b44e7e1D2IttksPmsoKmOBsdb3EZNc
 5uQzTddowX9ewSl3ZG/FSl5oeQoF0UqP7xuTjF2PdDNqyANvcYzPGAi1lCNzmvY=
X-Gm-Gg: ASbGncuA6BCySZO2lXVz7Kko1UWbF6rVl0pTSobuaC+nAhq1xvIG53JWt+BwaHrloPd
 C7kgnoEyv8AqSLbDLDXZmvxqiOD4qXBJ55oWbD3iAK70o4iKV3UiWEqk5siN7arMxABhDOikO+a
 FUxS6mwOoOVTZubVPYV9HYWc73jeBS+KwhaB24dyaOm7z8FIp1okUQ/4acnkP4FQF/nNPTkKuoR
 HaaksJ2w3NVJMR3npPb0rllvaQMJCzOcoq+88gUCXVV5RSFDmeZiuHv2C6hnQWK9YTpqmdS235+
 nw+rfarKVdrcAJicQpM8iizIVkNfqvB7vf+A
X-Google-Smtp-Source: AGHT+IHnwoCPgWRjT/bGzID6islUjf0zyYgIQI50BjO5i8gBoNoNKVSTouHPWSTit+8/8EFcYYGqQA==
X-Received: by 2002:a17:906:3110:b0:aa5:49f0:1510 with SMTP id
 a640c23a62f3a-aa5f7d03e3bmr358539666b.8.1733301971013; 
 Wed, 04 Dec 2024 00:46:11 -0800 (PST)
Received: from [192.168.69.223] (sml13-h01-176-184-15-95.dsl.sta.abo.bbox.fr.
 [176.184.15.95]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5999032c1sm703460966b.133.2024.12.04.00.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 00:46:10 -0800 (PST)
Message-ID: <234a2450-620b-4a78-8035-ab658cdae471@linaro.org>
Date: Wed, 4 Dec 2024 09:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Cover the tests/functional/test_sh4eb_r2d.py
 file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org
References: <20241204071120.663446-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241204071120.663446-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Wed, 04 Dec 2024 08:46:19 -0000

On 4/12/24 08:11, Thomas Huth wrote:
> This file should belong to the R2D machine in the MAINTAINERS file.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


