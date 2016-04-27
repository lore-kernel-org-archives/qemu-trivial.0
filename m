Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1avDcG-00047i-5G
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 20:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1avDcB-0003zU-Pi
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 20:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1avDcA-0001jc-P5
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 20:46:03 -0400
Received: from [59.151.112.132] (port=56959 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1avDc3-0001iT-HB; Tue, 26 Apr 2016 20:45:56 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5990068"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Apr 2016 08:45:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EE9CE42B55E4;
	Wed, 27 Apr 2016 08:45:43 +0800 (CST)
Received: from [10.167.226.49] (10.167.226.49) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Wed, 27 Apr 2016 08:45:43 +0800
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
	<20160426154135-mutt-send-email-mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Message-ID: <57200BB3.1040200@cn.fujitsu.com>
Date: Wed, 27 Apr 2016 08:45:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160426154135-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: EE9CE42B55E4.A0E89
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
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
X-List-Received-Date: Wed, 27 Apr 2016 00:46:05 -0000

On 2016/4/26 20:42, Michael S. Tsirkin wrote:
> On Tue, Apr 26, 2016 at 04:05:24PM +0800, Zhou Jie wrote:
>> virtio_net_flush_tx has a huge stack usage of 16392 bytes approx.
>> Moving large arrays to heap to reduce stack usage.
>>
>> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
>
> I don't think it's appropriate for trivial.
> Also - what's the point, exactly?
I think functions should not have very large stack frames.
For 64bit machine it will be 32k.
But according what Christian Borntraeger said, it doesn't matter.
So, considerate that virtio_net_flush_tx is in a hot path,
I agree to not change this.

Sincerely,
Zhou Jie

>
>> ---
>>   hw/net/virtio-net.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 5798f87..cab7bbc 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -1213,6 +1213,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>       VirtIONet *n = q->n;
>>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>       VirtQueueElement *elem;
>> +    struct iovec *sg = NULL, *sg2 = NULL;
>>       int32_t num_packets = 0;
>>       int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
>>       if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>> @@ -1224,10 +1225,12 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>           return num_packets;
>>       }
>>
>> +    sg = g_new(struct iovec, VIRTQUEUE_MAX_SIZE);
>> +    sg2 = g_new(struct iovec, VIRTQUEUE_MAX_SIZE + 1);
>>       for (;;) {
>>           ssize_t ret;
>>           unsigned int out_num;
>> -        struct iovec sg[VIRTQUEUE_MAX_SIZE], sg2[VIRTQUEUE_MAX_SIZE + 1], *out_sg;
>> +        struct iovec *out_sg;
>>           struct virtio_net_hdr_mrg_rxbuf mhdr;
>>
>>           elem = virtqueue_pop(q->tx_vq, sizeof(VirtQueueElement));
>> @@ -1252,7 +1255,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>                   virtio_net_hdr_swap(vdev, (void *) &mhdr);
>>                   sg2[0].iov_base = &mhdr;
>>                   sg2[0].iov_len = n->guest_hdr_len;
>> -                out_num = iov_copy(&sg2[1], ARRAY_SIZE(sg2) - 1,
>> +                out_num = iov_copy(&sg2[1], VIRTQUEUE_MAX_SIZE,
>>                                      out_sg, out_num,
>>                                      n->guest_hdr_len, -1);
>>                   if (out_num == VIRTQUEUE_MAX_SIZE) {
>> @@ -1269,10 +1272,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>            */
>>           assert(n->host_hdr_len <= n->guest_hdr_len);
>>           if (n->host_hdr_len != n->guest_hdr_len) {
>> -            unsigned sg_num = iov_copy(sg, ARRAY_SIZE(sg),
>> +            unsigned sg_num = iov_copy(sg, VIRTQUEUE_MAX_SIZE,
>>                                          out_sg, out_num,
>>                                          0, n->host_hdr_len);
>> -            sg_num += iov_copy(sg + sg_num, ARRAY_SIZE(sg) - sg_num,
>> +            sg_num += iov_copy(sg + sg_num, VIRTQUEUE_MAX_SIZE - sg_num,
>>                                out_sg, out_num,
>>                                n->guest_hdr_len, -1);
>>               out_num = sg_num;
>> @@ -1284,6 +1287,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>>           if (ret == 0) {
>>               virtio_queue_set_notification(q->tx_vq, 0);
>>               q->async_tx.elem = elem;
>> +            g_free(sg);
>> +            g_free(sg2);
>>               return -EBUSY;
>>           }
>>
>> @@ -1296,6 +1301,8 @@ drop:
>>               break;
>>           }
>>       }
>> +    g_free(sg);
>> +    g_free(sg2);
>>       return num_packets;
>>   }
>>
>> --
>> 2.5.5
>>
>>
>
>
> .
>

-- 
------------------------------------------------
周潔
Dept 1
No. 6 Wenzhu Road,
Nanjing, 210012, China
TEL：+86+25-86630566-8557
FUJITSU INTERNAL：7998-8557
E-Mail：zhoujie2011@cn.fujitsu.com
------------------------------------------------



