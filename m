Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XgVgb-0006ie-GI
	for mharc-qemu-trivial@gnu.org; Tue, 21 Oct 2014 05:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XgVgV-0006fT-Ia
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 05:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XgVgQ-0001SI-Od
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 05:24:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1XgVgQ-0001SD-Gv; Tue, 21 Oct 2014 05:24:50 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9L9Ommn025696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Oct 2014 05:24:48 -0400
Received: from dresden.str.redhat.com (dhcp-192-247.str.redhat.com
	[10.33.192.247])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9L9Okni026179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 21 Oct 2014 05:24:47 -0400
Message-ID: <5446265E.306@redhat.com>
Date: Tue, 21 Oct 2014 11:24:46 +0200
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Zhang Haoyu <zhanghy@sangfor.com>, qemu-devel <qemu-devel@nongnu.org>
References: <201410211604116199416@sangfor.com>
In-Reply-To: <201410211604116199416@sangfor.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
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
X-List-Received-Date: Tue, 21 Oct 2014 09:25:00 -0000

On 2014-10-21 at 10:04, Zhang Haoyu wrote:
> Use local variable to bdrv_pwrite_sync L1 table,
> needless to make conversion of cached L1 table between
> big-endian and host style.
>
> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
> ---
>   block/qcow2-refcount.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 2bcaaf9..8b318e8 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -881,7 +881,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>   {
>       BDRVQcowState *s = bs->opaque;
>       uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
> -    bool l1_allocated = false;
>       int64_t old_offset, old_l2_offset;
>       int i, j, l1_modified = 0, nb_csectors, refcount;
>       int ret;
> @@ -889,6 +888,11 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>       l2_table = NULL;
>       l1_table = NULL;

Please remove this assignment; thanks to this hunk we don't need it anymore.

>       l1_size2 = l1_size * sizeof(uint64_t);
> +    l1_table = g_try_malloc0(align_offset(l1_size2, 512));

I wanted to propose using qemu_try_blockalign(), but since it'd require 
a memset() afterwards, it gets rather ugly.

Could you at least replace 512 by BDRV_SECTOR_SIZE, and maybe even 
align_offset() by ROUND_UP()? We should probably do the latter in all of 
the qcow2 code, though, I think it's just there because it has been 
around since before there was a ROUND_UP()...

> +    if (l1_size2 && l1_table == NULL) {
> +        ret = -ENOMEM;
> +        goto fail;
> +    }
>   
>       s->cache_discards = true;
>   
> @@ -896,13 +900,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>        * l1_table_offset when it is the current s->l1_table_offset! Be careful
>        * when changing this! */
>       if (l1_table_offset != s->l1_table_offset) {
> -        l1_table = g_try_malloc0(align_offset(l1_size2, 512));
> -        if (l1_size2 && l1_table == NULL) {
> -            ret = -ENOMEM;
> -            goto fail;
> -        }
> -        l1_allocated = true;
> -
>           ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
>           if (ret < 0) {
>               goto fail;
> @@ -912,8 +909,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>               be64_to_cpus(&l1_table[i]);
>       } else {
>           assert(l1_size == s->l1_size);
> -        l1_table = s->l1_table;
> -        l1_allocated = false;
> +        memcpy(l1_table, s->l1_table, l1_size2);
>       }
>   
>       for(i = 0; i < l1_size; i++) {
> @@ -1055,12 +1051,8 @@ fail:

I don't think it will change a lot, but could you wrap the 
"s->cache_discards = false; qcow2_process_discards(bs, ret);" in an "if 
(s->cache_discards)"? You have introduced a case where s->cache_discards 
was still false, so we don't need to call qcow2_process_discards() then 
(which will hopefully return immediately, but well...).

>           }
>   
>           ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
> -
> -        for (i = 0; i < l1_size; i++) {
> -            be64_to_cpus(&l1_table[i]);
> -        }
>       }
> -    if (l1_allocated)
> +    if (l1_table)
>           g_free(l1_table);

Just drop the condition. g_free(l1_table); is enough.

>       return ret;
>   }

The change itself is good, it just needs some polishing.

Max

