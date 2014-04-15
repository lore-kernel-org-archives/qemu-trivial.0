Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa1FF-000092-SL
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 07:09:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa1F5-0008Sp-Dw
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:09:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa1Ev-0006R6-Qa
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 07:09:31 -0400
Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a]:57534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wa1Ev-0006Qs-JX; Tue, 15 Apr 2014 07:09:21 -0400
Received: by mail-pd0-f170.google.com with SMTP id v10so9342044pde.29
	for <multiple recipients>; Tue, 15 Apr 2014 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Kd3YZeWciMjJUqg7epv1LvkmRq9/Gv3D6FuJqY+Amgk=;
	b=iKYFxIU/dKtp1wLg30FdB4F9WHAdKQSAzdcYU5si0bLkU8TlyesCMh3XXghtaJD4jg
	Wn4XArJtzgXKYJdN0xQwD8yTumoIt1ZFO54+BOvDfmK+fBm95S+am4jguCL9j1/O/NM4
	u9/BDp9CzIKW4KwfWIPP7XwwdSgM3+qqGyaUcY2eB/XPzH1RVBFgpnCaSGFZcRjjc7gY
	Z8X+bkiUangGqszYWXFtAg+DxWOx/+eeSmP1ZcmZsO/kgLSLnLl6iUia4taUgygzzWcg
	/PbDTmonHQORSjC7D0pJf64w7YqTrXLDkVRUQgHFWPlBQ8nzpTu87Pw+0Ym43DhYOmKz
	HuPw==
X-Received: by 10.66.65.138 with SMTP id x10mr1192227pas.17.1397560160372;
	Tue, 15 Apr 2014 04:09:20 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.91.142])
	by mx.google.com with ESMTPSA id
	ci4sm39632000pbb.50.2014.04.15.04.09.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 04:09:19 -0700 (PDT)
Message-ID: <534D1359.9040409@gmail.com>
Date: Tue, 15 Apr 2014 19:09:13 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <53337BEB.90305@gmail.com>
	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>
	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>
	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>
	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>
	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>
	<5343E571.60407@gmail.com>	<5343E5ED.2040906@gmail.com>
	<87d2gjgecy.fsf@blackfin.pond.sub.org>
In-Reply-To: <87d2gjgecy.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 3/3] vl: remove
 local variable 'args' in the middle of code block
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Apr 2014 11:09:40 -0000


On 04/15/2014 04:56 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> For C code, it does not recommend to define a local variable in the
>> middle of code block without "{...}". The original author may want to
>> zero members not mentioned in structure assignment.
>>
>> So recommend to use structure initializing block "{...}" for structure
>> assignment in the middle of code block.
>>
>> And at present, we can assume that all related gcc versions will be
>> latest enough to notice about this grammar.
> 
> Commit message is a bit confusing :)  I'd write something like this:
> 
>     vl: Eliminate a superfluous local variable
> 
>     CODING_STYLE frowns upon mixing declarations and statements.  main()
>     has such a declaration.  Clean up by eliminating the variable.
> 

That sounds fine to me.

And excuse me, my English is not quite well (so may write confusing and
redundancy comments)

Thanks.
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  vl.c |   18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 377f962..d381443 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -4368,15 +4368,15 @@ int main(int argc, char **argv, char **envp)
>>  
>>      qdev_machine_init();
>>  
>> -    QEMUMachineInitArgs args = { .machine = machine,
>> -                                 .ram_size = ram_size,
>> -                                 .boot_order = boot_order,
>> -                                 .kernel_filename = kernel_filename,
>> -                                 .kernel_cmdline = kernel_cmdline,
>> -                                 .initrd_filename = initrd_filename,
>> -                                 .cpu_model = cpu_model };
>> -
>> -    current_machine->init_args = args;
>> +    current_machine->init_args = (QEMUMachineInitArgs) {
>> +        .machine = machine,
>> +        .ram_size = ram_size,
>> +        .boot_order = boot_order,
>> +        .kernel_filename = kernel_filename,
>> +        .kernel_cmdline = kernel_cmdline,
>> +        .initrd_filename = initrd_filename,
>> +        .cpu_model = cpu_model };
>> +
>>      machine->init(&current_machine->init_args);
>>  
>>      audio_init();
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

