Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aX5At-0006GI-IZ
	for mharc-qemu-trivial@gnu.org; Sat, 20 Feb 2016 05:54:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aX5Ap-00069d-TD
	for qemu-trivial@nongnu.org; Sat, 20 Feb 2016 05:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aX5Ao-0006nX-Kl
	for qemu-trivial@nongnu.org; Sat, 20 Feb 2016 05:54:03 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:58516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aX5Ai-0006hU-Ld; Sat, 20 Feb 2016 05:53:58 -0500
Received: from 172.24.1.50 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BWJ97616; Sat, 20 Feb 2016 18:53:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 20 Feb 2016 18:53:39 +0800
Message-ID: <56C845B1.3080000@huawei.com>
Date: Sat, 20 Feb 2016 18:53:37 +0800
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
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com>
In-Reply-To: <56BA6F6C.5000301@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.56C845B7.0004, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1dca19d7b01ec0f7a7cdcf85fba910c4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
X-List-Received-Date: Sat, 20 Feb 2016 10:54:05 -0000

Hi Wei,

On 2016/2/10 6:59, Wei Huang wrote:
> 
> On 02/04/2016 12:51 AM, Shannon Zhao wrote:
>>
>>
>> On 2016/2/4 14:10, Wei Huang wrote:
>>>
>>> On 02/03/2016 07:44 PM, Shannon Zhao wrote:
> 
> <snip>
> 
>>> I reversed the order of edge pulling. The state is 1 according to printk
>>> inside gpio_keys driver. However the reboot still failed with two
>>> reboots (1 very early, 1 later).
>>>
>> Because to make the input work, it should call input_event twice I think.
>>
>> input_event(input, type, button->code, 1) means the button pressed
>> input_event(input, type, button->code, 0) means the button released
>>
>> But We only see guest entering gpio_keys_gpio_report_event once.
>>
>> My original purpose is like below:
>>
>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) to make guest
>> execute input_event(input, type, button->code, 1)
>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) to make guest
>> execute input_event(input, type, button->code, 0).
>>
>> But even though it calls qemu_set_irq twice, it only calls pl061_update
>> once in qemu.
> 
> Hi Shannon,
> 
> Assuming that we are talking about the special case you found (i.e. send
> reboot very early and then send another one after guest VM fully
> booted). Dug into the code further, here are my findings:
> 
> === Why ACPI case failed? ===
> QEMU pl061.c checks the current request against the new request (see
> s->old_in_data ^ s->data in pl061.c file). If no change, nothing will
> happen.
> 
> So two consecutive reboots will cause the following state change;
> apparently the second request won't trigger VM reboot because
> pl01_update() decides _not_ to inject IRQ into guest VM.
> 
>   (PL061State fields)           data   old_in_data   istate
> VM boot                         0      0             0
> 1st ACPI reboot request         8      0             0
> After VM PL061 driver ACK       8      8             0
> 2nd ACPI reboot request         8     no-change, no IRQ <==
> 
> To solve this problem, we have to invert PL061State->data at least once
> to trigger IRQ inside VM. Two solutions:
> 
> S1: "Pulse"
> static void virt_powerdown_req(Notifier *n, void *opaque)
> {
>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
> }
> 
> S2: "Invert"
> static int old_gpio_level = 0;
> static void virt_powerdown_req(Notifier *n, void *opaque)
> {
>     /* use gpio Pin 3 for power button event */
>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), !old_gpio_level);
>     old_gpio_level = !old_gpio_level;
> }
> 
The S2 still doesn't work. After sending the early first reboot, whne
guest boots well, it doesn't react to the second reboot while it reacts
to the third one.

> Both S1 and S2 works for ACPI. But S1 has problem with DT, which is
> explained below.
> 
> === Why DT fails with S1 ===
> DT approach requires both PL061 and gpio-keys to work together. Looking
> into guest kernel gpio-keys/input code, you will find that it only
> reacts to both LEVEL-HI and input changes. Here is the code snip from
> drivers/input/input.c file:
> 
>     /* auto-repeat bypasses state updates */
>     if (value == 2) {
>             disposition = INPUT_PASS_TO_HANDLERS;
>             break;
>     }
> 
>     if (!!test_bit(code, dev->key) != !!value) {
>             __change_bit(code, dev->key);
>             disposition = INPUT_PASS_TO_HANDLERS;
>     }
> 
> Unless we adds gpio-keys DT property to "autorepeat", the
> "!!test_bit(code, dev->key) != !!value" is always FALSE with S1. Thus
> systemd won't receive any input event; and no power-switch will be
> triggered.
> 
> In comparison S2 will work because value is changed very time.
> 
> === Summary ===
> 1. Cleaning PL061 state is required. That means "[PATCH V2 1/2] ARM:
> PL061: Clear PL061 device state after reset" is necessary.
> 2. S2 is better. To support S2, we needs to change GPIO IRQ polarity to
> AML_ACTIVE_BOTH in ACPI description.
> 
Thanks. But we don't have the AML_ACTIVE_BOTH since there is only one
bit for "Interrupt Polarity" in ACPI table.
See ACPI SPEC 6.0 "Table 6-216 Extended Interrupt Descriptor Definition"
Bit [2] Interrupt Polarity, _LL
0 Active-High: This interrupt is sampled when the signal is high,
or true.
1 Active-Low: This interrupt is sampled when the signal is low, or
false.

> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -326,7 +326,7 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>      Aml *aei = aml_resource_template();
>      /* Pin 3 for power button */
>      const uint32_t pin_list[1] = {3};
> -    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, 3,
What's the meaning of 3 here?

>                                   AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
>                                   "GPO0", NULL, 0));
>      aml_append(dev, aml_name_decl("_AEI", aei));

Thanks,
-- 
Shannon


