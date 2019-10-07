Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHXBO-0002QN-3A
	for mharc-qemu-trivial@gnu.org; Mon, 07 Oct 2019 13:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msmarduch@digitalocean.com>) id 1iHXBK-0002Lr-8N
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 13:52:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msmarduch@digitalocean.com>) id 1iHXBI-00043a-Gv
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 13:52:25 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <msmarduch@digitalocean.com>)
 id 1iHXBI-00041E-Am
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 13:52:24 -0400
Received: by mail-ot1-x342.google.com with SMTP id 67so11754880oto.3
 for <qemu-trivial@nongnu.org>; Mon, 07 Oct 2019 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yD2BGOokKJIGeeMR/acSnJkJ4LqmGx3n92DLvLa6bAE=;
 b=e3K+YYZhLCy4Th4vU48bwr5UPeruZg+g79clIfKASicJFibWQ52jBLvYdYScH8VAum
 zV59diRedrpSUdrsXarpLXWirkpkBX6lZwtxW2QW798fkk4kpxVSlO2r+UWTYYRU33sy
 eGt6RWbYtyb/y4gyktOeCXhxF85cUUkQhAFoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yD2BGOokKJIGeeMR/acSnJkJ4LqmGx3n92DLvLa6bAE=;
 b=cRbO+hjvmHwXdqPw8RTINRbGw2zLURhlVlxoau7Nlnq6iC9DQbv1ypSuHjg8q+95sQ
 GlNJWGGvZXIH5epRv2/LfPASFCnfGIbdNAbWIQt1TFOzFSxN/JJttb0JrL5DjuP+BJjz
 nZGthEFh9l4JNDmb+c4jj/h7ykhsubijRHgg+ppwfFfBr0YS148mKLqPEp1Jfj3eUhpV
 ZnKPdAu5/4lzSITTMn+4NIbHTXVCzrJ/R3PRgqENEVJsDwiDy19OE3B6j8ej/a8ZBXT6
 XvuQk6GDYs4l5WCWSH8KeSn4UAl94h2Qcq0AbtUwwTPafjXWbnSKuCfGbzCAW9j7aQCN
 oBOg==
X-Gm-Message-State: APjAAAUV95z3myfMcD9ain2WJDXUrQtK7IaWVLKUtRD+VVj6bXGIfoRf
 NX1NloTXkDgtmGLBI3+ZtGqDTZnYFr5l5g==
X-Google-Smtp-Source: APXvYqxlyjBOHjhihOgm3Y4thApjsMu0dZk2SPcX+gE0IY/y+nlHvo+AWFPHpQL1Y+m4Zs5jXuGWdQ==
X-Received: by 2002:a9d:5f6:: with SMTP id 109mr21297767otd.358.1570470743139; 
 Mon, 07 Oct 2019 10:52:23 -0700 (PDT)
Received: from ?IPv6:2600:1700:4a30:84c0:901c:4ec3:b9ac:bb0d?
 ([2600:1700:4a30:84c0:901c:4ec3:b9ac:bb0d])
 by smtp.gmail.com with ESMTPSA id n186sm4814200oih.58.2019.10.07.10.52.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 10:52:22 -0700 (PDT)
Subject: Re: [PATCH] target/i386: log guest name and memory error type AO, AR
 for MCEs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 mtosatti@redhat.com, armbru@redhat.com, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, rth@twiddle.net, ehabkost@redhat.com,
 qemu-trivial@nongnu.org
References: <ceb4d639-842a-30bd-5d54-bfacb07b5cc4@digitalocean.com>
 <8ca93883-1af3-7959-1b8c-4eeff2f2cae5@redhat.com>
From: Mario Smarduch <msmarduch@digitalocean.com>
Message-ID: <7ed0d4bf-5c24-4c9b-349e-438e6ad02aa6@digitalocean.com>
Date: Mon, 7 Oct 2019 10:52:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <8ca93883-1af3-7959-1b8c-4eeff2f2cae5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Mon, 07 Oct 2019 17:52:28 -0000



On 10/07/2019 03:27 AM, Philippe Mathieu-Daudé wrote:
> Hi Mario,
> 
> On 10/5/19 1:53 AM, Mario Smarduch wrote:
>> In a large VPC environment we want to log memory error occurrences
>> and log them with guest name and type - there are few use cases
>>
>>
>> - if VM crashes on AR mce inform the user about the reason and
>>    resolve the case
>> - if VM hangs notify the user to reboot and resume processing
>> - if VM continues to run let the user know, he/she maybe able to
>>    correlate to vm internal outage
>> - Rawhammer attacks - isolate/determine the attacker possible
>>    migrating it off the hypervisor
>> - In general track memory errors on a hyperviosr over time to determine
>>    trends
>>
>> Monitoring our fleet we come across quite a few of these and been
>> able to take action where before there were no clues to the causes.
>>
>> When memory error occurs we get a log entry in qemu log:
>>
>> Guest [Droplet-12345678] 2019-08-02T05:00:11.940270Z qemu-system-x86_64:
>> Guest MCE Memory Error at qemu addr 0x7f3c7622f000 and guest 78e42f000
>> addr of type BUS_MCEERR_AR injected
>>
>> with enterprise logging environment we can to take further actions.
>>
>> Signed-off-by: Mario Smarduch <msmarduch@digitalocean.com>
>> ---
>>   target/i386/kvm.c | 27 ++++++++++++++++++++++-----
>>   util/qemu-error.c | 24 ++++++++++++++++++++++++
>>   2 files changed, 46 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index 92069099ab..79ebccc684 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -555,9 +555,9 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr
>> paddr, int code)
>>                          (MCM_ADDR_PHYS << 6) | 0xc, flags);
>>   }
>>
>> -static void hardware_memory_error(void)
>> +static void hardware_memory_error(void *addr)
> 
> Maybe rename addr -> host_addr.
yep makes it more clear.

