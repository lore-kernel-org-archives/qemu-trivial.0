Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqLqc-0001J8-8J
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 07:56:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XqLqW-0001BY-74
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 07:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XqLqR-0000GL-CK
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 07:55:56 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:8073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XqLqE-0000ES-Ox; Mon, 17 Nov 2014 07:55:39 -0500
Received: from 172.24.2.119 (EHLO szxeml403-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEO29375; Mon, 17 Nov 2014 20:55:29 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml403-hub.china.huawei.com
	(10.82.67.35) with Microsoft SMTP Server id 14.3.158.1; Mon, 17 Nov 2014
	20:55:17 +0800
Message-ID: <5469F033.5090104@huawei.com>
Date: Mon, 17 Nov 2014 20:55:15 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>
	<5469D4C4.5090407@redhat.com> <5469D98A.8020408@huawei.com>
In-Reply-To: <5469D98A.8020408@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
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
X-List-Received-Date: Mon, 17 Nov 2014 12:56:01 -0000

On 2014/11/17 19:18, Gonglei wrote:

> On 2014/11/17 18:58, Paolo Bonzini wrote:
> 
>>
>>
>> On 15/11/2014 11:06, arei.gonglei@huawei.com wrote:
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>> ---
>>>  hw/usb/hcd-musb.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
>>> index 66bc61a..f2cb73c 100644
>>> --- a/hw/usb/hcd-musb.c
>>> +++ b/hw/usb/hcd-musb.c
>>> @@ -624,6 +624,10 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>>>  
>>>      /* A wild guess on the FADDR semantics... */
>>>      dev = usb_find_device(&s->port, ep->faddr[idx]);
>>> +    if (!dev) {
>>> +        TRACE("Do not find an usb device");
>>> +        return;
>>> +    }
>>>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
>>>      usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
>>>                       (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
>>>
>>
>> I think this patch is not the real fix.  usb_ep_get and
>> usb_handle_packet can deal with a NULL device, but we have to avoid 
>> dereferencing NULL pointers when building the id.
>>
> 
> Good catch :)
> 
>> Paolo
>>
>> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
>> index 66bc61a..40809f6 100644
>> --- a/hw/usb/hcd-musb.c
>> +++ b/hw/usb/hcd-musb.c
>> @@ -608,6 +608,7 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>>      USBDevice *dev;
>>      USBEndpoint *uep;
>>      int idx = epnum && dir;
>> +    int id;
>>      int ttype;
>>  
>>      /* ep->type[0,1] contains:
>> @@ -625,8 +626,11 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>>      /* A wild guess on the FADDR semantics... */
>>      dev = usb_find_device(&s->port, ep->faddr[idx]);
>>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
>> -    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
>> -                     (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
>> +    id = pid;
>> +    if (uep) {
>> +        id |= (dev->addr << 16) | (uep->nr << 8);
>> +    }
>> +    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0, id, false, true);
>>      usb_packet_addbuf(&ep->packey[dir].p, ep->buf[idx], len);
>>      ep->packey[dir].ep = ep;
>>      ep->packey[dir].dir = dir;
> 
> This is a good approach, id is just a identifying. Thanks,
> 

Let me split the patch from this series as a separate patch
and add Paolo's signed-off-by.

Asking for Gerd's reviewing, Thanks.

Best regards,
-Gonglei


