Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgW3T-0001Kw-7Z
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 12:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgW3R-0001K2-Jy
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:15:49 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgW3M-0004FU-Cy
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 12:15:49 -0400
Received: by mail-pl1-x643.google.com with SMTP id x11so972784plv.9
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2020 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wMcvYkurwjHiH49izWq+rhG4nDgnT4Ab4MOL7kCO9fw=;
 b=BTwtB6r425RUixSVS+wj2ixhYu/5ZCqnj8esyqpSzCjPio2UPmWlUqCr0L3qc2GVnS
 ZyXAsRzBHjgHkLFFuu43ZinT0qmBymO1J9+zbaZAWkLmM4pGhMFrXwyp0dnkGNlfQ3nP
 XxHsPvCcMFf9Fic2Sb7ocX+2dRGjwm93zlJ1MJzmKvhJceiSV5nNT4V24N95lsuw6qh7
 m87jdxnjcL8qo1LoTiJOQsoxTkCCaBkZy6Ig4K0pQz+Wy2YIVk5DCY41lPa/uXdd4e/i
 vQELnKEx/7O+masEfFo7GmSALZ5SXr2yNekCDOmcV/o+4yxZ6ab1zM0hHTDbbyL7d0mx
 /66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wMcvYkurwjHiH49izWq+rhG4nDgnT4Ab4MOL7kCO9fw=;
 b=q4wDC7n6HVdlNWsGDGNHvo+tfg7fbIqfyEpTikwQPZvf4at1yKQ84XHmr6wTEzYR6l
 kWFItBVdeKFV+0nKwuO9zWwS01znC4f0TuKRbegUsshwrYoPucz0uzTcXyIhsuMVAQEA
 ceBDKn0m15w+8afdbQoF1r8Eh1MrI+PFtuu9EYBQxVb3gYGmjLwEYlZt/TzqZdKRprnX
 dYsodaU7UiZEkN+iSBo8BSLWuyOS/ggEVQOMsojuG2eYayjm2wgYkn4QS9LIPCIapUEr
 5ai4+3lImw2LjpcMxCgdpYtZvqbQvkCkv1RIzAtsyI/asKcAsVF3C5dVrm3o/DbTkCDJ
 nwDQ==
X-Gm-Message-State: AOAM531UKgfatLVEf2k1ffeRmIWzD9VkhIgbzfYcRYiqd5aQTGlpAirj
 XBl4/IdTuZ5MRkPH5UkgInrfrg==
X-Google-Smtp-Source: ABdhPJz4T295iZqiwAesz6IXs74a4O+6tG9bH43s1uPzDntK5UHzsfQ0mpihgZc4aj2YZ20h8JoQOQ==
X-Received: by 2002:a17:902:b414:: with SMTP id
 x20mr622571plr.32.1591200942666; 
 Wed, 03 Jun 2020 09:15:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id gm11sm2899198pjb.9.2020.06.03.09.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 09:15:41 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/unicore32: Remove unused headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20200603123754.19059-1-f4bug@amsat.org>
 <20200603123754.19059-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7a23b71-165a-5048-7038-f845402db154@linaro.org>
Date: Wed, 3 Jun 2020 09:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603123754.19059-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 16:15:49 -0000

On 6/3/20 5:37 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/unicore32/helper.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

