Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rdssN-0008Fi-2X
	for mharc-qemu-trivial@gnu.org; Sat, 24 Feb 2024 09:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rdssK-0008FA-Rk
 for qemu-trivial@nongnu.org; Sat, 24 Feb 2024 09:19:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rdssJ-0006QJ-40
 for qemu-trivial@nongnu.org; Sat, 24 Feb 2024 09:19:36 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1dc0e5b223eso14713425ad.1
 for <qemu-trivial@nongnu.org>; Sat, 24 Feb 2024 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708784373; x=1709389173;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sL7AXmg2/WGVYQ0ZtRCkJnAzTFCjo6PV+RI/0vO+oPQ=;
 b=g1lmAj7qqpGsAKgdLtmbPEerx6QFoFOg/eLxPRwzEcEpgT5UyGSfk9YvsqkzgLMWKX
 BaRTfSQk980BO8wQ3c9w+i3NZKWdgZGu2SWmx2KSduET6+NG3G9bWMFAO9GG54mgaMda
 j9EUUQAW8uVFHbloRSpObefjYm9D8HNWrpsX8KGi8UirwCl+HYvGaErqwZOkTuWImteh
 cb+eINBkhMdcMWe+80gTweAxl6GxuO6kl8Igf+1+9TG5LQgv9LZpaYNJHFqDvjRqjvXO
 5rBkEUJubFapk+AHw2gVg4hgFEICa73xX/PgqUlNk45rvLZPOx8w3P7LlTTTHmpFxGS3
 ESaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708784373; x=1709389173;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sL7AXmg2/WGVYQ0ZtRCkJnAzTFCjo6PV+RI/0vO+oPQ=;
 b=QmO9ce8mPAaepx/A93RidCHxqGHrOtrMSe+DLcr/8ntXJ+X1DyhZEirh1TEj6RXdEi
 bOjOANelteWXX4zgKVFhD4/6FpqUe5HOuMXqleYGRL3PtRpvfCbuBipxGkKXEDYOY/Xk
 DODllXF4geWsfLQyoCSp3Ah2TDJQWjTMR9ngQARk7ADlgZPgdpWynD3RWyLlS/mduD3u
 04v+SOpl1F4bHYQ70UEtKA+ku9FR09wU0yL2DioTPvDC5LFqtWtIlm1QsNNxdzdwPzGI
 CxWsJKF6UwwswRYb/IK8/PcpAjbGbji5Bd2pujCdoIwSM7ynx55krWO9k7/FvuKlgbq4
 NpVg==
X-Gm-Message-State: AOJu0YzYMa7P/4MbUN/wnFYTbcyBUY8+ZD8Xnl68wIz4BgNJQ4isFzRd
 b+uVtbYX2dMk5FlszOhFpIHlUXIU38Ze3COu3AE1DX8zZy4THUsRyAyY7Wyy4gw=
X-Google-Smtp-Source: AGHT+IGICiVaPlJTeYuTBlvwzO8G+l1hK+AfqS2ImDhvz0b5s04GC7R5shHgQ8HxuT2ql1ybTiWvPA==
X-Received: by 2002:a17:902:e84e:b0:1db:f965:471e with SMTP id
 t14-20020a170902e84e00b001dbf965471emr2996092plg.58.1708784373587; 
 Sat, 24 Feb 2024 06:19:33 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 kx4-20020a170902f94400b001dc214f7353sm1076942plb.249.2024.02.24.06.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Feb 2024 06:19:32 -0800 (PST)
Message-ID: <0dfce9a1-568c-4a1c-8d96-0523674c6873@daynix.com>
Date: Sat, 24 Feb 2024 23:19:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ui/cocoa: Fix window clipping on macOS 14
Content-Language: en-US
To: David Parsons <dave@daveparsons.net>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, philmd@linaro.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com
References: <20240224140620.39200-1-dave@daveparsons.net>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240224140620.39200-1-dave@daveparsons.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Sat, 24 Feb 2024 14:19:37 -0000

On 2024/02/24 23:06, David Parsons wrote:
> macOS Sonoma changes the NSView.clipsToBounds to false by default
> where it was true in earlier version of macOS. This causes the window
> contents to be occluded by the frame at the top of the window. This
> fixes the issue by conditionally compiling the clipping on Sonoma to
> true. NSView only exposes the clipToBounds in macOS 14 and so has
> to be fixed via conditional compilation.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1994
> Signed-off-by: David Parsons <dave@daveparsons.net>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> ---
>   ui/cocoa.m | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index eb99064bee..bbf9704b8c 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -54,6 +54,10 @@
>   #define MAC_OS_X_VERSION_10_13 101300
>   #endif
>   
> +#ifndef MAC_OS_VERSION_14_0
> +#define MAC_OS_VERSION_14_0 140000
> +#endif
> +
>   /* 10.14 deprecates NSOnState and NSOffState in favor of
>    * NSControlStateValueOn/Off, which were introduced in 10.13.
>    * Define for older versions
> @@ -365,6 +369,9 @@ - (id)initWithFrame:(NSRect)frameRect
>           screen.width = frameRect.size.width;
>           screen.height = frameRect.size.height;
>           kbd = qkbd_state_init(dcl.con);
> +#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_14_0
> +        [self setClipsToBounds:YES];
> +#endif
>   
>       }
>       return self;

