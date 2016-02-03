Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQzse-0003mS-26
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 11:02:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQzsW-0003b3-8y
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 11:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aQzsS-0007hC-2W
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 11:02:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aQzsL-0007eg-SS; Wed, 03 Feb 2016 11:01:49 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 9EAF73BEB5;
	Wed,  3 Feb 2016 16:01:48 +0000 (UTC)
Received: from [10.10.49.88] (vpn-49-88.rdu2.redhat.com [10.10.49.88])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u13G1j6d022719; Wed, 3 Feb 2016 11:01:46 -0500
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<56B1A90E.3000506@msgid.tls.msk.ru>
	<CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <56B22469.7040308@redhat.com>
Date: Wed, 3 Feb 2016 10:01:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RzHTZhZemvSGZ_Qpji+bu0=13wQJ0ThMbYhYdJ99w1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
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
X-List-Received-Date: Wed, 03 Feb 2016 16:02:06 -0000



On 2/3/16 04:46, Peter Maydell wrote:
> On 3 February 2016 at 07:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 28.01.2016 21:22, Wei Huang wrote:
>>> When QEMU is hook'ed up with libvirt/virsh, the first ACPI reboot
>>> request will succeed; but the following shutdown/reboot requests
>>> fail to trigger VMs to react. Notice that in mach-virt machine
>>> model GPIO is defined as edge-triggered and active-high in ACPI.
>>> This patch changes the behavior of powerdown notifier from PULLUP
>>> to PULSE. It solves the problem described above (i.e. reboot
>>> continues to work).
>>
>> So, what's the outcome of this? :)
> 
> This patch is definitely wrong. The patch to fix up the
> gpio reset stuff is definitely the right idea. Whether it
> fixes the reported failure or some further change is also
> needed is currently unclear.

I will NAK this one for now. Please see V2 patch, which is necessary. In
the meanwhile, I think there is a problem with pulling-up only in
current implementation. Let me debug Shannon's DT problem first.

> 
> thanks
> -- PMM
> 

