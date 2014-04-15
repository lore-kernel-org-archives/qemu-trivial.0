Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wa2YM-0007rs-UY
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 08:33:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa2YE-0007qu-LW
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 08:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wa2Y8-00042x-4K
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 08:33:22 -0400
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:38889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wa2Y7-00042n-U1; Tue, 15 Apr 2014 08:33:16 -0400
Received: by mail-pa0-f41.google.com with SMTP id fa1so9638643pad.28
	for <multiple recipients>; Tue, 15 Apr 2014 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=L0zDUQpDtitE1mwWJrVJT4I10RduzNYl3iZmenJkDbY=;
	b=oeEO8+gVTjax+HMFk5ezHUK7mdHgK1R59Er5aNsJ7p+4AR9kuNzwq+YWMI995M1B4a
	xhIKBd3alG6q/jqQrxf3fQCLf6eC3VjwR6tF/jmvzGBguS062o25pdnofAuL9HD2rUbE
	Hoflg9HUzhzhNcAZ+vhgZxFkGttm617ImkH0tc4vHqhJVaBzWeauxd5JmsMWDRjujWEZ
	Vf8SDmRSpER6R8p5qKY+MJmslJazKigYVUix7P1vCLUom/Va2m2mEZjsJYbr88qM9RsN
	Dj+QtPLOyFS2VF0D4h20jH7Ey0uz/rSSJcToewvEdvOmCP+tPJuIE4gb8DwsAsrCdath
	gATA==
X-Received: by 10.67.8.102 with SMTP id dj6mr1757585pad.10.1397565194853;
	Tue, 15 Apr 2014 05:33:14 -0700 (PDT)
Received: from [192.168.1.104] ([219.143.91.142])
	by mx.google.com with ESMTPSA id
	vd8sm95266397pac.12.2014.04.15.05.33.05 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 05:33:14 -0700 (PDT)
Message-ID: <534D26FC.6020004@gmail.com>
Date: Tue, 15 Apr 2014 20:33:00 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <53337BEB.90305@gmail.com>	<87wqfgrp83.fsf@blackfin.pond.sub.org>	<5333F6E2.9080202@gmail.com>	<53382DDD.8050001@gmail.com>	<87fvlylf02.fsf@blackfin.pond.sub.org>	<53396545.805@gmail.com>	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>	<533969AB.4010505@gmail.com>	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>	<53396CE9.9090405@gmail.com>	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>	<533E7DD5.3090203@gmail.com>	<5340F4FD.7040305@msgid.tls.msk.ru>	<53414941.5040908@gmail.com>	<5343E4D4.6070305@gmail.com>	<5343E516.3020103@gmail.com>	<5343E571.60407@gmail.com>	<5343E5ED.2040906@gmail.com>
	<CAEgOgz4QNY7yovixKEcxXRWo=9KVAJdaQxMn97ZnXtBkeYtmvA@mail.gmail.com>
In-Reply-To: <CAEgOgz4QNY7yovixKEcxXRWo=9KVAJdaQxMn97ZnXtBkeYtmvA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
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
X-List-Received-Date: Tue, 15 Apr 2014 12:33:29 -0000

On 04/15/2014 08:29 PM, Peter Crosthwaite wrote:
> On Tue, Apr 8, 2014 at 10:05 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> For C code, it does not recommend to define a local variable in the
>> middle of code block without "{...}". The original author may want to
>> zero members not mentioned in structure assignment.
>>
>> So recommend to use structure initializing block "{...}" for structure
>> assignment in the middle of code block.
>>
>> And at present, we can assume that all related gcc versions will be
>> latest enough to notice about this grammar.
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> 
> With Markus' suggest commit message fixup:
> 
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 

OK, thanks. I will use the new commit message in the patch v2.

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
>> --
>> 1.7.9.5
>>

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

