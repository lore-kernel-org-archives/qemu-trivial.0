Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO0eM-0007Vv-KR
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 11:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO0eI-0007S8-Ha
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO0eD-0003DM-Oj
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 11:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601566652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ylEXgl4yUI/EHL23DZ/WWkmoo/HeckrVbLG15QKKjvY=;
 b=STL+83kiGDdAw11CZx1jGpGiXJav4c0EU594E3OXVUUe+m/2g0COoUJnpkrEsQdX2vY0E5
 P9XPlyhRDfz2Q/aBv+XbT1dSl9JfoKiCUiy9ky6TdWeT/WY03f13KxHGjHboSC52+LwUJT
 EYrNZ6lUHM/eCmaTvobvWDvoP8T9dpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-ItawT6ulPiaVGl0pLFwpAQ-1; Thu, 01 Oct 2020 11:37:30 -0400
X-MC-Unique: ItawT6ulPiaVGl0pLFwpAQ-1
Received: by mail-wm1-f72.google.com with SMTP id 73so1317391wma.5
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 08:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ylEXgl4yUI/EHL23DZ/WWkmoo/HeckrVbLG15QKKjvY=;
 b=E8oQ4OJ6mrMbWouvzrzTcVTO2BeKpxjYgwCW/udgboY2ZptEQtoADvQv5waMXYy51p
 MYznuEtCfz61VCt4foKXyB4nEXmM/yJtdg5lHFo7tL2jw6iKUczwpNggZzdJ+iuDfb/j
 qoNopqCuRDVxcTdYB8CS5PjtB63/i/iogRHWYVTOdL1CNX2lKmx5boHyKdIHMv5P7Lws
 rawv57BU7oSp81rkLCN+NaKfoC5G/BiLu/rtJq6rEpEGnTIyrarTP3a7eGpmmCtnks3w
 oMFJW2qSO1o7/MBN13ZZgZnFl03k5pY268RI3jq2I28m8EWWYZOZWh8tR9HLcMOABDPy
 mdNw==
X-Gm-Message-State: AOAM530jWumh7m+qKSvweYeZphBdQptP7rdeq8MDt8KL6LfWqUn5H+9A
 Mw4Fnvk7Yh0sxlfchbKPAzlzExRtWe48R4gGZOnrBVF/WwRoGcb42MH2IQ7I7x0gEb3htI6IKWe
 R2RjXJPt2beiTaEaR+g==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr86295wmj.102.1601566649210;
 Thu, 01 Oct 2020 08:37:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxGOmvJpHy6noxCLyoKiY5ycaQj0o47Ou88Tfl4CAsrCPyjLpsy19rmBMoLusSFJfkDhBZnQ==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr86254wmj.102.1601566648883;
 Thu, 01 Oct 2020 08:37:28 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id z15sm8376143wrv.94.2020.10.01.08.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 08:37:28 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] target/i386: Restrict X86CPUFeatureWord to X86
 targets
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20201001144152.1555659-1-philmd@redhat.com>
 <20201001144152.1555659-4-philmd@redhat.com>
 <20201001152905.GC3717385@habkost.net>
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
Message-ID: <27bf4922-545e-e7e5-29fa-1dd80283e41a@redhat.com>
Date: Thu, 1 Oct 2020 17:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201001152905.GC3717385@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 01 Oct 2020 15:37:40 -0000

On 10/1/20 5:29 PM, Eduardo Habkost wrote:
> On Thu, Oct 01, 2020 at 04:41:52PM +0200, Philippe Mathieu-Daudé wrote:
>> Only qemu-system-FOO and qemu-storage-daemon provide QMP
>> monitors, therefore such declarations and definitions are
>> irrelevant for user-mode emulation.
>>
>> Restricting the x86-specific commands to machine-target.json
>> pulls less QAPI-generated code into user-mode.
> 
> Is this still true without "qapi: Restrict code generated for
> user-mode"?

The correct description so far is:

"Restricting the x86-specific commands to machine-target.json
pulls less QAPI-generated code into non-x86 targets.", as of
this commit the X86CPURegister32 definitions are not built in
the other ARM/S390/PPC/... targets.

I still have some hope "qapi: Restrict code generated for user-mode"
get merged some day.

