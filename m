Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qwIT3-00072Y-S1
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2023 04:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwISv-0006qy-1f
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 04:45:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwISr-00023G-CB
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 04:45:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso14009265e9.3
 for <qemu-trivial@nongnu.org>; Fri, 27 Oct 2023 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698396306; x=1699001106; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ItqT5r2iOVvGgoN0QA6Y9XgFg1+cfQVUsfc30W8vlNE=;
 b=dVBQ8x7LyhZj0JOJcijPEZ604+A5qyR6HqDIyqJKkBz8zcDVEGbmtbhAPGWrrLrqZ7
 F12SzDIdnhTNkiQHKUDgz6ZCuPYEr9nllES1PxeVgaKCjoPBFniPdLeGvz1kgzDTdadu
 stNQ8pN4OMPUs/0V2zP5SoVq2ZTjTD8/WJZF0muMs7TqDoqsMQ0kJALUeMJebv+ifenS
 QL87noq1H2iaxSM14pLpsfxL0lciMipm6IigpnmNxTC0mhFsMt9nS/WmpLvHoPZRqOH9
 m110D/QC2BUHvQg7IdpcDbtrtNS/0DP6N4uMDXTG9sn2DAsW9hbSZlm3Ar4YeDC5ZT2E
 Tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698396306; x=1699001106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ItqT5r2iOVvGgoN0QA6Y9XgFg1+cfQVUsfc30W8vlNE=;
 b=W1jjlA0H6BV++8gX1MGhjeBsYXNOom6b3Oaj7nUpym3wpx+2VDio+/D3KGTK2Oq4qo
 w8znjS2Z3Rm8Nrt/zqeKwMwMYhWUUgEe0bQ4gnsoIgwADsBzelvVBTEVatxXIfHEDOQt
 uEfOVuP/14g9Fs1a2RVq67Y6CDV0Bowv+c6HUXs0TyTrytbFfnTnVgCotBpr+ltnP6hY
 BfePkVpoteD8cb/68smeR5/49mjeQKCO49xiyzGgJeiCUN9LJFD7WvytmWblH0A+6gj7
 yOo2TA6v5GzyrJVxNIdj7Z20KD7N/8+tqUTO/QLwwbxPtTruNBxnN+Klvx1hWjc7GMSP
 tUVA==
X-Gm-Message-State: AOJu0YwcmuiazOopV6xx0Rr0eGD4VmqZ6OJ2qz+h3FZ4XSHcuDu6V7rQ
 VTclI1OIxD2b2bA8NH4skzkbws6H8wcdIJF3UNE=
X-Google-Smtp-Source: AGHT+IF147qQVo7AiFUQMKuEsGBjK7y6qvU+ZEoyyM7GkINSFjdwSvpLKO2CaAjSnycoK+KJscg9lw==
X-Received: by 2002:a05:600c:259:b0:407:5a7d:45a8 with SMTP id
 25-20020a05600c025900b004075a7d45a8mr1930581wmj.31.1698396305873; 
 Fri, 27 Oct 2023 01:45:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a05600c331a00b00406447b798bsm4498768wmp.37.2023.10.27.01.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:45:05 -0700 (PDT)
Message-ID: <a452a7d5-1d75-622f-bb32-df3ce1b10f5b@linaro.org>
Date: Fri, 27 Oct 2023 10:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Make sure that gicv3_internal.h is covered, 
 too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20231027060709.242388-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231027060709.242388-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Fri, 27 Oct 2023 08:45:18 -0000

On 27/10/23 08:07, Thomas Huth wrote:
> gic_internal.h is already covered by the "ARM cores" section.
> Let's adapt the entry with a wildcard to cover gicv3_internal.h, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


