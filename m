Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aW5zf-0005d9-9Y
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2016 12:34:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aW5zd-0005aN-C2
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 12:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aW5zX-0007Sd-JA
	for qemu-trivial@nongnu.org; Wed, 17 Feb 2016 12:34:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aW5zO-0007R6-5s; Wed, 17 Feb 2016 12:34:10 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 8CE41C00071A;
	Wed, 17 Feb 2016 17:34:09 +0000 (UTC)
Received: from [10.10.52.181] (unused [10.10.52.181] (may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1HHY59i005599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Feb 2016 12:34:07 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1454359775-25959-1-git-send-email-wei@redhat.com>
	<CAFEAcA8czS_7Wxw1_s_khTL8eFNKcXixRrEYuEb4==_cYbdHbg@mail.gmail.com>
	<CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56C4AF0D.9070803@redhat.com>
Date: Wed, 17 Feb 2016 11:34:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oUBe+mZ+2Lq0RO2eq_-H+atamp=gBCnxS2OWdkyza0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH V2 1/2] ARM: PL061: Clear PL061 device
	state after reset
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
X-List-Received-Date: Wed, 17 Feb 2016 17:34:26 -0000



On 02/16/2016 08:39 AM, Peter Maydell wrote:
> On 16 February 2016 at 14:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 1 February 2016 at 20:49, Wei Huang <wei@redhat.com> wrote:
>>> Current QEMU doesn't clear PL061 state after reset. This causes a
>>> weird issue with guest reboot via GPIO. Here is the device state
>>> description with two reboot requests:
> 
>>
>> These reset values are all OK...
>>
>>> +
>>> +static void pl061_state_reset(DeviceState *dev)
>>> +{
>>> +    PL061State *s = PL061(dev);
>>> +
>>> +    pl061_reset(s);
>>>  }
>>
>> ...but you don't need to have this wrapper function.
>> You can just do the reset in a function called pl061_reset()
>> with the function signature we need for dc->reset.
>> The only place that currently calls the existing pl061_reset()
>> is the device's init function, and you can delete that call
>> because the Device framework automatically calls the dc->reset
>> function after device initialization.
> 
> I know this patch doesn't (by itself) fix the issues with guest
> reboot, but I think it is worth having anyway because not resetting
> the PL061 state is a genuine bug. Can you do a v3 and resend, please?
> 
> PS: please could you include a cover letter email next time round,
> since this is a multi patch series?

Done, please review.

> 
> Side note: half our "PL061" behaviour is actually specific
> to the TI variant in the Luminary, and for our plain old PL061
> we ought to restrict access to the registers that are Stellaris
> only. But that's a different bug and not a very major one.

Thanks for your suggestion. I was trying to fix it. The plan was to add
a new field rsvd_addr in "struct PL061State". Then in pl061_read() and
pl061_write(), we can check offset against [rsvd_addr, 0xfcc] (ignored
if inside).

While I was working on it, I realized that this is a benign issue. It is
true that PL061 device can access Luminary registers in the reserved
memory area. However QEMU doesn't use these Luminary registers anywhere
else other than pl061_read() and pl061_write(). It basically passes the
read/write requests through. I don't see a malicious driver can damage
device state. Thoughts?

Thanks,
-Wei

> 
> thanks
> -- PMM
> 

