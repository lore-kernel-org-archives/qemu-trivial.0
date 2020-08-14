Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6d41-0007NB-DB
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 13:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d3z-0007IT-I6
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:00:19 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d3u-0004rZ-7T
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 13:00:19 -0400
Received: by mail-pj1-x1044.google.com with SMTP id f9so4658356pju.4
 for <qemu-trivial@nongnu.org>; Fri, 14 Aug 2020 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SEZRGmz5DA37H8I/I1TOST9jVFE0tezXKIjWAhPxFP4=;
 b=EBtClZrjG7uPc675BcIaduezGxAMWJ/5+7F6nqimeZchgrwRN5bV4fhVpNtTq92fuU
 OKdF8cEUzZdKkYUMm8nXs1XB9rRvK67HNpUuiZp69LLOAo8IXUjq2/5mSpVMXMNWYTMS
 zALJbyGB/+p6SCqwtBWIWNl4J0LL7Z7mU7uMMI2SebGuQ2d6yVBM5d66S/DKv+rSKZmk
 4Rh7a/g9uvOqXTnhH+OgGmn4LVB5famLvDEzdLMh/XseH4sYkKwOirHO3HwwgB9pYOTE
 KUc1Av9g68CFvyjFeA3dZ8CsyMV5OQr2s8MAdeGxqdDhSBBfN6P0izEMlRaUMs0or/0g
 VQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SEZRGmz5DA37H8I/I1TOST9jVFE0tezXKIjWAhPxFP4=;
 b=XEdSrkpU8wnRUO01zT/Cr7gI3iJNJj3jo21xQ2MKhQWBCqPTuQ6S35TVD/yAiDjZtg
 fTKT0Z6Z0eCWuj+4NwcDBrYrZsB2LAp0HBrv/v9x7CyiFWjO9mMPBNb5qb4dg2h9Y12Q
 afKcF/Y0Kx4iRNGAck8vLGN0bc2fztyLEFn7IMAZAhEhctpbNtFfF/R5231FT8wVS+rI
 Md5+fxzcEKw8AqTDSSKNCb9F43SDluE6Q5FmNRB9BjjT9hmBBQs+ViiDmUxNyWTAFbY6
 M5oSaVE2AUj9DMGQG7bvWDpga0+fGJ4qfBnwlP4MygmTMB75EgQzkuz44RoS7UxmMbUA
 9Jrw==
X-Gm-Message-State: AOAM532Q4sTRM6MlilcXt9c+kjlaBxPuLaZaA1YawxqKsrKJLrJrorlO
 LV1r7hAofdOemeMq/CkRkbuw/A==
X-Google-Smtp-Source: ABdhPJzJVLTWERQ/VK6UZ5hRxLWe/pTv3DRGdqypJIvtsCBna2Ftehmo6BkMg6mor7tpAOUDDgH8XQ==
X-Received: by 2002:a17:902:bc82:: with SMTP id
 bb2mr2693281plb.103.1597424412889; 
 Fri, 14 Aug 2020 10:00:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g8sm9987043pfo.132.2020.08.14.10.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:00:12 -0700 (PDT)
Subject: Re: [PATCH 5/7] hw/ide/atapi: Replace magic '512' value by
 BDRV_SECTOR_SIZE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22f4a10e-c90b-7d80-bac5-4b181283d610@linaro.org>
Date: Fri, 14 Aug 2020 10:00:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 14 Aug 2020 17:00:20 -0000

On 8/14/20 1:28 AM, Philippe Mathieu-Daudé wrote:
> Use self-explicit definitions instead of magic '512' value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/atapi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
> index 17a9d635d8..14a2b0bb2f 100644
> --- a/hw/ide/atapi.c
> +++ b/hw/ide/atapi.c
> @@ -824,9 +824,9 @@ static void cmd_get_configuration(IDEState *s, uint8_t *buf)
>       *
>       *      Only a problem if the feature/profiles grow.
>       */
> -    if (max_len > 512) {
> +    if (max_len > BDRV_SECTOR_SIZE) {
>          /* XXX: assume 1 sector */
> -        max_len = 512;
> +        max_len = BDRV_SECTOR_SIZE;
>      }
>  
>      memset(buf, 0, max_len);
> @@ -1186,8 +1186,8 @@ static void cmd_read_dvd_structure(IDEState *s, uint8_t* buf)
>          }
>      }
>  
> -    memset(buf, 0, max_len > IDE_DMA_BUF_SECTORS * 512 + 4 ?
> -           IDE_DMA_BUF_SECTORS * 512 + 4 : max_len);
> +    memset(buf, 0, max_len > IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 ?
> +           IDE_DMA_BUF_SECTORS * BDRV_SECTOR_SIZE + 4 : max_len);

If you're queuing other cleanups, both of these places could usefully use MIN().


r~

