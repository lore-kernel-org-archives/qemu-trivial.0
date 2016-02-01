Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQIDR-0008IW-SI
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 12:24:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQIDL-00089N-5c
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 12:24:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQIDK-0003aN-7t
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 12:24:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQIDG-0003Y4-1E; Mon, 01 Feb 2016 12:24:30 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9BD1470D74;
	Mon,  1 Feb 2016 17:24:29 +0000 (UTC)
Received: from [10.10.59.145] (vpn-59-145.rdu2.redhat.com [10.10.59.145])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11HOQf6024056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 1 Feb 2016 12:24:28 -0500
To: Igor Mammedov <imammedo@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
	<CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
	<56AB818B.1060500@redhat.com>
	<20160201111736.155e82fa@nial.brq.redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56AF94CA.8060605@redhat.com>
Date: Mon, 1 Feb 2016 11:24:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160201111736.155e82fa@nial.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Mon, 01 Feb 2016 17:24:40 -0000



On 02/01/2016 04:17 AM, Igor Mammedov wrote:
> On Fri, 29 Jan 2016 09:13:15 -0600
> Wei Huang <wei@redhat.com> wrote:
> 
>> On 01/29/2016 08:50 AM, Peter Maydell wrote:
>>> On 29 January 2016 at 14:46, Shannon Zhao <shannon.zhao@linaro.org> wrote:  
>>>> On 2016/1/29 22:35, Wei Huang wrote:  
>>>>> On 01/29/2016 04:10 AM, Shannon Zhao wrote:  
>>>>>> This makes ACPI work well but makes DT not work. The reason is systemd or
>>>>>> acpid open /dev/input/event0 failed. So the interrupt could be injected
>>>>>> and
>>>>>> could see under /proc/interrupts but guest doesn't have any action. I'll
>>>>>> investigate why it opens failed later.  
>>>>>
>>>>>
>>>>> That is interesting. Could you try it with the following? This reverses
>>>>> the order to down-up and worked on ACPI case.
>>>>>  
>>>> Yeah, that's very weird.
>>>>  
>>>>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
>>>>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
>>>>>  
>>>> I'll try this tomorrow. But even if this works, it's still weird.  
>>>
>>> I wonder if we should be asserting the GPIO pin in the powerdown-request
>>> hook and then deasserting it on system reset somewhere...  
>>
>> This is another possibility. We can try to reset the pl061 state by
>> hooking up with dc->reset and see what happens.
> I think that's what we do on x86.

So the device state is wrong after reset. I just sent out a fix for it,
which was verified on ACPI code path. Basically the old_in_data is stale
after reboot, causing QEMU to believe that it isn't necessary to raise
up IRQ again for the second reboot/shutdown (see s->old_in_data ^
s->data in pl061.c file).

Shannon: could you double check from your side with my patch?

-Wei

> 
>>
>>>
>>> thanks
>>> -- PMM
>>>   
>>
> 

