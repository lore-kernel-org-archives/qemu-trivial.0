Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WxCEu-0002xB-RV
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jun 2014 05:33:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WxCEm-0002nG-Ki
	for qemu-trivial@nongnu.org; Wed, 18 Jun 2014 05:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WxCEh-00021v-I6
	for qemu-trivial@nongnu.org; Wed, 18 Jun 2014 05:33:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50587)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WxCEU-00020b-FG; Wed, 18 Jun 2014 05:32:42 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5I9Wedw019681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 18 Jun 2014 05:32:40 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-64.ams2.redhat.com
	[10.36.112.64])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5I9WaJr014276; Wed, 18 Jun 2014 05:32:37 -0400
Message-ID: <53A15CB2.4090701@redhat.com>
Date: Wed, 18 Jun 2014 11:32:34 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1403047414-27505-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1403047414-27505-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kraxel@redhat.com, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCHv2] usb: Fix usb-bt-dongle initialization.
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
X-List-Received-Date: Wed, 18 Jun 2014 09:33:07 -0000

Il 18/06/2014 01:23, Hani Benhabiles ha scritto:
> Due to an incomplete initialization, adding a usb-bt-dongle device through HMP
> or QMP will cause a segmentation fault.
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>
> Compared to v1:
> * Remove duplicate code from usb_bt_init() and inline usb_create_simple() call.
> * usb_bt_initfn() check for s->hci.
>
>  hw/usb/dev-bluetooth.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/usb/dev-bluetooth.c b/hw/usb/dev-bluetooth.c
> index a9661d2..a76e581 100644
> --- a/hw/usb/dev-bluetooth.c
> +++ b/hw/usb/dev-bluetooth.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu-common.h"
> +#include "qemu/error-report.h"
>  #include "hw/usb.h"
>  #include "hw/usb/desc.h"
>  #include "sysemu/bt.h"
> @@ -506,6 +507,14 @@ static int usb_bt_initfn(USBDevice *dev)
>
>      usb_desc_create_serial(dev);
>      usb_desc_init(dev);
> +    s->dev.opaque = s;
> +    if (!s->hci) {
> +        s->hci = bt_new_hci(qemu_find_bt_vlan(0));
> +    }
> +    s->hci->opaque = s;
> +    s->hci->evt_recv = usb_bt_out_hci_packet_event;
> +    s->hci->acl_recv = usb_bt_out_hci_packet_acl;
> +    usb_bt_handle_reset(&s->dev);
>      s->intr = usb_ep_get(dev, USB_TOKEN_IN, USB_EVT_EP);
>
>      return 0;
> @@ -516,6 +525,7 @@ static USBDevice *usb_bt_init(USBBus *bus, const char *cmdline)
>      USBDevice *dev;
>      struct USBBtState *s;
>      HCIInfo *hci;
> +    const char *name = "usb-bt-dongle";
>
>      if (*cmdline) {
>          hci = hci_init(cmdline);
> @@ -525,19 +535,17 @@ static USBDevice *usb_bt_init(USBBus *bus, const char *cmdline)
>
>      if (!hci)
>          return NULL;
> -    dev = usb_create_simple(bus, "usb-bt-dongle");
> +    dev = usb_create(bus, name);
>      if (!dev) {
> +        error_report("Failed to create USB device '%s'", name);
>          return NULL;
>      }
>      s = DO_UPCAST(struct USBBtState, dev, dev);
> -    s->dev.opaque = s;
> -
>      s->hci = hci;
> -    s->hci->opaque = s;
> -    s->hci->evt_recv = usb_bt_out_hci_packet_event;
> -    s->hci->acl_recv = usb_bt_out_hci_packet_acl;
> -
> -    usb_bt_handle_reset(&s->dev);
> +    if (qdev_init(&dev->qdev) < 0) {
> +        error_report("Failed to initialize USB device '%s'", name);
> +        return NULL;
> +    }
>
>      return dev;
>  }
>

Perfect!  My comment about inlining usb_create_simple was a bit cryptic, 
but you got what I meant.  Thanks. :)

Not really trivial, but you've CCed Gerd too.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


