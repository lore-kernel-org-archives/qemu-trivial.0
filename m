Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rKzU3-0003pC-52
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jan 2024 06:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKzU0-0003oi-T0
 for qemu-trivial@nongnu.org; Wed, 03 Jan 2024 06:32:24 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKzTv-0001lm-9y
 for qemu-trivial@nongnu.org; Wed, 03 Jan 2024 06:32:24 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cc7b9281d1so131865081fa.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Jan 2024 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704281537; x=1704886337; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Uw11SI08AfTXeQE7SXpzipR7L2b7UEXTXmofT03JLU=;
 b=df/yCP9lj6Q3UTCHjzr3zkwO2EgEt26PnErO6PRpRXN8uhkyxLL+N8q8nbLdZlh+Y4
 p7j/uJrSIEx54zseaA4hCVUX4GbNj0ZQYUEBxP2zzBtC4DiD4GVIowqIQDiXMgsDhFC5
 kkWRzg68VukjAEQu7Qqj/Nu+YH1NTD6RS3XWeIOtRAzw6mIuFqRDbr1rGr9pY7XFpTQN
 Lak9dzA/pVk+VXv1RWQYK3HJYPGA6skGt5aLIARp+wO8uBVQ41rCQzZTGDmusUA54S1b
 dgsQhtP/Y8oLRSprTW2nLVwtZz3+qKvwQb10xN9fgpk9eGfRU+mrUX2q23iF24BwkIXd
 pcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704281537; x=1704886337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Uw11SI08AfTXeQE7SXpzipR7L2b7UEXTXmofT03JLU=;
 b=EpA9hh7KfyJh9lx1MDYOl7LC6jNgviYtwMnqX38vDvQBTI5vtHDj/mj4hbECz0bLc9
 PcFqWgsNXLMvTjxm6CUbu4hJs0Bm9kB25/FZDAyIJXabo9+eEZVVj1FOkgjXvlknsaqd
 5yh71n613dgTJwRQJF9uLUopUUTbU6JQGOpgRVdXB9Jfq2bT9cXq9Re/v8VYnlQhVaxv
 xXN/AHJN4w2Am1ZmXpwgst7elCr3Qewc/AaMoZnOx7A2C5D1LQK4tm4oA9z7XDbt2Vtu
 1oh78yo+vcj48GS7GVfJRSk3k4v73BzLNYBO3g9kYYyN+/SUcFqc1zdH2AfojPRWUt/R
 +g6w==
X-Gm-Message-State: AOJu0Yyubo2w0l5KyBLdjLQ3g2Rj4wIP9FpktDli0/y8BmRDFO0oy7TX
 ohRuQ/HzLkD1QH/P5vxIJnMEnFu1k/ILSA==
X-Google-Smtp-Source: AGHT+IFbclPYLG3EQIABvqS+Urv9s0DG419U8bS17o+85hN0la+BNJibuON7BMmYuZeZ/m6YLj3I2Q==
X-Received: by 2002:a2e:a68a:0:b0:2cc:5864:f3e8 with SMTP id
 q10-20020a2ea68a000000b002cc5864f3e8mr7565247lje.98.1704281536823; 
 Wed, 03 Jan 2024 03:32:16 -0800 (PST)
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr.
 [176.184.7.144]) by smtp.gmail.com with ESMTPSA id
 c9-20020a056000104900b003368849129dsm29757242wrx.15.2024.01.03.03.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 03:32:16 -0800 (PST)
Message-ID: <3eeb7394-d138-4a27-b2d3-0b6aeb9c5205@linaro.org>
Date: Wed, 3 Jan 2024 12:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial] audio/audio.c: remove trailing newline in
 error_setg
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Martin Kletzander <mkletzan@redhat.com>
References: <20240103111800.250151-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103111800.250151-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Jan 2024 11:32:25 -0000

On 3/1/24 12:18, Michael Tokarev wrote:
> error_setg() appends newline to the formatted message.
> Fixes: cb94ff5f80c5
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   audio/audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 8d1e4ad922..7ac74f9e16 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1744,7 +1744,7 @@ static AudioState *audio_init(Audiodev *dev, Error **errp)
>           if (driver) {
>               done = !audio_driver_init(s, driver, dev, errp);
>           } else {
> -            error_setg(errp, "Unknown audio driver `%s'\n", drvname);
> +            error_setg(errp, "Unknown audio driver `%s'", drvname);
>           }
>           if (!done) {
>               goto out;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


