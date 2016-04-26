Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av35S-0005kW-7d
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 09:31:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auywh-0007f0-Sd
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 05:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auywc-0005tm-SW
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 05:06:15 -0400
Received: from [59.151.112.132] (port=55216 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1auywV-0005sX-LE; Tue, 26 Apr 2016 05:06:04 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5965500"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 17:05:52 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2335E408D264;
	Tue, 26 Apr 2016 17:05:51 +0800 (CST)
Received: from [10.167.226.49] (10.167.226.49) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Tue, 26 Apr 2016 17:05:50 +0800
To: Christian Borntraeger <borntraeger@de.ibm.com>, <qemu-devel@nongnu.org>
References: <1461657924-1933-1-git-send-email-zhoujie2011@cn.fujitsu.com>
	<571F2B8B.8030505@de.ibm.com>
CC: <qemu-trivial@nongnu.org>, <mst@redhat.com>
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Message-ID: <571F2F6E.4070809@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 17:05:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <571F2B8B.8030505@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 2335E408D264.AA905
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 Apr 2016 09:31:31 -0400
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
X-List-Received-Date: Tue, 26 Apr 2016 09:06:20 -0000

On 2016/4/26 16:49, Christian Borntraeger wrote:
> On 04/26/2016 10:05 AM, Zhou Jie wrote:
>> virtio_net_flush_tx has a huge stack usage of 16392 bytes approx.
>> Moving large arrays to heap to reduce stack usage.
>>
>> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
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
>
>
> As I said in another mail, 16k is usually perfectly fine for a userspace
> stack and doing allocations in a hot path might actually hurt performance.
>
> Unless we have a real problem (e.g. very long call stack on a small thread
> stack) I would prefer to not change this.
> Do you have seen a real problem due to this?
No, I don't.
I think functions should not have very large stack frames.
For 64bit machine it will be 32k.
But according what you said, it doesn't matter.
So, considerate that virtio_net_flush_tx is in a hot path,
I agree to not change this.

Sincerely,
Zhou Jie


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
>
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



