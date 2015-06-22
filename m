Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpI-0003or-JU
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpF-0003iH-0d
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpD-00055h-1b
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zp0-00053Y-2L; Mon, 22 Jun 2015 07:23:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8770841E4C;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 34784A69;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9255 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:15 +0300
Message-Id: <5f3fe7d1e25de1add0cf3572b3faca3eaa5c264e.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/21] wdt_i6300esb: QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:42 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/watchdog/wdt_i6300esb.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 4ebdbb8..cfa2b1b 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -103,6 +103,10 @@ struct I6300State {
 
 typedef struct I6300State I6300State;
 
+#define TYPE_WATCHDOG_I6300ESB_DEVICE "i6300esb"
+#define WATCHDOG_I6300ESB_DEVICE(obj) \
+    OBJECT_CHECK(I6300State, (obj), TYPE_WATCHDOG_I6300ESB_DEVICE)
+
 /* This function is called when the watchdog has either been enabled
  * (hence it starts counting down) or has been keep-alived.
  */
@@ -150,7 +154,7 @@ static void i6300esb_disable_timer(I6300State *d)
 static void i6300esb_reset(DeviceState *dev)
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
-    I6300State *d = DO_UPCAST(I6300State, dev, pdev);
+    I6300State *d = WATCHDOG_I6300ESB_DEVICE(pdev);
 
     i6300esb_debug("I6300State = %p\n", d);
 
@@ -213,7 +217,7 @@ static void i6300esb_timer_expired(void *vp)
 static void i6300esb_config_write(PCIDevice *dev, uint32_t addr,
                                   uint32_t data, int len)
 {
-    I6300State *d = DO_UPCAST(I6300State, dev, dev);
+    I6300State *d = WATCHDOG_I6300ESB_DEVICE(dev);
     int old;
 
     i6300esb_debug("addr = %x, data = %x, len = %d\n", addr, data, len);
@@ -241,7 +245,7 @@ static void i6300esb_config_write(PCIDevice *dev, uint32_t addr,
 
 static uint32_t i6300esb_config_read(PCIDevice *dev, uint32_t addr, int len)
 {
-    I6300State *d = DO_UPCAST(I6300State, dev, dev);
+    I6300State *d = WATCHDOG_I6300ESB_DEVICE(dev);
     uint32_t data;
 
     i6300esb_debug ("addr = %x, len = %d\n", addr, len);
@@ -416,7 +420,7 @@ static const VMStateDescription vmstate_i6300esb = {
 
 static void i6300esb_realize(PCIDevice *dev, Error **errp)
 {
-    I6300State *d = DO_UPCAST(I6300State, dev, dev);
+    I6300State *d = WATCHDOG_I6300ESB_DEVICE(dev);
 
     i6300esb_debug("I6300State = %p\n", d);
 
@@ -451,7 +455,7 @@ static void i6300esb_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo i6300esb_info = {
-    .name          = "i6300esb",
+    .name          = TYPE_WATCHDOG_I6300ESB_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(I6300State),
     .class_init    = i6300esb_class_init,
-- 
2.1.4