> 
>>   {
>> -    fprintf(stderr, "Hardware memory error!\n");
>> +    error_report("QEMU got Hardware memory error at addr %p", addr);
>>       exit(1);
>>   }
>>
>> @@ -581,15 +581,32 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int
>> code, void *addr)
>>               kvm_physical_memory_addr_from_host(c->kvm_state, addr,
>> &paddr)) {
>>               kvm_hwpoison_page_add(ram_addr);
>>               kvm_mce_inject(cpu, paddr, code);
>> +            /*
>> +             * Use different logging severity based on error type.
>> +             * If mcelog is running qemu va addr will help debug via
>> mcelog.
>> +             */
>> +            if (code == BUS_MCEERR_AR) {
>> +                error_report("Guest MCE Memory Error at qemu addr %p
>> and "
>> +                    "guest %lx addr of type %s injected", addr, paddr,
> 
> "qemu addr" is not clear IMO, 'addr' is in the host (and is virtual...
> how does this help you?).

Our mcelog entries are logged globally as well as qemu memory errors, if
log entry(s) from mcelog go missing we can use the VA from qemu to
more or less figure out its the same memory if we have some prior
relationship (based on timestamps of entries). For some cases every
bit helps.

> 
> For the guest paddr you should use "0x%"HWADDR_PRIx format.

Yes missed that should be similar to x86_cpu_dump_state(), a bare
pointer looks bad in qemu.

> 
>> +                     "BUS_MCEERR_AR");
>> +            } else {
>> +                 warn_report("Guest MCE Memory Error at qemu addr %p
>> and "
>> +                     "guest %lx addr of type %s injected", addr,
>> +                     paddr, "BUS_MCEERR_AO");
>> +            }
>> +
>>               return;
>>           }
>>
>> -        fprintf(stderr, "Hardware memory error for memory used by "
>> -                "QEMU itself instead of guest system!\n");
>> +        if (code == BUS_MCEERR_AO) {
>> +            warn_report("Hardware memory error at addr %p of type %s "
>> +                "for memory used by QEMU itself instead of guest
>> system!",
>> +                addr, "BUS_MCEERR_AO");
>> +        }
>>       }
>>
>>       if (code == BUS_MCEERR_AR) {
>> -        hardware_memory_error();
>> +        hardware_memory_error(addr);
>>       }
>>
>>       /* Hope we are lucky for AO MCE */
>> diff --git a/util/qemu-error.c b/util/qemu-error.c
>> index f373f3b3b0..2ebafd4405 100644
>> --- a/util/qemu-error.c
>> +++ b/util/qemu-error.c
>> @@ -11,6 +11,8 @@
>>    */
>>
>>   #include "qemu/osdep.h"
>> +#include "qemu/option.h"
>> +#include "qemu/config-file.h"
>>   #include "monitor/monitor.h"
>>   #include "qemu/error-report.h"
>>
>> @@ -35,11 +37,31 @@ int error_printf(const char *fmt, ...)
>>       return ret;
>>   }
>>
>> +static const char *error_get_guestname(void)
>> +{
>> +    QemuOpts *opts = qemu_opts_find(qemu_find_opts("name"), NULL);
>> +    return qemu_opt_get(opts, "guest");
>> +}
>> +
>> +/*
>> + * Print guest name associated with error, to aid debugging errors from
>> + * multiple guests in centralized logging environment.
>> + */
>> +static void error_print_guestname(void)
>> +{
>> +    const char *name;
>> +    name = error_get_guestname();
>> +    if (name != NULL && !cur_mon) {
>> +        error_printf("Guest [%s] ", name);
>> +    }
>> +}
>> +
>>   int error_printf_unless_qmp(const char *fmt, ...)
>>   {
>>       va_list ap;
>>       int ret;
>>
>> +    error_print_guestname();
>>       va_start(ap, fmt);
>>       ret = error_vprintf_unless_qmp(fmt, ap);
>>       va_end(ap);
>> @@ -274,6 +296,7 @@ void error_report(const char *fmt, ...)
>>   {
>>       va_list ap;
>>
>> +    error_print_guestname();
>>       va_start(ap, fmt);
>>       vreport(REPORT_TYPE_ERROR, fmt, ap);
>>       va_end(ap);
>> @@ -289,6 +312,7 @@ void warn_report(const char *fmt, ...)
>>   {
>>       va_list ap;
>>
>> +    error_print_guestname();
>>       va_start(ap, fmt);
>>       vreport(REPORT_TYPE_WARNING, fmt, ap);
>>       va_end(ap);
>> -- 
>> 2.17.1
>>

