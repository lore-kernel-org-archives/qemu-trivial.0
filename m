Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGKsE-0008GC-9g
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 07:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGKsD-0008FG-I1
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 07:36:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30969
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGKsB-0002w5-T2
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 07:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599737770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g68Ln2Ykm0AsGzDT36RNb3rZ1ltN22ArPGT5SDWCbBk=;
 b=JpRk7yyJrz17Vd9gBPLGBk5oGKc7sBRo9J3X5wuX73kMFh2+UKBz62ckDQ21fhnwo/Tqfo
 G2a8TPO6CGrfKtPTG+rxhom3A1LGCCDxSrw1PZkCZKWfHsahUnUj0sSg3UzCKSy48g8Jw8
 RZQ1XaOo+AP1HYiDx8FCCbBWFHfYCq4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-DnYDCl7WMgqtE6Kq-z-jwg-1; Thu, 10 Sep 2020 07:36:06 -0400
X-MC-Unique: DnYDCl7WMgqtE6Kq-z-jwg-1
Received: by mail-ej1-f69.google.com with SMTP id lx11so2584470ejb.19
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 04:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g68Ln2Ykm0AsGzDT36RNb3rZ1ltN22ArPGT5SDWCbBk=;
 b=Jb7xOB+w2AAmmRdVujdMepxRlOaNWWWXeoo8Corhr9Bx7r+BnNBqXkqR2Z+5gK969H
 okW8r9l2+3V4kxl8BIRG+6XlIBA7DA+QI6oo+SQ1aaBeob/74napa3mxgEM1WBXIvlBH
 MHzWDBWr8dIZMmtPxh2rJX5IaQHoQQUFwiQevkHcli8PMW7ZU5xE2ehfF7lt3AHu2pVT
 xmrYIf7Dz985yKw+sDfNOaYue05TAhSc1O89vR/2bsJWu82H8dhFxOlpaATBs8NXi3sH
 sMLfR/ATo94GuOGca0hql4w0Ik9e21fdnNtJC5+xbCdj4B32HsY4jDCnooBnJ7rTl+g8
 bjIw==
X-Gm-Message-State: AOAM531bWxCDrvi1+PL2pudwfSYYZqjGXIb5kojoXz2EvXU6/aS0kUXJ
 WZ+WPbRgzD2k5X96R0zOA5ZcOWI5h4Bl0pjY0xfk9n1WEPyf/rgT1+WpzOTcb4fr1paX0KJixec
 yqst1XMKn2n3trxYhVg==
X-Received: by 2002:a05:6402:70f:: with SMTP id
 w15mr9029433edx.202.1599737765679; 
 Thu, 10 Sep 2020 04:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9MRcEWHvXnnWCE/19WdyGtANc2GFua6jmtkInHUN59/gDC3dQTZo6HFVJY56Lsok1NEcSrw==
X-Received: by 2002:a05:6402:70f:: with SMTP id
 w15mr9029399edx.202.1599737765385; 
 Thu, 10 Sep 2020 04:36:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:68f6:5b4d:4ee8:10c7?
 ([2001:b07:6468:f312:68f6:5b4d:4ee8:10c7])
 by smtp.gmail.com with ESMTPSA id m6sm6450319ejb.85.2020.09.10.04.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 04:36:04 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
 <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
 <20200910091454.GE1083348@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6af444a-fb0b-ed98-60df-28ea67d6abe4@redhat.com>
Date: Thu, 10 Sep 2020 13:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910091454.GE1083348@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 10 Sep 2020 11:36:17 -0000

On 10/09/20 11:14, Daniel P. Berrangé wrote:
> On Thu, Sep 10, 2020 at 09:15:02AM +0200, Thomas Huth wrote:
>> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>>> In order to use inclusive terminology, rename "blackhole"
>>> as "(memory)hole".
>>
>> A black hole is a well-known astronomical term, which is simply named
>> that way since it absorbes all light. I doubt that anybody could get
>> upset by this term?
> 
> In this particular case I think the change is the right thing to do
> simply because the astronomical analogy is not adding any value in
> understanding. Calling it a "memoryhole" is more descriptive in what
> is actually is.

Absolutely not.  A memory hole ("memoryhole" is not an English word)
would be easily confused with a hole in the memory map, which this is
not.  For example on x86 systems the "PCI hole" is a hole between the
end of low RAM and the bottom of the ROM that is reserved for memory
mapped devices.  The "PCI hole" is explicitly left free by board code so
that the OS can put PCI BARs in there.

These black hole MemoryRegions, instead, are present in the memory map
and their purpose is to absorbs all writes and only sends back zeros,
hiding the contents of SMRAM and TSEG from the guest.  Just like a black
hole they are "something that exists".

Therefore, both "memory hole" and "hole" as in Philippe's patch are
worse than the astronomical metaphor.

Paolo

>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  include/hw/pci-host/q35.h |  4 ++--
>>>  hw/pci-host/q35.c         | 38 +++++++++++++++++++-------------------
>>>  tests/qtest/q35-test.c    |  2 +-
>>>  3 files changed, 22 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
>>> index 070305f83df..0fb90aca18b 100644
>>> --- a/include/hw/pci-host/q35.h
>>> +++ b/include/hw/pci-host/q35.h
>>> @@ -48,8 +48,8 @@ typedef struct MCHPCIState {
>>>      PAMMemoryRegion pam_regions[13];
>>>      MemoryRegion smram_region, open_high_smram;
>>>      MemoryRegion smram, low_smram, high_smram;
>>> -    MemoryRegion tseg_blackhole, tseg_window;
>>> -    MemoryRegion smbase_blackhole, smbase_window;
>>> +    MemoryRegion tseg_hole, tseg_window;
>>> +    MemoryRegion smbase_hole, smbase_window;
>>
>> Maybe rather use smbase_memhole and tseg_memhole?
>>
>>  Thomas
>>
>>
> 
> Regards,
> Daniel
> 


