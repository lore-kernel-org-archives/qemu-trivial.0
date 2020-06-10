Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jivY4-0001HP-2I
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2020 03:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jivY2-0001H6-DC
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 03:53:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35983
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jivY1-0005Tr-I9
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 03:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591775600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hh7yZ8HkBCxrFABw/Oh0ZZArusjq+ZaCkDkJbqjjcGM=;
 b=RqDZ/FUhVmr8/sLYhTenT57hChAdN1ggOgU8f/g9oEOCxZBXs23dzPani9fjCwGzxLoRq1
 4pYnBm72zGXaJUgrUUR8oQe0KIr3jX631vQSuDaC5ZECmeRkGMNM6+Utqcm4Avt1HFBCoi
 jYH81jtzNzbpL445v55zJFijZTmS8gg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-7zXYrk5WOE24HyNjd_eUoQ-1; Wed, 10 Jun 2020 03:53:19 -0400
X-MC-Unique: 7zXYrk5WOE24HyNjd_eUoQ-1
Received: by mail-wr1-f70.google.com with SMTP id h6so731354wrx.4
 for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2020 00:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Hh7yZ8HkBCxrFABw/Oh0ZZArusjq+ZaCkDkJbqjjcGM=;
 b=bql7OJZBTf6vR3wFhJzL/Dp2SZI1b+lCEgL0KSNUv425PtU3FZVs0o0jA11ZuRE3vp
 piaXWPt0QPDz8jEBiF/vjmIX7XM1n9mTmZysNpTN/W6VY/5OdHYeesJcT+qsGqoLZttn
 bpaA56aurvoc7L7WRM0+1v3TOE12zLbHBnmkwpxmtdm0JJhjtx0nR2+JsGXQK/HdB97S
 M0LrsSFzH4xSLj2JTNSGGdwBe+HvhqbckNvjnjw4Vm9ClzqWKdgY4DEooKNvN0UVcHC7
 wYFeh/eTL91E5aAzKbNmez3cygryU20/utMIBAh6QtaEDCV8tWWVLuU55tfR8LNqWqV8
 +j9Q==
X-Gm-Message-State: AOAM533sL/xCCkMEfZMMl0K6Lo4a5vbugAz4F/7+HAEsIgJyP3mdhVzS
 s6jtEWOBV/tkzaNXiMLIvF7YBuKJoebzEN5bEQzsxblWhkiGDU+bb1N6Fbh5w+8PhIjPA7gvv7i
 hJ52Wyz7K4lCvrnp4Qw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr1839671wmk.35.1591775597989; 
 Wed, 10 Jun 2020 00:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE5iaAocfPq7FQ7tS6D1ZTCrvu0MASGrVuA6ifY2Nsg0yMfoQ27hZzC48TwIepbSjk8Ag1zw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr1839650wmk.35.1591775597754; 
 Wed, 10 Jun 2020 00:53:17 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j5sm7089157wrm.57.2020.06.10.00.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 00:53:17 -0700 (PDT)
Subject: Re: [PATCH] hw/vfio/pci-quirks: Fix broken legacy IGD passthrough
To: Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20200610035102.20192-1-thuth@redhat.com>
 <706060db-46c4-2dee-d746-eba24e6b137d@redhat.com>
 <a8195883-fb78-0cc1-5e15-e100dcb807de@redhat.com>
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
Message-ID: <fd82556f-297d-6634-1bb2-37c4da415a50@redhat.com>
Date: Wed, 10 Jun 2020 09:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a8195883-fb78-0cc1-5e15-e100dcb807de@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 10 Jun 2020 07:53:22 -0000

On 6/10/20 9:50 AM, Thomas Huth wrote:
> On 10/06/2020 09.31, Philippe Mathieu-Daudé wrote:
>> On 6/10/20 5:51 AM, Thomas Huth wrote:
>>> The #ifdef CONFIG_VFIO_IGD in pci-quirks.c is not working since the
>>> required header config-devices.h is not included, so that the legacy
>>> IGD passthrough is currently broken. Let's include the right header
>>> to fix this issue.
>>>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1882784
>>> Fixes: 29d62771c81d8fd244a67c14a1d968c268d3fb19
>>>        ("hw/vfio: Move the IGD quirk code to a separate file")
>>
>> What about shorter tag?
>>
>> Fixes: 29d62771c81 ("vfio: Move the IGD quirk code to a separate file")
> 
> I always forget whether to use the short or the long version for
> "Fixes:" ... this can hopefully be fixed (if necessary) when the patch
> gets picked up.
> 
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/vfio/pci-quirks.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
>>> index f2155ddb1d..3158390db1 100644
>>> --- a/hw/vfio/pci-quirks.c
>>> +++ b/hw/vfio/pci-quirks.c
>>> @@ -11,6 +11,7 @@
>>>   */
>>>  
>>>  #include "qemu/osdep.h"
>>> +#include "config-devices.h"
>>
>> I've been wondering how we can avoid that mistake in the
>> future, but can find anything beside human review.
> 
> I think in the long term, we should include config-devices.h in osdep.h,
> just like config-host.h and config-target.h is already included there.
> Everything else is just too confusing. But then we should also add a
> mechanism to poison the switches from config-devices.h in common code...

We only need it for the files under hw/, right?

> thus this likely needs some work and discussion of the patch first, so I
> think we should go with this change to pci-quirks.c here first to get
> the regression fixed ASAP.

Sure, I'm not objecting that.

> 
>  Thomas
> 


