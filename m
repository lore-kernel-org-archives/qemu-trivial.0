Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVFgN-0003Ur-15
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 04:38:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YVFgJ-0003QH-O9
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 04:38:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YVFgF-0000xv-4W
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 04:38:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YVFgE-0000xn-QK; Tue, 10 Mar 2015 04:38:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2A8cKHd003257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Mar 2015 04:38:20 -0400
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2A8cGAx008589; Tue, 10 Mar 2015 04:38:18 -0400
Message-ID: <1425976695.2944.7.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Date: Tue, 10 Mar 2015 09:38:15 +0100
In-Reply-To: <1425922215-20819-7-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1425922215-20819-7-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 6/8] usb: Remove unused functions
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
X-List-Received-Date: Tue, 10 Mar 2015 08:38:29 -0000

On Mo, 2015-03-09 at 18:30 +0100, Thomas Huth wrote:
> Delete set_usb_string(), usb_ep_get_ifnum(), usb_ep_get_max_packet_size()
> usb_ep_get_max_streams() and usb_ep_set_pipeline() since they are
> not used anymore.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/core.c    |   41 -----------------------------------------
>  include/hw/usb.h |    5 -----
>  2 files changed, 0 insertions(+), 46 deletions(-)
> 
> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index cf34755..d0025db 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -331,23 +331,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p)
>      usb_packet_complete(s, p);
>  }
>  
> -/* XXX: fix overflow */
> -int set_usb_string(uint8_t *buf, const char *str)
> -{
> -    int len, i;
> -    uint8_t *q;
> -
> -    q = buf;
> -    len = strlen(str);
> -    *q++ = 2 * len + 2;
> -    *q++ = 3;
> -    for(i = 0; i < len; i++) {
> -        *q++ = str[i];
> -        *q++ = 0;
> -    }
> -    return q - buf;
> -}
> -
>  USBDevice *usb_find_device(USBPort *port, uint8_t addr)
>  {
>      USBDevice *dev = port->dev;
> @@ -749,12 +732,6 @@ void usb_ep_set_type(USBDevice *dev, int pid, int ep, uint8_t type)
>      uep->type = type;
>  }
>  
> -uint8_t usb_ep_get_ifnum(USBDevice *dev, int pid, int ep)
> -{
> -    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> -    return uep->ifnum;
> -}
> -
>  void usb_ep_set_ifnum(USBDevice *dev, int pid, int ep, uint8_t ifnum)
>  {
>      struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> @@ -782,12 +759,6 @@ void usb_ep_set_max_packet_size(USBDevice *dev, int pid, int ep,
>      uep->max_packet_size = size * microframes;
>  }
>  
> -int usb_ep_get_max_packet_size(USBDevice *dev, int pid, int ep)
> -{
> -    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> -    return uep->max_packet_size;
> -}
> -
>  void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw)
>  {
>      struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> @@ -801,18 +772,6 @@ void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw)
>      }
>  }
>  
> -int usb_ep_get_max_streams(USBDevice *dev, int pid, int ep)
> -{
> -    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> -    return uep->max_streams;
> -}
> -
> -void usb_ep_set_pipeline(USBDevice *dev, int pid, int ep, bool enabled)
> -{
> -    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> -    uep->pipeline = enabled;
> -}
> -
>  void usb_ep_set_halted(USBDevice *dev, int pid, int ep, bool halted)
>  {
>      struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index e6dfb87..bdd570a 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -445,15 +445,11 @@ void usb_ep_reset(USBDevice *dev);
>  void usb_ep_dump(USBDevice *dev);
>  struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep);
>  uint8_t usb_ep_get_type(USBDevice *dev, int pid, int ep);
> -uint8_t usb_ep_get_ifnum(USBDevice *dev, int pid, int ep);
>  void usb_ep_set_type(USBDevice *dev, int pid, int ep, uint8_t type);
>  void usb_ep_set_ifnum(USBDevice *dev, int pid, int ep, uint8_t ifnum);
>  void usb_ep_set_max_packet_size(USBDevice *dev, int pid, int ep,
>                                  uint16_t raw);
> -int usb_ep_get_max_packet_size(USBDevice *dev, int pid, int ep);
>  void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw);
> -int usb_ep_get_max_streams(USBDevice *dev, int pid, int ep);
> -void usb_ep_set_pipeline(USBDevice *dev, int pid, int ep, bool enabled);
>  void usb_ep_set_halted(USBDevice *dev, int pid, int ep, bool halted);
>  USBPacket *usb_ep_find_packet_by_id(USBDevice *dev, int pid, int ep,
>                                      uint64_t id);
> @@ -469,7 +465,6 @@ void usb_port_reset(USBPort *port);
>  void usb_device_reset(USBDevice *dev);
>  void usb_wakeup(USBEndpoint *ep, unsigned int stream);
>  void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
> -int set_usb_string(uint8_t *buf, const char *str);
>  
>  /* usb-linux.c */
>  USBDevice *usb_host_device_open(USBBus *bus, const char *devname);



