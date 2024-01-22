Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rS1jC-000211-43
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jan 2024 16:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rS1j9-00020l-91
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 16:21:07 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rS1j7-0003oB-Jq
 for qemu-trivial@nongnu.org; Mon, 22 Jan 2024 16:21:07 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-290b219a60cso760641a91.0
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705958461; x=1706563261; darn=nongnu.org;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVGN10RZ4K/UEdssV8pBym67eJ8IizFt13VRngK3UOI=;
 b=RUJ9q9DjF8GCFgO3xyYajGY/COv6SphwxH5R8wXP7i/sZ+9zZZuk5aT689f80HXU7s
 U0vIE/0tCjGzIRHUjFFvEVzH/k0B6wCYby7iFOo7H4u74M7SHy2gA99yoH/n0kWbDN0c
 8QwKQaQT20+bSOU+0ade06+dYtzCj/F/DUApA8evXY9d91TGMg/CtmMrD1kyps2MD9HJ
 zbES4ElTWY4gkMjyHS5aH27Ohe9OtCWmqrfQv+yfwEVv/yRt0SbMKZ4w5rKL7+//351L
 FApF59k7ysnf/QegWuuBQwJJ+F9rmJBEmrVqY5X8jJCQ3JSpCOp55sY3A7mAFGK2EibM
 ZAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705958461; x=1706563261;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVGN10RZ4K/UEdssV8pBym67eJ8IizFt13VRngK3UOI=;
 b=Z24kTVrU4iKLGm8OhVavWYI1cAq++aec8V3CzgZqsnJE35ii2lMpl35z6nMUwx5KIp
 +uH9UStDCcj1axH7VUEJiubIJkf/kdOJyIkNcVYjaP2wncnZ5AdpfjNJOggDfcKoQYuR
 EpmLhKxjzviTyXbe2udh5iBAtZOph8eyJjNV9h8/69ZvcBIjEBAMVotrO1F8YnQZX9aY
 fMGQw83941rH6j7NYnRDUNoonokan8Zd/K9I29gbVuxSVMG1DdgzEQVnEJ56xyy9mOHL
 y6RuVTSrqu+x1hynsHzJ1n3tyilg9iosy8bMEzu8BMJTkWtDgbnYHX+VhiTcmouLi1AJ
 hqjA==
X-Gm-Message-State: AOJu0YyeoayJrryR3P9tEoqr4zrHeyHKNZi7LIh09KS7aLrOQjq0YAFL
 2iVOC9Kr7lPudU5qsgdMmukJmtZsk+InHlPLUy4hv8eZ6Tn1pO57F+MqAHcxDm3vfciP7pnAamA
 K
X-Google-Smtp-Source: AGHT+IEbtYRDVcpV6zOgbOfhq0emcP//CDnaJRLNDryo+YxCBWKSvPY6kmHf1qFX2tLmIGcZTMKoLA==
X-Received: by 2002:a17:90a:17e2:b0:28b:c0a1:15f with SMTP id
 q89-20020a17090a17e200b0028bc0a1015fmr1680130pja.42.1705958461382; 
 Mon, 22 Jan 2024 13:21:01 -0800 (PST)
Received: from ?IPv6:2804:7f0:b401:e1f2:e374:8883:e6bd:fa0b?
 ([2804:7f0:b401:e1f2:e374:8883:e6bd:fa0b])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090ac88700b0028b89520c7asm10072888pjt.9.2024.01.22.13.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 13:21:00 -0800 (PST)
Subject: Re: [PATCH] docs/system/arm/virt.rst: Add note on CPU features off by
 default
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org
References: <20240122134334.91411-1-gustavo.romero@linaro.org>
 <CAFEAcA8e+2MCpohL_EU7NA=1jgyC7-QTdgEJiqAosBL6RiiJYg@mail.gmail.com>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <ec175276-2676-f7a5-ccff-d1a0c76c473c@linaro.org>
Date: Mon, 22 Jan 2024 18:20:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8e+2MCpohL_EU7NA=1jgyC7-QTdgEJiqAosBL6RiiJYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.22,
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
X-List-Received-Date: Mon, 22 Jan 2024 21:21:07 -0000

On 1/22/24 1:31 PM, Peter Maydell wrote:
> On Mon, 22 Jan 2024 at 13:43, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> Add a note on CPU features off by default on `virt` machines. These CPU
>> features will remain off even if `-cpu max` is given so the user must
>> turn on them explicitly on `virt` machines.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Hi -- it looks like you forgot to cc qemu-devel on this;
> could you do that on the next version, please? (All our
> automated patch tooling looks at qemu-devel only. The
> idea is that for other mailing lists you cc the other
> list plus qemu-devel.)

Hi Peter! Oh, I missed it indeed :-) Did that for the v2.
Thanks!


>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -69,6 +69,17 @@ Supported guest CPU types:
>>   Note that the default is ``cortex-a15``, so for an AArch64 guest you must
>>   specify a CPU type.
>>
>> +Also, please note that passing ``max`` CPU (i.e. ``-cpu max``) won't
>> +enable all the CPU features for a given ``virt`` machine. Some CPU
>> +features are ``off`` by default (e.g. MTE) -- see machine-specific list
>> +below or check them for a given machine passing ``help``. For instance,
>> +for the ``virt`` machine pass ``-machine virt,help`` to QEMU.
>> +
>> +For example, because MTE CPU feature is ``off`` by default it's
>> +necessary to turn  MTE ``on`` explicitly to have this CPU feature
>> +available on the ``virt`` machine, even when ``max`` CPU is specified:
>> +``-machine virt,mte=on -cpu max`` .
> 
> I think I would phrase this as:
> 
> Where a CPU architectural feature requires support in
> both the CPU itself and in the wider system, it may
> not be enabled by default, but instead require a machine
> option to enable it. For instance MTE support must be
> enabled with ``-machine virt,mte=on``, as well as by
> selecting an MTE-capable CPU with the ``-cpu`` option.
> See the list of machine-specific options below.

Got it. Sure, that version is much better due to the
explanation of why some feature are off. I kept the initial
part about -cpu max not being sufficient to select the feature
because I believe some users might get confused by selecting the
max cpu and not getting all the CPU features, like it happened
to me :)


Thanks!


Cheers,
Gustavo

