Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1racOu-0006kw-6l
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2024 09:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1racOs-0006kh-UG
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:07:42 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1racOo-0005Vp-6B
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:07:42 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a3d159220c7so115833566b.2
 for <qemu-trivial@nongnu.org>; Thu, 15 Feb 2024 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708006056; x=1708610856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fak3h2S2fdUxm+Gvh0uWUCezlhQiRY1Wnz4XuBbDs0c=;
 b=w3l2d5IUQDA+SQ8alVxHS5FbZ3W9RJPlexTOyVucxk5SU1v0HtFH35en36/URa9Hlv
 1cJ6LqEQy4KXaSW04V2IIbLU1cTW0anfp7hcziv0pCuK2mrFJdbtyZIBXgwwuM58huog
 KJDewhkoeWHaSwpbQydYyxqPM94vSXWiwocS0i+SWotn5wq2OKNTqD79PAPE1FJXa8o7
 15SDkihjbqlXewsIyUZrA67Sw56DzGyRXyYwPJCXF06iIBZAKYYzvpVV0JIkmyg4Bdyc
 3VoLTm71alvEfmeic4+M65/zpyfWnJBgAQTLq4jqAoA1e+YcqHM9e4+7ptifcTgcv/MC
 eQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708006056; x=1708610856;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fak3h2S2fdUxm+Gvh0uWUCezlhQiRY1Wnz4XuBbDs0c=;
 b=GdstObuZ02xL1UbsIH/sAtHHvMRQcn+sHMz5xx+6rev1H9adV2KYQXfqfx1MeyHpcj
 1X8vzXX11q2/aY/qYG7BRqQzawq4vd1IzUaQ8zOyz3GaRmLjOQgFrBGJbgzKx7A99UiZ
 ruiiSWxwk4k5xk8fptjuzplPI+mkn3Wq4HLvb7yZXm7T/lJ0lArOTNLna/cL728YF6Ez
 Ip60dBirH4au3MzV4WmfTL+jG12q3wLEDlkphnakMa0fezKNht5dYiDdVW48pMl2d7E4
 cmHgjA5INShuiFs+hWicOEDdC+KfkSUJ7IceEBkAu36EZENrhb7ErNOUICeBb1IhqMnX
 sA8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGXdGdGe+ArySMyk0xrQDqbqsRRmII4y2Eq3eWgT7XZaI7oAnHJLLrCQsEkB9EieNIL+44KpZ3C2i+n06P3RSMkjjW9MGjtA==
X-Gm-Message-State: AOJu0Yx6BGTlp5A0cop8qM496YYgpc9EeF+VIAe4mYs4a7TGTfsRAj4Q
 6B1tteVQDZo3wRetTjwzpELdBkrX9HUMuXlCnCUJz8oXzJWTdYuern5apK6Zv3Y=
X-Google-Smtp-Source: AGHT+IEqyNSdbeMdZ59C1SQGm/YtDzJekc1TBGU57mHpNPlLnuUo5Ud+3YEZ6OGfpCVwa117vLzprQ==
X-Received: by 2002:a17:906:46da:b0:a3c:f6dc:ea46 with SMTP id
 k26-20020a17090646da00b00a3cf6dcea46mr1350831ejs.49.1708006056022; 
 Thu, 15 Feb 2024 06:07:36 -0800 (PST)
Received: from [192.168.69.100] ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a170906241a00b00a3d7975639csm573481eja.206.2024.02.15.06.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 06:07:35 -0800 (PST)
Message-ID: <3da80312-81e7-49b7-a6c5-479309d79ddc@linaro.org>
Date: Thu, 15 Feb 2024 15:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/sgx: Use QDev API
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20240213071613.72566-1-philmd@linaro.org>
 <05ef6ee2-ef3a-4137-994f-4a548b587d0b@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <05ef6ee2-ef3a-4137-994f-4a548b587d0b@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Thu, 15 Feb 2024 14:07:43 -0000

On 15/2/24 10:31, Michael Tokarev wrote:
> 13.02.2024 10:16, Philippe Mathieu-Daudé :
>> Prefer the QDev API over the low level QOM one.
>> No logical change intended.
> ...
>>           /* set the numa node property for sgx epc object */
>> -        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, 
>> list->value->node,
>> -                             &error_fatal);
>> -        object_property_set_bool(obj, "realized", true, &error_fatal);
>> -        object_unref(obj);
>> +        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
>> +                                 list->value->node, &error_fatal);
>> +        qdev_realize_and_unref(dev, &error_fatal);
> 
> This does not work.  Here's the function prototype:
> 
>   bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error 
> **errp);

I was surprised because all my local tests passed, but then I
realized 'config SGX depends on KVM' and I'm on Darwin... Sorry.

> 
> I'd say a v2 is in order.
> 
> /mjt
> 


