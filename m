Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGIYr-0007Tk-EA
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 05:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGIYq-0007T1-5R
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 05:08:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGIYn-0002D3-UJ
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 05:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599728884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPFIhvjjZZMrZtxtj2VIAvzFKsc4panpciSld1za2uc=;
 b=U/J9U379MDAAONCpSPUs61ypgHyX46t08TQPCD71J3PDclKr2JHBwytO7vZ6+oJYEnZlnD
 r//FtKt1sh2QKG8Z9wDTKfkIBCfSHPHVFynIfpcbDdWbUfCNlB/MlDCNmuyGty8/oUG6rL
 wGaHs8zLB3DoMoeTpeynorQYREvu+jQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-IIZwOOgyOF2I4aWigN_5KA-1; Thu, 10 Sep 2020 05:08:02 -0400
X-MC-Unique: IIZwOOgyOF2I4aWigN_5KA-1
Received: by mail-ed1-f70.google.com with SMTP id r19so2150813edq.12
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 02:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MPFIhvjjZZMrZtxtj2VIAvzFKsc4panpciSld1za2uc=;
 b=qVIdFnlyRCCmFuO3/n4dn7B/+uI5i0OqVYoCmRb12X6Stp4WE3LfQ8stQpFjvKImpq
 MmHh5TlSdBP8PLaYS6LCV175KikpPKsxtrw2Qw/Zh/Jv8B8uS+IYbyI2WAKCe8rHzjmw
 8SyqSh210HJK/zgbnFY8jxGe+142OAbgscScpQf382MdWsCEbR+LOWZJ4r+Bw7Bi+9oL
 TanCOMsu1SPp5ELK7x4jyx6Dag+v/JAuA8dnqkahGhRSmQp4Yb3+6agSAo4W/Rtad+/z
 QffcQhypxbzDUEXcwCUDnuK7kYUqhYWeuzcf/9ef+iI1qGbmsav9EXjrEYMqiybn+CHS
 4HAQ==
X-Gm-Message-State: AOAM533NiRjRsNjgeSaCcur0ztuM+niTFFqS6i4rfDLxRZDR46qrgtCN
 Wbfy+gnI8NeQ0iS0zo/1/U4Sgjad4TfngICeQYU2TyxZgp7VbUoEOKLoBpIhh8HnDWwDsNCuDZD
 I8cuMo2pvAw/tvw+VuA==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8264347edo.181.1599728881707; 
 Thu, 10 Sep 2020 02:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQY7ESTIgaZMy+kHSdTrJ7jizxujH24NZ0PRXz6BdORgw8v3h7QKACcLPwL7zPscN03XKOCg==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8264297edo.181.1599728881331; 
 Thu, 10 Sep 2020 02:08:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2744:1c91:fa55:fa01?
 ([2001:b07:6468:f312:2744:1c91:fa55:fa01])
 by smtp.gmail.com with ESMTPSA id lr14sm6284398ejb.0.2020.09.10.02.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 02:08:00 -0700 (PDT)
Subject: Re: [PATCH 6/6] target/i386/kvm: Rename host_tsx_blacklisted() as
 host_tsx_broken()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
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
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-7-philmd@redhat.com>
 <118a4cae-f220-8224-52ac-26a1795ac071@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cfc1c6be-8569-4150-6deb-136f930285ee@redhat.com>
Date: Thu, 10 Sep 2020 11:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <118a4cae-f220-8224-52ac-26a1795ac071@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 01:23:25
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
X-List-Received-Date: Thu, 10 Sep 2020 09:08:08 -0000

On 10/09/20 09:08, Thomas Huth wrote:
> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>> In order to use inclusive terminology, rename host_tsx_blacklisted()
>> as host_tsx_broken().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/i386/kvm.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index 205b68bc0ce..3d640a8decf 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -302,7 +302,7 @@ static int get_para_features(KVMState *s)
>>      return features;
>>  }
>>  
>> -static bool host_tsx_blacklisted(void)
>> +static bool host_tsx_broken(void)
>>  {
>>      int family, model, stepping;\
>>      char vendor[CPUID_VENDOR_SZ + 1];
>> @@ -408,7 +408,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>>      } else if (function == 6 && reg == R_EAX) {
>>          ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
>>      } else if (function == 7 && index == 0 && reg == R_EBX) {
>> -        if (host_tsx_blacklisted()) {
>> +        if (host_tsx_broken()) {
>>              ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>>          }
>>      } else if (function == 7 && index == 0 && reg == R_EDX) {
>>
> 
> Looking at commit 40e80ee4113, the term "broken" seems to be a good
> replacement here.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


