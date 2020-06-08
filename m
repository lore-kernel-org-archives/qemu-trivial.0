Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiBAz-0001ea-Cm
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 02:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiBAw-0001eK-8R
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 02:22:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46805
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiBAu-0005Wd-Rk
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 02:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591597343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ykvfrJWLvSkklWC8KZJenQj60ZoIuXiEDTc376mlX3s=;
 b=OInCAmHBHRXykwaUvXYRnSQM0jxHgs573AOTZKzJjZR0vyDmMEH9HSOYZ/s3pRfafRqktV
 VI0P71wLNW87D1pNdxrYjC2ytWREgtZoto6rm16Hz5/BWZrgD0jrOQLWMTIX4c7hSd2M6r
 Gw0nrnQqDp8+U3RuME7qgqWedH1HJZU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-g6xc2sLCMkmFwrIJMSQC_g-1; Mon, 08 Jun 2020 02:22:20 -0400
X-MC-Unique: g6xc2sLCMkmFwrIJMSQC_g-1
Received: by mail-wm1-f69.google.com with SMTP id 11so3558340wmj.6
 for <qemu-trivial@nongnu.org>; Sun, 07 Jun 2020 23:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ykvfrJWLvSkklWC8KZJenQj60ZoIuXiEDTc376mlX3s=;
 b=My2clUEBeYyeoa3nywocvKwCGF7zDxtNnMup3Z452ZSOt5HF26Gxr0rqBamRxQl3dF
 QA28VU9imS0QO+oYmGMz73qIo4yEM7ywXF+HQgqa2dDJZ+5CU6F1J6ROqQRzA/xxGNz5
 nrW7MZVJxbLFHg7b2c/+1H07lRkv06fs8qVnYMyfKshTcytoH6fLtP4d2vFbRoahYTe1
 5pT6iTEmBt0zfLUVVIhA8/fuFsLop4Jt5HHB0IVjuMKNmz3nlldtHKUnYEWTyosnHIk/
 SiPL9sYjDV9a4MJeObBmEbX7fj62CsE2Gme8WK2v+t/XEaj3glfTBF6mNnOworZPoQlV
 On3g==
X-Gm-Message-State: AOAM530Zt6z3tQv0dVKRKoxvHRURaq6ml9bsK2Dieh+JZaR0R314aq42
 GgP1Q/G02nBXfJMewK4wf1h+ZISXebWRbqGobwrzR6g+dBh/AMb0+SrsDMXKm1J/slZ/1/SKsq6
 6yjN9sJySwS62KRVTow==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr21371681wrn.284.1591597338929; 
 Sun, 07 Jun 2020 23:22:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRNy2K8xbNbtA6/wgD7Zj13GNcR6pGcSNoXJHn8p2olUpIn34zrUnCWczAqTbo1sztr7tFdw==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr21371648wrn.284.1591597338597; 
 Sun, 07 Jun 2020 23:22:18 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a15sm23312362wra.86.2020.06.07.23.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jun 2020 23:22:18 -0700 (PDT)
Subject: Re: [PATCH] or1k: Fix compilation hiccup
To: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Christophe de Dinechin <dinechin@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20200526185132.1652355-1-eblake@redhat.com>
 <m1d06msod9.fsf@redhat.com>
 <CAFEAcA9Huery0AeUFsLVrcK4bUGibg1f-m8gMuMiJgnr+Hj7CA@mail.gmail.com>
 <87eeqx9alv.fsf@dusky.pond.sub.org> <873676ksbb.fsf@dusky.pond.sub.org>
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
Message-ID: <09123e95-b1c1-be7b-1aa8-f68f99417b28@redhat.com>
Date: Mon, 8 Jun 2020 08:22:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <873676ksbb.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 06:22:26 -0000

On 6/8/20 8:03 AM, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Fri, 29 May 2020 at 17:23, Christophe de Dinechin
>>> <dinechin@redhat.com> wrote:
>>>> On 2020-05-26 at 20:51 CEST, Eric Blake wrote...
>>>>> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>>>>> index d08ce6181199..95011a8015b4 100644
>>>>> --- a/hw/openrisc/openrisc_sim.c
>>>>> +++ b/hw/openrisc/openrisc_sim.c
>>>>> @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *machine)
>>>>>      const char *kernel_filename = machine->kernel_filename;
>>>>>      OpenRISCCPU *cpu = NULL;
>>>>>      MemoryRegion *ram;
>>>>> -    qemu_irq *cpu_irqs[2];
>>>>> +    qemu_irq *cpu_irqs[2] = {};
>>>>
>>>> Why is the value [2] correct here? The loop that initializes loops over
>>>> machine->smp.cpus. Is it always less than 2 on this machine?
>>>
>>> Yes: openrisc_sim_machine_init() sets mc->max_cpus = 2.
>>> My suggestion of adding an assert() is essentially telling the
>>> compiler that indeed smp_cpus must always be in the range [1,2],
>>> which we can tell but it can't.
>>
>> Do we have a proper patch for this on the list?
> 
> Apparently not.
> 
> Philippe did try Peter's suggestion, found it works, but then posted it
> only to Launchpad.  Philippe, please post to the list, so we can finally
> get this fixed.

Sorry since it was Eric finding, I didn't understood I had to post it.
Will do.


