Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYhpk-00046p-E1
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2016 17:23:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aYhpg-000414-Lt
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 17:22:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aYhpf-0007Q9-B7
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 17:22:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aYhpa-0007Pl-FY; Wed, 24 Feb 2016 17:22:50 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id BF86B7F082;
	Wed, 24 Feb 2016 22:22:48 +0000 (UTC)
Received: from [10.10.53.181] (vpn-53-181.rdu2.redhat.com [10.10.53.181])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1OMMhC9016557
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 24 Feb 2016 17:22:44 -0500
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56CE2D33.7020005@redhat.com>
Date: Wed, 24 Feb 2016 16:22:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56C845B1.3080000@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
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
X-List-Received-Date: Wed, 24 Feb 2016 22:22:58 -0000



On 02/20/2016 04:53 AM, Shannon Zhao wrote:
> Hi Wei,
> 
> On 2016/2/10 6:59, Wei Huang wrote:
>>
>> On 02/04/2016 12:51 AM, Shannon Zhao wrote:
>>>
>>>
>>> On 2016/2/4 14:10, Wei Huang wrote:
>>>>
>>>> On 02/03/2016 07:44 PM, Shannon Zhao wrote:
>>
>> <snip>
>>
>>>> I reversed the order of edge pulling. The state is 1 according to printk
>>>> inside gpio_keys driver. However the reboot still failed with two
>>>> reboots (1 very early, 1 later).
>>>>
>>> Because to make the input work, it should call input_event twice I think.
>>>
>>> input_event(input, type, button->code, 1) means the button pressed
>>> input_event(input, type, button->code, 0) means the button released
>>>
>>> But We only see guest entering gpio_keys_gpio_report_event once.
>>>
>>> My original purpose is like below:
>>>
>>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) to make guest
>>> execute input_event(input, type, button->code, 1)
>>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) to make guest
>>> execute input_event(input, type, button->code, 0).
>>>
>>> But even though it calls qemu_set_irq twice, it only calls pl061_update
>>> once in qemu.
>>
>> Hi Shannon,
>>
>> Assuming that we are talking about the special case you found (i.e. send
>> reboot very early and then send another one after guest VM fully
>> booted). Dug into the code further, here are my findings:
>>
>> === Why ACPI case failed? ===
>> QEMU pl061.c checks the current request against the new request (see
>> s->old_in_data ^ s->data in pl061.c file). If no change, nothing will
>> happen.
>>
>> So two consecutive reboots will cause the following state change;
>> apparently the second request won't trigger VM reboot because
>> pl01_update() decides _not_ to inject IRQ into guest VM.
>>
>>   (PL061State fields)           data   old_in_data   istate
>> VM boot                         0      0             0
>> 1st ACPI reboot request         8      0             0
>> After VM PL061 driver ACK       8      8             0
>> 2nd ACPI reboot request         8     no-change, no IRQ <==
>>
>> To solve this problem, we have to invert PL061State->data at least once
>> to trigger IRQ inside VM. Two solutions:
>>
>> S1: "Pulse"
>> static void virt_powerdown_req(Notifier *n, void *opaque)
>> {
>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>> }
>>
>> S2: "Invert"
>> static int old_gpio_level = 0;
>> static void virt_powerdown_req(Notifier *n, void *opaque)
>> {
>>     /* use gpio Pin 3 for power button event */
>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), !old_gpio_level);
>>     old_gpio_level = !old_gpio_level;
>> }
>>
> The S2 still doesn't work. After sending the early first reboot, whne
> guest boots well, it doesn't react to the second reboot while it reacts
> to the third one.

I can reproduce it. The problem is that gpio-keys only handles
GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH. It can't react to ACTIVE_BOTH. That
explains why it reacts to the 3rd request: HIGH (ingored, too early,
keyboard driver not loaded) ==> LOW (ignored, ACTIVE_HIGH only) ==> HIGH
(received).

This problem is full of dilemma, across different components in QEMU or
guest VM:

* For qemu/pl011.c to generate IRQ, we need to have level transition.
That means qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) in
virt_powerdown_req() isn't enough.
* If we do "invert" (i.e. S2 above), gpio-keys inside VM isn't happy
with it.
* If we do pulse (i.e. S1 above), DT fails because of the reason
explained below. Plus the GPIO seems to receive the same state due to
non-preemptive (you mentioned it long time ago).

Not sure what to do next. Some wild ideas can be:
1) set up a worker thread to pull down GPIO after a fix time. This
emulates real world scenario.
2) enable PL061 to support auto-ACK after receiving ACK from guest VM.

Thanks,
-Wei

> 
>> Both S1 and S2 works for ACPI. But S1 has problem with DT, which is
>> explained below.
>>
>> === Why DT fails with S1 ===
>> DT approach requires both PL061 and gpio-keys to work together. Looking
>> into guest kernel gpio-keys/input code, you will find that it only
>> reacts to both LEVEL-HI and input changes. Here is the code snip from
>> drivers/input/input.c file:
>>
>>     /* auto-repeat bypasses state updates */
>>     if (value == 2) {
>>             disposition = INPUT_PASS_TO_HANDLERS;
>>             break;
>>     }
>>
>>     if (!!test_bit(code, dev->key) != !!value) {
>>             __change_bit(code, dev->key);
>>             disposition = INPUT_PASS_TO_HANDLERS;
>>     }
>>
>> Unless we adds gpio-keys DT property to "autorepeat", the
>> "!!test_bit(code, dev->key) != !!value" is always FALSE with S1. Thus
>> systemd won't receive any input event; and no power-switch will be
>> triggered.
>>
>> In comparison S2 will work because value is changed very time.
>>
>> === Summary ===
>> 1. Cleaning PL061 state is required. That means "[PATCH V2 1/2] ARM:
>> PL061: Clear PL061 device state after reset" is necessary.
>> 2. S2 is better. To support S2, we needs to change GPIO IRQ polarity to
>> AML_ACTIVE_BOTH in ACPI description.
>>
> Thanks. But we don't have the AML_ACTIVE_BOTH since there is only one
> bit for "Interrupt Polarity" in ACPI table.
> See ACPI SPEC 6.0 "Table 6-216 Extended Interrupt Descriptor Definition"
> Bit [2] Interrupt Polarity, _LL
> 0 Active-High: This interrupt is sampled when the signal is high,
> or true.
> 1 Active-Low: This interrupt is sampled when the signal is low, or
> false.



> 
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -326,7 +326,7 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>>      Aml *aei = aml_resource_template();
>>      /* Pin 3 for power button */
>>      const uint32_t pin_list[1] = {3};
>> -    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
>> +    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, 3,
> What's the meaning of 3 here?
> 
>>                                   AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
>>                                   "GPO0", NULL, 0));
>>      aml_append(dev, aml_name_decl("_AEI", aei));
> 
> Thanks,
> 

