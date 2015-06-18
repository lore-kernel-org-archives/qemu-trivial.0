Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5X5L-0001MC-Fb
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 06:30:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z5X5J-0001IV-8G
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 06:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z5X5I-0003uT-AZ
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 06:30:13 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:32448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Z5X5A-0003Z3-AR; Thu, 18 Jun 2015 06:30:04 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPR33652; Thu, 18 Jun 2015 18:29:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 18 Jun 2015 18:29:44 +0800
Message-ID: <55829D96.1040607@huawei.com>
Date: Thu, 18 Jun 2015 18:29:42 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
	<558121F9.6010804@msgid.tls.msk.ru>
In-Reply-To: <558121F9.6010804@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v3 0/8] Add a member in MachineState to
	store irq array
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
X-List-Received-Date: Thu, 18 Jun 2015 10:30:14 -0000



On 2015/6/17 15:30, Michael Tokarev wrote:
> 17.06.2015 05:59, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> These are relevant to memory leak in machine init function. Here we add
>> a member in MachineState to store irq array returned from
>> qemu_allocate_irqs.
>>
>> PS. These patches are split from my previous patchset [1] since they are
>> relevant to MachineState.
>>
>> Thanks,
>> Shannon
>>
>> [1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irqs
>>
>> changes since v2：
>>   * Rebased on QEMU upstream
>>   * Add a member in MachineState first, then fix the memory leak [mjt]
> 
> Um.  This is not what I asked.  It was a small suggestion, to add
> infrastructure first use it in subsequent patches.
> 
> But the main question was what this infrastructure, what this patchset
> actually brings us?  You just store the irq pointer in machine state,
> that's okay, but WHAT FOR?  If your intention is to free resources,
> this intention isn't met.  The end result of this whole change is a no-op,
> there's nothing changed, the memory which has been allocated isn't being
> freed.
> 

Ok, will rethink about.

> So the actual question is: what's the point of this patchset?
> 
> Thanks,
> 
> /mjt
> 
> 
> .
> 

-- 
Shannon


