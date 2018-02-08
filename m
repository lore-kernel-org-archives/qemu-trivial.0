Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejdoX-000148-QA
	for mharc-qemu-trivial@gnu.org; Wed, 07 Feb 2018 23:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ejdoV-00011W-KR
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 23:28:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1ejdoR-00084i-K2
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 23:27:59 -0500
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:55107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1ejdoR-00084O-Dn
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 23:27:55 -0500
Received: by mail-it0-x243.google.com with SMTP id k131so5039638ith.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Feb 2018 20:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=FZ7d3i36uzIavXojlp6HvdcGP91QKvuwJNlM9WGY0NE=;
	b=r16L9zuUQiS1P3dYIF4t3B1sq6xh6mvMsisU827kCBVbPrcNDknSPlI5NwallqN9Vg
	wrRphpZXRYi1bXh0hFaZlpwXe0yWFSTQkMnSqJBukmjtGW4oIcZjlgzi+DxMzfV59HR3
	X5WjEMn5F1ZWf3suXGyp4bHZxDnu8hfQNYrsikrbFMZ5nIcWOWZtvOg8wKl7RpWADwIs
	cEBbaCiqclWRzLMk1A4evcDvyxELh0enQamcY/aclvFw5wwaXLF6gvZ8Pb5gbDQIKlkD
	4aX3Lj1c7wR8CidfZMF2H9VX8Cv4Ot2tlVNlPMVqQ2EPAyKYfdg1lvTjdG278Fag9RU8
	qMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FZ7d3i36uzIavXojlp6HvdcGP91QKvuwJNlM9WGY0NE=;
	b=XJq8xp8ha2qYbPVHl+ofaUekfuSRuhJXtRnoV6PQ49CZ+GP4vaogydhQwaNyKfO07K
	XjF8GZAqFqHD2Qa0ModcZlEBh5d/vHvorLPbV98iNUCipsp6fofVyG95D0hnFdYBcS2W
	VgUq+RXPhlqFfzHGGDOjunCAGMsARWd6QIrM/kRKZKNV2xCbSh2alm80Ae4eKusYBeT0
	VXM2rMYNYvDs+6lO8Y0lyZFfGGh8eGuh75FrE44KbXNHUslw9MOPq/WJxh4ur4OcMggN
	B9sVwb5f1VUxhjqoZTdoxXXLqth6pO8OkGAP0zMi/qZKTV9le2vH71w7b4C8ZGgFogie
	o8mg==
X-Gm-Message-State: APf1xPBgm84K1BLm0KrRAyftm3UW9B5fjDsUv/l6WvWpidY1ylF7f78H
	12dX1K92YkTP0xVNMuytS+0LOjY2
X-Google-Smtp-Source: AH8x224lQE8ngj4Zgp0c/j6bLubG76VpPuVQMjUFekmb840Pw24kKypgvXtqrO7N3JwAgpUOUhtKpw==
X-Received: by 10.36.19.5 with SMTP id 5mr10980696itz.11.1518064073955;
	Wed, 07 Feb 2018 20:27:53 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	c15sm9048863itd.4.2018.02.07.20.27.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 20:27:52 -0800 (PST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20171026014139.46221-1-aik@ozlabs.ru>
	<82b6cfcf-70ae-2817-8eb8-fe630d3bec95@ozlabs.ru>
	<70dce2ac-5278-d7c1-744d-83de8e111faf@ozlabs.ru>
	<bebff732-86de-d7e2-93d5-a33fa44f5763@ozlabs.ru>
Message-ID: <bef12936-8383-d455-8753-5f04bb58827d@ozlabs.ru>
Date: Thu, 8 Feb 2018 15:27:48 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bebff732-86de-d7e2-93d5-a33fa44f5763@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::243
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
X-List-Received-Date: Thu, 08 Feb 2018 04:28:00 -0000

On 02/02/18 13:45, Alexey Kardashevskiy wrote:
> On 29/01/18 16:03, Alexey Kardashevskiy wrote:
>> On 15/12/17 15:47, Alexey Kardashevskiy wrote:
>>> On 26/10/17 12:41, Alexey Kardashevskiy wrote:
>>>> The "-machine xxx,help" prints kernel-irqchip possible values as
>>>> "OnOffSplit", this adds separators to the printed line.
>>>>
>>>> Also, since only lower case letters are specified in qapi/common.json,
>>>> this changes the letter cases too.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>
>>> ping?
>>
>>
>> anyone?
> 
> Let's try trivial list now :)


And ping again :)


> 
> 
>>
>>>
>>>
>>>> ---
>>>>
>>>> aik@fstn1-p1:~$ ./qemu-system-ppc64 -machine pseries,help 2>&1 | grep kernel-irqchip
>>>>
>>>> Was:
>>>> pseries-2.11.kernel-irqchip=OnOffSplit (Configure KVM in-kernel irqchip)
>>>>
>>>> Now:
>>>> pseries-2.11.kernel-irqchip=on|off|split (Configure KVM in-kernel irqchip)
>>>> ---
>>>>  hw/core/machine.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>> index 36c2fb069c..bd3db14e12 100644
>>>> --- a/hw/core/machine.c
>>>> +++ b/hw/core/machine.c
>>>> @@ -506,7 +506,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>>      object_class_property_set_description(oc, "accel",
>>>>          "Accelerator list", &error_abort);
>>>>  
>>>> -    object_class_property_add(oc, "kernel-irqchip", "OnOffSplit",
>>>> +    object_class_property_add(oc, "kernel-irqchip", "on|off|split",
>>>>          NULL, machine_set_kernel_irqchip,
>>>>          NULL, NULL, &error_abort);
>>>>      object_class_property_set_description(oc, "kernel-irqchip",
>>>>
>>>
>>>
>>
>>
> 
> 


-- 
Alexey

