Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tmUX3-00062I-Jc
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2025 04:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tmUX1-00061x-0x
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2025 04:13:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tmUWy-0002kM-Ak
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2025 04:13:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43aac0390e8so1912725e9.2
 for <qemu-trivial@nongnu.org>; Mon, 24 Feb 2025 01:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740388418; x=1740993218; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/pxXgM/jJQ1y7JldAYYgpxkyydMmBle6xYMKLcPlQ44=;
 b=EgpqSL/2QjvEIQDpg9coElLun5CAr5tKTMBl+r1BL9nYvSLZr0LacqsYNaLiLC/U+d
 DACo1vkOR5/PVxLRG4PDP6sIP1p7wRqz7rbs2qE1nVEgo9hjNLi7nvkoXDGOSo4gGxHO
 QbaUnRBZN9SVp7WnGGHLpWi8Y8SNwk32l52OyNR6bgLkVkrg7r6qxlPZvq/pMiyXMWuG
 EKecjr3qiNYv6PNuuvaQha49hxUwiVbZ6YfnaXVEc5UGymeedMh5D98t5jjyMD3iBL4k
 bF2aO/s7Fx65/zrN3zkqHoEludhQfT+rv1jhox77QmapM/ZoFXpdxBUmxVN2KaVGMaSq
 tbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740388418; x=1740993218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/pxXgM/jJQ1y7JldAYYgpxkyydMmBle6xYMKLcPlQ44=;
 b=MxmMBt1q8qObaq4W8H/zzIn9WgA0NhNSOqS6V9ZRr/lb7djD4ZKQ4TCRNV9ir3MMAu
 jt/lDNxl5eVw7W1ZglIqLMX0XA8VmXE6g3n9nUpiA9djjoSS3uA88hWzlPXShGBG72jb
 vkGe5UCwB2opX0xrY/D3qSNr/dCKumv+hYrvQPD/qYesfHYA3SPbvSFtx7X4WmoGuskd
 0vj4Tn7aLcRmk/v9Lz6c+DUGLs5Chsea/KBpU6nmVLYHOzAAv/T/3I4j1DYcvoiJulVy
 Hw6HcSoWq2qZr65BUX/54H1uX/wKj+GHXsvotjIAH7PmtknA/aJiSoWIW48/ZB3rKY4R
 sNPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5aA/qmMlLxOGJ8NzSvnG5VSTcCQK1TUYdl7JEzyYtFaGPXRT/9SbViO1oci6JQDg6OCVCyPXSHG9meeM=@nongnu.org
X-Gm-Message-State: AOJu0Yz0sSeuVOzkvE47zkLyHLryjVdGCP+3o7V+z97gNX76ghgT4qo8
 UTSdNRl0CwTvPWO4uD8JAYxqvaCBC85BEYdQ6p1jkn2TQy8fe2zPBD+JT4U8FgM=
X-Gm-Gg: ASbGncuEC/5g+0tPGE8JHwMj4JfdQeOaieUPRcdHZl/8ZT0cb8MhVz7L3cq4AyCROfD
 BWRg3FQY725FbqNniSoESdjiqdDh7WnJJ1Q298sKubsw2emQIKfdRY0W+ugrsKz6d96M+NE9FF+
 7dDxPzOwuk9Kb3T0zOQaX/wtjJrJLUQGaCWlHAWWGBKaNKwOiBU9CztOMyErVdUXhCXsunM0ezL
 l0zCs735vXDUML/5pYgzpYRmPwcgvA4Q19AAe9MZ3mNr5UoRVi485WwHcIgjwpZV8qeVnR7T2fs
 wO91pm7YyzxRKX3joluTVi8IXhxy+iiWNl2DHyZcm1/v0z6yrlZc3GvrwcPpjJIhUWb8OA==
X-Google-Smtp-Source: AGHT+IH2udHSwUNErSUylpjdwGrSfckpA+qNe/rHNu2Ysc9Z70q716OZFGPGThfbBCi52l6KiJJE8Q==
X-Received: by 2002:a05:600c:1c13:b0:439:98b0:f911 with SMTP id
 5b1f17b1804b1-439ae1e9aa8mr112740885e9.10.1740388417661; 
 Mon, 24 Feb 2025 01:13:37 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02e486csm99133075e9.18.2025.02.24.01.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 01:13:37 -0800 (PST)
Message-ID: <bf35aad7-17f1-4ab7-a9d8-118eb531f8fa@linaro.org>
Date: Mon, 24 Feb 2025 10:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/macio: Improve trace logs
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jd Lyons <lyons_dj@yahoo.com>
References: <20250222122850.9D8B84E603D@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250222122850.9D8B84E603D@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Mon, 24 Feb 2025 09:13:43 -0000

On 22/2/25 13:28, BALATON Zoltan wrote:
> Add macio_gpio_read trace event and use that in macio_gpio_read()
> instead of macio_gpio_write. Also change log message to match
> macio_timer_{read,write}.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/gpio.c       | 2 +-
>   hw/misc/macio/trace-events | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


