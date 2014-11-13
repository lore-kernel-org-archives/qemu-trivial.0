Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xosuu-0003gw-V6
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 06:50:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xosup-0003eJ-3b
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:50:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xosuk-0000o7-A9
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 06:50:19 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:42351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xosuj-0000kw-Lh; Thu, 13 Nov 2014 06:50:14 -0500
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCH63627; Thu, 13 Nov 2014 19:50:00 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml420-hub.china.huawei.com
	(10.82.67.159) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 19:49:51 +0800
Message-ID: <54649AD4.8040806@huawei.com>
Date: Thu, 13 Nov 2014 19:49:40 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1415846372-12756-1-git-send-email-arei.gonglei@huawei.com>
	<20141113112734.GN7462@stefanha-thinkpad.redhat.com>
In-Reply-To: <20141113112734.GN7462@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-bus: avoid breaking
 build when open DEBUG switch
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
X-List-Received-Date: Thu, 13 Nov 2014 11:50:24 -0000

On 2014/11/13 19:27, Stefan Hajnoczi wrote:

> On Thu, Nov 13, 2014 at 10:39:32AM +0800, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/virtio/virtio-bus.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index eb77019..dfd2d8c 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -58,7 +58,7 @@ void virtio_bus_reset(VirtioBusState *bus)
>>  {
>>      VirtIODevice *vdev = virtio_bus_get_device(bus);
>>  
>> -    DPRINTF("%s: reset device.\n", qbus->name);
>> +    DPRINTF("%s: reset device.\n", BUS(bus)->name);
> 
> In general the problem with existing DPRINTF() macros is that they use
> #ifdef.  This leads to bitrot, such as this instance.
> 

Yes.

> A better approach is:
> 
> #define DEBUG_FOO 0
> #define DPRINTF(...) \
> do { \
>     if (DEBUG_FOO) { \
>         fprintf(stderr, ...); \
>     } \
> } while (0)
> 
> Now the compiler always checks the DPRINTF() code.
> 
> Trace events can be a good solution too.  If you like stderr output,
> build QEMU with ./configure --enable-trace-backend=stderr and all
> trace_*() calls are turned into fprintf(stderr).
> 
> The cool thing about trace events is that they are available in
> production too.
> 

Hum, trace events is great! :)

Best regards,
-Gonglei


