Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeW2B-00015m-9a
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 03:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeW29-00014i-9s
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 03:36:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeW25-00012w-9n
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 03:36:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52bcb8b199aso2383660a12.3
 for <qemu-trivial@nongnu.org>; Fri, 08 Sep 2023 00:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694158559; x=1694763359; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R1B5WzyLjhzRLrp2qu5a0XUbuPsS3q5x4g0m+DQga1I=;
 b=dLTM4bUDq8zm/7abm6frg6XF8D7tNNUEezzfHgM3qiBC96lO6dS0R/fi2VYT6H+0J8
 2tYJy2DeSdoiKI3lGojczKXvf/8ekmdt/3SQW0mK7cKxb7kv1MnEpKcbLpJDCmAyh9GU
 qIe1pbtMhGl5/kaXU6PX/zfDEeVHt8SprQZ8ZfiEm6gSRuKbKUqJuTPziID3wluscZHD
 jDEWznZRQJ1Igknou7l+uUghMzcyDTiqjH8FbuX6F+ZF6xLb/zH5/iAQbzbOONqeeITM
 c9dPC/r0VIRkZ7t7A6mqhb/p8kCzPOR3v7DXX1qx+VY59C4KRHuQQHFYe9YGTS3rgNCE
 aIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694158559; x=1694763359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R1B5WzyLjhzRLrp2qu5a0XUbuPsS3q5x4g0m+DQga1I=;
 b=dB37wPnydoWYPDE1RZSFJE7w43lZZQnJZT080i34++tw/NCPOQRviFEh59IC7UQPNu
 7VWyz1WQoP0U46UcvJFTxdKG+8zwX+eLxnf0Lq4yyzihUnouyM5kgeC3PCk6hxRwHB13
 V9HkjDC5JMdfBR6c8W29l/0qv6IkTt/wjWiFUMs2+MtCkqRgqOLrMaOMjdQtA5VYqgL9
 HUQtNoDNJApsPjzPEXEpaau/r/LBsVvkjPFKNBYe51MCi9Y2kJIT33ojPmRgTl6JbZFT
 R7bTJ8KZUr8RmafXs+7pgeBSSo0Q1aD/MgMNGs2z0oAl9BtAejxBqEp2k1QPlOB/xTqD
 igIg==
X-Gm-Message-State: AOJu0Yzr672fn50CcY7xflWVQPqVrNvAHAXV2s5PNZwkwoq1NkjNqtF/
 USbmQfam1RrC2DZ1OypuB+tK5Q==
X-Google-Smtp-Source: AGHT+IHSUUIn+HcJmizUpSv8pCOH1qEoTyKtA+e2GAWjLYdi1CFgZ9zrq/uK5HIl8mboQTQve38ZLg==
X-Received: by 2002:aa7:d158:0:b0:523:ba10:d795 with SMTP id
 r24-20020aa7d158000000b00523ba10d795mr1292491edo.11.1694158559541; 
 Fri, 08 Sep 2023 00:35:59 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 dy24-20020a05640231f800b00523a43f9b1dsm649039edb.22.2023.09.08.00.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 00:35:59 -0700 (PDT)
Message-ID: <5b9caa3a-865c-d1dd-8b1a-5d0e49bf3abb@linaro.org>
Date: Fri, 8 Sep 2023 09:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] hw/display/xlnx_dp: update comments
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230907203440.257845-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907203440.257845-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-List-Received-Date: Fri, 08 Sep 2023 07:36:05 -0000

On 7/9/23 22:34, Michael Tokarev wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> Clarify somewhat misleading code comments.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/display/xlnx_dp.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


