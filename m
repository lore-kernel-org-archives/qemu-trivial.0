Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqKKx-00046G-Og
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 06:19:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XqKKr-00040O-UC
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XqKKn-0005d4-4X
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:19:09 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:15461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XqKKc-0005al-9I; Mon, 17 Nov 2014 06:18:55 -0500
Received: from 172.24.2.119 (EHLO szxeml413-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXF85250; Mon, 17 Nov 2014 19:18:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml413-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 17 Nov 2014 19:18:41 +0800
Message-ID: <5469D98A.8020408@huawei.com>
Date: Mon, 17 Nov 2014 19:18:34 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>
	<5469D4C4.5090407@redhat.com>
In-Reply-To: <5469D4C4.5090407@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5469D999.0129, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a1a71920f2c02b347e704da5364cf20d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "Huangweidong \(C\)" <weidong.huang@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"mjt@tls.msk.ru" <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>, Gerd
	Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 9/9] hcd-musb: fix dereference null
	return value
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
X-List-Received-Date: Mon, 17 Nov 2014 11:19:14 -0000

On 2014/11/17 18:58, Paolo Bonzini wrote:

> 
> 
> On 15/11/2014 11:06, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/usb/hcd-musb.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
>> index 66bc61a..f2cb73c 100644
>> --- a/hw/usb/hcd-musb.c
>> +++ b/hw/usb/hcd-musb.c
>> @@ -624,6 +624,10 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>>  
>>      /* A wild guess on the FADDR semantics... */
>>      dev = usb_find_device(&s->port, ep->faddr[idx]);
>> +    if (!dev) {
>> +        TRACE("Do not find an usb device");
>> +        return;
>> +    }
>>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
>>      usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
>>                       (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
>>
> 
> I think this patch is not the real fix.  usb_ep_get and
> usb_handle_packet can deal with a NULL device, but we have to avoid 
> dereferencing NULL pointers when building the id.
> 

Good catch :)

> Paolo
> 
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 66bc61a..40809f6 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -608,6 +608,7 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>      USBDevice *dev;
>      USBEndpoint *uep;
>      int idx = epnum && dir;
> +    int id;
>      int ttype;
>  
>      /* ep->type[0,1] contains:
> @@ -625,8 +626,11 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>      /* A wild guess on the FADDR semantics... */
>      dev = usb_find_device(&s->port, ep->faddr[idx]);
>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
> -    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
> -                     (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
> +    id = pid;
> +    if (uep) {
> +        id |= (dev->addr << 16) | (uep->nr << 8);
> +    }
> +    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0, id, false, true);
>      usb_packet_addbuf(&ep->packey[dir].p, ep->buf[idx], len);
>      ep->packey[dir].ep = ep;
>      ep->packey[dir].dir = dir;

This is a good approach, id is just a identifying. Thanks,

Best regards,
-Gonglei


