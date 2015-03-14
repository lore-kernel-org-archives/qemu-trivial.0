Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQO-0006Me-E0
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQL-0006HB-Ju
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQE-0004CW-Qm
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:49 -0400
Received: from e06smtp15.uk.ibm.com ([195.75.94.111]:44940)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQE-0004C9-IH
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:42 -0400
Received: from /spool/local
	by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:41 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:38 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5B9C917D8059; 
	Sat, 14 Mar 2015 06:20:01 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JcNi64290834; Sat, 14 Mar 2015 06:19:38 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JbRi013428; Sat, 14 Mar 2015 02:19:37 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkX013361; Sat, 14 Mar 2015 02:19:37 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:32 +0100
Message-Id: <1426313974-25607-6-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0021-0000-0000-0000033A3333
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.111
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 5/7] usb: Remove unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:50 -0000

Delete set_usb_string(), usb_ep_get_ifnum(), usb_ep_get_max_packet_size()
usb_ep_get_max_streams() and usb_ep_set_pipeline() since they are
not used anymore.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
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


