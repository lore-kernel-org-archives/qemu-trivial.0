Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWs9M-0005rI-On
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 15:59:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aWs9L-0005ot-Eg
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 15:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aWs9K-0001Ez-Fc
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 15:59:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aWs94-000185-A1; Fri, 19 Feb 2016 15:59:22 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B874EC057EC9;
	Fri, 19 Feb 2016 20:59:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com ([10.3.113.10])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1JKxJuC014735; Fri, 19 Feb 2016 15:59:20 -0500
To: Wei Huang <wei@redhat.com>, qemu-devel@nongnu.org
References: <1455905587-4347-1-git-send-email-wei@redhat.com>
	<56C781AE.5050004@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56C78227.4030207@redhat.com>
Date: Fri, 19 Feb 2016 21:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56C781AE.5050004@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] virtio-rng: fix
 condition checking on period_ms
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
X-List-Received-Date: Fri, 19 Feb 2016 20:59:40 -0000

On 02/19/16 21:57, Laszlo Ersek wrote:
> On 02/19/16 19:13, Wei Huang wrote:
>> The condition checking on vrng->conf.period_ms appears to be wrong,
>> conflicting with the error comment following it.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/virtio/virtio-rng.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
>> index 473c044..a06427c 100644
>> --- a/hw/virtio/virtio-rng.c
>> +++ b/hw/virtio/virtio-rng.c
>> @@ -149,7 +149,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
>>      VirtIORNG *vrng = VIRTIO_RNG(dev);
>>      Error *local_err = NULL;
>>  
>> -    if (!vrng->conf.period_ms > 0) {
>> +    if (!(vrng->conf.period_ms > 0)) {
>>          error_setg(errp, "'period' parameter expects a positive integer");
>>          return;
>>      }
>>
> 
> The current condition is absolutely weird, but I think it happens to
> work correctly:
> 
> Period_ms has type uint32_t. If it is positive, then !period_ms is zero.
> 0>0 is false, hence the error message is not printed.
> 
> If period_ms is zero, then !period_ms is 1. 1>0 is true, hence the error
> message is printed.
> 
> I would rewrite the check as
> 
>     if (vrng->conf.period_ms == 0) {
>         error_setg(...)

... actually, what the heck are you looking at? :) This has been fixed
up in:

commit a3a292c420d2fec3c07a7ca56fbb064cd57a298a
Author: Amit Shah <amit.shah@redhat.com>
Date:   Thu Dec 11 13:17:42 2014 +0530

    virtio-rng: fix check for period_ms validity

Thanks
Laszlo