> 
> Markus, Eric: what's the difference between machine.json and
> machine-target.json? commit 7f7b4e7abef4 ("qapi: Split
> machine-target.json off target.json and misc.json") explains what
> but not why.
> 
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Why the visit_type_X86CPUFeatureWordInfoList() stub was required
> in v3, but not in this version?

Because it is ifdef'ed out in the previous (new) patch:
"target/i386/cpu: Restrict some of feature-words uses to system-mode".

> 
> 
>> ---
>>  qapi/machine-target.json | 45 ++++++++++++++++++++++++++++++++++++++++
>>  qapi/machine.json        | 42 -------------------------------------
>>  target/i386/cpu.c        |  2 +-
>>  3 files changed, 46 insertions(+), 43 deletions(-)
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index 698850cc78..b4d769a53b 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -4,6 +4,51 @@
>>  # This work is licensed under the terms of the GNU GPL, version 2 or later.
>>  # See the COPYING file in the top-level directory.
>>  
>> +##
>> +# @X86CPURegister32:
>> +#
>> +# A X86 32-bit register
>> +#
>> +# Since: 1.5
>> +##
>> +{ 'enum': 'X86CPURegister32',
>> +  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ],
>> +  'if': 'defined(TARGET_I386)' }
>> +
>> +##
>> +# @X86CPUFeatureWordInfo:
>> +#
>> +# Information about a X86 CPU feature word
>> +#
>> +# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
>> +#
>> +# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
>> +#                   feature word
>> +#
>> +# @cpuid-register: Output register containing the feature bits
>> +#
>> +# @features: value of output register, containing the feature bits
>> +#
>> +# Since: 1.5
>> +##
>> +{ 'struct': 'X86CPUFeatureWordInfo',
>> +  'data': { 'cpuid-input-eax': 'int',
>> +            '*cpuid-input-ecx': 'int',
>> +            'cpuid-register': 'X86CPURegister32',
>> +            'features': 'int' },
>> +  'if': 'defined(TARGET_I386)' }
>> +
>> +##
>> +# @DummyForceArrays:
>> +#
>> +# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
>> +#
>> +# Since: 2.5
>> +##
>> +{ 'struct': 'DummyForceArrays',
>> +  'data': { 'unused': ['X86CPUFeatureWordInfo'] },
>> +  'if': 'defined(TARGET_I386)' }
>> +
>>  ##
>>  # @CpuModelInfo:
>>  #
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 756dacb06f..995e972858 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -574,48 +574,6 @@
>>     'dst': 'uint16',
>>     'val': 'uint8' }}
>>  
>> -##
>> -# @X86CPURegister32:
>> -#
>> -# A X86 32-bit register
>> -#
>> -# Since: 1.5
>> -##
>> -{ 'enum': 'X86CPURegister32',
>> -  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
>> -
>> -##
>> -# @X86CPUFeatureWordInfo:
>> -#
>> -# Information about a X86 CPU feature word
>> -#
>> -# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
>> -#
>> -# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
>> -#                   feature word
>> -#
>> -# @cpuid-register: Output register containing the feature bits
>> -#
>> -# @features: value of output register, containing the feature bits
>> -#
>> -# Since: 1.5
>> -##
>> -{ 'struct': 'X86CPUFeatureWordInfo',
>> -  'data': { 'cpuid-input-eax': 'int',
>> -            '*cpuid-input-ecx': 'int',
>> -            'cpuid-register': 'X86CPURegister32',
>> -            'features': 'int' } }
>> -
>> -##
>> -# @DummyForceArrays:
>> -#
>> -# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
>> -#
>> -# Since: 2.5
>> -##
>> -{ 'struct': 'DummyForceArrays',
>> -  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
>> -
>>  ##
>>  # @NumaCpuOptions:
>>  #
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 9f72342506..848a65ded2 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -38,7 +38,7 @@
>>  #include "qemu/option.h"
>>  #include "qemu/config-file.h"
>>  #include "qapi/error.h"
>> -#include "qapi/qapi-visit-machine.h"
>> +#include "qapi/qapi-visit-machine-target.h"
>>  #include "qapi/qapi-visit-run-state.h"
>>  #include "qapi/qmp/qdict.h"
>>  #include "qapi/qmp/qerror.h"
>> -- 
>> 2.26.2
>>
> 


