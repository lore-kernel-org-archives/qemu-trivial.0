Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPALH-0004vV-9M
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 09:48:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAKQ-0004gQ-Hj
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAJN-00083Q-41
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:47:14 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:34392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aPAJM-00083E-Q4
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 09:46:08 -0500
Received: by mail-pa0-x234.google.com with SMTP id uo6so43235030pac.1
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=GJZh3SUKeog1m9Mv+as9E5YdYhBAMTorMFxNHmkwDwc=;
	b=FsIl19hQ8CcbUF7CJMId/+RnvE0vllj2nKs/6HTp9SaixGiew0kRzC6GbrdMYG3dR3
	4fYbeAsrqAl5iECZRcymJH/BNpvWL2SJT1Ogx1y5ePVxS4Y0idZMCcnyPSP+4NTlCU1g
	EWMam7P78kaHJDhL8IrToSdsjPJRwvOT19+oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=GJZh3SUKeog1m9Mv+as9E5YdYhBAMTorMFxNHmkwDwc=;
	b=JuV97i/XjT2Wd3nEEmNljPH1EVvl6CF+oWeQXXKmlUShAFp5yuXxHYp6w69JW9Qfvd
	J7zbZm1F4mOD6EgWhDyq/g9/QJuw4QCCvw+zp2jfJVPYF+gE/5/jpv3qS99GsHFcKEHx
	pPQ9dtZSczbr2ghUl29JB/cFnr5utz0HqE+pn9wNMYCH230cPxry5sa/k6eNdKvf4gDM
	46fbmrLBhY0cZx1ezQwnrwYRQ6ugaMPD8BYUT9Wg25lpRjmOPtAczZObidF0zhIpYrou
	u54cMVqBpRUXDzot/gfc9cfeLSclvhji4Z6z8Buk4xFc2K1e/w6cve3j/ZbPzF2PrU1y
	SxOg==
X-Gm-Message-State: AG10YOQmkFozcDClX4l18akIiXAqnvP4rhrHPJE74NQKRXc84njHCrDeT2SD8RRzOOf/9uvp
X-Received: by 10.66.121.136 with SMTP id lk8mr13878803pab.1.1454078767876;
	Fri, 29 Jan 2016 06:46:07 -0800 (PST)
Received: from [10.15.245.110] ([167.160.116.223])
	by smtp.googlemail.com with ESMTPSA id
	t87sm5528260pfa.14.2016.01.29.06.46.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 06:46:06 -0800 (PST)
Message-ID: <56AB7B48.9020007@linaro.org>
Date: Fri, 29 Jan 2016 22:46:32 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com>
In-Reply-To: <56AB78A6.7070505@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::234
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
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
X-List-Received-Date: Fri, 29 Jan 2016 14:48:06 -0000



On 2016/1/29 22:35, Wei Huang wrote:
>
>
> On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>> Hi，
>>
>> This makes ACPI work well but makes DT not work. The reason is systemd or
>> acpid open /dev/input/event0 failed. So the interrupt could be injected and
>> could see under /proc/interrupts but guest doesn't have any action. I'll
>> investigate why it opens failed later.
>
> That is interesting. Could you try it with the following? This reverses
> the order to down-up and worked on ACPI case.
>
Yeah, that's very weird.

> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>
I'll try this tomorrow. But even if this works, it's still weird.

> Thanks,
> -Wei
>
>>
>> 2016年1月29日星期五，Wei Huang <wei@redhat.com> 写道：
>>
>>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>> request will succeed; but the following shutdown/reboot requests
>>> fail to trigger VMs to react. Notice that in mach-virt machine
>>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>> This patch changes the behavior of powerdown notifier from PULLUP
>>> to PULSE. It solves the problem described above (i.e. reboot
>>> continues to work).
>>>
>>> Signed-off-by: Wei Huang <wei@redhat.com <javascript:;>>
>>> ---
>>>   hw/arm/virt.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 05f9087..b5468a9 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -546,7 +546,7 @@ static DeviceState *pl061_dev;
>>>   static void virt_powerdown_req(Notifier *n, void *opaque)
>>>   {
>>>       /* use gpio Pin 3 for power button event */
>>> -    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>> +    qemu_irq_pulse(qdev_get_gpio_in(pl061_dev, 3));
>>>   }
>>>
>>>   static Notifier virt_system_powerdown_notifier = {
>>> --
>>> 1.8.3.1
>>>
>>>
>>

-- 
Shannon

