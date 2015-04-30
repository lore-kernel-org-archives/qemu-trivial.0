Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhOq-00026A-RZ
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:52:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOn-0001vv-4u
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOm-0008Ct-2o
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhOf-00088l-KO; Thu, 30 Apr 2015 01:52:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6E1642B84;
	Thu, 30 Apr 2015 08:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3851F958;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4327 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:30 +0300
Message-Id: <6b20216d93807cb7f966b1067f9895e6b3c0be06.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 17/42] usb: Remove unused functions
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
X-List-Received-Date: Thu, 30 Apr 2015 05:52:38 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

Delete set_usb_string(), usb_ep_get_ifnum(), usb_ep_get_max_packet_size()
usb_ep_get_max_streams() and usb_ep_set_pipeline() since they are
not used anymore.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/core.c    | 41 -----------------------------------------
 include/hw/usb.h |  5 -----
 2 files changed, 46 deletions(-)

diff --git a/hw/usb/core.c b/hw/usb/core.c
index cf34755..d0025db 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -331,23 +331,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p)
     usb_packet_complete(s, p);
 }
 
-/* XXX: fix overflow */
-int set_usb_string(uint8_t *buf, const char *str)
-{
-    int len, i;
-    uint8_t *q;
-
-    q = buf;
-    len = strlen(str);
-    *q++ = 2 * len + 2;
-    *q++ = 3;
-    for(i = 0; i < len; i++) {
-        *q++ = str[i];
-        *q++ = 0;
-    }
-    return q - buf;
-}
-
 USBDevice *usb_find_device(USBPort *port, uint8_t addr)
 {
     USBDevice *dev = port->dev;
@@ -749,12 +732,6 @@ void usb_ep_set_type(USBDevice *dev, int pid, int ep, uint8_t type)
     uep->type = type;
 }
 
-uint8_t usb_ep_get_ifnum(USBDevice *dev, int pid, int ep)
-{
-    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
-    return uep->ifnum;
-}
-
 void usb_ep_set_ifnum(USBDevice *dev, int pid, int ep, uint8_t ifnum)
 {
     struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
@@ -782,12 +759,6 @@ void usb_ep_set_max_packet_size(USBDevice *dev, int pid, int ep,
     uep->max_packet_size = size * microframes;
 }
 
-int usb_ep_get_max_packet_size(USBDevice *dev, int pid, int ep)
-{
-    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
-    return uep->max_packet_size;
-}
-
 void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw)
 {
     struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
@@ -801,18 +772,6 @@ void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw)
     }
 }
 
-int usb_ep_get_max_streams(USBDevice *dev, int pid, int ep)
-{
-    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
-    return uep->max_streams;
-}
-
-void usb_ep_set_pipeline(USBDevice *dev, int pid, int ep, bool enabled)
-{
-    struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
-    uep->pipeline = enabled;
-}
-
 void usb_ep_set_halted(USBDevice *dev, int pid, int ep, bool halted)
 {
     struct USBEndpoint *uep = usb_ep_get(dev, pid, ep);
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 5be2937..c8b6e7b 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -445,15 +445,11 @@ void usb_ep_reset(USBDevice *dev);
 void usb_ep_dump(USBDevice *dev);
 struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep);
 uint8_t usb_ep_get_type(USBDevice *dev, int pid, int ep);
-uint8_t usb_ep_get_ifnum(USBDevice *dev, int pid, int ep);
 void usb_ep_set_type(USBDevice *dev, int pid, int ep, uint8_t type);
 void usb_ep_set_ifnum(USBDevice *dev, int pid, int ep, uint8_t ifnum);
 void usb_ep_set_max_packet_size(USBDevice *dev, int pid, int ep,
                                 uint16_t raw);
-int usb_ep_get_max_packet_size(USBDevice *dev, int pid, int ep);
 void usb_ep_set_max_streams(USBDevice *dev, int pid, int ep, uint8_t raw);
-int usb_ep_get_max_streams(USBDevice *dev, int pid, int ep);
-void usb_ep_set_pipeline(USBDevice *dev, int pid, int ep, bool enabled);
 void usb_ep_set_halted(USBDevice *dev, int pid, int ep, bool halted);
 USBPacket *usb_ep_find_packet_by_id(USBDevice *dev, int pid, int ep,
                                     uint64_t id);
@@ -469,7 +465,6 @@ void usb_port_reset(USBPort *port);
 void usb_device_reset(USBDevice *dev);
 void usb_wakeup(USBEndpoint *ep, unsigned int stream);
 void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
-int set_usb_string(uint8_t *buf, const char *str);
 
 /* usb-linux.c */
 USBDevice *usb_host_device_open(USBBus *bus, const char *devname);
-- 
2.1.4


