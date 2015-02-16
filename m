Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNU8F-0007zO-6Y
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 17:27:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1YNU8C-0007vN-N8
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 17:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1YNU8B-0008Nk-Mx
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 17:27:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1YNU85-0008M1-H3; Mon, 16 Feb 2015 17:27:01 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1GMQvt6002328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Feb 2015 17:26:58 -0500
Received: from dresden.str.redhat.com ([10.18.17.71])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1GMQu2l009304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 16 Feb 2015 17:26:57 -0500
Message-ID: <54E26EB0.70308@redhat.com>
Date: Mon, 16 Feb 2015 17:26:56 -0500
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1424122891-9390-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1424122891-9390-5-git-send-email-thuth@linux.vnet.ibm.com>
In-Reply-To: <1424122891-9390-5-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] block: Remove unused
	functions
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
X-List-Received-Date: Mon, 16 Feb 2015 22:27:09 -0000

On 2015-02-16 at 16:41, Thomas Huth wrote:
> qemu_try_blockalign0() and nbd_export_close_all() are not
> used anymore and thus can be removed.
>
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block.c               |   11 -----------
>   include/block/block.h |    1 -
>   include/block/nbd.h   |    1 -
>   nbd.c                 |    9 ---------
>   4 files changed, 0 insertions(+), 22 deletions(-)

NACK, I'm using nbd_export_close_all() in my "block: Rework 
bdrv_close_all()" series.

I'm not so sure about qemu_try_blockalign0(); it has never been used, 
but I introduced it because we have qemu_blockalign(), 
qemu_try_blockalign(), and qemu_blockalign0() (the latter of which I 
introduced along with qemu_try_blockalign0(), and this function is used).

So I'd be fine with removing qemu_try_blockalign0() again, but I don't 
really see the point in doing so. It is not a function that is per-se 
deprecated or something, quite the opposite, actually. If people can 
make use of that function, they should most certainly do so.

Max

> diff --git a/block.c b/block.c
> index 210fd5f..2128f82 100644
> --- a/block.c
> +++ b/block.c
> @@ -5335,17 +5335,6 @@ void *qemu_try_blockalign(BlockDriverState *bs, size_t size)
>       return qemu_try_memalign(align, size);
>   }
>   
> -void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
> -{
> -    void *mem = qemu_try_blockalign(bs, size);
> -
> -    if (mem) {
> -        memset(mem, 0, size);
> -    }
> -
> -    return mem;
> -}
> -
>   /*
>    * Check if all memory in this vector is sector aligned.
>    */
> diff --git a/include/block/block.h b/include/block/block.h
> index 321295e..7ee9ab3 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -433,7 +433,6 @@ void bdrv_set_guest_block_size(BlockDriverState *bs, int align);
>   void *qemu_blockalign(BlockDriverState *bs, size_t size);
>   void *qemu_blockalign0(BlockDriverState *bs, size_t size);
>   void *qemu_try_blockalign(BlockDriverState *bs, size_t size);
> -void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
>   bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov);
>   
>   struct HBitmapIter;
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index b759595..fccef2d 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -95,7 +95,6 @@ BlockBackend *nbd_export_get_blockdev(NBDExport *exp);
>   
>   NBDExport *nbd_export_find(const char *name);
>   void nbd_export_set_name(NBDExport *exp, const char *name);
> -void nbd_export_close_all(void);
>   
>   NBDClient *nbd_client_new(NBDExport *exp, int csock,
>                             void (*close)(NBDClient *));
> diff --git a/nbd.c b/nbd.c
> index e56afbc..634bf84 100644
> --- a/nbd.c
> +++ b/nbd.c
> @@ -1067,15 +1067,6 @@ BlockBackend *nbd_export_get_blockdev(NBDExport *exp)
>       return exp->blk;
>   }
>   
> -void nbd_export_close_all(void)
> -{
> -    NBDExport *exp, *next;
> -
> -    QTAILQ_FOREACH_SAFE(exp, &exports, next, next) {
> -        nbd_export_close(exp);
> -    }
> -}
> -
>   static ssize_t nbd_co_send_reply(NBDRequest *req, struct nbd_reply *reply,
>                                    int len)
>   {


