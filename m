Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLnp-0000Q7-LI
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLno-0000Nr-1T
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLnn-0002P3-04
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:48:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnLng-0002OQ-Ve; Wed, 29 Apr 2015 02:48:53 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BCF4942A5D;
	Wed, 29 Apr 2015 09:48:51 +0300 (MSK)
Message-ID: <55407ED3.102@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 09:48:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
	<1430212264-9672-3-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1430212264-9672-3-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hans de Goede <hdegoede@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 2/3] xhci: remove unused code
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
X-List-Received-Date: Wed, 29 Apr 2015 06:49:01 -0000

28.04.2015 12:11, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Value from xfer->packet.ep is assigned to ep here, but that
> stored value is not used before it is overwritten. Remove it.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/usb/hcd-xhci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index ba15ae0..99f11fc 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2204,7 +2204,6 @@ static void xhci_kick_ep(XHCIState *xhci, unsigned int slotid,
>          if (epid == 1) {
>              if (xhci_fire_ctl_transfer(xhci, xfer) >= 0) {
>                  epctx->next_xfer = (epctx->next_xfer + 1) % TD_QUEUE;
> -                ep = xfer->packet.ep;
>              } else {
>                  DPRINTF("xhci: error firing CTL transfer\n");
>              }

This one is somewhat fun.  ep variable is not used in whole this
function until the very end, with the code:


    ep = xhci_epid_to_usbep(xhci, slotid, epid);
    if (ep) {
        usb_device_flush_ep_queue(ep->dev, ep);
    }

There are only 2 assignments to it here, it is the NULL
initializer and this place which is being removed by this
patch (which is obviously unused).

So, I think if we were to drop this assignment, we should
remove the initializer too.  But before doing this, I think
we should try to remember _why_ this assignment is here in
the first place. The code looks like after the loop, this
ep variable was supposed to be used for something.  Or is
it just a leftover from 518ad5f2a075 (Cc'ing the author)?

I haven't looked at all this in more details without good
knowlege of the protocol and background.

Thanks,

/mjt

