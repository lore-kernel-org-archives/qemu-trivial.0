Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j71BT-00043r-24
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 13:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j71BQ-0003xA-5P
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 13:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j71BN-0001AS-TB
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 13:13:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j71BN-00018t-Ik
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 13:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582740796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dF4AphZnyYCsK5rvScAvOr8vc+ZLjYYMku9g6SdRFM=;
 b=IoZJpjnkrTkuUfimyCk5C2Dt9btzxMSo4RnYV2K+bM5XcmIeiNUEERJOlFQmH2VTYNvC6L
 P/QJzrv34IO81pFUaghYZV6PsYvsroeXFvJo262yz0ioosc+/sQW5/dBZ9dg854OLRAvYo
 GZOdVIG+FVOzrxkXoAVhf5Kc8J1LcRw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-qLlW4P9hPE-03N7H98EaMA-1; Wed, 26 Feb 2020 13:13:14 -0500
X-MC-Unique: qLlW4P9hPE-03N7H98EaMA-1
Received: by mail-wr1-f72.google.com with SMTP id y28so94989wrd.23
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 10:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFkXNEV3DEBhDV7T1m4SavDBYV06a90sP6zI76AthVQ=;
 b=nkd+JR8moF1pM/oR3gT3Tvu/EcJ7UUnMvuK8RXrJ9wiWif1R7DA47c0mcVjOCazjyv
 vjfZ3PE5Xups3D1MMDykunyXWUL7JcR8IlwaKIjWYKvzrdNS3YLIpx/coHYonyaedyrm
 PaPJJqPzmAETwksUJbnl7GJiPZt1EWlSpTvFOOpjfPcAwBbeW1ulWF28Cs+L8+JGLAef
 PYeupIaVWBs6d0ym7ql8dBzi4e2b2n6oiF7V6uWELi5EmHBVVP+eyue0e8/7d6FvzlHg
 HZ3fKWcRSyMDH96Nqa4rFZRE3UWaiijdnYhrKUW/laaQ+RitJfyRibhRP6TjGz9yRtO8
 hJ9Q==
X-Gm-Message-State: APjAAAWGBgZzrZhs+j0GuDVDp2Z61t20pYqyfoLw679K+FPYXzCQQoEV
 uyzmdOFdiFCq6Pb+jBBko2uZzviGNnyNOckE9MKJg6/0wivUTy2V5LB8frskRkSaY6kwpWFe+IP
 e+sctJnf1Ik5W7l4BrA==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr133225wmg.154.1582740793252; 
 Wed, 26 Feb 2020 10:13:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsEsKoPjDZMRdNh3cf0y9Kph6onilB0Gqit/d3oSwKrm0buyx/mTAQVYnFBrHvDmMa/2zmQA==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr133204wmg.154.1582740793002; 
 Wed, 26 Feb 2020 10:13:13 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j11sm3912193wmi.3.2020.02.26.10.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 10:13:12 -0800 (PST)
Subject: Re: [PATCH] hw/i386/intel_iommu: Simplify vtd_find_as_from_bus_num()
 logic
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Liu Yi L <yi.l.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Yi Sun <yi.y.sun@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eric Auger <eric.auger@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20200226174956.17018-1-philmd@redhat.com>
 <20200226180150.GF140200@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a04e3bb-f0f0-c263-9db4-a1b01cbbcb44@redhat.com>
Date: Wed, 26 Feb 2020 19:13:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226180150.GF140200@xz-x1>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Wed, 26 Feb 2020 18:13:21 -0000

On 2/26/20 7:01 PM, Peter Xu wrote:
> On Wed, Feb 26, 2020 at 06:49:56PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Reorder the if() statement to simplify the function.
>> This avoid bugs like the one fixed by commit a2e1cd41ccf.
>=20
> This seems to hint that this patch fixes a problem, but it's pure
> refactoring, right?

Pure refactoring yes, I meant: If the code was written this way, we=20
wouldn't had the bug fixed by a2e1cd41ccf.

>=20
> And I'm not sure about git-diff -w or so, but... I can't apply such a
> patch cleanly using "git am".  Are you sure a patch like this would
> work (without space change information)?

Ah sorry I didn't think of that (I really thought git-am would apply it).

>=20
> Thanks,
>=20
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   hw/i386/intel_iommu.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index 6258c58ac9..e720a8939c 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -987,14 +987,17 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte,=
 uint32_t level)
>>   static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bu=
s_num)
>>   {
>>       VTDBus *vtd_bus =3D s->vtd_as_by_bus_num[bus_num];
>> -    if (!vtd_bus) {
>> +    GHashTableIter iter;
>> +
>> +    if (vtd_bus) {
>> +        return vtd_bus;
>> +    }
>> +
>>       /*
>>        * Iterate over the registered buses to find the one which
>>        * currently hold this bus number, and update the bus_num
>>        * lookup table:
>>        */
>> -        GHashTableIter iter;
>> -
>>       g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
>>       while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
>>           if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
>> @@ -1002,9 +1005,8 @@ static VTDBus *vtd_find_as_from_bus_num(IntelIOMMU=
State *s, uint8_t bus_num)
>>               return vtd_bus;
>>           }
>>       }
>> -        vtd_bus =3D NULL;
>> -    }
>> -    return vtd_bus;
>> +
>> +    return NULL;
>>   }
>>  =20
>>   /* Given the @iova, get relevant @slptep. @slpte_level will be the las=
t level
>> --=20
>> 2.21.1
>>
>=20


