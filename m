Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xguaz-0006nX-Jn
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 08:00:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xguat-0006lp-JS
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xguam-00030K-Jy
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:00:47 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:38667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xgual-0002zq-MX; Wed, 22 Oct 2014 08:00:40 -0400
Received: from 172.24.2.119 (EHLO szxeml404-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AVX51509; Wed, 22 Oct 2014 20:00:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml404-hub.china.huawei.com
	(10.82.67.59) with Microsoft SMTP Server id 14.3.158.1; Wed, 22 Oct 2014
	20:00:00 +0800
Message-ID: <54479C3E.1070803@huawei.com>
Date: Wed, 22 Oct 2014 19:59:58 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Zhang Haoyu <zhanghy@sangfor.com>
References: <201410221945053926307@sangfor.com>
In-Reply-To: <201410221945053926307@sangfor.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54479C46.007C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2bbab01d9c9c22d3351ad8785048d530
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Max Reitz <mreitz@redhat.com>
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
X-List-Received-Date: Wed, 22 Oct 2014 12:00:52 -0000

On 2014/10/22 19:45, Zhang Haoyu wrote:

> Use local variable to bdrv_pwrite_sync L1 table,
> needless to make conversion of cached L1 table between
> big-endian and host style.
> 
> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
> v3 -> v4:
>  - convert local L1 table to host-style before copy it
>    back to s->l1_table
> 
> v2 -> v3:
>  - replace g_try_malloc0 with qemu_try_blockalign
>  - copy the latest local L1 table back to s->l1_table
>    after successfully bdrv_pwrite_sync L1 table
> 
> v1 -> v2:
>  - remove the superflous assignment, l1_table = NULL;
>  - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
>  - remove needless check of if (l1_table) before g_free(l1_table)
> 
>  block/qcow2-refcount.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 2bcaaf9..3e4050a 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -881,14 +881,17 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>  {
>      BDRVQcowState *s = bs->opaque;
>      uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
> -    bool l1_allocated = false;
>      int64_t old_offset, old_l2_offset;
>      int i, j, l1_modified = 0, nb_csectors, refcount;
>      int ret;
>  
>      l2_table = NULL;
> -    l1_table = NULL;
>      l1_size2 = l1_size * sizeof(uint64_t);
> +    l1_table = qemu_try_blockalign(bs->file, l1_size2);
> +    if (l1_size2 && l1_table == NULL) {

I think this check has a logic problem.  If l1_size2 != 0 and l1_table == NULL,
What will happen?

Best regards,
-Gonglei

> +        ret = -ENOMEM;
> +        goto fail;
> +    }
>  
>      s->cache_discards = true;
>  
> @@ -896,13 +899,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>       * l1_table_offset when it is the current s->l1_table_offset! Be careful
>       * when changing this! */
>      if (l1_table_offset != s->l1_table_offset) {
> -        l1_table = g_try_malloc0(align_offset(l1_size2, 512));
> -        if (l1_size2 && l1_table == NULL) {
> -            ret = -ENOMEM;
> -            goto fail;
> -        }
> -        l1_allocated = true;
> -
>          ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
>          if (ret < 0) {
>              goto fail;
> @@ -912,8 +908,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
>              be64_to_cpus(&l1_table[i]);
>      } else {
>          assert(l1_size == s->l1_size);
> -        l1_table = s->l1_table;
> -        l1_allocated = false;
> +        memcpy(l1_table, s->l1_table, l1_size2);
>      }
>  
>      for(i = 0; i < l1_size; i++) {
> @@ -1055,13 +1050,14 @@ fail:
>          }
>  
>          ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
> -
> -        for (i = 0; i < l1_size; i++) {
> -            be64_to_cpus(&l1_table[i]);
> +        if (ret == 0) {
> +            for (i = 0; i < l1_size; i++) {
> +                be64_to_cpus(&l1_table[i]);
> +            }
> +            memcpy(s->l1_table, l1_table, l1_size2);
>          }
>      }
> -    if (l1_allocated)
> -        g_free(l1_table);
> +    g_free(l1_table);
>      return ret;
>  }
>  




