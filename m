Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRDmw-0005KJ-D5
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 01:53:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aRDmu-0005IK-C1
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 01:53:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aRDmt-0008Du-E2
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 01:53:08 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:62997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aRDmo-0008Ab-CA; Thu, 04 Feb 2016 01:53:03 -0500
Received: from 172.24.1.50 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.50])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DED29941; Thu, 04 Feb 2016 14:51:24 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.235.1; Thu, 4 Feb 2016
	14:51:17 +0800
Message-ID: <56B2F4E3.6010807@huawei.com>
Date: Thu, 4 Feb 2016 14:51:15 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com>
In-Reply-To: <56B2EB3E.2000908@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56B2F4EF.0026, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4f9f862f6137241ff606cd7fb8bfb35f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
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
X-List-Received-Date: Thu, 04 Feb 2016 06:53:09 -0000



On 2016/2/4 14:10, Wei Huang wrote:
> 
> On 02/03/2016 07:44 PM, Shannon Zhao wrote:
>> > 
>> > 
>> > On 2016/2/4 0:01, Wei Huang wrote:
>>> >>
>>> >> On 2/3/16 04:46, Peter Maydell wrote:
>>>>> >>>> On 3 February 2016 at 07:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>>>>>> >>>>>> 28.01.2016 21:22, Wei Huang wrote:
>>>>>>>>> >>>>>>>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>>>>>>>> >>>>>>>> request will succeed; but the following shutdown/reboot requests
>>>>>>>>> >>>>>>>> fail to trigger VMs to react. Notice that in mach-virt machine
>>>>>>>>> >>>>>>>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>>>>>>>> >>>>>>>> This patch changes the behavior of powerdown notifier from PULLUP
>>>>>>>>> >>>>>>>> to PULSE. It solves the problem described above (i.e. reboot
>>>>>>>>> >>>>>>>> continues to work).
>>>>>>> >>>>>>
>>>>>>> >>>>>> So, what's the outcome of this? :)
>>>>> >>>>
>>>>> >>>> This patch is definitely wrong. The patch to fix up the
>>>>> >>>> gpio reset stuff is definitely the right idea. Whether it
>>>>> >>>> fixes the reported failure or some further change is also
>>>>> >>>> needed is currently unclear.
>>> >> I will NAK this one for now. Please see V2 patch, which is necessary. In
>>> >> the meanwhile, I think there is a problem with pulling-up only in
>>> >> current implementation. Let me debug Shannon's DT problem first.
>>> >>
>> > Hi Wei,
>> > 
>> > The reason of DT problem is that when we use qemu_irq_pulse(i.e
>> > qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>> > qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);), it will inject the
>> > GPIO interrupt until it executes
>> > qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) because the qemu main
>> > thread is serialized and then guest will get the button value as zero,
>> > so it's failed to report the input event.
>> > 
>> > See gpio_keys_gpio_report_event
>> >  in drivers/input/keyboard/gpio_keys.c
>> > int state = gpio_get_value_cansleep(button->gpio);
>> > 
>> > The state is always zero.
> I reversed the order of edge pulling. The state is 1 according to printk
> inside gpio_keys driver. However the reboot still failed with two
> reboots (1 very early, 1 later).
> 
Because to make the input work, it should call input_event twice I think.

input_event(input, type, button->code, 1) means the button pressed
input_event(input, type, button->code, 0) means the button released

But We only see guest entering gpio_keys_gpio_report_event once.

My original purpose is like below:

call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) to make guest
execute input_event(input, type, button->code, 1)
call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) to make guest
execute input_event(input, type, button->code, 0).

But even though it calls qemu_set_irq twice, it only calls pl061_update
once in qemu.

-- 
Shannon


