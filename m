Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EvY-0002rR-VU
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:50:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EvX-0002pi-Fz
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EvW-00022n-KD
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:50:15 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:47278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4EvT-00022B-Mv; Mon, 07 Jul 2014 15:50:11 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id ACAFC17FA16; Mon,  7 Jul 2014 21:50:08 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:50:07 +0200
Message-Id: <1404762607-4134-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] hw/timer: Move extern declaration from .c
	to .h file
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
X-List-Received-Date: Mon, 07 Jul 2014 19:50:16 -0000

This fixes a warning from smatch (static code analyser).

Fix also the comment with the renamed source file name.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

v2: Moved extern declaration to better location, fixed comment.

 hw/timer/tusb6010.c |    3 ---
 include/hw/usb.h    |    7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index 8bcab48..223a5ae 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -475,7 +475,8 @@ void usb_host_info(Monitor *mon, const QDict *qdict);
 
 #define VM_USB_HUB_SIZE 8
 
-/* usb-musb.c */
+/* hw/usb/hdc-musb.c */
+
 enum musb_irq_source_e {
     musb_irq_suspend = 0,
     musb_irq_resume,
@@ -494,6 +495,10 @@ enum musb_irq_source_e {
 };
 
 typedef struct MUSBState MUSBState;
+
+extern CPUReadMemoryFunc * const musb_read[];
+extern CPUWriteMemoryFunc * const musb_write[];
+
 MUSBState *musb_init(DeviceState *parent_device, int gpio_base);
 void musb_reset(MUSBState *s);
 uint32_t musb_core_intr_get(MUSBState *s);
-- 
1.7.10.4


