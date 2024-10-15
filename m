Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0isl-0005YO-Jk
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 10:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0isi-0005WE-7R
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 10:50:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0isY-0007FZ-P0
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 10:50:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e2e88cb0bbso3041803a91.3
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729003806; x=1729608606; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rk+/FbCiHQ32J4q76H311+hrQgeaQw67dxOv7z9Wcek=;
 b=XzNijK+oOYZFzXRI0QP8/+qBIoPGkIogOcsQz94x9pJls4WhrakmKxQ8DMoBDI9eb4
 utbG8IUm7KZPiDdB5vUPNoDpXa3yVIU6XQIULFI1dRsBJv3/MaRTafT0vTvlMQrvilYg
 vsfRlHZrKNNkQpmLOp+wUnBzr9eQ11hl1dwqHfsLnWlTOjFXGDabAeY1ClNAspCqzWqj
 sCDhDhsQhIEvkHU4FSX0n/ryUuFdTAhlAzrjNqnl7brOhIUYMlmzOIoBGXo4jlA8HM1x
 qSk1aMvsUJQQxPtDRTfJuhxgixw0zWqONPgEYiak2oAKzHQY6AMpLSuiSYumASYoGstj
 5j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729003806; x=1729608606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rk+/FbCiHQ32J4q76H311+hrQgeaQw67dxOv7z9Wcek=;
 b=TNwn1SZcJqqeMlHTp6At+lIvN+3TQkH1hjJcgWDzmY8z+08HcMV/CeV+eMK8Ydj8VR
 /3UN6o4mGYTw7jVuFpE2lXYoOzTf2t1BFSpUkkGBGJoNolg/CmqyZdkGKNUYoOY5O35V
 mNW2q4BwzZpCLe8i+h29837FODj5KjgGEdvBprH19SQdyrdLtmj3mSIQNQlYrq6VHGNg
 DPv4ts1dKS5rPuMueCaQd6yeTuwG1h4QmVnAH2yDwUCSW7wZW2OOSdU/3KD015PjlSxC
 N3N1dKpTNrWeqmBOtox4VdxQZYzJhXVps/Dec0PvFXo9OM6r6v9CuPCePlRa5kUnXlFR
 gJYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdn7fajFV0uquORIYb62ux8iA/b9p5paM55TrQWh4UsIujq/ezsH0oJlDnwlhDeG0L6SuYX50PK8jy3D4=@nongnu.org
X-Gm-Message-State: AOJu0Yw4O+K6Xt0Rud1k9dFlm959yjRSBgRaS90qvKLMQisROdk8NOLU
 98EV4W3ISjG1zvbQPwlL3kHp7ilLW9VV2EvhOg7LluWbkjZ0fH/aeJPQZMtOfwg=
X-Google-Smtp-Source: AGHT+IE3JOVsYp9RZ51cS+h+UjKMEpSJi9nmKqOedw3tz8PcdpuXaSa6oC4Y9A+CfUl8Lt1UBIcesg==
X-Received: by 2002:a17:90b:8d7:b0:2e2:eba1:a1a1 with SMTP id
 98e67ed59e1d1-2e3ab8e7b72mr510959a91.36.1729003806667; 
 Tue, 15 Oct 2024 07:50:06 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e392ecdd37sm1867836a91.13.2024.10.15.07.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 07:50:06 -0700 (PDT)
Message-ID: <345e96a9-7111-4727-9510-63c3d6deffbc@linaro.org>
Date: Tue, 15 Oct 2024 07:50:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-user: Clean up unused header
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial <qemu-trivial@nongnu.org>
References: <20241015140922.385470-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241015140922.385470-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Tue, 15 Oct 2024 14:50:40 -0000

On 10/15/24 07:09, Gustavo Romero wrote:
> Clean up unused (already commented-out) header from syscall.c.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   linux-user/syscall.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1354e75694..d1b0f7c5bb 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -54,7 +54,6 @@
>   #include <utime.h>
>   #include <sys/sysinfo.h>
>   #include <sys/signalfd.h>
> -//#include <sys/user.h>
>   #include <netinet/in.h>
>   #include <netinet/ip.h>
>   #include <netinet/tcp.h>


Cc: qemu-trivial
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

