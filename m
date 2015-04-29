Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnMJX-0001OW-NT
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 03:21:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YnMJV-0001Lp-F9
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 03:21:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YnMJS-0005KK-7n
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 03:21:45 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:49518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YnMJR-0005JL-0W; Wed, 29 Apr 2015 03:21:42 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BFH04056; Wed, 29 Apr 2015 15:21:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 29 Apr 2015 15:21:28 +0800
Message-ID: <55408699.5030201@huawei.com>
Date: Wed, 29 Apr 2015 15:22:01 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>	<1430212264-9672-3-git-send-email-arei.gonglei@huawei.com>
	<55407ED3.102@msgid.tls.msk.ru>
In-Reply-To: <55407ED3.102@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5540867E.00AE, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f54a9b13ed59a3801752c502edbeb3db
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Hans de Goede <hdegoede@redhat.com>, Gerd
	Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] xhci: remove unused code
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
X-List-Received-Date: Wed, 29 Apr 2015 07:21:46 -0000

On 2015/4/29 14:48, Michael Tokarev wrote:
> 28.04.2015 12:11, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Value from xfer->packet.ep is assigned to ep here, but that
>> stored value is not used before it is overwritten. Remove it.
>>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/usb/hcd-xhci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
>> index ba15ae0..99f11fc 100644
>> --- a/hw/usb/hcd-xhci.c
>> +++ b/hw/usb/hcd-xhci.c
>> @@ -2204,7 +2204,6 @@ static void xhci_kick_ep(XHCIState *xhci, unsigned int slotid,
>>          if (epid == 1) {
>>              if (xhci_fire_ctl_transfer(xhci, xfer) >= 0) {
>>                  epctx->next_xfer = (epctx->next_xfer + 1) % TD_QUEUE;
>> -                ep = xfer->packet.ep;
>>              } else {
>>                  DPRINTF("xhci: error firing CTL transfer\n");
>>              }
> 
> This one is somewhat fun.  ep variable is not used in whole this
> function until the very end, with the code:
> 
> 
>     ep = xhci_epid_to_usbep(xhci, slotid, epid);
>     if (ep) {
>         usb_device_flush_ep_queue(ep->dev, ep);
>     }
> 
> There are only 2 assignments to it here, it is the NULL
> initializer and this place which is being removed by this
> patch (which is obviously unused).
> 
> So, I think if we were to drop this assignment, we should
> remove the initializer too.  But before doing this, I think
> we should try to remember _why_ this assignment is here in
> the first place. The code looks like after the loop, this
> ep variable was supposed to be used for something.  Or is
> it just a leftover from 518ad5f2a075 (Cc'ing the author)?
> 
I can't agree with you more. :)

Regards,
-Gonglei

> I haven't looked at all this in more details without good
> knowlege of the protocol and background.
> 
> Thanks,
> 
> /mjt
> 



