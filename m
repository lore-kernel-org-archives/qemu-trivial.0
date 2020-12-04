Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1klBTp-0003pI-4b
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2020 08:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBTn-0003p2-Br
 for qemu-trivial@nongnu.org; Fri, 04 Dec 2020 08:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klBTl-0000fp-P4
 for qemu-trivial@nongnu.org; Fri, 04 Dec 2020 08:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607089832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sn5rcDZl+QIXuATUZwzF5FMHKstgrHFxwSTzFxKZ+4=;
 b=T0Dodlw/siNFjcP09zgeO0vRWIB5UztbboLzBA8jC1wBohZ6gMKVJSlhXVT70R1fB6Z5dL
 8i/x++FGxn1V4V5dnG539l4x7ryhAevgdzFLr1Jftoe/kQXJtrcYXVkIxvkAA8fyIVbILY
 CJwTc9Fm5ZD2h87kXtv6TZ310f4/Hp0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Ncl7B5rJOTqkVCtaKDdGdg-1; Fri, 04 Dec 2020 08:50:31 -0500
X-MC-Unique: Ncl7B5rJOTqkVCtaKDdGdg-1
Received: by mail-ej1-f70.google.com with SMTP id dc13so2080703ejb.9
 for <qemu-trivial@nongnu.org>; Fri, 04 Dec 2020 05:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+sn5rcDZl+QIXuATUZwzF5FMHKstgrHFxwSTzFxKZ+4=;
 b=b+fCHsTWx6pfm1Pa2h1yAY3+8OXNrx0DVWnB+5t0VRfytzqTzsSmdjaua/0aOor6jx
 CLnpte//Ju07E2yh3oW82FXWH6gRC/3grTheVM+vx+seCikw3txGAE8j+tjPNT0Zm6L5
 jmR192nRTSQIqc9haUXqLhj3RdUpTS1pDmcu8XoxTFiAVa2ruZ3arzkLjzHHv33Ckh/k
 YZlpRDcENXWw8/74ygu/tMCng5OcVTBIIHLBPmf5VjI++qzO0xu7MFvRV8wV6zah9ZV0
 PMWb/01/FIJp8ry0gjqS4LzMZVIDuoeuuU9mRodpSKbX/7UWmHhTct6wjTXc6i2zG4GI
 uxJw==
X-Gm-Message-State: AOAM532OiOO5Wn7b97ZWuK6ZLtaOFrIGYyIhhOB7EeAXned7UdrdFloz
 ePXg/w/bQkUW54sbQGRHiROqf4WS6teiPAK00CM1qOwwBD6I1yZRF/mw67jIYCz2QbeKM5Hcb/A
 zxaKsksJjWw+5rx3f1g==
X-Received: by 2002:a05:6402:1646:: with SMTP id
 s6mr7585187edx.319.1607089829646; 
 Fri, 04 Dec 2020 05:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRY8+ymMqDTt5W71PFhqaSOhHRw5L2iB6E+SJ8m/N16FtcnbuLQTD5iiHj2VGhVEkSZApKQg==
X-Received: by 2002:a05:6402:1646:: with SMTP id
 s6mr7585167edx.319.1607089829479; 
 Fri, 04 Dec 2020 05:50:29 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id t26sm3115044eji.22.2020.12.04.05.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 05:50:28 -0800 (PST)
Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
To: ganqixin <ganqixin@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Cc: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
 <A5B86EC83C48EF4CB2BC58BEF3A2F496065C27CD@DGGEMI525-MBS.china.huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <babff5a6-4c78-7d44-4d97-d095e627639d@redhat.com>
Date: Fri, 4 Dec 2020 14:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <A5B86EC83C48EF4CB2BC58BEF3A2F496065C27CD@DGGEMI525-MBS.china.huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Dec 2020 13:50:35 -0000

On 11/17/20 2:37 PM, ganqixin wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé [mailto:philmd@redhat.com]
>> Sent: Monday, November 16, 2020 10:05 PM
>> To: ganqixin <ganqixin@huawei.com>; qemu-devel@nongnu.org;
>> qemu-trivial@nongnu.org; Marc-André Lureau
>> <marcandre.lureau@redhat.com>; thuth@redhat.com
>> Cc: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Zhanghailiang
>> <zhang.zhanghailiang@huawei.com>; Gerd Hoffmann <kraxel@redhat.com>;
>> Eduardo Habkost <ehabkost@redhat.com>
>> Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
>>
>> On 11/15/20 7:48 PM, Gan Qixin wrote:
>>> The category of the u2f-passthru device is not set, put it into the 'usb'
>>> category.
>>
>> I guess we discussed this with Thomas 1 or 2 years ago but I don't remember.
>> I think it was about using set_bits() so devices can appear in multiple
>> categories.
>>
>> Gerd, do you know what is the point of the "usb" category for management
>> apps? This is a bus accepting multiple better categorized devices (display,
>> storage, input, network, sound).
>>
>> Unrelated but multiple devices are related to SECURITY.
>> Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?
> 
> Hi, Philippe
> Thanks for your reply, but I'm not sure if it is appropriate to add a security category to place this device.
> (Maybe it's because I don't know much about these device, I haven't find many safety-related devices in 'misc' category or uncategorized devices)

What is the difference between 'misc' and 'uncategorized'?

> 
> Thanks,
> Gan Qixin
> 


