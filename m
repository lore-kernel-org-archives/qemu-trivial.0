Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPAjq-0006Pv-Vy
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 10:13:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aPAjl-0006H2-F2
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:13:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aPAjk-00005w-Ee
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:13:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aPAjd-0008VU-5D; Fri, 29 Jan 2016 10:13:17 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id C5BEC8F029;
	Fri, 29 Jan 2016 15:13:16 +0000 (UTC)
Received: from [10.10.49.93] (vpn-49-93.rdu2.redhat.com [10.10.49.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TFDFsm004562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jan 2016 10:13:16 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
	<CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56AB818B.1060500@redhat.com>
Date: Fri, 29 Jan 2016 09:13:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Fri, 29 Jan 2016 15:13:29 -0000



On 01/29/2016 08:50 AM, Peter Maydell wrote:
> On 29 January 2016 at 14:46, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> On 2016/1/29 22:35, Wei Huang wrote:
>>> On 01/29/2016 04:10 AM, Shannon Zhao wrote:
>>>> This makes ACPI work well but makes DT not work. The reason is systemd or
>>>> acpid open /dev/input/event0 failed. So the interrupt could be injected
>>>> and
>>>> could see under /proc/interrupts but guest doesn't have any action. I'll
>>>> investigate why it opens failed later.
>>>
>>>
>>> That is interesting. Could you try it with the following? This reverses
>>> the order to down-up and worked on ACPI case.
>>>
>> Yeah, that's very weird.
>>
>>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>>
>> I'll try this tomorrow. But even if this works, it's still weird.
> 
> I wonder if we should be asserting the GPIO pin in the powerdown-request
> hook and then deasserting it on system reset somewhere...

This is another possibility. We can try to reset the pl061 state by
hooking up with dc->reset and see what happens.

> 
> thanks
> -- PMM
> 

