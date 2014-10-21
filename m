Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XgZ0o-0004EH-LX
	for mharc-qemu-trivial@gnu.org; Tue, 21 Oct 2014 08:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgX0Z-00053O-01
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 06:49:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgX0U-0005xq-5L
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 06:49:42 -0400
Received: from [58.251.49.30] (port=33965 helo=mail.sangfor.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>)
	id 1XgX0I-0005vp-GC; Tue, 21 Oct 2014 06:49:28 -0400
Received: from localhost (mail.sangfor.com [127.0.0.1])
	by mail.sangfor.com (Postfix) with ESMTP id B5D8C17C01FC;
	Tue, 21 Oct 2014 18:30:14 +0800 (CST)
Received: from mail.sangfor.com ([127.0.0.1])
	by localhost (mail.sangfor.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRagzXQ0w+yV; Tue, 21 Oct 2014 18:30:14 +0800 (CST)
Received: from vv-PC (unknown [10.10.6.254])
	by mail.sangfor.com (Postfix) with ESMTPA id 35A4E17C01F8;
	Tue, 21 Oct 2014 18:30:14 +0800 (CST)
Date: Tue, 21 Oct 2014 18:49:19 +0800
From: "Zhang Haoyu" <zhanghy@sangfor.com>
To: "Max Reitz" <mreitz@redhat.com>,
 "qemu-devel" <qemu-devel@nongnu.org>
References: <201410211604116199416@sangfor.com>,
 <5446265E.306@redhat.com>
Message-ID: <201410211849166022861@sangfor.com>
X-mailer: Foxmail 6, 15, 201, 20 [cn]
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 58.251.49.30
X-Mailman-Approved-At: Tue, 21 Oct 2014 08:58:05 -0400
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] snapshot: use local
	variable to bdrv_pwrite_syncL1 table
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
X-List-Received-Date: Tue, 21 Oct 2014 10:49:48 -0000

>> Use local variable to bdrv_pwrite_sync L1 table,
>> needless to make conversion of cached L1 table between
>> big-endian and host style.
>>
>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>> ---
>>   block/qcow2-refcount.c | 22 +++++++---------------
>>   1 file changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index 2bcaaf9..8b318e8 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -881,7 +881,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>   {
>>       BDRVQcowState *s = bs->opaque;
>>       uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
>> -    bool l1_allocated = false;
>>       int64_t old_offset, old_l2_offset;
>>       int i, j, l1_modified = 0, nb_csectors, refcount;
>>       int ret;
>> @@ -889,6 +888,11 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>       l2_table = NULL;
>>       l1_table = NULL;
>
>Please remove this assignment; thanks to this hunk we don't need it anymore.
OK.
>
>>       l1_size2 = l1_size * sizeof(uint64_t);
>> +    l1_table = g_try_malloc0(align_offset(l1_size2, 512));
>
>I wanted to propose using qemu_try_blockalign(), but since it'd require 
>a memset() afterwards, it gets rather ugly.
>
>Could you at least replace 512 by BDRV_SECTOR_SIZE, and maybe even 
>align_offset() by ROUND_UP()? We should probably do the latter in all of 
>the qcow2 code, though, I think it's just there because it has been 
>around since before there was a ROUND_UP()...
>
Good, I will replace 512 with BDRV_SECTOR_SIZE, and replace align_offset with ROUND_UP.
>> +    if (l1_size2 && l1_table == NULL) {
>> +        ret = -ENOMEM;
>> +        goto fail;
>> +    }
>>   
>>       s->cache_discards = true;
>>   
>> @@ -896,13 +900,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>        * l1_table_offset when it is the current s->l1_table_offset! Be careful
>>        * when changing this! */
>>       if (l1_table_offset != s->l1_table_offset) {
>> -        l1_table = g_try_malloc0(align_offset(l1_size2, 512));
>> -        if (l1_size2 && l1_table == NULL) {
>> -            ret = -ENOMEM;
>> -            goto fail;
>> -        }
>> -        l1_allocated = true;
>> -
>>           ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
>>           if (ret < 0) {
>>               goto fail;
>> @@ -912,8 +909,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>>               be64_to_cpus(&l1_table[i]);
>>       } else {
>>           assert(l1_size == s->l1_size);
>> -        l1_table = s->l1_table;
>> -        l1_allocated = false;
>> +        memcpy(l1_table, s->l1_table, l1_size2);
>>       }
>>   
>>       for(i = 0; i < l1_size; i++) {
>> @@ -1055,12 +1051,8 @@ fail:
>
>I don't think it will change a lot, but could you wrap the 
>"s->cache_discards = false; qcow2_process_discards(bs, ret);" in an "if 
>(s->cache_discards)"? You have introduced a case where s->cache_discards 
>was still false, so we don't need to call qcow2_process_discards() then 
>(which will hopefully return immediately, but well...).
s->cache_discards's initial value is true in qcow2_update_snapshot_refcount(),
where s->cache_discards is set to false?
Or you means s->cache_discards should be set to false
after g_try_malloc0(align_offset(l1_size2, 512)) failed.

>
>>           }
>>   
>>           ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
>> -
>> -        for (i = 0; i < l1_size; i++) {
>> -            be64_to_cpus(&l1_table[i]);
>> -        }
>>       }
>> -    if (l1_allocated)
>> +    if (l1_table)
>>           g_free(l1_table);
>
>Just drop the condition. g_free(l1_table); is enough.
>
OK.
>>       return ret;
>>   }
>
>The change itself is good, it just needs some polishing.
>
>Max


