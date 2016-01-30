Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPQkV-0001Q7-Ru
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 03:19:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aPQkT-0001NN-Cy
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 03:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aPQkS-0007sT-Ep
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 03:19:13 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:24857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aPQkM-0007nC-OL; Sat, 30 Jan 2016 03:19:07 -0500
Received: from 172.24.1.48 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAR76989; Sat, 30 Jan 2016 16:18:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 30 Jan 2016 16:18:52 +0800
Message-ID: <56AC71D8.1090509@huawei.com>
Date: Sat, 30 Jan 2016 16:18:32 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com>
In-Reply-To: <56AB78A6.7070505@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.56AC71F0.0007, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4e483b9f970a0138d4cf102654284a6d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sat, 30 Jan 2016 08:19:14 -0000



On 2016/1/29 22:35, Wei Huang wrote:
> 
> On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>> > Hi，
>> > 
>> > This makes ACPI work well but makes DT not work. The reason is systemd or
>> > acpid open /dev/input/event0 failed.
To correct, systemd or acpid open /dev/input/event0 successfully but it
waits for events and when we input "system_powerdown", it doesn't get
the event.

> So the interrupt could be injected and
>> > could see under /proc/interrupts but guest doesn't have any action. I'll
>> > investigate why it opens failed later.
> That is interesting. Could you try it with the following? This reverses
> the order to down-up and worked on ACPI case.
> 
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
If we don't input "system_powerdown" during guest booting(before device
driver load), current QEMU with above codes could work for DT. But if we
input "system_powerdown" during guest booting, guest has no action when
we input "system_powerdown" again after guest booting completely.
I add dc->reset for pl061 but get the same result.

Below is the output of acpid:

./acpid -l -n -d
input layer /dev/input/event0 (gpio-keys) opened successfully, fd 4
inotify fd: 5
inotify wd: 1
RTNETLINK1 answers: No such file or directory
acpid: error talking to the kernel via netlink
netlink opened successfully
acpid: starting up with netlink and the input layer
parsing conf file /etc/acpi/events/powerbtn
acpid: 1 rule loaded
acpid: waiting for events: event logging is on

It will stuck here even if we input "system_powerdown".

Below is the right output when we input "system_powerdown".

./acpid -l -n -d
input layer /dev/input/event0 (gpio-keys) opened successfully, fd 4
inotify fd: 5
inotify wd: 1
RTNETLINK1 answers: No such file or directory
acpid: error talking to the kernel via netlink
netlink opened successfully
acpid: starting up with netlink and the input layer
parsing conf file /etc/acpi/events/powerbtn
acpid: 1 rule loaded
acpid: waiting for events: event logging is on
acpid: received input layer event "button/power PBTN 00000080 00000000"
acpid: rule from /etc/acpi/events/powerbtn matched
acpid: executing action "/etc/acpi/powerbtn.sh"

Thanks,
-- 
Shannon


