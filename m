Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otOhX-0007we-9u
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 02:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOhV-0007t2-BW
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 02:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otOhT-0000Wi-Lz
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 02:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668152620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=We8qUyneTVx8BlgfbXLKndxifkV3yJqHNuInsSpVb/U=;
 b=i7IxoyawZzWdAFjzQVQwRrMImAABJ0HooSnxMZyVU7kaUYQSQ/pK2V4NeCq2QOsILsSZY3
 PTaLL9tSzhim6oYu5NhDwuA6GPvvoxREBeODPlzEKmMMGwdo+RAyUsiWWOO4+gZjJaNa7W
 7EUhXP4xkUlEZWYtuqNBqe2iLWfvMXs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-lZSDQhSWOc23ZQ57xkkvkw-1; Fri, 11 Nov 2022 02:43:38 -0500
X-MC-Unique: lZSDQhSWOc23ZQ57xkkvkw-1
Received: by mail-qv1-f71.google.com with SMTP id
 b2-20020a0cfe62000000b004bbfb15297dso3205813qvv.19
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 23:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=We8qUyneTVx8BlgfbXLKndxifkV3yJqHNuInsSpVb/U=;
 b=P4uC91EOWm9P4zsQiKpgKnnim0rAnVkDo9tiNEnxqqDVgFlrTd4q5VRS3qHF6p1c53
 10Sl9Zh+1GULelUxIX+jncAU8XPLhHWVPpf/cY8Wp9S0gXKQrr6deYJTBQgNSaOYg47o
 1w+ridsRGGmazKgnH15oares5pnN1GPDlW1Nrztzxqb6X+VnJrcdzuKXaCtXDcLm+q8c
 9Po865femQIMt+yg03eo7yx3bUwwfSODHtATxwvLAD/iSNHcz98sEGmjwlzMvWz/kY/w
 IZ4F+IYbb1FkYugKJg69pF3e1uK2RMOLkYaGMn85BQTSzbMp8zMxEj4R0d93alZhfTnT
 qWSQ==
X-Gm-Message-State: ANoB5pkXA3xgXk29l5Ot0bHazijc7dLthAT+aNSFgiFXf/yJEl1eodiA
 B7SvbCuF6Cz32/6x7RMu/zYbIgodw2UqwZoSk4gJf0jVdN3uQbQaEZ+khgT/K0WeSV0xVnrAehK
 v45DC2Hj7ieI+N6rNJg==
X-Received: by 2002:a05:620a:2147:b0:6fb:4089:9ce5 with SMTP id
 m7-20020a05620a214700b006fb40899ce5mr189806qkm.137.1668152618572; 
 Thu, 10 Nov 2022 23:43:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7sol+hJLdLIuLjYlOWKRQPJrV6gr+3svs2hJpeNt8vPc6aO2YdVhcJR+7cbRTEuMTzUjedRA==
X-Received: by 2002:a05:620a:2147:b0:6fb:4089:9ce5 with SMTP id
 m7-20020a05620a214700b006fb40899ce5mr189799qkm.137.1668152618342; 
 Thu, 10 Nov 2022 23:43:38 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k1-20020ac81401000000b0035cf31005e2sm878439qtj.73.2022.11.10.23.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:43:37 -0800 (PST)
Message-ID: <37ed2651-936b-3ce3-2df4-f5a151e95971@redhat.com>
Date: Fri, 11 Nov 2022 08:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] libdecnumber/dpd/decimal64: Fix compiler warning from
 Clang 15
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, mrezanin@redhat.com,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221110131112.104283-1-thuth@redhat.com>
 <eb8745ad-8075-c6ea-6fac-4437530c63b4@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <eb8745ad-8075-c6ea-6fac-4437530c63b4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 11 Nov 2022 07:43:45 -0000

On 10/11/2022 21.00, Philippe Mathieu-Daudé wrote:
> On 10/11/22 14:11, Thomas Huth wrote:
>> Clang 15 from Fedora 37 complains:
>>
>>   ../libdecnumber/dpd/decimal64.c:620:8: error: variable 'n' set but
>>   not used [-Werror,-Wunused-but-set-variable]
>>     Int  n;                     /* output bunch counter */
>>          ^
>>   1 error generated.
>>
>> Remove the unused variable to silence the compiler warning.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   libdecnumber/dpd/decimal64.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/libdecnumber/dpd/decimal64.c b/libdecnumber/dpd/decimal64.c
>> index 4816176410..290dbe8177 100644
>> --- a/libdecnumber/dpd/decimal64.c
>> +++ b/libdecnumber/dpd/decimal64.c
>> @@ -617,7 +617,6 @@ static const uInt multies[]={131073, 26215, 5243, 
>> 1049, 210};
>>   #endif
>>   void decDigitsToDPD(const decNumber *dn, uInt *targ, Int shift) {
>>     Int  cut;              /* work */
>> -  Int  n;              /* output bunch counter */
>>     Int  digits=dn->digits;     /* digit countdown */
>>     uInt dpd;              /* densely packed decimal value */
>>     uInt bin;              /* binary value 0-999 */
>> @@ -676,7 +675,7 @@ void decDigitsToDPD(const decNumber *dn, uInt *targ, 
>> Int shift) {
>>       bin=0;               /* [keep compiler quiet] */
>>     #endif
>> -  for(n=0; digits>0; n++) {       /* each output bunch */
>> +  while (digits > 0) {             /* each output bunch */
>>       #if DECDPUN==3           /* fast path, 3-at-a-time */
>>         bin=*inu;               /* 3 digits ready for convert */
>>         digits-=3;           /* [may go negative] */
> 
> Or we could we backport the upstream fix :)
> 
> https://gcc.gnu.org/git/?p=gcc.git;a=blobdiff;f=libdecnumber/dpd/decimal64.c;h=f72c5730ac3b473e2c334f604e7e52da9711fa72;hp=269eaecade5115a62e979897742cd5decec0681e;hb=8a79685989bff33f479d0ac2df0e18d55d3ba78b;hpb=e1d1842b5432472330384d1523bb3c3132c4fea0 

I did not look on that code on purpose - it's licensed under the GPLv3, so 
we should not mix that back into our GPLv2 version.

  Thomas


