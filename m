Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rreDs-0000K9-TO
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 09:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rreDm-0000IR-AW
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 09:30:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rreDi-0000SM-UB
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 09:30:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4155baa696eso17712885e9.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712064632; x=1712669432; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7yV5DhXp84F08Csgrgf5l9tQgfG+5zMqa1qugWdzDL0=;
 b=rJm2n7DV9U0ODWzkdFoUUP7qtMfyeNFOOuHvzrPlPNWazIrhvt+AYkr1bvNiaK/HzL
 r0EdF7l9bPtxVTAUPkMm5Kkd2kg4NB0ClO/Hp/0j80lcul4xCUEu/Z7fm4c7Qniblsa0
 nxeDfz60EPwUrQ9JwOAqePrw/SObdRQymtN22N7GUzROJXyqw7/odii9kiqA/xGeRjLV
 KNFEKE2cR/DClkERI1N2odWrOmhoanw7bw/ScVVYYRmeIVF+9nJANreC81+El7+dtkr3
 resCMOhg3TSlfy+bu10OFuV19CB8oZlNNrHutE+9GR++PtbZwEF1mLcYA4fe/921Te78
 FfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712064632; x=1712669432;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yV5DhXp84F08Csgrgf5l9tQgfG+5zMqa1qugWdzDL0=;
 b=d2yceIfsx7R29gommygabNVTZ4DFV6tvgE7DFaPmABxEsJs6oZCXPVKGzfXcQvT2f2
 dFimbcMMX7SQP4hix2A6XoXF+iNIPer+xbgWc9o1h+hkZfcWg3UAtLMV90g8y9lcFxx3
 u2nzSiDAAFJGd37yZf9MR7+z0u+7zvCz25sd7kv0p93X+SVk6ydIg6FYD6GgivBcO3de
 pRnPiSxLVzG1WgaSOWdoAEkbfCsBH3ggBVwEx+8nPIQdtwmRoROloRlkqjy4GmG+EdbK
 JvxxmTeda7BslG7gJOutd2VAM3l6ketsuiGvxowNB2jCa1vqDnFBYRMFQmffkvoS9T/w
 FDHA==
X-Gm-Message-State: AOJu0YwVyePoILtUh9SKj/iAQHZdnEFl8cOYsfHCWdizSOtcti0yHnQx
 lH5iGfHTlIB1Oo9lxyQrkILDgtSWhQcFSUhRGmpZa3G2a1u+UIqIgckBI1o8y/I=
X-Google-Smtp-Source: AGHT+IEqXEFfetuczkoGQBa8L7Fc0uIIdMkhAHukdsYrGm6EfZd+FqNUlWRBhvqyQBziC9eTlEZAdg==
X-Received: by 2002:a05:600c:3b02:b0:414:8abb:a96b with SMTP id
 m2-20020a05600c3b0200b004148abba96bmr8116028wms.34.1712064632074; 
 Tue, 02 Apr 2024 06:30:32 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0041409db0349sm17959110wmo.48.2024.04.02.06.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 06:30:31 -0700 (PDT)
Message-ID: <9ec42b31-f169-4d7d-82a4-f0173bc75581@linaro.org>
Date: Tue, 2 Apr 2024 15:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch for qemu-project/qemu#2247 issue
To: Michael Tokarev <mjt@tls.msk.ru>, liu.dayu@zte.com.cn,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, jiang.xuexin@zte.com.cn
References: <20240401174355899iU6IFrpOQSiGe36G4PToz@zte.com.cn>
 <298819da-145e-4478-901f-66241a23f03f@tls.msk.ru>
 <d960f4d5-1570-4b07-a1fd-2bd1267d661b@linaro.org>
 <291032f7-de3f-4b21-9b2e-872274203e37@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <291032f7-de3f-4b21-9b2e-872274203e37@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Tue, 02 Apr 2024 13:30:38 -0000

On 2/4/24 11:59, Michael Tokarev wrote:
> 02.04.2024 12:50, Philippe Mathieu-Daudé пишет:
>> On 1/4/24 18:52, Michael Tokarev wrote:
>>> 01.04.2024 12:43, liu.dayu@zte.com.cn wrote:
>>>> hmp: Add help information for watchdog action: inject-nmi
>>>>
>>>> virsh qemu-monitor-command --hmp help information of watchdog_action 
>>>> missing inject-nmi which already supported in Commit 795dc6e4
>>>>
>>>> Signed-off-by: Dayu Liu <liu.dayu@zte.com.cn>
>>>
>>> Applied to trivial-patches tree, in the following form:
>>>
>>> Author: Dayu Liu <liu.dayu@zte.com.cn>
>>> Date:   Mon Apr 1 17:43:55 2024 +0800
>>>
>>>      hmp: Add help information for watchdog action: inject-nmi
>>>
>>>      virsh qemu-monitor-command --hmp help information of
>>>      watchdog_action missing inject-nmi which already supported
>>>      in Commit 795dc6e4
>>>
>>
>> Fixes: 795dc6e46d ("watchdog: Add new Virtual Watchdog action 
>> INJECT-NMI")
> 
> I don't think that commit is broken and needs Fixing.
> I see your point though - to have more formal way to
> mark "related" commits, it isn't always fixing something.
> 
> I sent a pullreq for this a couple hours ago anyway.

No worries ;)

