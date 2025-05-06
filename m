Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uC695-0008Qg-SP
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 20:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC692-0008Lx-KQ
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 20:26:48 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC690-0001RZ-Kh
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 20:26:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-736aa9d0f2aso6780618b3a.0
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746491199; x=1747095999; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h4sIncQY5r5apgcE9rlS/8QBsbDJtCkeXIVQE9s4/kU=;
 b=XoAGc5Q+xOvrcLWS/fstK/ANT+0Ixr5UF2EonKpm0nTAY9Hz4o2PTVlTJSEiO6lHvj
 JOxW9LJZdZ0w8gMkDWtt/A7ZRpbVbtjczIinvthtuGpTrbLHjxVyeSE4S8im+vTevGIC
 dIp0RxbofFHdiDIhTU6efnQnT5RE2Z7l/c/LQnnsQ80IliautqnwS8xtwppEfrsR7Hji
 R3SP23y84vNRrHWHOgbUpbk2vHuR9Jv+/20ctmaaQPbd3k+O3AI5hi1Au5TarvN9hq94
 T1/qK8DClIhm6Zkjwz/em5nteuuDuITgLcDMFX5LFnF6erwySZ0JXncYpnHkts7WCief
 WGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746491199; x=1747095999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4sIncQY5r5apgcE9rlS/8QBsbDJtCkeXIVQE9s4/kU=;
 b=bVZRSvgT7gzws0JzFYj0uEw8l/S3gywYoHIT8gViedyq1FYf9RkeDHp3X3Lblrc98h
 iRyj9LrxjlKFtDEObcVe9EBfSidQCEzu4h8RvdX4YUleM7LVUbpcGFVhxBe33BwCNu/8
 swqwZlVEdFenCN0R7RFVu6haZcRuLKmKHXUSlCddRGOp1EheuPhFczfOi7PE6HLxT0nR
 uXGCSKBJ/L0ZSZAGYsp6i0doBu4N6k7QDI9B6NXQhVQm1bXreLqu15OZalLmnc/eQsrf
 fN6u8GbutZ11qUzVclxMAc5X2U+er8adA+D82rW+72rp1GFEuwJpYqFetE//N4tABxnO
 yUow==
X-Gm-Message-State: AOJu0YyfcW5j4YLeKCs9qtIf8xwz081azQToBM4Yk/790qXVKmIc+idw
 lMiZlyn7B3S2WZF5UiynC8E242APqdSxvHrwQeqlXmJq48+gN2kNGGFQIo0Atmo=
X-Gm-Gg: ASbGnctuj1be+/zVEQ/qtxwTiDlxcT3OstGmUADzRuqlBNcalkXEQd+sQZkQcGIgvxZ
 MyhHuUm2pz/jGju0yFNmfkgJuhadOHGJOuTiiPVDq+1wm6PHW1KcyzPzrQK6wUX3UaICAbiEBRi
 yUhSDi5p5qxbug6Es27rh/+n3nLcCQPAFxZOCTXFxAOw2vV7E9n5KQ+XNYpUe4gtypKsTINYOZE
 feDGo+3+8B7W5FFvepAb8AVf0tLxDpQtfBF81TQqYZ2tAYOm9f2f36oebMRKat3WJsagNlRCb0m
 Of7dNrchTRZ0Bqg+KRfNOxTtPuIJBBywngff6YKpqmttyDmafjtKaBXW+gkvKokUeH/d7fOUQRo
 r8SzWkYvd5QxScTt44XY=
X-Google-Smtp-Source: AGHT+IEHsJVj1h5STNnQCbZvqPdOshyZMMmUGvSXm9Q2Pe4WLz6gdcurC6evIVbstKoDiV3JFUwAEQ==
X-Received: by 2002:a05:6a20:c908:b0:1f5:7873:3052 with SMTP id
 adf61e73a8af0-211819af752mr1524620637.11.1746491199525; 
 Mon, 05 May 2025 17:26:39 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fb3920069sm6251724a12.9.2025.05.05.17.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:26:39 -0700 (PDT)
Message-ID: <5b507a45-133d-4340-b677-e8fc49bfbfd8@linaro.org>
Date: Mon, 5 May 2025 21:26:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: eric.auger@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
 <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
 <6523849b-b44c-4176-ba5f-78a606621eb6@linaro.org>
 <c66f47ae-ccb9-47b2-9bbe-fb1386958e6f@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <c66f47ae-ccb9-47b2-9bbe-fb1386958e6f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Tue, 06 May 2025 00:26:49 -0000

Hi Eric,

On 5/5/25 11:19, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/5/25 2:29 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> On 5/5/25 04:13, Eric Auger wrote:
>>>
>>>
>>> On 5/4/25 11:56 PM, Gustavo Romero wrote:
>>>> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
>>>> whether a given bus is hotplug-capable.
>>>>
>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> For awareness, there is a similar typo in pci-port.
>>> see
>>> https://lore.kernel.org/all/20250428102628.378046-2-eric.auger@redhat.com/
>>>
>>
>> hmm it's unfortunate that I was about to publish a series to exactly
>> enable the APCI PCI hotplug on ARM. Next time I should try to sync better
>> with Red Hat folks on the work fronts...
> Sorry to hear that. That's always a frustrating situation :-(

Yes...


>> I've skimmed through your RFC and it seems to be doing mostly of what I
>> was doing for my series, so I'll reviewed it formally today, it should
>> be quick.
> I guess we may need to add some additional qtests for hotplug (just as
> they have on x86). Maybe we can collaborate on this or you already have
> some stuff under work.

Sure, the new test I'm baking is the one I've used in the smoke test. I'll
contribute it on top of your series so.

For the x86 "parity", which tests you're thinking of to add for arm64?


Cheers,
Gustavo

