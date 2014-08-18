Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJLRZ-0003aO-1f
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 07:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLRT-0003TJ-0j
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:49:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XJLRO-0001Jg-2m
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 07:49:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XJLRE-0001If-6b; Mon, 18 Aug 2014 07:49:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 306F643816;
	Mon, 18 Aug 2014 15:49:23 +0400 (MSK)
Message-ID: <53F1E842.60009@msgid.tls.msk.ru>
Date: Mon, 18 Aug 2014 15:49:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, lcapitulino@redhat.com,
	stefanha@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
	rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 03/10] virtio-blk: fix reference a
 pointer which might be freed
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
X-List-Received-Date: Mon, 18 Aug 2014 11:49:43 -0000

14.08.2014 11:29, zhanghailiang wrote:
> In function virtio_blk_handle_request, it may freed memory pointed by req,
> So do not access member of req after calling this function.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/block/virtio-blk.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index c241c50..54a853a 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -458,7 +458,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>  static void virtio_blk_dma_restart_bh(void *opaque)
>  {
>      VirtIOBlock *s = opaque;
> -    VirtIOBlockReq *req = s->rq;
> +    VirtIOBlockReq *req = s->rq, *next = NULL;
>      MultiReqBuffer mrb = {
>          .num_writes = 0,
>      };
> @@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
>      s->rq = NULL;
>  
>      while (req) {
> +        next = req->next;
>          virtio_blk_handle_request(req, &mrb);
> -        req = req->next;
> +        req = next;
>      }
>  
>      virtio_submit_multiwrite(s->bs, &mrb);

So, finally, I've applied this patch:

--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
     s->rq = NULL;

     while (req) {
+        VirtIOBlockReq *next = req->next;
         virtio_blk_handle_request(req, &mrb);
-        req = req->next;
+        req = next;
     }

     virtio_submit_multiwrite(s->bs, &mrb);

and dropped Stefan's Reviewed-by on the way ;)

This is a bugfix after all ;)

Thanks,

/mjt

