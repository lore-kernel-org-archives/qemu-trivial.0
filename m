Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aZHZX-0000Nw-DI
	for mharc-qemu-trivial@gnu.org; Fri, 26 Feb 2016 07:32:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aZHZQ-0000CF-2J
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 07:32:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aZHZO-0008UZ-CB
	for qemu-trivial@nongnu.org; Fri, 26 Feb 2016 07:32:32 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:57677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aZHZF-0008SC-Km; Fri, 26 Feb 2016 07:32:24 -0500
Received: from 172.24.1.48 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCA12902; Fri, 26 Feb 2016 20:32:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 26 Feb 2016 20:32:03 +0800
Message-ID: <56D04596.7010205@huawei.com>
Date: Fri, 26 Feb 2016 20:31:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
	<56B22469.7040308@redhat.com> <56B2AD13.6030504@huawei.com>
	<56B2EB3E.2000908@redhat.com> <56B2F4E3.6010807@huawei.com>
	<56BA6F6C.5000301@redhat.com> <56C845B1.3080000@huawei.com>
	<56CE2D33.7020005@redhat.com>
In-Reply-To: <56CE2D33.7020005@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.56D045CB.021E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4e483b9f970a0138d4cf102654284a6d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
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
X-List-Received-Date: Fri, 26 Feb 2016 12:32:34 -0000



On 2016/2/25 6:22, Wei Huang wrote:
> 
> 
> On 02/20/2016 04:53 AM, Shannon Zhao wrote:
>> Hi Wei,
>>
>> On 2016/2/10 6:59, Wei Huang wrote:
>>>
>>> On 02/04/2016 12:51 AM, Shannon Zhao wrote:
>>>>
>>>>
>>>> On 2016/2/4 14:10, Wei Huang wrote:
>>>>>
>>>>> On 02/03/2016 07:44 PM, Shannon Zhao wrote:
>>>
>>> <snip>
>>>
>>>>> I reversed the order of edge pulling. The state is 1 according to printk
>>>>> inside gpio_keys driver. However the reboot still failed with two
>>>>> reboots (1 very early, 1 later).
>>>>>
>>>> Because to make the input work, it should call input_event twice I think.
>>>>
>>>> input_event(input, type, button->code, 1) means the button pressed
>>>> input_event(input, type, button->code, 0) means the button released
>>>>
>>>> But We only see guest entering gpio_keys_gpio_report_event once.
>>>>
>>>> My original purpose is like below:
>>>>
>>>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) to make guest
>>>> execute input_event(input, type, button->code, 1)
>>>> call qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0) to make guest
>>>> execute input_event(input, type, button->code, 0).
>>>>
>>>> But even though it calls qemu_set_irq twice, it only calls pl061_update
>>>> once in qemu.
>>>
>>> Hi Shannon,
>>>
>>> Assuming that we are talking about the special case you found (i.e. send
>>> reboot very early and then send another one after guest VM fully
>>> booted). Dug into the code further, here are my findings:
>>>
>>> === Why ACPI case failed? ===
>>> QEMU pl061.c checks the current request against the new request (see
>>> s->old_in_data ^ s->data in pl061.c file). If no change, nothing will
>>> happen.
>>>
>>> So two consecutive reboots will cause the following state change;
>>> apparently the second request won't trigger VM reboot because
>>> pl01_update() decides _not_ to inject IRQ into guest VM.
>>>
>>>   (PL061State fields)           data   old_in_data   istate
>>> VM boot                         0      0             0
>>> 1st ACPI reboot request         8      0             0
>>> After VM PL061 driver ACK       8      8             0
>>> 2nd ACPI reboot request         8     no-change, no IRQ <==
>>>
>>> To solve this problem, we have to invert PL061State->data at least once
>>> to trigger IRQ inside VM. Two solutions:
>>>
>>> S1: "Pulse"
>>> static void virt_powerdown_req(Notifier *n, void *opaque)
>>> {
>>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>> }
>>>
>>> S2: "Invert"
>>> static int old_gpio_level = 0;
>>> static void virt_powerdown_req(Notifier *n, void *opaque)
>>> {
>>>     /* use gpio Pin 3 for power button event */
>>>     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), !old_gpio_level);
>>>     old_gpio_level = !old_gpio_level;
>>> }
>>>
>> The S2 still doesn't work. After sending the early first reboot, whne
>> guest boots well, it doesn't react to the second reboot while it reacts
>> to the third one.
> 
> I can reproduce it. The problem is that gpio-keys only handles
> GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH. It can't react to ACTIVE_BOTH. That
> explains why it reacts to the 3rd request: HIGH (ingored, too early,
> keyboard driver not loaded) ==> LOW (ignored, ACTIVE_HIGH only) ==> HIGH
> (received).
> 
> This problem is full of dilemma, across different components in QEMU or
> guest VM:
> 
> * For qemu/pl011.c to generate IRQ, we need to have level transition.
> That means qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1) in
> virt_powerdown_req() isn't enough.
> * If we do "invert" (i.e. S2 above), gpio-keys inside VM isn't happy
> with it.
> * If we do pulse (i.e. S1 above), DT fails because of the reason
> explained below. Plus the GPIO seems to receive the same state due to
> non-preemptive (you mentioned it long time ago).
> 
> Not sure what to do next. Some wild ideas can be:
> 1) set up a worker thread to pull down GPIO after a fix time. This
> emulates real world scenario.
Yeah, right! But other than a worker thread, I'd like to use a timer.
Then set a latency between pull up and down like we press a button in
real world.

So how about below patch? I've tested it and it works both for ACPI and
DT. Could you help verify if it works for you? Thanks.

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15658f4..4d45ea2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -558,11 +558,20 @@ static void create_rtc(const VirtBoardInfo *vbi,
qemu_irq *pic)
     g_free(nodename);
 }

+#define GPIO_KEY_LATENCY 500 /* 500ms */
 static DeviceState *pl061_dev;
+static QEMUTimer *gpio_key_timer;
+static void gpio_key_timer_expired(void *vp)
+{
+    qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
+}
+
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
     /* use gpio Pin 3 for power button event */
     qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
+    timer_mod(gpio_key_timer,
+              qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + GPIO_KEY_LATENCY);
 }

 static Notifier virt_system_powerdown_notifier = {
@@ -609,6 +618,8 @@ static void create_gpio(const VirtBoardInfo *vbi,
qemu_irq *pic)

     /* connect powerdown request */
     qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
+    gpio_key_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
gpio_key_timer_expired,
+                                  NULL);

     g_free(nodename);
 }

Thanks,
-- 
Shannon


