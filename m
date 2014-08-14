Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHt1Z-0001Xp-PG
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 07:16:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHt1T-0001SJ-3j
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 07:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHt1O-0006lE-93
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 07:16:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHt1D-0006jF-9S; Thu, 14 Aug 2014 07:16:31 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EBGBJ2007111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 07:16:12 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s7EBG68G032583; Thu, 14 Aug 2014 07:16:07 -0400
Date: Thu, 14 Aug 2014 13:16:43 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140814111643.GA31742@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103718.GJ31346@redhat.com>
	<53EC91DA.2080406@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53EC91DA.2080406@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, luonengjun@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
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
X-List-Received-Date: Thu, 14 Aug 2014 11:16:52 -0000

On Thu, Aug 14, 2014 at 02:39:22PM +0400, Michael Tokarev wrote:
> 14.08.2014 14:37, Michael S. Tsirkin wrote:
> > On Thu, Aug 14, 2014 at 03:29:14PM +0800, zhanghailiang wrote:
> >> In function virtio_blk_handle_request, it may freed memory pointed by req,
> >> So do not access member of req after calling this function.
> >>
> >> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Just a small nitpick...
> 
> > Stefan want to pick up this one?
> > 
> >> ---
> >>  hw/block/virtio-blk.c | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> >> index c241c50..54a853a 100644
> >> --- a/hw/block/virtio-blk.c
> >> +++ b/hw/block/virtio-blk.c
> >> @@ -458,7 +458,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >>  static void virtio_blk_dma_restart_bh(void *opaque)
> >>  {
> >>      VirtIOBlock *s = opaque;
> >> -    VirtIOBlockReq *req = s->rq;
> >> +    VirtIOBlockReq *req = s->rq, *next = NULL;
> 
> There's no need to initialize next here.
> With init like this I for one instinctively start searching below
> how this `NULL' is used (which it isn't).
> 
> I'd declare it inside the loop too, since it is a local-to-loop
> var, but that doesn't matter much.
> 
> /mjt

Good point, I agree.

> >>      MultiReqBuffer mrb = {
> >>          .num_writes = 0,
> >>      };
> >> @@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
> >>      s->rq = NULL;
> >>  
> >>      while (req) {
> >> +        next = req->next;
> >>          virtio_blk_handle_request(req, &mrb);
> >> -        req = req->next;
> >> +        req = next;
> >>      }
> >>  
> >>      virtio_submit_multiwrite(s->bs, &mrb);
> >> -- 
> >> 1.7.12.4
> >>

