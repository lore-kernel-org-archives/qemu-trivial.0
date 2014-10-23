Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xh6nz-0002f8-2b
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 21:03:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xh6nt-0002YJ-HB
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 21:03:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xh6np-0002iO-9B
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 21:03:01 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:60496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xh6nc-0002fq-Dp; Wed, 22 Oct 2014 21:02:44 -0400
Received: from 172.24.2.119 (EHLO szxeml421-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AVY05785; Thu, 23 Oct 2014 09:02:36 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 23 Oct 2014 09:02:31 +0800
Message-ID: <5448539F.6030300@huawei.com>
Date: Thu, 23 Oct 2014 09:02:23 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <201410211604116199416@sangfor.com> <5446265E.306@redhat.com>
	<54482D38.5080904@redhat.com>
In-Reply-To: <54482D38.5080904@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.544853AC.0221, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: aef1d1223d5fba262bd3e047ffd40bb7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Zhang Haoyu <zhanghy@sangfor.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] snapshot: use local
 variable to bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 01:03:05 -0000

On 2014/10/23 6:18, Eric Blake wrote:

> On 10/21/2014 03:24 AM, Max Reitz wrote:
>> On 2014-10-21 at 10:04, Zhang Haoyu wrote:
>>> Use local variable to bdrv_pwrite_sync L1 table,
>>> needless to make conversion of cached L1 table between
>>> big-endian and host style.
>>>
>>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>>> ---
>>>   block/qcow2-refcount.c | 22 +++++++---------------
>>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>>
> 
> I know we're up to v5 and that Max already took it into his branch, but...
> 
> 
>>>       l1_size2 = l1_size * sizeof(uint64_t);
>>> +    l1_table = g_try_malloc0(align_offset(l1_size2, 512));
>>
>> I wanted to propose using qemu_try_blockalign(), but since it'd require
>> a memset() afterwards, it gets rather ugly.
> 
> Not after this recent patch:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2014-10/msg02499.html
> 

Good catch :)

Best regards,
-Gonglei


