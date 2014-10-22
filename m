Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xguvm-0002kR-9Q
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 08:22:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xguvg-0002Z6-2N
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xguvb-0001rF-EK
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:22:15 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:56675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XguvR-0001lJ-Ib; Wed, 22 Oct 2014 08:22:02 -0400
Received: from 172.24.2.119 (EHLO szxeml456-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDF52408; Wed, 22 Oct 2014 20:21:43 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml456-hub.china.huawei.com
	(10.82.67.199) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 22 Oct 2014 20:21:39 +0800
Message-ID: <5447A151.2050000@huawei.com>
Date: Wed, 22 Oct 2014 20:21:37 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Max Reitz <mreitz@redhat.com>
References: <201410221945053926307@sangfor.com> <54479C3E.1070803@huawei.com>
	<54479C8A.9000407@redhat.com> <54479CE5.7040406@redhat.com>
In-Reply-To: <54479CE5.7040406@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Zhang Haoyu <zhanghy@sangfor.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] snapshot: use local
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
X-List-Received-Date: Wed, 22 Oct 2014 12:22:20 -0000

On 2014/10/22 20:02, Max Reitz wrote:

> On 2014-10-22 at 14:01, Max Reitz wrote:
>> On 2014-10-22 at 13:59, Gonglei wrote:
>>> On 2014/10/22 19:45, Zhang Haoyu wrote:
>>>
>>>> Use local variable to bdrv_pwrite_sync L1 table,
>>>> needless to make conversion of cached L1 table between
>>>> big-endian and host style.
>>>>
>>>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>> v3 -> v4:
>>>>   - convert local L1 table to host-style before copy it
>>>>     back to s->l1_table
>>>>
>>>> v2 -> v3:
>>>>   - replace g_try_malloc0 with qemu_try_blockalign
>>>>   - copy the latest local L1 table back to s->l1_table
>>>>     after successfully bdrv_pwrite_sync L1 table
>>>>
>>>> v1 -> v2:
>>>>   - remove the superflous assignment, l1_table = NULL;
>>>>   - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
>>>>   - remove needless check of if (l1_table) before g_free(l1_table)
>>>>
>>>>   block/qcow2-refcount.c | 28 ++++++++++++----------------
>>>>   1 file changed, 12 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>>> index 2bcaaf9..3e4050a 100644
>>>> --- a/block/qcow2-refcount.c
>>>> +++ b/block/qcow2-refcount.c
>>>> @@ -881,14 +881,17 @@ int 
>>>> qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>>>   {
>>>>       BDRVQcowState *s = bs->opaque;
>>>>       uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
>>>> -    bool l1_allocated = false;
>>>>       int64_t old_offset, old_l2_offset;
>>>>       int i, j, l1_modified = 0, nb_csectors, refcount;
>>>>       int ret;
>>>>         l2_table = NULL;
>>>> -    l1_table = NULL;
>>>>       l1_size2 = l1_size * sizeof(uint64_t);
>>>> +    l1_table = qemu_try_blockalign(bs->file, l1_size2);
>>>> +    if (l1_size2 && l1_table == NULL) {
>>> I think this check has a logic problem.  If l1_size2 != 0 and 
>>> l1_table == NULL,
>>> What will happen?
>>
>> Then this condition is met and you return with -ENOMEM...?
> 
> Oh, but I see something different: qemu_try_blockalign() never returns 
> NULL, not even when you request 0 bytes. 


Yes. But if l1_size2 is zero, will waste memory or some other problems.
Please see below:

the original code:
l1_table = g_try_malloc0(align_offset(0, 512));
 -> l1_table = g_try_malloc0(0)
so  l1_table == NULL.

after this patch:
l1_table = qemu_try_blockalign(bs->file, 0)
l1_table will not be NULL.

I don't know whether l1_size2 can be zero or not.

Best regards,
-Gonglei

> Therefore, just "if (l1_table  == NULL)" is sufficient.
> 


> Max




