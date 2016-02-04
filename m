Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aR8zB-0002Jq-2T
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 20:45:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aR8z8-0002GA-EJ
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 20:45:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aR8z7-0008I6-HL
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 20:45:26 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:29512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aR8z0-0008FO-QI; Wed, 03 Feb 2016 20:45:19 -0500
Received: from 172.24.1.49 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DED01659; Thu, 04 Feb 2016 09:45:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1; Thu, 4 Feb 2016
	09:44:54 +0800
Message-ID: <56B2AD13.6030504@huawei.com>
Date: Thu, 4 Feb 2016 09:44:51 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com>
In-Reply-To: <56B22469.7040308@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56B2AD20.019D, ss=1, re=0.000, recu=0.000,
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
X-List-Received-Date: Thu, 04 Feb 2016 01:45:27 -0000



On 2016/2/4 0:01, Wei Huang wrote:
> 
> On 2/3/16 04:46, Peter Maydell wrote:
>> > On 3 February 2016 at 07:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> >> 28.01.2016 21:22, Wei Huang wrote:
>>>> >>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>>> >>> request will succeed; but the following shutdown/reboot requests
>>>> >>> fail to trigger VMs to react. Notice that in mach-virt machine
>>>> >>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>>> >>> This patch changes the behavior of powerdown notifier from PULLUP
>>>> >>> to PULSE. It solves the problem described above (i.e. reboot
>>>> >>> continues to work).
>>> >>
>>> >> So, what's the outcome of this? :)
>> > 
>> > This patch is definitely wrong. The patch to fix up the
>> > gpio reset stuff is definitely the right idea. Whether it
>> > fixes the reported failure or some further change is also
>> > needed is currently unclear.
> I will NAK this one for now. Please see V2 patch, which is necessary. In
> the meanwhile, I think there is a problem with pulling-up only in
> current implementation. Let me debug Shannon's DT problem first.
> 
Hi Wei,

The reason of DT problem is that when we use qemu_irq_pulse(i.e
qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);), it will inject the
GPIO interrupt until it executes
qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) because the qemu main
thread is serialized and then guest will get the button value as zero,
so it's failed to report the input event.

See gpio_keys_gpio_report_event
 in drivers/input/keyboard/gpio_keys.c
int state = gpio_get_value_cansleep(button->gpio);

The state is always zero.

The solution I think would be making the each
qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1 or 0) cloud inject an
interrupt to guest.

Thanks,
-- 
Shannon


