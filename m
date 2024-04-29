Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s1ODa-0005Ss-Cy
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2024 06:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1ODZ-0005Sc-0w
 for qemu-trivial@nongnu.org; Mon, 29 Apr 2024 06:26:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s1ODX-0000SI-3e
 for qemu-trivial@nongnu.org; Mon, 29 Apr 2024 06:26:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso23099075e9.3
 for <qemu-trivial@nongnu.org>; Mon, 29 Apr 2024 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714386397; x=1714991197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=znmZeJkGaSCtxVUBkfoWyfWxlq6LW1KJw9yscTqdCls=;
 b=uafpNz7Yh1vUEcU00qiBPfVEYfe4TKkxUY6tslVavBjJ9B35QfJmpb+uxiZzXyZiRO
 yTSnSi569UEeSrk24kqNjZioDpy+S80s2JKSMaWvSB58wK1SE/CkqFiz3BtTGu2kJHIz
 /ESOPofebFup4k9c5Cj+4CYpx5FZQ9xihuO2Gi1w39JQBxT4WaaTq119C7O+o2OEk+0T
 TgHDgD2nh7g/YOj/+ri8L0bAqDQpk9rX4Uhv9M01c58UEkYNOfL3qoSnHVNe4FTTjItf
 GK5nOo7oKqRxyjqtxeyJngEmkCMwgBSprhQ4NfmqwcMEUrZr06cCWFsbGyD74gNFj26a
 4S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714386397; x=1714991197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=znmZeJkGaSCtxVUBkfoWyfWxlq6LW1KJw9yscTqdCls=;
 b=VPyhYDjn3KAmS1NJuwA9qIPzLUr1wB8frObGJojq7tNE4wLt9maTJ9GBIVmGY+JRZO
 do1hx0wjBLjwOennyELDlaLFTNWLSTQbLkaNMvSt82VEDK08VTep5BKGlucFfyVJz7FE
 PnCzU8zQSDAGFjjrixg4ahB9d8EiuxwlL5pg6Npo4ULoihjADE5YUKbLvzlV+a49XjC3
 vlU4xuXRcrHzmpKIUizVmlTpxdafsEjQBlSlybm5u5U6qWZ8G1FjhWe+uDP+IyE+SGi3
 JZXRn7KWvcgJaJat4bUbizuFBDAuq7YFgTRUCFnaI/hE5DGMhpt2MFDg/7/M7t7hkl1X
 Tgrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjJ4ozZMTvRWSd24KTGgguNbi6UwBa8exM2eRQrqqAjXBET2zpz/Lq/wp8dpoZ1l4zqxKDgX4X9CEDNuOj61sJRvMnANCtYg==
X-Gm-Message-State: AOJu0Yy4TjLVHKPU8ebPTCq4PjR/PRpNVAOnrvg1HruMJmj6isew/Tud
 HVm1fDTfBm66tsKo3vK3v2bYYCPQvZayC9vPHg9OlU82IVN3/9/rkTueXF3p8OM=
X-Google-Smtp-Source: AGHT+IHO7DkfsZ+o36ag67jMmIfb9FepsJaq94SOAortLU0+IbQtuqBtQlP6p0pKJToptzjsDzj8xg==
X-Received: by 2002:a05:600c:548a:b0:418:ed13:302d with SMTP id
 iv10-20020a05600c548a00b00418ed13302dmr8086092wmb.26.1714386397205; 
 Mon, 29 Apr 2024 03:26:37 -0700 (PDT)
Received: from [10.79.37.248] ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b0041b5500e438sm15224477wmb.23.2024.04.29.03.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 03:26:36 -0700 (PDT)
Message-ID: <3de69422-38eb-4fa2-972d-16d5c868ae30@linaro.org>
Date: Mon, 29 Apr 2024 12:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Remove useless architecture prefix from the CPU list
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
References: <20240420054606.13353-1-thuth@redhat.com>
 <ZiYZyOqeM2tYPcCs@redhat.com>
 <d2786e99-ae33-43a0-8040-8a218bb485f1@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d2786e99-ae33-43a0-8040-8a218bb485f1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Mon, 29 Apr 2024 10:26:41 -0000

On 22/4/24 10:22, Thomas Huth wrote:
> On 22/04/2024 10.03, Daniel P. Berrangé wrote:
>> On Sat, Apr 20, 2024 at 07:46:03AM +0200, Thomas Huth wrote:
>>> Printing an architecture prefix in front of each CPU name is not helpful
>>> at all: It is confusing for the users since they don't know whether they
>>> have to specify these letters for the "-cpu" parameter, too, and it also
>>> takes some precious space in the dense output of the CPU entries. Let's
>>> simply remove those now.
>>
>> Could it be said that this arch prefix is about to finally become useful
>> with Philippe's patches to add a 'qemu-system-any' command covering
>> multiple arches ?
> 
> I don't think so: In that case we'd rather print it once at the 
> beginning of a list ("Available x86 CPUs:") instead of printing it in 
> each and every line.

Yes that is correct. Hopefully we won't have the same CPU name used
by different architectures...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


