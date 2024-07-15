Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTIGU-0003dS-DQ
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2024 05:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIGG-00036W-Gp
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:44:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTIGA-0005S0-0E
 for qemu-trivial@nongnu.org; Mon, 15 Jul 2024 05:44:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-36798e62aeeso2587311f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2024 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721036680; x=1721641480; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=voOsnZmg1bnOTOj8efHaXA/kRvba9LY5vB88tFa2EpU=;
 b=BVLS/g0wbYZrHZZjG9i09qEVjm53soPIpRUSLlPl1yGgVVBHjTHhGgvqek1oOqaKFe
 vtPk5AVVWgr+l++kYo/J8e8oHjwQQMgbfk7u0ReaRZFdbN7uk6mj5Tr2sj9iU/VCMWNQ
 UYfSe0umIUUOnfmuM8jeDXgsR0Hqj3ae91RnqpGJ3DxVWsOQzoiSN78e4ugDYVINIM5P
 d+s8XVrlm+TekvRXXfP8UiR1MO3b5Mb0XK/WFfa5YI3cPCz/op8ancbs2a4Ii9zbA0OO
 U7igQCIJ5oZ/jHKKfhh1eb5UnUwtFvfD8kqRbe4yiPbGOBb+IjJJTxvmpgMcvlf4fRHS
 T5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721036680; x=1721641480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=voOsnZmg1bnOTOj8efHaXA/kRvba9LY5vB88tFa2EpU=;
 b=IlRx42N22SSZ+mG2gqWnNWKaUVDbZep0fttm6usR4lPIUSNviC0aTP77rDK9F2wy1i
 4JiwqYFv0SrMiOgSfdfZpX4ajuNDTBzdf71YWSOtgQM4xXjeMqp57AV2suu3lL34lgSF
 uHspDryRPa+2aubOUStgRPO6LOVOeH4hy6zoFXiAInvq1NHwF9aq6B6m0oY9hauo9HEl
 KU27s4bJcISYi3CZP2KV94OYk07PjtQBN11sJI3QIV6Vw+IkcNty+KxQZys+EI9MmyBw
 v3yHUqPqqDZRj0vAjDsHMJfNZACwAqeM230kFAj3bKFhGd7pWAD3L6pwuML6eYbR3rgC
 mJoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOoiLw48VJAX+Jj2NIObszj9LN0kgtWdGf+rYYYCmYBq6Vofp5FCJugUp4TxRW2CVOx6yUKiaUg8E2DkuDmvBGdI4J4uChLg==
X-Gm-Message-State: AOJu0Yyk/qkxO5axItRSyYPuBEYxIgsy9v0745O5If/ywhZ3MUK9hV/B
 YhP0BytAIF8AcmS5xZSw75MEO9VkR45zmnRJZRKro2Fk2d7lACZ6gkw21uoPUXs=
X-Google-Smtp-Source: AGHT+IGMuA8a3NNS+Y3b1tSyeFyuvbw5A6fnVnlhZlcJttcgLT/zgAkmHRj13smLnXiKZBNs3qXe8Q==
X-Received: by 2002:a5d:47a9:0:b0:366:e7e2:13c8 with SMTP id
 ffacd0b85a97d-367cea46a0bmr15484668f8f.11.1721036680377; 
 Mon, 15 Jul 2024 02:44:40 -0700 (PDT)
Received: from [192.168.121.175] (91.red-95-127-43.staticip.rima-tde.net.
 [95.127.43.91]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccac2sm5791658f8f.56.2024.07.15.02.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:44:39 -0700 (PDT)
Message-ID: <5441aecd-0080-4528-a356-62318cb7704e@linaro.org>
Date: Mon, 15 Jul 2024 11:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hw/usb/u2f-passthru: Get rid of qemu_open_old()
To: Zhao Liu <zhao1.liu@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20240715082155.28771-1-zhao1.liu@intel.com>
 <20240715082155.28771-4-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240715082155.28771-4-zhao1.liu@intel.com>
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
X-List-Received-Date: Mon, 15 Jul 2024 09:44:55 -0000

On 15/7/24 10:21, Zhao Liu wrote:
> For qemu_open_old(), osdep.h said:
> 
>> Don't introduce new usage of this function, prefer the following
>> qemu_open/qemu_create that take an "Error **errp".
> 
> So replace qemu_open_old() with qemu_open().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/usb/u2f-passthru.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


