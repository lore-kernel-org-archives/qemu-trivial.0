Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhMe5-0006By-De
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 13:57:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhMdz-0006Ba-70
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 13:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhMdu-0004Fd-I9
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 13:57:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1XhMdu-0004FU-AA; Thu, 23 Oct 2014 13:57:46 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9NHvidF015359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 13:57:45 -0400
Received: from [10.36.116.19] (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9NHvfYo021725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 23 Oct 2014 13:57:42 -0400
Message-ID: <54494195.9090409@redhat.com>
Date: Thu, 23 Oct 2014 19:57:41 +0200
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Zhang Haoyu <zhanghy@sangfor.com>, qemu-devel <qemu-devel@nongnu.org>
References: <201410222039495960337@sangfor.com>
In-Reply-To: <201410222039495960337@sangfor.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v5] snapshot: use local variable to
 bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 17:57:55 -0000

On 22.10.2014 14:39, Zhang Haoyu wrote:
> Use local variable to bdrv_pwrite_sync L1 table,
> needless to make conversion of cached L1 table between
> big-endian and host style.
>
> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
> v4 -> v5:
> - delete superfluous check of "l1_size2 != 0"
>    after qemu_try_blockalign(l1_size2)
>
> v3 -> v4:
>   - convert local L1 table to host-style before copy it
>     back to s->l1_table
>
> v2 -> v3:
>   - replace g_try_malloc0 with qemu_try_blockalign
>   - copy the latest local L1 table back to s->l1_table
>     after successfully bdrv_pwrite_sync L1 table
>
> v1 -> v2:
>   - remove the superflous assignment, l1_table = NULL;
>   - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
>   - remove needless check of if (l1_table) before g_free(l1_table)
>
>   block/qcow2-refcount.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 2bcaaf9..4cf6639 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -881,14 +881,17 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>   {
>       BDRVQcowState *s = bs->opaque;
>       uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
> -    bool l1_allocated = false;
>       int64_t old_offset, old_l2_offset;
>       int i, j, l1_modified = 0, nb_csectors, refcount;
>       int ret;
>   
>       l2_table = NULL;
> -    l1_table = NULL;
>       l1_size2 = l1_size * sizeof(uint64_t);
> +    l1_table = qemu_try_blockalign(bs->file, l1_size2);
> +    if (l1_table == NULL) {
> +        ret = -ENOMEM;
> +        goto fail;
> +    }
>   
>       s->cache_discards = true;
>   
> @@ -896,13 +899,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
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
> @@ -912,8 +908,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>               be64_to_cpus(&l1_table[i]);
>       } else {
>           assert(l1_size == s->l1_size);
> -        l1_table = s->l1_table;
> -        l1_allocated = false;
> +        memcpy(l1_table, s->l1_table, l1_size2);
>       }
>   
>       for(i = 0; i < l1_size; i++) {
> @@ -1055,13 +1050,14 @@ fail:
>           }
>   
>           ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
> -
> -        for (i = 0; i < l1_size; i++) {
> -            be64_to_cpus(&l1_table[i]);
> +        if (ret == 0) {

This needs to be "if (ret == 0 && l1_table_offset == s->l1_table_offset) 
{". We don't want to overwrite the active L1 table in memory when we're 
working on an inactive snapshot L1 table.

With that change, you can keep my R-b. I'll leave this patch out of the 
queue for Kevin this week though, because it's still a non-trivial 
change so I don't want to do it without your permission (and because 
Kevin is merging my queue right now, I won't get your permission in 
time), sorry.

Max

> +            for (i = 0; i < l1_size; i++) {
> +                be64_to_cpus(&l1_table[i]);
> +            }
> +            memcpy(s->l1_table, l1_table, l1_size2);
>           }
>       }
> -    if (l1_allocated)
> -        g_free(l1_table);
> +    g_free(l1_table);
>       return ret;
>   }
>   


