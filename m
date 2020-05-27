Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdqTs-0008Pz-VI
	for mharc-qemu-trivial@gnu.org; Wed, 27 May 2020 03:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdqTq-0008NP-O7
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 03:28:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31196
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdqTo-0003TF-VZ
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 03:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590564479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z2/c0Aqc+jPAz37cBdOdNxUgJnmWJgrosIaFchyc4EY=;
 b=Jn0NMqyY7vRlxdATIQpoS+XvPCXThei7jqe1ybisPAx78V80mVNb8YnjS5m9C7BJruC+wD
 +I0QlHECnponhiRSml3582K0W3QAZ1/Gzaqhddb8HH3Tbr+i0FBtyC5DeL8Gu8yPeSLIP4
 5fA+xlY5IKI9fIkpyoscL9y7vQRViBg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-KZw4ox1QNsGoitH1b9DiPA-1; Wed, 27 May 2020 03:27:56 -0400
X-MC-Unique: KZw4ox1QNsGoitH1b9DiPA-1
Received: by mail-wr1-f71.google.com with SMTP id l1so7187888wrc.8
 for <qemu-trivial@nongnu.org>; Wed, 27 May 2020 00:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Z2/c0Aqc+jPAz37cBdOdNxUgJnmWJgrosIaFchyc4EY=;
 b=gmnfYjL/l7foXFMOsGLwhhPix/msy+chc2t3I0WwoB0aYww4xFO9A6svHsA8U0bf4P
 g+jzBthbSy9b8WK4MEl/lk2OUhq3ZuyFmEg9/nG/PDNi0L11YlN4MiAd2ZQkF0bGTuYW
 OYrrOZcriRxdzX/CjXCxWUIIGB3wsaZ4JQQjtbOMTh2v434xZQgE+yytJAUqUl6lpxDf
 PYqZfU2K8eTU7fKOQqA+Uy0glNaTA8h3hwxHsDry9QQw3W+der9RpvkwywbAMt6hRVLk
 Htspb37+MnDnYXyjuaSAv7Fd6yqcfT6N9GVbfF3qpT4XGY2TESHcjUs7P2oXE4VYefcK
 1f5A==
X-Gm-Message-State: AOAM531C+6yMgWFu7penkKxWuCGThS4kvcLHMzJi9MS3fhG41skqvEM8
 3/2JXFewWfCWCqjp98eUsveFkMNbGVPbOsNAgiN6F3FY+/5G/fW5sUOXcM+tU1SGg80s0RkOWtO
 +jDUi42KuVc+W1ZNodA==
X-Received: by 2002:adf:f512:: with SMTP id q18mr25332602wro.38.1590564475072; 
 Wed, 27 May 2020 00:27:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv00IBPjCoazyPRwkEKCJmHmxHEMZNtLkSzuQlakVZMDfuy4O0kWegqGxIfTNEJwjObNwZRg==
X-Received: by 2002:adf:f512:: with SMTP id q18mr25332581wro.38.1590564474749; 
 Wed, 27 May 2020 00:27:54 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id o10sm1950572wrq.40.2020.05.27.00.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 00:27:54 -0700 (PDT)
Subject: Re: [PATCH] or1k: Fix compilation hiccup
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>, Bug 1874073 <1874073@bugs.launchpad.net>,
 Martin Liska <mliska@suse.cz>, Peter Maydell <peter.maydell@linaro.org>
References: <20200526185132.1652355-1-eblake@redhat.com>
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
Message-ID: <e6f9b1b0-2c57-4089-4907-053a553e4180@redhat.com>
Date: Wed, 27 May 2020 09:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200526185132.1652355-1-eblake@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 27 May 2020 07:28:03 -0000

On 5/26/20 8:51 PM, Eric Blake wrote:
> On my Fedora 32 machine, gcc 10.1.1 at -O2 (the default for a bare
> './configure') has a false-positive complaint:
> 
>   CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
> /home/eblake/qemu/hw/openrisc/openrisc_sim.c: In function ‘openrisc_sim_init’:
> /home/eblake/qemu/hw/openrisc/openrisc_sim.c:87:42: error: ‘cpu_irqs[0]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
>       |                                  ~~~~~~~~^~~
> 
> Initializing both pointers of cpu_irqs[] to NULL is sufficient to shut
> up the compiler, even though they are definitely assigned in
> openrisc_sim_init() prior to the inlined call to
> openrisc_sim_ompic_init() containing the line in question.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/openrisc/openrisc_sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d08ce6181199..95011a8015b4 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *machine)
>      const char *kernel_filename = machine->kernel_filename;
>      OpenRISCCPU *cpu = NULL;
>      MemoryRegion *ram;
> -    qemu_irq *cpu_irqs[2];
> +    qemu_irq *cpu_irqs[2] = {};

Ah I now remembered why this warning sound familiar:
https://bugs.launchpad.net/qemu/+bug/1874073

Peter suggested a different fix, I tested it, and was expecting Martin
Liska to post an updated patch.

>      qemu_irq serial_irq;
>      int n;
>      unsigned int smp_cpus = machine->smp.cpus;
> 


