Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZU74-0000Nz-6Y
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 20:56:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aZU71-0000N2-Ew
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 20:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aZU6y-0001ds-1e
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 20:56:03 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:25583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aZU6w-0001ZW-W4; Fri, 26 Feb 2016 20:55:59 -0500
Received: from 172.24.1.49 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BWR90069; Sat, 27 Feb 2016 09:55:44 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 27 Feb 2016 09:55:25 +0800
Message-ID: <56D10209.7090002@huawei.com>
Date: Sat, 27 Feb 2016 09:55:21 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Wei Huang <wei@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com> <56D04596.7010205@huawei.com>
	<CAFEAcA-nQuKcONE4GZwavB2w55srvHQP4OxLD6epJaZf4b=agA@mail.gmail.com>
	<56D06712.2030607@linaro.org>
	<CAFEAcA8DE2Sx4+Rm8cg-tLktW0hz9VcV_7O2jWN5OeA9CwyF4w@mail.gmail.com>
	<56D06F29.7040106@redhat.com>
	<CAFEAcA8_bP64H0EOnx_gSWmMXcQvHFy8L+ervvgDkJE1xqtkbA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_bP64H0EOnx_gSWmMXcQvHFy8L+ervvgDkJE1xqtkbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56D10222.0108, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: baa44350aa3f91d13edfba6646b27aa7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
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
X-List-Received-Date: Sat, 27 Feb 2016 01:56:04 -0000



On 2016/2/26 23:42, Peter Maydell wrote:
> On 26 February 2016 at 15:28, Wei Huang <wei@redhat.com> wrote:
>>
>>
>> On 02/26/2016 09:06 AM, Peter Maydell wrote:
>>> On 26 February 2016 at 14:54, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>>>> On 2016/2/26 20:53, Peter Maydell wrote:
>>>>> I don't understand why a 500ms pulse is better than a short one.
>>>>>
>>>> Oh, I just pick a value which seems like a real latency for pressing a
>>>> button. What's your suggestion?
>>>
>>> I would prefer to avoid the pain of having a timer whose state
>>> needs to be migrated. It's unclear to me why a 500ms pulse
>>> will solve anything that an instantaneous pulse does not,
>>> so I'd like to better understand the problem first.
>>
>> The problem we found with pulse was: only the last state change in GPIO
>> is received by guest VM. In other words, with 0(L)->1(H)->0(L) or
>> 1(H)->0(L)->1(0), PL061 only sees the last state (0 and 1). I guess this
>> is because QEMU is non-preemptive. The solution is to have the following
>> steps:
>>   * qemu_set_irq(gpio_in, 1)
>>   * yeild to guest VM
>>   * qemu_set_irq(gpio_in, 0)
>>
>> Is there any way to do so in QEMU without using timer?
> 
> You have no guarantee that the guest VM will necessarily
> make any progress even with a 500ms pulse length, 
Yeah, if the guest is very busy! But it's true in the real world like
that we press a GPIO_KEY button, but guest is too busy that it can't
react to this then the guest can't shutdown.

> so I don't
> think increasing the length of the pulse is going to solidly
> fix this.
> 
This is not simply increasing the length. It just makes the guest not
blocked after the first qemu_set_irq so that the guest can detect the
button is pressed(i.e. get the value 1). Then after any time, call the
second qemu_set_irq then guest can detect the button is released.

You must be aware that here the purpose of qemu_set_irq is only to set
the value of gpio pin not directly set the interrupt controller. As for
injecting the interrupt, it's what the PL061 device does which detects
the pin value changed.

And for GPIO_KEY, it must detect 1 and 0 then it realizes it as a valid
input.

Have a look at the below function in drivers/input/keyboard/gpio_keys.c.

static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
{
	const struct gpio_keys_button *button = bdata->button;
	struct input_dev *input = bdata->input;
	unsigned int type = button->type ?: EV_KEY;
	int state = (gpio_get_value_cansleep(button->gpio) ? 1 : 0) ^
button->active_low;

	if (type == EV_ABS) {
		if (state)
			input_event(input, type, button->code, button->value);
	} else {
		input_event(input, type, button->code, !!state);
	}
	input_sync(input);
}


> As usual with any kind of interrupt you either need to
> trigger on an edge (and latch the trigger in the interrupt
> controller until the guest picks it up), or trigger on a
> level, and keep the level high until the guest acknowledges
> by writing back to the original device to tell it to drop
> the level.
> 
As said, here we only want change the some pin value and want guest to
get the value. The interrupt is triggered by PL061 device which just
notifies the guest that pin value is changed, please read.

Thanks,
-- 
Shannon


