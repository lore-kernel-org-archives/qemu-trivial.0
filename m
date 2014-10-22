Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xgv5O-0003dr-Lh
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 08:32:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1Xgv5J-0003aS-1T
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1Xgv5E-00051G-Gh
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:32:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1Xgv5E-000518-86; Wed, 22 Oct 2014 08:32:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9MCW2dT004069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 22 Oct 2014 08:32:03 -0400
Received: from dresden.str.redhat.com (dhcp-192-247.str.redhat.com
	[10.33.192.247])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9MCW0Dl023984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 22 Oct 2014 08:32:01 -0400
Message-ID: <5447A3C0.6070003@redhat.com>
Date: Wed, 22 Oct 2014 14:32:00 +0200
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>
References: <201410221945053926307@sangfor.com> <54479C3E.1070803@huawei.com>
	<54479C8A.9000407@redhat.com> <54479CE5.7040406@redhat.com>
	<5447A151.2050000@huawei.com> <5447A1E1.7030102@redhat.com>
	<5447A374.4070309@huawei.com>
In-Reply-To: <5447A374.4070309@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 22 Oct 2014 12:32:17 -0000

On 2014-10-22 at 14:30, Gonglei wrote:
> On 2014/10/22 20:24, Max Reitz wrote:
>
>> On 2014-10-22 at 14:21, Gonglei wrote:
>>> On 2014/10/22 20:02, Max Reitz wrote:
>>>
>>>> On 2014-10-22 at 14:01, Max Reitz wrote:
>>>>> On 2014-10-22 at 13:59, Gonglei wrote:
>>>>>> On 2014/10/22 19:45, Zhang Haoyu wrote:
>>>>>>
>>>>>>> Use local variable to bdrv_pwrite_sync L1 table,
>>>>>>> needless to make conversion of cached L1 table between
>>>>>>> big-endian and host style.
>>>>>>>
>>>>>>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>>>>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>>>>> ---
>>>>>>> v3 -> v4:
>>>>>>>     - convert local L1 table to host-style before copy it
>>>>>>>       back to s->l1_table
>>>>>>>
>>>>>>> v2 -> v3:
>>>>>>>     - replace g_try_malloc0 with qemu_try_blockalign
>>>>>>>     - copy the latest local L1 table back to s->l1_table
>>>>>>>       after successfully bdrv_pwrite_sync L1 table
>>>>>>>
>>>>>>> v1 -> v2:
>>>>>>>     - remove the superflous assignment, l1_table = NULL;
>>>>>>>     - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
>>>>>>>     - remove needless check of if (l1_table) before g_free(l1_table)
>>>>>>>
>>>>>>>     block/qcow2-refcount.c | 28 ++++++++++++----------------
>>>>>>>     1 file changed, 12 insertions(+), 16 deletions(-)
>>>>>>>
>>>>>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>>>>>> index 2bcaaf9..3e4050a 100644
>>>>>>> --- a/block/qcow2-refcount.c
>>>>>>> +++ b/block/qcow2-refcount.c
>>>>>>> @@ -881,14 +881,17 @@ int
>>>>>>> qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>>>>>>     {
>>>>>>>         BDRVQcowState *s = bs->opaque;
>>>>>>>         uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
>>>>>>> -    bool l1_allocated = false;
>>>>>>>         int64_t old_offset, old_l2_offset;
>>>>>>>         int i, j, l1_modified = 0, nb_csectors, refcount;
>>>>>>>         int ret;
>>>>>>>           l2_table = NULL;
>>>>>>> -    l1_table = NULL;
>>>>>>>         l1_size2 = l1_size * sizeof(uint64_t);
>>>>>>> +    l1_table = qemu_try_blockalign(bs->file, l1_size2);
>>>>>>> +    if (l1_size2 && l1_table == NULL) {
>>>>>> I think this check has a logic problem.  If l1_size2 != 0 and
>>>>>> l1_table == NULL,
>>>>>> What will happen?
>>>>> Then this condition is met and you return with -ENOMEM...?
>>>> Oh, but I see something different: qemu_try_blockalign() never returns
>>>> NULL, not even when you request 0 bytes.
>>> Yes. But if l1_size2 is zero, will waste memory or some other problems.
>>> Please see below:
>>>
>>> the original code:
>>> l1_table = g_try_malloc0(align_offset(0, 512));
>>>    -> l1_table = g_try_malloc0(0)
>>> so  l1_table == NULL.
>>>
>>> after this patch:
>>> l1_table = qemu_try_blockalign(bs->file, 0)
>>> l1_table will not be NULL.
>> Okay, so you meant "if l1_size2 == 0 and l1_table != NULL".
>>
> Hum, sorry for my typo ;)
>
>>> I don't know whether l1_size2 can be zero or not.
>> Probably not, but if it cannot be zero, testing for that case makes even
>> less sense.
>>
> So, can we add a check at the begin of this function?

We can just omit the "l1_size2 && " from the "if (l1_size2 && l1_table 
== NULL)".

Max

