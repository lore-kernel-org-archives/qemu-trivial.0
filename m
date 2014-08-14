Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHsRe-0002aY-4P
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:39:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHsRX-0002Qf-FP
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHsRS-0002T3-Lo
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:39:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XHsRI-0002S6-Ph; Thu, 14 Aug 2014 06:39:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B844342DEC;
	Thu, 14 Aug 2014 14:39:22 +0400 (MSK)
Message-ID: <53EC91DA.2080406@msgid.tls.msk.ru>
Date: Thu, 14 Aug 2014 14:39:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-4-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103718.GJ31346@redhat.com>
In-Reply-To: <20140814103718.GJ31346@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi,
	luonengjun@huawei.com, qemu-devel@nongnu.org,
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
X-List-Received-Date: Thu, 14 Aug 2014 10:39:44 -0000

14.08.2014 14:37, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:14PM +0800, zhanghailiang wrote:
>> In function virtio_blk_handle_request, it may freed memory pointed by req,
>> So do not access member of req after calling this function.
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Just a small nitpick...

> Stefan want to pick up this one?
> 
>> ---
>>  hw/block/virtio-blk.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>> index c241c50..54a853a 100644
>> --- a/hw/block/virtio-blk.c
>> +++ b/hw/block/virtio-blk.c
>> @@ -458,7 +458,7 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>>  static void virtio_blk_dma_restart_bh(void *opaque)
>>  {
>>      VirtIOBlock *s = opaque;
>> -    VirtIOBlockReq *req = s->rq;
>> +    VirtIOBlockReq *req = s->rq, *next = NULL;

There's no need to initialize next here.
With init like this I for one instinctively start searching below
how this `NULL' is used (which it isn't).

I'd declare it inside the loop too, since it is a local-to-loop
var, but that doesn't matter much.

/mjt

>>      MultiReqBuffer mrb = {
>>          .num_writes = 0,
>>      };
>> @@ -469,8 +469,9 @@ static void virtio_blk_dma_restart_bh(void *opaque)
>>      s->rq = NULL;
>>  
>>      while (req) {
>> +        next = req->next;
>>          virtio_blk_handle_request(req, &mrb);
>> -        req = req->next;
>> +        req = next;
>>      }
>>  
>>      virtio_submit_multiwrite(s->bs, &mrb);
>> -- 
>> 1.7.12.4
>>


