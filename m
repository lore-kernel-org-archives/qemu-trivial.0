Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgUVS-0007hz-E9
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 10:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgUVQ-0007gE-Tg
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 10:36:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51258
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgUVP-0005ln-Jt
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 10:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591194994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jShcf6r14QddKNgr+dD5dhGl+o2Cd2OLCwje7MJIWkg=;
 b=Gb0zedxMmui0P1e8bPpdQ3xZKv3lq+6qhrXxgYVwOVLEDaeq67rbEvh3Sx2rVNmtMfTB7b
 DCcAFtPgLIBVBizxsLoKSBxeEBxWC8QDxHSeFtXZmeQigRk/hSk1pgiO6tDjr8OUKdT04T
 ckTUWYYM9gOcSnWYKjPeymHj656GWHg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-Hfpq0X4TMPu6Tu1zPb4P9A-1; Wed, 03 Jun 2020 10:36:31 -0400
X-MC-Unique: Hfpq0X4TMPu6Tu1zPb4P9A-1
Received: by mail-wm1-f72.google.com with SMTP id s15so941438wmc.8
 for <qemu-trivial@nongnu.org>; Wed, 03 Jun 2020 07:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jShcf6r14QddKNgr+dD5dhGl+o2Cd2OLCwje7MJIWkg=;
 b=iOeYPVyRBfrunPAq0cUY8offAz9XxRhABpIJBA4NldF0PbBmU1kFjaIzgJTuq94p3g
 0jHJgMo6IeogvrNcZHnyzTEPOS8VHtokXeACRzPUEFng1g/OBrtlTkSDod8WnEETlwhu
 urg1DNz1QmdcJWL/806t5+6dacPg30elolXq0F85pBmP5Rm1terBpiV9c5Zz2p94Ir8A
 k6U0RjAkbHz2qGcmRhHta73wy/+KXULgrJwogW/raAGV3J+7yAKnskpEp4i51NAird3s
 5dm/jW4yuTyLXpiOTH95m4i9GrOH2xrcCKVbs1+z2sUGjGgF8I7w1Oh32K7jflj6K5J0
 NbKA==
X-Gm-Message-State: AOAM53365dgXlbVbVaU7zO/wsw5wJsjWM/+7B0wQtwsmYwBhKvHwF2Xx
 0zFGao1yaSW+itQ3my/12fFALZuTb/XtkZTGgiR3av7XCfeNGhZ+XMyZ8baYotLmYVoSXjVj1zj
 pgFVmq6FhxrdZ9cIZXw==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr22074364wrh.13.1591194990107; 
 Wed, 03 Jun 2020 07:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPutnxG1HHD8y19dFBrP6wucJatLWt1wRleaIoIPFcdgVbjmkKG2Ls4DhLT5gM07jYZ24Ntw==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr22074348wrh.13.1591194989915; 
 Wed, 03 Jun 2020 07:36:29 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t8sm3139950wmi.46.2020.06.03.07.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 07:36:29 -0700 (PDT)
Subject: Re: [PATCH] util/oslib-posix : qemu_init_exec_dir implementation for
 MacOS
To: Justin Hibbits <chmeeedalf@gmail.com>
Cc: David CARLIER <devnexen@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, pbonzini@redhat.com,
 John Arbuckle <programmingkidx@gmail.com>,
 Mikhail Gusarov <dottedmag@dottedmag.net>, Izik Eidus <izik@veertu.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <CA+XhMqwH6btbKFD0Ei47e+QHN2eBPG5H2PTS92MAje2Tij4Y=A@mail.gmail.com>
 <76587685-fa03-6dd6-5ca3-caeaf3c7504b@redhat.com>
 <20200603090921.64351a28@titan.knownspace>
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
Message-ID: <4e3b6904-5dfe-0608-88e9-2e051265fcd2@redhat.com>
Date: Wed, 3 Jun 2020 16:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200603090921.64351a28@titan.knownspace>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 14:36:37 -0000

On 6/3/20 4:09 PM, Justin Hibbits wrote:
> On Wed, 3 Jun 2020 08:08:42 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Cc'ing more developers.
>>
>> On 5/26/20 10:40 PM, David CARLIER wrote:
>>> From b24a6702beb2a4e2a9c1c03b69c6d1dd07d4cf08 Mon Sep 17 00:00:00
>>> 2001 From: David Carlier <devnexen@gmail.com>
>>> Date: Tue, 26 May 2020 21:35:27 +0100
>>> Subject: [PATCH] util/oslib: current process full path resolution
>>> on MacOS
>>>
>>> Using existing libproc to fill the path.
>>>
>>> Signed-off-by: David Carlier <devnexen@gmail.com>
>>> ---
>>>  util/oslib-posix.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>>> index 062236a1ab..96f0405ee6 100644
>>> --- a/util/oslib-posix.c
>>> +++ b/util/oslib-posix.c
>>> @@ -55,6 +55,10 @@
>>>  #include <sys/sysctl.h>
>>>  #endif
>>>
>>> +#ifdef __APPLE__
>>> +#include <libproc.h>
>>> +#endif
>>> +
>>>  #include "qemu/mmap-alloc.h"
>>>
>>>  #ifdef CONFIG_DEBUG_STACK_USAGE
>>> @@ -366,6 +370,15 @@ void qemu_init_exec_dir(const char *argv0)
>>>              p = buf;
>>>          }
>>>      }
>>> +#elif defined(__APPLE__)
>>> +    {
>>> +        uint32_t len;
>>> +        len = proc_pidpath(getpid(), buf, sizeof(buf) - 1);
>>> +        if (len > 0) {
>>> +            buf[len] = 0;
>>> +            p = buf;
>>> +        }
>>> +    }
>>>  #endif
>>>      /* If we don't have any way of figuring out the actual
>>> executable location then try argv[0].  */
>>>   
>>
> 
> Apologies, I don't have context for this.  Why was I CC'd on this?

I did after finding this patch of yours:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg639033.html

> 
> Does proc_pidpath() not NUL-terminate its written string?  And, given
> from my quick google search, it looks like this function is private and
> subject to change, so can you guarantee that the returned length is the
> *written* length, not the full string length?  If not, you could be
> overwriting other arbitrary data.
> 
> - Justin
> 


