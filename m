Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehRNn-0006L0-8G
	for mharc-qemu-trivial@gnu.org; Thu, 01 Feb 2018 21:47:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ehRMh-00066w-MP
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 21:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ehRLd-0007dc-KD
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 21:46:11 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1ehRLd-0007bn-9c
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 21:45:05 -0500
Received: by mail-pf0-x243.google.com with SMTP id c6so16523182pfi.8
	for <qemu-trivial@nongnu.org>; Thu, 01 Feb 2018 18:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=8ymqUaYaztpIoyupv0aSA12OmiQ2BJFuGgPjnreC/x0=;
	b=WVkAz4AWr4hXj2Huapr/rlKvyWWv8HHYa9ljEEOo8kSx8uD8C33tQsx/YikzuXlKcH
	L7rIFyoj5INQa8se0dpUgQQkwxdn1pSdK636I9fuQMQzsfwna/cK1PRvTb5g6XcSYLwk
	ty/OZoGQ1YhgfwgJD7cZ6ZJye3uMiQSXVUIfKeLolzqIYILZGNsiQPyXRnpVoOkx/ojU
	F6hrMqUL/RoPiGgN7gkpaCVLNn8pcSyu7zxRK1o7Cn+HiWN1WDSGjGlBklKUAJ/pSfEF
	DeCy7+MXZwkHMhQ+j7M4k9tkkNBKf//OZqZA7u6NPCEwLSK2foKKo26B2cEXkr8uhKig
	Nm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8ymqUaYaztpIoyupv0aSA12OmiQ2BJFuGgPjnreC/x0=;
	b=bnLNXZu0U5L3hxi9nef7T5WRfwRPnnsg1GyJeTiqls7NG4541dOylqzgMHNR8kKSGv
	G8l1F+JPsBsT0yrH4rehcmOV8bc0HBnzkpQd2tCdir1JpmEdfwUqWgEgCTANVCogpHIu
	AsQ8bmb6w11iB73O/A6D9O5b3ZvQaIW6p+yEC4qLZzreMYEqqYf7UoSYLrjx2QGCzRl8
	zk7UnC9xnqOEBgxJYUZwiq1DH1n3VhuC5o0uxI26wPY9cQu1LGbf3bURfQrL9HEue4lg
	UBl0C9wfEQiRG9S09i+9dhnP513/fmn3TuFEUGf3b+1mQiyh8evqb855jGLd0R6e/1sn
	cJLQ==
X-Gm-Message-State: AKwxytcNsljcWdLgVKwm3UkTrq3jsktyQvu5v4R8Z9K5883WpPm0EOlQ
	4a/9bFEL07y96StrsAbjXXthLkZp
X-Google-Smtp-Source: AH8x224sG2ED3wI17zhFnYMnlEmnPQjk96gA8RTqfQtjx5w2avHdEULlmy5Zr2NFywvAIf2h7t2S/g==
X-Received: by 10.98.102.135 with SMTP id s7mr38244811pfj.209.1517539503735;
	Thu, 01 Feb 2018 18:45:03 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	r88sm1093863pfb.17.2018.02.01.18.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 18:45:03 -0800 (PST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20171026014139.46221-1-aik@ozlabs.ru>
	<82b6cfcf-70ae-2817-8eb8-fe630d3bec95@ozlabs.ru>
	<70dce2ac-5278-d7c1-744d-83de8e111faf@ozlabs.ru>
Message-ID: <bebff732-86de-d7e2-93d5-a33fa44f5763@ozlabs.ru>
Date: Fri, 2 Feb 2018 13:45:00 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <70dce2ac-5278-d7c1-744d-83de8e111faf@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-trivial] [PATCH qemu v2] machine: Polish -machine xxx,
 help
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 02:47:17 -0000

On 29/01/18 16:03, Alexey Kardashevskiy wrote:
> On 15/12/17 15:47, Alexey Kardashevskiy wrote:
>> On 26/10/17 12:41, Alexey Kardashevskiy wrote:
>>> The "-machine xxx,help" prints kernel-irqchip possible values as
>>> "OnOffSplit", this adds separators to the printed line.
>>>
>>> Also, since only lower case letters are specified in qapi/common.json,
>>> this changes the letter cases too.
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> ping?
> 
> 
> anyone?

Let's try trivial list now :)


> 
>>
>>
>>> ---
>>>
>>> aik@fstn1-p1:~$ ./qemu-system-ppc64 -machine pseries,help 2>&1 | grep kernel-irqchip
>>>
>>> Was:
>>> pseries-2.11.kernel-irqchip=OnOffSplit (Configure KVM in-kernel irqchip)
>>>
>>> Now:
>>> pseries-2.11.kernel-irqchip=on|off|split (Configure KVM in-kernel irqchip)
>>> ---
>>>  hw/core/machine.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 36c2fb069c..bd3db14e12 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -506,7 +506,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>      object_class_property_set_description(oc, "accel",
>>>          "Accelerator list", &error_abort);
>>>  
>>> -    object_class_property_add(oc, "kernel-irqchip", "OnOffSplit",
>>> +    object_class_property_add(oc, "kernel-irqchip", "on|off|split",
>>>          NULL, machine_set_kernel_irqchip,
>>>          NULL, NULL, &error_abort);
>>>      object_class_property_set_description(oc, "kernel-irqchip",
>>>
>>
>>
> 
> 


-- 
Alexey

