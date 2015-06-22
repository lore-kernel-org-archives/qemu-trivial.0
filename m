Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpT-00047i-9H
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpQ-00041t-6i
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpP-00059E-51
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zpJ-000579-Lh; Mon, 22 Jun 2015 07:23:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1530641E43;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E5CA9A54;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: (nullmailer pid 9252 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:14 +0300
Message-Id: <21a0e0b7ead29a694b8fc074bc27368bc6bfc64d.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/21] piix4: QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/piix4.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d9522b1..2c59e91 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -34,6 +34,10 @@ typedef struct PIIX4State {
     PCIDevice dev;
 } PIIX4State;
 
+#define TYPE_PIIX4_PCI_DEVICE "PIIX4"
+#define PIIX4_PCI_DEVICE(obj) \
+    OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
+
 static void piix4_reset(void *opaque)
 {
     PIIX4State *d = opaque;
@@ -84,7 +88,7 @@ static const VMStateDescription vmstate_piix4 = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *d = DO_UPCAST(PIIX4State, dev, dev);
+    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
 
     isa_bus_new(DEVICE(d), pci_address_space(dev),
                 pci_address_space_io(dev));
@@ -121,7 +125,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix4_info = {
-    .name          = "PIIX4",
+    .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIX4State),
     .class_init    = piix4_class_init,
-- 
2.1.4


