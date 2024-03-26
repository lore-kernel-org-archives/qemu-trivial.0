Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp7ME-0001LH-Ev
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 10:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp7MC-0001Jj-Re
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 10:00:53 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp7MA-00031K-VZ
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 10:00:52 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513d3746950so6911651e87.1
 for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2024 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711461649; x=1712066449; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=518rxPStDSiC644PHfV+WPYhM8g47DKTiBbf7OfJSi0=;
 b=kWBcBdpf792gvdtXC/72MjFfTzItqOcs9LCs6U4mWLk6RS3zOQJ1Bj++2iNdiFfQFX
 36znMpFNcAy15WY8wepqaU3WCRId0B4uuP8QMS4q5B8WwHVlaRPkheQpchh/J63PrKzi
 qXvK4VF4K/QgC1Lwjw24RfshGBfNp153HpNeQaD4n1ytBd/Oez8p1E3N+uVuOeX48Pl4
 3WV4HDQvfWH8pKyfIAvk2joKk8QWmHf5MPCG9a0e4gQRki2gzrRzjcbhZnx9oA9/QMOq
 sH9wTGDHbnihNVYjluw1LPuofMbtKUnWTSAvlDgKh00KqDi8mtx86LTt9jXcw3c4Mozy
 udDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711461649; x=1712066449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=518rxPStDSiC644PHfV+WPYhM8g47DKTiBbf7OfJSi0=;
 b=Z4vncMd2clic9U69oV3cXaTkddQlgB/AS+vxMrrNlftvpyQeaxdZQtaZvqgooD5WLD
 rG5BbyldK99i1yQPzQ2vBkKUeqoc/SJcSyIHsV1B9Mc83/ZX6HbioqkAVKKzDCcKX/AG
 AveJ9wXOo6qMf4fn6cGI+Gej8tnSPr1WliSUFnJtwYnHA62lHcPUrqUyeHTONl5YCU9e
 A4mAPgylEda26ZRsW28eFZc7Wn3goHE3ZJHDjc+O1vOoNE85QddABjdWZm0I7Mjw6G4d
 ZYVcywOL2v4JOsuISOWMQQ7B6vnOe/5qptDoTBGqvRNZEsGRxHiXoHNVqupkEIQQCHW+
 fPhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfFdS4JJAFSlpq9XTPgtm4JFFa0zdLbyec42wqI+hfANHsKamaFa/DXv/kcfbCQEzLMTi9GgA+yiKak//+2I1pgGqvOi+5bg==
X-Gm-Message-State: AOJu0YwVDiHwpcLNUmUq3b2f3jNyRNknPkHR2jC0RVG3D7ri25Y9Cyrw
 ZqlxBPs/7Wc/dyv2vpY+mYLpG3fIflg2+eanC5Fef1WquqjR2n89UY+k0z40kK4=
X-Google-Smtp-Source: AGHT+IHTZfn9haAVcRCw/8INyWm7Ly7DU7TOZaflyvkjX11+WuWsm4pXECrJDW8M1nc7kDWpNyvcLQ==
X-Received: by 2002:a19:6914:0:b0:513:e249:65fc with SMTP id
 e20-20020a196914000000b00513e24965fcmr5932355lfc.61.1711461648472; 
 Tue, 26 Mar 2024 07:00:48 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c00cf00b00414041032casm908926wmm.1.2024.03.26.07.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 07:00:47 -0700 (PDT)
Message-ID: <c8a96403-a07f-40ae-8865-bec3fa1a7258@linaro.org>
Date: Tue, 26 Mar 2024 15:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: pbonzini@redhat.com, devel@lists.libvirt.org,
 richard.henderson@linaro.org, mst@redhat.com, qemu-trivial@nongnu.org
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
 <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
 <306fd62e-50d4-4871-ae62-ea554a0fb388@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <306fd62e-50d4-4871-ae62-ea554a0fb388@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
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
X-List-Received-Date: Tue, 26 Mar 2024 14:00:53 -0000

On 26/3/24 14:37, Thomas Huth wrote:
> On 26/03/2024 14.29, Philippe Mathieu-Daudé wrote:
>> Hi Igor,
>>
>> On 26/3/24 14:08, Thomas Huth wrote:
>>>
>>> s/iaspc/isapc/ in the subject
>>>
>>> On 26/03/2024 13.51, Igor Mammedov wrote:
>>>> ISAPC machine was introduced 25 years ago and it's a lot of time since
>>>> such machine was around with real ISA only PC hardware practically 
>>>> defunct.
>>>> Also it's slowly bit-rots (for example: I was able to boot RHEL6 on 
>>>> RHEL9 host
>>>> in only TCG mode, while in KVM mode it hung in the middle of boot)
>>
>> I'm quite opposed to this patch. QEMU models various very-old /
>> defunct hardware. I'm pretty sure Bernhard and myself are OK to
>> keep maintaining it, besides we are working in separating it from
>> the i440fx+piix machine. Also, this machine is particularly
>> interesting for my single-binary experiments.
>>
>> Where I agree is we should stop reporting "KVM on ISA/PC machine"
>> as supported.
> 
> +1

Rough plan is to extract 'isapc' machine from PCMachineClass,
having the latter becoming smth like PcPciMachineClass, on
top of:
https://lore.kernel.org/qemu-devel/20240305134221.30924-1-philmd@linaro.org/

> See also:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01367.html

lol I didn't remember I posted a similar patch =)


