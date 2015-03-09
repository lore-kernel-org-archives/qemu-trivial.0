Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV1W8-0003Xy-VI
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 13:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vy-000399-Ls
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vv-0005ns-5z
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:50 -0400
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:57045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YV1Vu-0005nM-TG
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 13:30:47 -0400
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 9 Mar 2015 17:30:45 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 9 Mar 2015 17:30:43 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id C63FA1B08061; 
	Mon,  9 Mar 2015 17:31:02 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t29HUgqH47906924; Mon, 9 Mar 2015 17:30:42 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t29HUgEV025096; Mon, 9 Mar 2015 11:30:42 -0600
Received: from oc7435384737.ibm.com (sig-9-81-34-230.evts.uk.ibm.com
	[9.81.34.230])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t29HUF7r024224; Mon, 9 Mar 2015 11:30:41 -0600
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Mar 2015 18:30:13 +0100
Message-Id: <1425922215-20819-7-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15030917-0013-0000-0000-0000033BBE5A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.109
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 6/8] usb: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 17:30:58 -0000

Delete set_usb_string(), usb_ep_get_ifnum(), usb_ep_get_max_packet_size()
usb_ep_get_max_streams() and usb_ep_set_pipeline() since they are
not used anymore.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/core.c    |   41 -----------------------------------------
 include/hw/usb.h |    5 -----
 2 files changed, 0 insertions(+), 46 deletions(-)

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
index e6dfb87..bdd570a 100644
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
1.7.1


