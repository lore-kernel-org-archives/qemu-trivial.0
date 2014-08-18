Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJTMm-0005q4-Ax
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 16:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJTMf-0005gI-4R
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XJTMa-0008MO-3Z
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 16:17:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XJTMP-0008LY-Pp; Mon, 18 Aug 2014 16:16:58 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7IKGcMM020813
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 18 Aug 2014 16:16:38 -0400
Received: from redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7IKGXLr015287; Mon, 18 Aug 2014 16:16:34 -0400
Date: Mon, 18 Aug 2014 22:17:10 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140818201710.GB1121@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E842.60009@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53F1E842.60009@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, stefanha@redhat.com,
	pbonzini@redhat.com, lcapitulino@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
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
X-List-Received-Date: Mon, 18 Aug 2014 20:17:18 -0000

On Mon, Aug 18, 2014 at 03:49:22PM +0400, Michael Tokarev wrote:
> 14.08.2014 11:29, zhanghailiang wrote:
> > In function virtio_blk_handle_request, it may freed memory pointed by req,
> > So do not access member of req after calling this function.
> > 
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > ---
> >  hw/block/virtio-blk.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index c241c50..54a853a 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -458,7 +458,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >  static void virtio_blk_dma_restart_bh(void *opaque)
> >  {
> >      VirtIOBlock *s = opaque;
> > -    VirtIOBlockReq *req = s->rq;
> > +    VirtIOBlockReq *req = s->rq, *next = NULL;
> >      MultiReqBuffer mrb = {
> >          .num_writes = 0,
> >      };
> > @@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
> >      s->rq = NULL;
> >  
> >      while (req) {
> > +        next = req->next;
> >          virtio_blk_handle_request(req, &mrb);
> > -        req = req->next;
> > +        req = next;
> >      }
> >  
> >      virtio_submit_multiwrite(s->bs, &mrb);
> 
> So, finally, I've applied this patch:
> 
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
>      s->rq = NULL;
> 
>      while (req) {
> +        VirtIOBlockReq *next = req->next;
>          virtio_blk_handle_request(req, &mrb);
> -        req = req->next;
> +        req = next;
>      }
> 
>      virtio_submit_multiwrite(s->bs, &mrb);
> 
> and dropped Stefan's Reviewed-by on the way ;)
> 
> This is a bugfix after all ;)
> 
> Thanks,
> 
> /mjt


By the way, could you please add Cc qemu-stable on bugfixes
you have queued?
These are likely appopriate for 2.1.1.

-- 
MST


