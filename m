Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sJE4n-0004Va-EU
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2024 11:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJE4m-0004VJ-5Z
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2024 11:15:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJE4k-00051l-4w
 for qemu-trivial@nongnu.org; Mon, 17 Jun 2024 11:15:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4217926991fso39715825e9.3
 for <qemu-trivial@nongnu.org>; Mon, 17 Jun 2024 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718637316; x=1719242116; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znYenmDJyAitrpjZrWLm6TJUdAqFs2a4bvQDiAz0fTE=;
 b=CVa5jZpulVNA3PmaNbgtDyx/R7AhUDAoOrIngFXtnK3LfQzh2IvjldNqiSX3AizCB/
 TYBOPaewPRF1zV1ghOxCxQgO4Buxj5mo2RrAZCM+O/n0Ja2gcA6N9iKN5l4nxHi1FqcP
 dWUbZDZ5seEk4FBhrzWInCgL+OLWl8IAtuhtTxZ4xHvdxtHWfZ/OQrgGKdsbGL5j2uXb
 EOcpwU0StWStMjn+xqGnw1DEHjisy2PVEABbXK7VvOGmZcMxx1xB6BJnr5VvPK6XAMML
 Fs9GhCOfQfrOMVl7W+TqzQLteoiRd3v1/60N/MUxxlBb8qUCvR18axCqyVISQFK8BtR2
 nxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718637316; x=1719242116;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=znYenmDJyAitrpjZrWLm6TJUdAqFs2a4bvQDiAz0fTE=;
 b=v1GrGedrD5f6h3r99XeTtHhByYCBRE+3/C+1xC4Aa9T52/6Ip6z1wUNqs2f+CWqcz5
 CfesF5hGxLfZxAr9r17LD+mUhPrrKXv+9T4ByAEOqxWxBgPneCwru/RyrZdPAXk4BWPR
 SU8qPXaxy8fTuaaCzCuDJsCRm64mGTkpVsEM1qlucHQKKooHO3FwwdA9pix8mLN0HnmZ
 rJu8BVOlYWGBiDevB/zloY7fGMuRsif9QjsSMx9eO3NwT5NWK3LNpspes9FvjFBjLqWC
 Fmb/wLtJoinCk3ViXDOIMnMhlJWRrmcTXs+pndxpaA289tR0aaN02A/b2j8rDEaGY/uO
 Jv4A==
X-Gm-Message-State: AOJu0Yy/7W5DWwxelw0Ax0gOfc/Tw9pf60bNSxx2H8Sqh1a42gGo/Sx3
 wUh3gMGNtJxDYq8Kt7R3VfZ2U/Ok95m29pgT9kO+8DxPWEjQTaePx0A5UE4SusY=
X-Google-Smtp-Source: AGHT+IELmqvzRe3AvStEGJ9zlOhI2QCJq4V4kw9CnWIfigXDjd6Z+iq34fjTzWIFiYMU64cOLVAdBA==
X-Received: by 2002:a05:6000:1b02:b0:35f:1a84:35e6 with SMTP id
 ffacd0b85a97d-3607a768f45mr6897951f8f.42.1718637315782; 
 Mon, 17 Jun 2024 08:15:15 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.169.90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f0d71sm12023933f8f.86.2024.06.17.08.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:15:15 -0700 (PDT)
Message-ID: <506a5c94-b9bf-479f-88b1-3c87ece9b9d9@linaro.org>
Date: Mon, 17 Jun 2024 17:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] os-posix: Expand setrlimit() syscall compatibility
To: Michael Tokarev <mjt@tls.msk.ru>, Trent Huber <trentmhuber@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <20240614210638.5959-1-trentmhuber@gmail.com>
 <b9ed9c39-349d-4397-9b05-d7faa5b95fa2@linaro.org>
 <781afc0a-6ae1-4122-8a2d-8ca77191983f@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <781afc0a-6ae1-4122-8a2d-8ca77191983f@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jun 2024 15:15:20 -0000

On 17/6/24 15:07, Michael Tokarev wrote:
> 17.06.2024 10:19, Philippe Mathieu-Daudé wrote:
>> Hi Trent,
>>
>> On 14/6/24 23:06, Trent Huber wrote:
>>> Darwin uses a subtly different version of the setrlimit() syscall as
>>> described in the COMPATIBILITY section of the macOS man page. The value
>>> of the rlim_cur member has been adjusted accordingly for Darwin-based
>>> systems.
>>>
>>> Signed-off-by: Trent Huber <trentmhuber@gmail.com>
>>> ---
>>> The previous version assumed OPEN_MAX was a constant defined on all
>>> POSIX systems--turns out it's only a macOS constant. This version adds
>>> preprocessing conditionals to maintain compatibility with Linux.
>>>
>>>   os-posix.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/os-posix.c b/os-posix.c
>>> index a4284e2c07..43f9a43f3f 100644
>>> --- a/os-posix.c
>>> +++ b/os-posix.c
>>> @@ -270,7 +270,11 @@ void os_setup_limits(void)
>>>           return;
>>>       }
>>> +#ifdef CONFIG_DARWIN
>>> +    nofile.rlim_cur = OPEN_MAX < nofile.rlim_max ? OPEN_MAX : 
>>> nofile.rlim_max;
>>
>> Why open-code min()? (The man-page also suggests it).
> 
> I guess it's because stddef.h isn't included there, so min() isn't 
> immediately
> available :)

I see os-posix.c -> "qemu/osdep.h" -> <stddef.h>. Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Applied to trivial-patches,

Thanks!


