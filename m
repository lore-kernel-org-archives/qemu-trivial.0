Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihQGz-00014a-My
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 22:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQGw-00013D-36
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:45:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQGu-00036H-OB
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:45:13 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52496)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihQGu-00033R-Gi
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:45:12 -0500
Received: by mail-pj1-x1041.google.com with SMTP id w23so223420pjd.2
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2019 19:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4BY76WHYZYu3SM+DW6jPxH+7o+ToqfkQOtBe0hdVU54=;
 b=X4GIK6Ix6/YqvozJQM1qury/NT4LgeZZZrQoyQ7HdEj3FH2oCw45TZemnPqBBjA5o6
 8tkO1gAtzx8POal3ZgQo9UI+2MaiZW2ildCnCuvoQKrWrjE0e8hceE04qKI4wkn177Ij
 rfHX9SaAWzkc4EdOOeu0UAEme/EuPVKlZuD2G0aSQBgcsvKxhf8DSogA/nDykRtlCU4p
 f9LR5u6ygc0jAnqad4CdOgIc8APfM5UTUW591iLBHYJ5JiMSg+Sy1jiCroZDIB+c1Umh
 I8sUsMX91ZD88jInLWr0mJUrzeYr923m+BNRpvwS7okeg2I+lqC1J/GCyWYKK63hVCoe
 BhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4BY76WHYZYu3SM+DW6jPxH+7o+ToqfkQOtBe0hdVU54=;
 b=cb4czQkzu49NPyt/OYOZV8u1bsEMphQfwXkcRAd3I7+QQLYQ62SiYsyK5Pb7Br9POp
 DkVgxfHW1M5DapFo6T/nyQPLdE+IRlOeOj5xDZ9bMljrT4YkvRFidBOpT+d1EIFT8Q27
 4pSLVtf7KbrROAyddMzpCYEVBUuWtiFXLs9XALCzb0ilTdMjELzdDaqPrHrr0L5LLXW+
 k2L1GiM6r68BYICivSVmtRj6SKzaIlnuePQXsCt70JAXoN918lDdLMMyej8uojF1plYr
 SiEPSZgUUoDRQpAAo+XI58/G92TyW9ytxYG2q3O1d4Ilaq1iENtxb5zTby5D+dlI7u/j
 gAwA==
X-Gm-Message-State: APjAAAUlg4b6S0QbQsAikL6Cupq9RzRKiY1MYfwyxIrneb08ehvPe/ht
 RiAuW3ivyKenVyNC3VZXy0r5IA==
X-Google-Smtp-Source: APXvYqwXTH0BuwOkiBVFuU95mpMLmFML2h5VkQ+J5XWk0mi0oD+fAqbrj9d9N+6Fu50RTgcYn5JKFg==
X-Received: by 2002:a17:90a:e98a:: with SMTP id
 v10mr112682pjy.67.1576640711224; 
 Tue, 17 Dec 2019 19:45:11 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id h3sm648871pfr.15.2019.12.17.19.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 19:45:10 -0800 (PST)
Subject: Re: [PATCH 1/6] audio/audio: Add missing fall through comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf500e60-91be-c0a6-c7ee-56229128fd4c@linaro.org>
Date: Tue, 17 Dec 2019 17:45:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 03:45:16 -0000

On 12/17/19 7:34 AM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused by this comment when building with
> CFLAG -Wimplicit-fallthrough=2:
> 
>   audio/audio.c: In function ‘audio_pcm_init_info’:
>   audio/audio.c:306:14: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     306 |         sign = 1;
>         |         ~~~~~^~~
>   audio/audio.c:307:5: note: here
>     307 |     case AUDIO_FORMAT_U8:
>         |     ^~~~
>   cc1: all warnings being treated as errors
> 
> Add the missing fall through comment, similarly to e46349414.
...
> diff --git a/audio/audio.c b/audio/audio.c
> index 56fae55047..57daf3f620 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as)
>      switch (as->fmt) {
>      case AUDIO_FORMAT_S8:
>          sign = 1;
> +        /* fall through */
>      case AUDIO_FORMAT_U8:
>          mul = 1;
>          break;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


