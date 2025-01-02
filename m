Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tTNUg-0007KK-Th
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2025 10:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTNUe-0007Ju-81
 for qemu-trivial@nongnu.org; Thu, 02 Jan 2025 10:52:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tTNUc-0004mf-4F
 for qemu-trivial@nongnu.org; Thu, 02 Jan 2025 10:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735833133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=arTDeOUBowmmiQHJXDXrgbLZIFlARASgXGT2zN/xSkk=;
 b=XJkwNuVwj5zYu16qVkN5Px5wWKz6gY57Y57QiVK9DoenPhwiGJuP/HLngAt/KOYK2FybVx
 gioa7LxC4q6DOLreYttq8ZUXAr3CrSGUm2ARNCs3wONxSvr72OPoQHEUhUWWXo1044tJHw
 30olD9KJKcxZIa2Bd0dF0XAEHU8QyqY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-7Tuviu3hPXmnZOZW4lk_sQ-1; Thu, 02 Jan 2025 10:52:10 -0500
X-MC-Unique: 7Tuviu3hPXmnZOZW4lk_sQ-1
X-Mimecast-MFC-AGG-ID: 7Tuviu3hPXmnZOZW4lk_sQ
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862f3ccf4fso4784733f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 02 Jan 2025 07:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735833129; x=1736437929;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=arTDeOUBowmmiQHJXDXrgbLZIFlARASgXGT2zN/xSkk=;
 b=SZW0OEftwfDLiGiDE0os0PbkWUV0xZTY+Z2pmvHPvLpT8lh3V0fhxYRDNJx3mrj+gI
 pYx7IGXwPq3HaAtQrUrL9JpbZFGgL/jPcdd1bSZ6pBSYWGfVi8+3d53ESCuqGt/izCZA
 h534RZZZOBlX4nXXpwmxeO40K60IAoE5Y8q87o2ZO3OecSgYMYWr2L2ecwLksE+1YURD
 CuutAWvCMrVJ5Gd5W9Oz03JrTFwQaKKfoPG5uxH6YDTPE/7cYcC+pHYkqc5DzaRqb0Rv
 6VXOsGiMAAd0sGW40iYyAmMpo7E1ytNeF+nOt6SCHSeQ43qGIb+hKJVUfuQgS5chkUtl
 b57Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVutWhz3PhNHOHqHZ8IuWz1ta57DWUNNZq6pDBJjMlQCshjN6AaynL1Nwws57k8ics8pG8UxFm5A931cns=@nongnu.org
X-Gm-Message-State: AOJu0YxQeal50VmxgZ3aVjmqv2nf2Q8/+mgQIrLU3R3fCrjlAb6wDi+a
 eKL34x0uxIM9ypNkt94HWG2ajWyzX/YzBOCWD1guUDQE0txc5zfss4zbVaDTUWTMszYuqN7Rk2P
 9612/epoktNv658NLOYDxNOEV40IPdNtfRoS6cEURKzsVX05ohJPvLG4=
X-Gm-Gg: ASbGnculqnm9vbhSE4q9n+dO1PONlYF/ZzcXYoOIS3hkwjqKdo6a9N8Ul1GBZa13OeN
 FQEHTS3lmk6eVlmypC4ai/WBoStZvOzd4u9XR6fSxeZL/S0tI1T7/xSxQn4ynrJgEqgQnjCYrCv
 frq1AHUrqIRbjklAEALthbOcQDl+0yJwgfzJnBF1KkKAqj0cTbFhhWexzQXtfD83IPhXfoPco87
 fHxj3FogLMzae8B7Gym2t3bETTEyDY7vmlaMOqJg3DpMzUipV7J/aJVbiUUjPw+xqcfJbx2lyPc
 NgtUbfX8nPjG
X-Received: by 2002:a05:6000:1f82:b0:381:f443:21d3 with SMTP id
 ffacd0b85a97d-38a223fee7fmr30856693f8f.57.1735833129409; 
 Thu, 02 Jan 2025 07:52:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZIbob/pJAv2P0DUQdhAg6THc/Gyerb7c1BpUjbcaGqErWRYmD5FFcx4B+FQLg3Tx2G99bQ==
X-Received: by 2002:a05:6000:1f82:b0:381:f443:21d3 with SMTP id
 ffacd0b85a97d-38a223fee7fmr30856683f8f.57.1735833129088; 
 Thu, 02 Jan 2025 07:52:09 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-148.web.vodafone.de.
 [109.42.51.148]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847214sm38335478f8f.46.2025.01.02.07.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 07:52:08 -0800 (PST)
Message-ID: <f3644b7f-ef19-4b9b-b8a3-b1e2622b8027@redhat.com>
Date: Thu, 2 Jan 2025 16:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dockerfiles: Remove 'MAINTAINER' entry in
 debian-tricore-cross.docker
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20250102152513.61065-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250102152513.61065-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tP_B4QKT0NWNzCxHP-tPjjMZgQpks7H64ZRvzwO8dl0_1735833129
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.185,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Jan 2025 15:52:17 -0000

On 02/01/2025 16.25, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> AMSAT closed its email service [*] so my personal email
> address is now defunct. Remove it to avoid bouncing emails.
> 
> [*] https://forum.amsat-dl.org/index.php?thread/4581-amsat-mail-alias-service-to-end-august-1-2024/
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-tricore-cross.docker | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> index 479b4d6ebab..7e00e870ceb 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -11,8 +11,6 @@
>   #
>   FROM docker.io/library/debian:11-slim
>   
> -MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>


