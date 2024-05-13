Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s6Tpi-0000Uu-6S
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2024 07:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Tph-0000US-2B
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 07:27:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Tpb-00008v-3Q
 for qemu-trivial@nongnu.org; Mon, 13 May 2024 07:27:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34da4d6f543so3086365f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 13 May 2024 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715599617; x=1716204417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/G7MfgzCcN0jtEglp0t6kBbppY8sZFYe8E6d/jwHYcg=;
 b=DfDgY65CkKaOX+Cpy8Eikx6rhzf/S9sY1ZJY9EuB+hmYAfGFX0wLckwm6y/aR6y6PW
 9O0sAZUfVyJkrYKrj7CDArEaBOT4UN9tik5wWS/3LLCpAEb+wJN2ucNIFQXrH9AaBUm+
 HakPhTMvv3RX2qVB+RCSFVbt5qlQUqWXLZ/EfV9hUjyBgAowH5P11hZ70N8XnFB/RPEC
 5/L34AZ5N+Knl3OC7vSTbz+4QUfyOhVP/zBAm2lFUjFXwlwZVtQu6UzHl92ULiHGhCUX
 eqU2PNe85tOusHPRTKq+8tnzLoTfuAEwhi+2aXLc6V6Y3BQbluO1cN5md/0jPJAD816w
 /Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715599617; x=1716204417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/G7MfgzCcN0jtEglp0t6kBbppY8sZFYe8E6d/jwHYcg=;
 b=mo0P5BUTAiBrsN+NwqMbRDbGfB9dF9RlH6FolCftDqLMHYiY8nEyWSF2OUf/2zo+h5
 h+PWH+IpRAE3Y8yNXUK/Gb0U6G+Reh6LMt5vjInjfREuQTtCH2KnAvNfonhdjSVAzonf
 igsNhsgpshbI1G9zbBSqUFktgwRarl0hdB4xqDixt46Utyw5F/3/etvRZpIFJp9qgVNX
 iFm9QbHgArnXWa0g8EeYNXHth1TglSw+Fg7DOm/ewBZ9B9Vzit/H1wLk3aR68lUPPLmJ
 4B+46ZmLs2KoBDjNHA08CYFtqj+ymnhIMQpFWkX2gnxkIsDPPvLrp8I3CXmm76EnZf4l
 oyuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGaNClQb4LcIBiQVB/j3luzPIVVV7u2EQJ8EnjXxsUL2qYHPCL8D/Q+2YRMd47ufHRErKwxFoW+IkRm42o88IiwxRjL6m8g==
X-Gm-Message-State: AOJu0YyEphHZ1GZsfcATZyyvr1sgN39VEhHC04kr+uS6hMZGTwJyGkih
 Dqz/C9j2/Tra0bvQQ3EuJS6kiV8U3XlzZ6FTgqIadXya1gFyy7vzLpa/4nN6wM4=
X-Google-Smtp-Source: AGHT+IHHKRugbe7S2sosZWTGK6SMaDiKH339rK6MCwqegI28M3lHkG/hP7jmXPxx25wWZ8lnz7TgUw==
X-Received: by 2002:adf:fa4d:0:b0:34f:fd71:9af with SMTP id
 ffacd0b85a97d-3504a73edbfmr6780716f8f.39.1715599617085; 
 Mon, 13 May 2024 04:26:57 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b79e8e6bsm3274119f8f.65.2024.05.13.04.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 04:26:56 -0700 (PDT)
Message-ID: <93836d9f-56b7-464e-84a2-a101ca78e360@linaro.org>
Date: Mon, 13 May 2024 13:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/rtc/ds1338: Trace send and receive operations
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org
References: <20240513101108.5237-1-shentey@gmail.com>
 <20240513101108.5237-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240513101108.5237-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Mon, 13 May 2024 11:27:05 -0000

On 13/5/24 12:11, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/rtc/ds1338.c     | 6 ++++++
>   hw/rtc/trace-events | 4 ++++
>   2 files changed, 10 insertions(+)


> @@ -134,6 +138,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
>   {
>       DS1338State *s = DS1338(i2c);
>   
> +    trace_ds1338_send(s->ptr, data);


> --- a/hw/rtc/trace-events
> +++ b/hw/rtc/trace-events
> @@ -22,6 +22,10 @@ pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
>   aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
>   aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
>   
> +# ds1338.c
> +ds1338_recv(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] -> 0x%02" PRIx8
> +ds1338_send(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] <- 0x%02" PRIx8

DS1338State::ptr is signed, although being an offset, odd. Using
unsigned in traces seems better anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


