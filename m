Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryDoF-0005hf-9k
	for mharc-qemu-trivial@gnu.org; Sat, 20 Apr 2024 12:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryDoE-0005by-9u
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 12:43:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryDoC-0004lw-JY
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 12:43:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e4f341330fso26212785ad.0
 for <qemu-trivial@nongnu.org>; Sat, 20 Apr 2024 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713631403; x=1714236203; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p2Qi3Z69q+iov6pHwb1AL1DKLkWOYopTR+eWFrUSnBQ=;
 b=LIJTEJ5M+xeBugeILPXqDCePwtOq3GwtkcMv0M9pnefAYujsqKHYlJblZwg9yeoUBF
 e/+KmScPELOs77cbMB1FXtvAhpGMkeGcDEvDoZ/jIq1KXQcG208g2aod9MoqPqGuJOiz
 05mIkquXDNEqGi9GwxU4++MOEsJf6lsrbm5wrQlKDv5gECyeKxOkB69oa4JUtshKOUty
 CCfbzCKgFkYqI3YkNDSZ9G9Q0fttYK9IoCUFu3c7gmqots5qypEPiO7NO34Naiit7RzJ
 1urHE5QMUB5ktn8yxMepv3hQwCHhW+SE2LjNLGDo6dUKQK6uz8i5r1frD05tj27eJ0St
 uB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713631403; x=1714236203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p2Qi3Z69q+iov6pHwb1AL1DKLkWOYopTR+eWFrUSnBQ=;
 b=E4JAY4OIA56EtcJapPbZJfJFfmTP4rGNr7uCng1yiCM6ob7JMuD5f4aHcCkvQumx87
 d/KbLlsE1nWZ3CjhsD9nBW567OUL5yOM3GdvEyqn4BnLp1/aHXrjCsVfLa+WaZaQC1gW
 Dddkpm4iSHDL8ctgSrKLJf/YoExvW4R2U/te07zzAddFuhlBI7J1WSD4ABu8VjixT1hv
 wioUVglioUp1qd3qu7lGRTVr6iBL5X19puwTOSQNSJs6LGiLQ/kHH7rAun2Ib48OudKn
 gf9fvLSalnxQT/pDuHVTdCe5hoyn/XzEGRKo1FbhQmrc6tHIIxJHtffMrDMx9e8yPDQt
 9UNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVBFwPDXCqD1CQzLYW4FlgR/BZRd4ZvgMQvXOXDrDrw1p9cX8puNuPOd7pUrcbbsQxqBm4vBNWWLrFExkRjILLJQwJOfvYOw==
X-Gm-Message-State: AOJu0YxRWi1yjoF1fMV/u7DlE2yelLe/FkKKFhSWPuPL2SndgPrqyoOA
 b6ksdRTmXKjsaPWd2cWjVQcQWMzQWFP/pOsQgHdHygRCvXrZTlueDS+HArRUGFQ=
X-Google-Smtp-Source: AGHT+IGvaTzai2nBRgo7Bm9FYoXYHBi4etHXcMS5jNMBl0hFj7PArOjGcaZm7QUtRwp87hYjzVGkmQ==
X-Received: by 2002:a17:902:d48c:b0:1e6:11ae:dcde with SMTP id
 c12-20020a170902d48c00b001e611aedcdemr6937900plg.58.1713631403110; 
 Sat, 20 Apr 2024 09:43:23 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170902e80900b001e7c05cf1a2sm5246142plg.112.2024.04.20.09.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 09:43:22 -0700 (PDT)
Message-ID: <b51ecf9e-ca5e-4548-b9c2-077ad9ccfd4a@linaro.org>
Date: Sat, 20 Apr 2024 09:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/unit: Remove debug statements in
 test-nested-aio-poll.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240419085819.47606-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240419085819.47606-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sat, 20 Apr 2024 16:43:26 -0000

On 4/19/24 01:58, Philippe Mathieu-Daudé wrote:
> We are running this test since almost a year; it is
> safe to remove its debug statements, which clutter
> CI jobs output:
> 
>    ▶  88/100 /nested-aio-poll                      OK
>    io_read 0x16bb26158
>    io_poll_true 0x16bb26158
>    > io_poll_ready
>    io_read 0x16bb26164
>    < io_poll_ready
>    io_poll_true 0x16bb26158
>    io_poll_false 0x16bb26164
>    > io_poll_ready
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_poll_false 0x16bb26164
>    io_read 0x16bb26164
>    < io_poll_ready
>    88/100 qemu:unit / test-nested-aio-poll        OK
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/unit/test-nested-aio-poll.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

