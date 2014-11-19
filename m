Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqzO9-0000rf-Sl
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 02:09:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzO2-0000i8-Vm
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzNx-0001Rp-TX
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:09:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57910)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XqzNn-0001QM-Ff; Wed, 19 Nov 2014 02:08:55 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAJ78rTt024013
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 19 Nov 2014 02:08:53 -0500
Received: from localhost (dhcp-14-161.nay.redhat.com [10.66.14.161])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAJ78p0N030028; Wed, 19 Nov 2014 02:08:52 -0500
Date: Wed, 19 Nov 2014 15:09:16 +0800
From: Fam Zheng <famz@redhat.com>
To: Jun Li <junmuzi@gmail.com>
Message-ID: <20141119070916.GA9314@fam-t430.nay.redhat.com>
References: <1416380263-1274-1-git-send-email-junmuzi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1416380263-1274-1-git-send-email-junmuzi@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, juli@redhat.com, qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: delete redundant
 brackets in usb_host_handle_control()
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
X-List-Received-Date: Wed, 19 Nov 2014 07:09:16 -0000

On Wed, 11/19 14:57, Jun Li wrote:
> When see usb codes, find there are redundant brackets !((udev->port->speedmask
> & USB_SPEED_MASK_SUPER)) here. So delete it.
> 
> Signed-off-by: Jun Li <junmuzi@gmail.com>
> ---
>  hw/usb/host-libusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index a5f9dab..cff4f7c 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1237,7 +1237,7 @@ static void usb_host_handle_control(USBDevice *udev, USBPacket *p,
>      /* Fix up USB-3 ep0 maxpacket size to allow superspeed connected devices
>       * to work redirected to a not superspeed capable hcd */
>      if (udev->speed == USB_SPEED_SUPER &&
> -        !((udev->port->speedmask & USB_SPEED_MASK_SUPER)) &&
> +        !(udev->port->speedmask & USB_SPEED_MASK_SUPER) &&
>          request == 0x8006 && value == 0x100 && index == 0) {
>          r->usb3ep0quirk = true;
>      }
> -- 
> 1.9.3
> 
> 

Reviewed-by: Fam Zheng <famz@redhat.com>

Cc'ing qemu-trivial@nongnu.org.

Fam

