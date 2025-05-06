Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCE8n-00086E-VI
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2025 04:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uCE8m-00085r-TR
 for qemu-trivial@nongnu.org; Tue, 06 May 2025 04:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uCE8j-00088I-Tq
 for qemu-trivial@nongnu.org; Tue, 06 May 2025 04:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746521940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oLmxjICOleaJ4ZZlmRaK63Vr6TElbfPLkAnWp0P9/Q=;
 b=ihxkfu146DzERC3WjA5EH8O7ZvbFdfa36lEEICYjHLjtXyfBXwptT5MFN54F29rTpyjoix
 bptL+LzBqaKHEmBBjHq+89/wPw4nTI55gksKnTrgIuedZSoFPo2h8Z86FtyF6E94wkl9Yt
 D+g3t1CGS4BX/DOOoT2nkect6CYYUXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-_kJwjdN2OkGR-C7RVxyURQ-1; Tue, 06 May 2025 04:58:59 -0400
X-MC-Unique: _kJwjdN2OkGR-C7RVxyURQ-1
X-Mimecast-MFC-AGG-ID: _kJwjdN2OkGR-C7RVxyURQ_1746521938
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39134c762ebso1588763f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 06 May 2025 01:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746521938; x=1747126738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3oLmxjICOleaJ4ZZlmRaK63Vr6TElbfPLkAnWp0P9/Q=;
 b=IMzer6rCvNEev+9kvcw7hViLwDjNDV/Z70lRI07HlyccOjRSULI0GuGDeGSZIVBQse
 GOLanZ/LY0m6yb6orGJJyz8E/3HkgHBMjeGCJ81OtO6p6f3W9jCbTDjeIYm+xik6SlVE
 tQg8ZWwcDFjEsSSlwmmxCdDWRCq3tFIMOS3Kps1ru94JOPXFY7j8Nz/wWXtzFY7ZfamA
 HXwiUh7FAgW1IvU396imnng16Hd7/H5uCM36+tWMuRTYjSaVk5qa2NnBcxnTCVLNix63
 353v1DceA+H9j2omXBkv2omkoCUPhqb2W7/BJcaTVZaoRedIqmwyMI5vZiKtoJudFCz6
 1+hQ==
X-Gm-Message-State: AOJu0YwA7Y4Pg4uQVuUfiWmC1UM4dQkCFa9rb5y9S5YdkzF+p14eSEFi
 5GeCAELEV17TJID8Rn01m+XP52HTDR2i6FvFYWjUFRTa88IN156EB+AkjqdTCLKXEj1VhjJ3QER
 SEXnxZ1lztKGM1ym1UUoEk/aixCmbwxsT2NaK0rF0TqP4QIAtwUorNMs=
X-Gm-Gg: ASbGncsNGYRf+n1qNscwU3ijfqzWsypXua9+Eb8wCZgx37o2V9VEACF+Jw20Zxy/fn4
 NNCKHVl+uALLsN28fmo9Pyb+Hc39UbImrsAd+Hap7AHO3NyhJAxNZIPKvT65u13LzeSb6QHznQr
 F6zVpZg0wf+BE8AX0lGVqH9GmNauJxB57045cs6f1ijDJVATKoRPax2W+AlaNKez34C5LspG8cc
 HMOPRrCJon9WGf6UTe4ZD7ks5I/1khRRET7fPhGOXWUewhpkWYQva/V22ykxcZjWl3/tkC5FGFv
 aIje90+wsLMveYlZSVTswFlRrzgm3yiPmMUSKhsX2Ly45icyIZZn026yT7k=
X-Received: by 2002:a05:6000:4383:b0:391:22e2:cd21 with SMTP id
 ffacd0b85a97d-3a0ac1ff33amr1623927f8f.36.1746521938117; 
 Tue, 06 May 2025 01:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0X7cA8inR5GsNgTdqOs1F1czfzBT1PMZxfct4egn2rqLfLXmZK36Na9z0wLq3N1yBKsgBaQ==
X-Received: by 2002:a05:6000:4383:b0:391:22e2:cd21 with SMTP id
 ffacd0b85a97d-3a0ac1ff33amr1623906f8f.36.1746521937682; 
 Tue, 06 May 2025 01:58:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7caasm13161033f8f.54.2025.05.06.01.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 01:58:56 -0700 (PDT)
Message-ID: <4941224c-75cc-488a-9107-74c6f7f89560@redhat.com>
Date: Tue, 6 May 2025 10:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, philmd@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
 <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
 <6523849b-b44c-4176-ba5f-78a606621eb6@linaro.org>
 <c66f47ae-ccb9-47b2-9bbe-fb1386958e6f@redhat.com>
 <5b507a45-133d-4340-b677-e8fc49bfbfd8@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5b507a45-133d-4340-b677-e8fc49bfbfd8@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ibc7cc68fKGLNu_bDEGjeav_rLLI_r3-c7LpQRTjzVg_1746521938
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 May 2025 08:59:05 -0000

Hi Gustavo,

On 5/6/25 2:26 AM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/5/25 11:19, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 5/5/25 2:29 PM, Gustavo Romero wrote:
>>> Hi Eric,
>>>
>>> On 5/5/25 04:13, Eric Auger wrote:
>>>>
>>>>
>>>> On 5/4/25 11:56 PM, Gustavo Romero wrote:
>>>>> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
>>>>> whether a given bus is hotplug-capable.
>>>>>
>>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> For awareness, there is a similar typo in pci-port.
>>>> see
>>>> https://lore.kernel.org/all/20250428102628.378046-2-eric.auger@redhat.com/
>>>>
>>>>
>>>
>>> hmm it's unfortunate that I was about to publish a series to exactly
>>> enable the APCI PCI hotplug on ARM. Next time I should try to sync
>>> better
>>> with Red Hat folks on the work fronts...
>> Sorry to hear that. That's always a frustrating situation :-(
>
> Yes...
>
>
>>> I've skimmed through your RFC and it seems to be doing mostly of what I
>>> was doing for my series, so I'll reviewed it formally today, it should
>>> be quick.
>> I guess we may need to add some additional qtests for hotplug (just as
>> they have on x86). Maybe we can collaborate on this or you already have
>> some stuff under work.
>
> Sure, the new test I'm baking is the one I've used in the smoke test.
> I'll
> contribute it on top of your series so.
sure
>
> For the x86 "parity", which tests you're thinking of to add for arm64?

I found
https://lore.kernel.org/all/20200918084111.15339-1-ani@anisinha.ca/#r

so in tests/qtest/bios-tables-test.c
tests featuring various values of
acpi-root-pci-hotplug/acpi-pci-hotplug-with-bridge-support

Cheers

Eric
>
>
> Cheers,
> Gustavo
>


