Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsPh-0000XD-R0
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:37:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsPa-0000NK-LG
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHsPV-0001pj-Re
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:37:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHsPJ-0001mX-S8; Thu, 14 Aug 2014 06:37:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAajw8008049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:36:45 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7EAafLk019948; Thu, 14 Aug 2014 06:36:41 -0400
Date: Thu, 14 Aug 2014 12:37:18 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814103718.GJ31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
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
X-List-Received-Date: Thu, 14 Aug 2014 10:37:43 -0000

On Thu, Aug 14, 2014 at 03:29:14PM +0800, zhanghailiang wrote:
> In function virtio_blk_handle_request, it may freed memory pointed by req,
> So do not access member of req after calling this function.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Stefan want to pick up this one?

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
> -- 
> 1.7.12.4
> 

