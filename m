Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGH2P-0004vp-3g
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 03:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGH2N-0004rD-9L
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:30:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48042
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGH2K-0005I0-Eb
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599723026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=O2/LZQ4SfG2uIyz2Sy8hmaRH8IBqBKbrVmAQjPIOGyA=;
 b=gj4EzwxDAVlhJnez2HCev9T2i69CWQNgLeXgpcrgqQtbBPUGvuGsl9oKAtLT2lnQ8P7sGC
 99Yn3x5KCCJMV+IBIOSrJksTjiPLgQyXamHtRUKFT5GT3id+RcNHPDN1e7CVP0cTiklpc3
 QWXr/mHqaHcYIsfqWVZg1gawL6fwgM4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-iZXmnzxEPRCbR87xPZaF3g-1; Thu, 10 Sep 2020 03:30:23 -0400
X-MC-Unique: iZXmnzxEPRCbR87xPZaF3g-1
Received: by mail-wr1-f69.google.com with SMTP id s8so1911652wrb.15
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 00:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O2/LZQ4SfG2uIyz2Sy8hmaRH8IBqBKbrVmAQjPIOGyA=;
 b=ZqaqaByyvhM1TC0HvQ/KXZjQdUPKMC4G7L5nX6ydSWXJIeUrYzED2XTuHmz20eCP92
 TL0foWG/zRlHtley8wuBnPPghBHC3lztDGhbxqQxD6bDKrpfwl0UBJP6l+ppt2x1AWde
 85vaQzC/Q4h4Bh9R3I5Wsh76+M1lpQ/1G4UJA83z34TTl1t5eaf6/BVMWh/Wl1+M/pfy
 mH2opvxgoK6mKuIpNpCkoyEadMwHPV3RWFYr69UvIA/fX2uHyNzPtJ+4MqRyB9Yhhr1x
 cXBe01/PPcENjx0WhfY6NjUJBB5htuItW0bcVroe6xMizmR+jC7wof7Ynmazb8ATJ3uQ
 gw0g==
X-Gm-Message-State: AOAM531GLKryHZZ44EmLyYhsJ58ifX3JmWDhitaqzXYbofOjIrj0S7Au
 l2xXQNHXWBYdq4tIifA22jALC4rS9SHP7Lrb20lg1RkUlmdiCfkQamBYC1GUaDDiUAL7N7jX2tE
 7bddt21f5xXkSpQwarw==
X-Received: by 2002:a1c:1f42:: with SMTP id f63mr6842965wmf.1.1599723022634;
 Thu, 10 Sep 2020 00:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa+AilB8jUcoDap4Dj/Q6aT+m/RhHroGA32WyZFmjvYzvEnjSYEsACVxXBGVSjK7VmvtWsJQ==
X-Received: by 2002:a1c:1f42:: with SMTP id f63mr6842931wmf.1.1599723022407;
 Thu, 10 Sep 2020 00:30:22 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b76sm2377151wme.45.2020.09.10.00.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 00:30:21 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
 <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8c883b22-c63a-9c61-8dd5-14f26f5e5237@redhat.com>
Date: Thu, 10 Sep 2020 09:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 01:44:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 07:30:31 -0000

On 9/10/20 9:15 AM, Thomas Huth wrote:
> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>> In order to use inclusive terminology, rename "blackhole"
>> as "(memory)hole".
> 
> A black hole is a well-known astronomical term, which is simply named
> that way since it absorbes all light. I doubt that anybody could get
> upset by this term?

Let's put some light in our address space then :)

But you right, the NASA does not consider renaming this one:
https://www.space.com/nasa-stops-racist-nicknames-cosmic-objects.html

Note than for electronic busses design, master/slave are also
well-known terms, but they might be considered offensive.
I changed this one too because I'm not sure about its offensiveness
threshold.

> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/pci-host/q35.h |  4 ++--
>>  hw/pci-host/q35.c         | 38 +++++++++++++++++++-------------------
>>  tests/qtest/q35-test.c    |  2 +-
>>  3 files changed, 22 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
>> index 070305f83df..0fb90aca18b 100644
>> --- a/include/hw/pci-host/q35.h
>> +++ b/include/hw/pci-host/q35.h
>> @@ -48,8 +48,8 @@ typedef struct MCHPCIState {
>>      PAMMemoryRegion pam_regions[13];
>>      MemoryRegion smram_region, open_high_smram;
>>      MemoryRegion smram, low_smram, high_smram;
>> -    MemoryRegion tseg_blackhole, tseg_window;
>> -    MemoryRegion smbase_blackhole, smbase_window;
>> +    MemoryRegion tseg_hole, tseg_window;
>> +    MemoryRegion smbase_hole, smbase_window;
> 
> Maybe rather use smbase_memhole and tseg_memhole?

OK.

> 
>  Thomas
> 


