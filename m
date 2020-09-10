Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGNuB-0000Bi-PN
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 10:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGNu9-0000AX-Va
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 10:50:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42445
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGNu8-0002J8-7y
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 10:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599749427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lC4J9StLd/QW0XR2r3AbCJXGSYpkjo/xDz5tK2/XdIA=;
 b=cfDzy4Rn9wY3SYUFs1rCz3eODy1b9DcClj1yek0J6veTVyiw2DlKSSHouNgym4ZUpViJYW
 iNW9XQyKQKpTuzPhX9v/9+V0A1TmQIk9vch3tV53qbEg4+Zb3diSraMPCZ2BhUM2RdYQl0
 tby4eT6tvyVFEw08OMDr3ZoWmnN1kPo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-jZUdprp7PE6it-txYx7zdA-1; Thu, 10 Sep 2020 10:50:26 -0400
X-MC-Unique: jZUdprp7PE6it-txYx7zdA-1
Received: by mail-wr1-f69.google.com with SMTP id g6so2353134wrv.3
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 07:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lC4J9StLd/QW0XR2r3AbCJXGSYpkjo/xDz5tK2/XdIA=;
 b=YON1FhMhbMzIJCbcqHhjENz/suN9i743zhsabqwLNAyfY7jCa81pvmCa/scK7Dhlom
 xset46ehppzE2ZrVeDwErOrFclN4aUaDuOQMW/SUqJ96RqWJWO4JstHWHQRkfoE5yhwV
 En3Gm8owkPFQRlhAlWzCtWtMDKKZMvHu0ZQdasbkx8F8GNz2eqXjfjdmafJlXWbNVVfP
 KwWC13TKReyULw2H38EBzXbm6wdozPBvEW+3j0scn9PbjFwPj1Bg6im8kwUXOqk2/g0P
 l1qSx2CPB4ShMwrVlDvlpvtSayFCCp51N0DWfvSe1nIVBDF5c6sPCXAMuI6ha0R1Oc2v
 y4Nw==
X-Gm-Message-State: AOAM533Mw4eNd8yS4PMNV63CH5NJw4CmprMwMNGMN5xhB+CarBwVSU2v
 M5NflMpLZL4RcyvtG4H2C9Ovg7UzJ2sSAHh/yvov8Qp4xi5q1EeG70duDim8z/fg6T/xQrR7xSE
 Qwgf7OyUTMesySUYN7g==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr407293wma.18.1599749424820;
 Thu, 10 Sep 2020 07:50:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7b2Ad+eRTDPyI1AbnaWFgLPT211RlKHRQzAEV4rqOLYg2qtaNKsbVuU4iUkur8RonoJFeoQ==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr407270wma.18.1599749424607;
 Thu, 10 Sep 2020 07:50:24 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id z13sm9452327wro.97.2020.09.10.07.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:50:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/timer/hpet: Remove dead code
To: Li Qiang <liq3ea@gmail.com>
Cc: Qemu Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
 <20200910135852.516809-2-philmd@redhat.com>
 <CAKXe6SLhDWvWU_D-87sb0sHfNOO9dkPPS4EiVjuXuHLiCbGKgw@mail.gmail.com>
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
Message-ID: <ad2e06b8-fe5e-628a-7145-e724c85ccf6f@redhat.com>
Date: Thu, 10 Sep 2020 16:50:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SLhDWvWU_D-87sb0sHfNOO9dkPPS4EiVjuXuHLiCbGKgw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:35:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 10 Sep 2020 14:50:30 -0000

On 9/10/20 4:46 PM, Li Qiang wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> 于2020年9月10日周四 下午10:01写道：
>>
>> This code was never compiled/used, remove it.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/timer/hpet.c | 14 --------------
>>  1 file changed, 14 deletions(-)
>>
>> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
>> index 380acfa7c8a..b683f64f1d3 100644
>> --- a/hw/timer/hpet.c
>> +++ b/hw/timer/hpet.c
> 
> Maybe we also remove the
> "//#define HPET_DEBUG"
> in the head of this file?

We need to convert the debug calls to trace events first.

> 
> Thanks,
> Li Qiang
> 
>> @@ -416,20 +416,6 @@ static void hpet_del_timer(HPETTimer *t)
>>      update_irq(t, 0);
>>  }
>>
>> -#ifdef HPET_DEBUG
>> -static uint32_t hpet_ram_readb(void *opaque, hwaddr addr)
>> -{
>> -    printf("qemu: hpet_read b at %" PRIx64 "\n", addr);
>> -    return 0;
>> -}
>> -
>> -static uint32_t hpet_ram_readw(void *opaque, hwaddr addr)
>> -{
>> -    printf("qemu: hpet_read w at %" PRIx64 "\n", addr);
>> -    return 0;
>> -}
>> -#endif
>> -
>>  static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
>>                                unsigned size)
>>  {
>> --
>> 2.26.2
>>
>>
> 


