Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYlU9-0004G3-QF
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 21:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YYlU7-0004EC-Ch
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 21:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YYlU3-0001N4-Bt
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 21:12:23 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:54680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YYlU2-0001Mh-IW; Thu, 19 Mar 2015 21:12:19 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIS81641; Fri, 20 Mar 2015 09:12:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 20 Mar 2015 09:12:02 +0800
Message-ID: <550B73D3.7000604@huawei.com>
Date: Fri, 20 Mar 2015 09:11:47 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial <qemu-trivial@nongnu.org>
References: <550ABC48.5060602@siemens.com>
In-Reply-To: <550ABC48.5060602@siemens.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pcspk: Fix I/O port name
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
X-List-Received-Date: Fri, 20 Mar 2015 01:12:24 -0000

On 2015/3/19 20:08, Jan Kiszka wrote:
> Probably a copy&paste bug. Fixing it helps identifying the device model
> behind port 0x61.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/audio/pcspk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index 1d81bbe..5266fb5 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -167,7 +167,7 @@ static void pcspk_initfn(Object *obj)
>  {
>      PCSpkState *s = PC_SPEAKER(obj);
>  
> -    memory_region_init_io(&s->ioport, OBJECT(s), &pcspk_io_ops, s, "elcr", 1);
> +    memory_region_init_io(&s->ioport, OBJECT(s), &pcspk_io_ops, s, "pcspk", 1);
>  }
>  
>  static void pcspk_realizefn(DeviceState *dev, Error **errp)
> 



