Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EUd-0006vH-T9
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:22:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EUb-0006tg-JX
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:22:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EUa-00014G-LW
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:22:25 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:47216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4EUY-00012b-Kp; Mon, 07 Jul 2014 15:22:22 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 6DBAB17FA16; Mon,  7 Jul 2014 21:22:19 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:22:18 +0200
Message-Id: <1404760938-2265-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw/timer: Move extern declaration from .c to
	.h file
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
X-List-Received-Date: Mon, 07 Jul 2014 19:22:26 -0000

This fixes a warning from smatch (static code analyser).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/timer/tusb6010.c |    3 ---
 include/hw/usb.h    |    4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
index a281567..4e8f053 100644
--- a/hw/timer/tusb6010.c
+++ b/hw/timer/tusb6010.c
@@ -282,9 +282,6 @@ static void tusb_gpio_intr_update(TUSBState *s)
     /* TODO: How is this signalled?  */
 }
 
-extern CPUReadMemoryFunc * const musb_read[];
-extern CPUWriteMemoryFunc * const musb_write[];
-
 static uint32_t tusb_async_readb(void *opaque, hwaddr addr)
 {
     TUSBState *s = (TUSBState *) opaque;
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 8bcab48..e68e57e 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -467,6 +467,10 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream);
 void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
 int set_usb_string(uint8_t *buf, const char *str);
 
+/* hcd-musb.c */
+extern CPUReadMemoryFunc * const musb_read[];
+extern CPUWriteMemoryFunc * const musb_write[];
+
 /* usb-linux.c */
 USBDevice *usb_host_device_open(USBBus *bus, const char *devname);
 void usb_host_info(Monitor *mon, const QDict *qdict);
-- 
1.7.10.4


