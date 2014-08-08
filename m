Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFqwn-0005CV-Jj
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwg-0004zh-Q5
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFqwc-0000xp-Bi
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:39:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFqwO-0000ot-K6; Fri, 08 Aug 2014 16:39:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1FEBE41A18;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0ACAF6F3;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10320 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:59 +0400
Message-Id: <1407530342-10259-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 6/9] hw/timer: Move extern declaration from .c
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
X-List-Received-Date: Fri, 08 Aug 2014 20:39:31 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from smatch (static code analyser).

Fix also the comment with the renamed source file name.

Signed-off-by: Stefan Weil <sw@weilnetz.de>

 hw/timer/tusb6010.c |    3 ---
 include/hw/usb.h    |    7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/tusb6010.c |    3 ---
 include/hw/usb.h    |    7 ++++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/timer/tusb6010.c b/hw/timer/tusb6010.c
index bd2a89e..459c748 100644
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


