Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av2KD-0007kK-Og
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 08:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1av2K8-0007aB-Rp
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 08:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1av2K3-0002dW-5w
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 08:42:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1av2Jy-0002cW-Ob; Tue, 26 Apr 2016 08:42:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9D4164082;
	Tue, 26 Apr 2016 12:42:29 +0000 (UTC)
Received: from redhat.com (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u3QCgRXQ027148; Tue, 26 Apr 2016 08:42:28 -0400
Date: Tue, 26 Apr 2016 15:42:26 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160426154135-mutt-send-email-mst@redhat.com>
References: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 26 Apr 2016 12:42:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/net/virtio-net: Allocating Large
 sized arrays to heap
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 12:42:44 -0000

On Tue, Apr 26, 2016 at 04:05:24PM +0800, Zhou Jie wrote:
> virtio_net_flush_tx has a huge stack usage of 16392 bytes approx.
> Moving large arrays to heap to reduce stack usage.
> 
> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>

I don't think it's appropriate for trivial.
Also - what's the point, exactly?

> ---
>  hw/net/virtio-net.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5798f87..cab7bbc 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1213,6 +1213,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>      VirtIONet *n = q->n;
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
>      VirtQueueElement *elem;
> +    struct iovec *sg = NULL, *sg2 = NULL;
>      int32_t num_packets = 0;
>      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
>      if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> @@ -1224,10 +1225,12 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>          return num_packets;
>      }
>  
> +    sg = g_new(struct iovec, VIRTQUEUE_MAX_SIZE);
> +    sg2 = g_new(struct iovec, VIRTQUEUE_MAX_SIZE + 1);
>      for (;;) {
>          ssize_t ret;
>          unsigned int out_num;
> -        struct iovec sg[VIRTQUEUE_MAX_SIZE], sg2[VIRTQUEUE_MAX_SIZE + 1], *out_sg;
> +        struct iovec *out_sg;
>          struct virtio_net_hdr_mrg_rxbuf mhdr;
>  
>          elem = virtqueue_pop(q->tx_vq, sizeof(VirtQueueElement));
> @@ -1252,7 +1255,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>                  virtio_net_hdr_swap(vdev, (void *) &mhdr);
>                  sg2[0].iov_base = &mhdr;
>                  sg2[0].iov_len = n->guest_hdr_len;
> -                out_num = iov_copy(&sg2[1], ARRAY_SIZE(sg2) - 1,
> +                out_num = iov_copy(&sg2[1], VIRTQUEUE_MAX_SIZE,
>                                     out_sg, out_num,
>                                     n->guest_hdr_len, -1);
>                  if (out_num == VIRTQUEUE_MAX_SIZE) {
> @@ -1269,10 +1272,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>           */
>          assert(n->host_hdr_len <= n->guest_hdr_len);
>          if (n->host_hdr_len != n->guest_hdr_len) {
> -            unsigned sg_num = iov_copy(sg, ARRAY_SIZE(sg),
> +            unsigned sg_num = iov_copy(sg, VIRTQUEUE_MAX_SIZE,
>                                         out_sg, out_num,
>                                         0, n->host_hdr_len);
> -            sg_num += iov_copy(sg + sg_num, ARRAY_SIZE(sg) - sg_num,
> +            sg_num += iov_copy(sg + sg_num, VIRTQUEUE_MAX_SIZE - sg_num,
>                               out_sg, out_num,
>                               n->guest_hdr_len, -1);
>              out_num = sg_num;
> @@ -1284,6 +1287,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>          if (ret == 0) {
>              virtio_queue_set_notification(q->tx_vq, 0);
>              q->async_tx.elem = elem;
> +            g_free(sg);
> +            g_free(sg2);
>              return -EBUSY;
>          }
>  
> @@ -1296,6 +1301,8 @@ drop:
>              break;
>          }
>      }
> +    g_free(sg);
> +    g_free(sg2);
>      return num_packets;
>  }
>  
> -- 
> 2.5.5
> 
> 

