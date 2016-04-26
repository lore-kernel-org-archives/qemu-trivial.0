Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auygU-0001GP-DA
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 04:49:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auygP-00017t-8g
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 04:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auygM-00020a-1Y
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 04:49:25 -0400
Received: from e06smtp05.uk.ibm.com ([195.75.94.101]:46661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1auygL-00020Q-Nr
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 04:49:21 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 26 Apr 2016 09:49:19 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 26 Apr 2016 09:49:17 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id E432D17D8063; 
	Tue, 26 Apr 2016 09:50:06 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u3Q8nGt16095112; Tue, 26 Apr 2016 08:49:16 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u3Q8nGkr008175; Tue, 26 Apr 2016 02:49:16 -0600
Received: from oc1450873852.ibm.com (dyn-9-152-224-38.boeblingen.de.ibm.com
	[9.152.224.38])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u3Q8nF0j008153; Tue, 26 Apr 2016 02:49:16 -0600
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, mst@redhat.com
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <571F2B8B.8030505@de.ibm.com>
Date: Tue, 26 Apr 2016 10:49:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042608-0021-0000-0000-000019B141D2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.101
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/net/virtio-net:
 Allocating Large sized arrays to heap
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
X-List-Received-Date: Tue, 26 Apr 2016 08:49:29 -0000

On 04/26/2016 10:05 AM, Zhou Jie wrote:
> virtio_net_flush_tx has a huge stack usage of 16392 bytes approx.
> Moving large arrays to heap to reduce stack usage.
> 
> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
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


As I said in another mail, 16k is usually perfectly fine for a userspace
stack and doing allocations in a hot path might actually hurt performance.

Unless we have a real problem (e.g. very long call stack on a small thread 
stack) I would prefer to not change this.
Do you have seen a real problem due to this?



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


