Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqK15-0004Sf-2X
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 05:58:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqK0z-0004J9-E2
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 05:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqK0u-0007RV-LR
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 05:58:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XqK0u-0007RR-Ca; Mon, 17 Nov 2014 05:58:32 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAHAwIJh012259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 05:58:18 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAHAwDiG008987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 17 Nov 2014 05:58:15 -0500
Message-ID: <5469D4C4.5090407@redhat.com>
Date: Mon, 17 Nov 2014 11:58:12 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gerd Hoffmann <kraxel@redhat.com>
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
X-List-Received-Date: Mon, 17 Nov 2014 10:58:42 -0000



On 15/11/2014 11:06, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/usb/hcd-musb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
> index 66bc61a..f2cb73c 100644
> --- a/hw/usb/hcd-musb.c
> +++ b/hw/usb/hcd-musb.c
> @@ -624,6 +624,10 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>  
>      /* A wild guess on the FADDR semantics... */
>      dev = usb_find_device(&s->port, ep->faddr[idx]);
> +    if (!dev) {
> +        TRACE("Do not find an usb device");
> +        return;
> +    }
>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
>      usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
>                       (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
> 

I think this patch is not the real fix.  usb_ep_get and
usb_handle_packet can deal with a NULL device, but we have to avoid 
dereferencing NULL pointers when building the id.

Paolo

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 66bc61a..40809f6 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -608,6 +608,7 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
     USBDevice *dev;
     USBEndpoint *uep;
     int idx = epnum && dir;
+    int id;
     int ttype;
 
     /* ep->type[0,1] contains:
@@ -625,8 +626,11 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
     /* A wild guess on the FADDR semantics... */
     dev = usb_find_device(&s->port, ep->faddr[idx]);
     uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
-    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
-                     (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
+    id = pid;
+    if (uep) {
+        id |= (dev->addr << 16) | (uep->nr << 8);
+    }
+    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0, id, false, true);
     usb_packet_addbuf(&ep->packey[dir].p, ep->buf[idx], len);
     ep->packey[dir].ep = ep;
     ep->packey[dir].dir = dir;

