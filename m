Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRD7U-0004fv-Ti
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 01:10:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aRD7S-0004Zj-65
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 01:10:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aRD7R-0007n7-88
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 01:10:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aRD7M-0007kc-Bk; Thu, 04 Feb 2016 01:10:12 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id C5F668051A;
	Thu,  4 Feb 2016 06:10:11 +0000 (UTC)
Received: from [10.10.57.110] (vpn-57-110.rdu2.redhat.com [10.10.57.110])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u146A7gM027592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 4 Feb 2016 01:10:08 -0500
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56B2EB3E.2000908@redhat.com>
Date: Thu, 4 Feb 2016 00:10:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B2AD13.6030504@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 04 Feb 2016 06:10:19 -0000



On 02/03/2016 07:44 PM, Shannon Zhao wrote:
> 
> 
> On 2016/2/4 0:01, Wei Huang wrote:
>>
>> On 2/3/16 04:46, Peter Maydell wrote:
>>>> On 3 February 2016 at 07:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>>>>> 28.01.2016 21:22, Wei Huang wrote:
>>>>>>>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>>>>>>> request will succeed; but the following shutdown/reboot requests
>>>>>>>> fail to trigger VMs to react. Notice that in mach-virt machine
>>>>>>>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>>>>>>> This patch changes the behavior of powerdown notifier from PULLUP
>>>>>>>> to PULSE. It solves the problem described above (i.e. reboot
>>>>>>>> continues to work).
>>>>>>
>>>>>> So, what's the outcome of this? :)
>>>>
>>>> This patch is definitely wrong. The patch to fix up the
>>>> gpio reset stuff is definitely the right idea. Whether it
>>>> fixes the reported failure or some further change is also
>>>> needed is currently unclear.
>> I will NAK this one for now. Please see V2 patch, which is necessary. In
>> the meanwhile, I think there is a problem with pulling-up only in
>> current implementation. Let me debug Shannon's DT problem first.
>>
> Hi Wei,
> 
> The reason of DT problem is that when we use qemu_irq_pulse(i.e
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);), it will inject the
> GPIO interrupt until it executes
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) because the qemu main
> thread is serialized and then guest will get the button value as zero,
> so it's failed to report the input event.
> 
> See gpio_keys_gpio_report_event
>  in drivers/input/keyboard/gpio_keys.c
> int state = gpio_get_value_cansleep(button->gpio);
> 
> The state is always zero.

I reversed the order of edge pulling. The state is 1 according to printk
inside gpio_keys driver. However the reboot still failed with two
reboots (1 very early, 1 later).

> 
> The solution I think would be making the each
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1 or 0) cloud inject an
> interrupt to guest.
> 
> Thanks,
> 

