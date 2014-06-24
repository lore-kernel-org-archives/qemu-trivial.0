Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzGQq-0005Tz-4T
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 22:26:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WzGQi-0005L2-NH
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 22:25:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WzGQc-0002Ha-ID
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 22:25:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WzGQP-0002GM-QX; Mon, 23 Jun 2014 22:25:34 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5O2PVdw023441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 23 Jun 2014 22:25:31 -0400
Received: from localhost (vpn1-114-89.nay.redhat.com [10.66.114.89])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5O2PSTp014489; Mon, 23 Jun 2014 22:25:29 -0400
Date: Tue, 24 Jun 2014 10:25:47 +0800
From: Fam Zheng <famz@redhat.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140624022547.GC26197@T430.redhat.com>
References: <53A84797.9040304@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A84797.9040304@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial v2] block.c: Add return value for
 bdrv_append_temp_snapshot() to avoid incorrect failure processing issue
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
X-List-Received-Date: Tue, 24 Jun 2014 02:25:59 -0000

On Mon, 06/23 23:28, Chen Gang wrote:
> When failure occurs, 'ret' need be set, or may return 0 to indicate success.

s/need/needs/

> And error_propagate() also need be called only one time within a function.

s/need/needs/

> 
> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
> set errp when error occurs -- although it contents return value internally.

s/contents/has/

> 
> So let bdrv_append_temp_snapshot() internal return value outside, and let
> all things normal, then fix the issue too.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  block.c               | 7 ++++---
>  include/block/block.h | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 74af8d7..5e4fb60 100644
> --- a/block.c
> +++ b/block.c
> @@ -1240,7 +1240,7 @@ done:
>      return ret;
>  }
>  
> -void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
> +int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>  {
>      /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>      char *tmp_filename = g_malloc0(PATH_MAX + 1);
> @@ -1258,6 +1258,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>      /* Get the required size from the image */
>      total_size = bdrv_getlength(bs);
>      if (total_size < 0) {
> +        ret = total_size;
>          error_setg_errno(errp, -total_size, "Could not get image size");
>          goto out;
>      }
> @@ -1304,6 +1305,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>  
>  out:
>      g_free(tmp_filename);
> +    return ret;
>  }
>  
>  static QDict *parse_json_filename(const char *filename, Error **errp)
> @@ -1495,9 +1497,8 @@ int bdrv_open(BlockDriverState **pbs, const char *filename,
>      /* For snapshot=on, create a temporary qcow2 overlay. bs points to the
>       * temporary snapshot afterwards. */
>      if (snapshot_flags) {
> -        bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
> +        ret = bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
>          if (local_err) {
> -            error_propagate(errp, local_err);
>              goto close_and_fail;
>          }
>      }
> diff --git a/include/block/block.h b/include/block/block.h
> index f15b99b..7b3381c 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -217,7 +217,7 @@ int bdrv_open_image(BlockDriverState **pbs, const char *filename,
>                      bool allow_none, Error **errp);
>  void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd);
>  int bdrv_open_backing_file(BlockDriverState *bs, QDict *options, Error **errp);
> -void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);
> +int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);

Not used outside block.c, but pre-existing.

Reviewed-by: Fam Zheng <famz@redhat.com>

Fam

>  int bdrv_open(BlockDriverState **pbs, const char *filename,
>                const char *reference, QDict *options, int flags,
>                BlockDriver *drv, Error **errp);
> -- 
> 1.7.11.7

