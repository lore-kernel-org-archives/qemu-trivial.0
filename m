Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpL-0003tV-Cy
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpG-0003k9-6B
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpE-00055u-Lo
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zoz-00052r-AG; Mon, 22 Jun 2015 07:23:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DD3941E4A;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A2DFBA6E;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9259 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:17 +0300
Message-Id: <9ff23d3894b8cb1e7e480eea5ea32792ffaefe6d.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/21] vt82c686: QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:44 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/vt82c686.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b2ba870..252e1d7 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -47,6 +47,10 @@ typedef struct VT82C686BState {
     SuperIOConfig superio_conf;
 } VT82C686BState;
 
+#define TYPE_VT82C686B_DEVICE "VT82C686B"
+#define VT82C686B_DEVICE(obj) \
+    OBJECT_CHECK(VT82C686BState, (obj), TYPE_VT82C686B_DEVICE)
+
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
 {
@@ -114,7 +118,7 @@ static void vt82c686b_reset(void * opaque)
 {
     PCIDevice *d = opaque;
     uint8_t *pci_conf = d->config;
-    VT82C686BState *vt82c = DO_UPCAST(VT82C686BState, dev, d);
+    VT82C686BState *vt82c = VT82C686B_DEVICE(d);
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
@@ -142,7 +146,7 @@ static void vt82c686b_reset(void * opaque)
 static void vt82c686b_write_config(PCIDevice * d, uint32_t address,
                                    uint32_t val, int len)
 {
-    VT82C686BState *vt686 = DO_UPCAST(VT82C686BState, dev, d);
+    VT82C686BState *vt686 = VT82C686B_DEVICE(d);
 
     DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
            address, val, len);
@@ -172,6 +176,18 @@ typedef struct VT686MC97State {
     PCIDevice dev;
 } VT686MC97State;
 
+#define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
+#define VT82C686B_PM_DEVICE(obj) \
+    OBJECT_CHECK(VT686PMState, (obj), TYPE_VT82C686B_PM_DEVICE)
+
+#define TYPE_VT82C686B_MC97_DEVICE "VT82C686B_MC97"
+#define VT82C686B_MC97_DEVICE(obj) \
+    OBJECT_CHECK(VT686MC97State, (obj), TYPE_VT82C686B_MC97_DEVICE)
+
+#define TYPE_VT82C686B_AC97_DEVICE "VT82C686B_AC97"
+#define VT82C686B_AC97_DEVICE(obj) \
+    OBJECT_CHECK(VT686AC97State, (obj), TYPE_VT82C686B_AC97_DEVICE)
+
 static void pm_update_sci(VT686PMState *s)
 {
     int sci_level, pmsts;
@@ -247,7 +263,7 @@ static const VMStateDescription vmstate_acpi = {
 
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686AC97State *s = DO_UPCAST(VT686AC97State, dev, dev);
+    VT686AC97State *s = VT82C686B_AC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -261,7 +277,7 @@ void vt82c686b_ac97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_create(bus, devfn, "VT82C686B_AC97");
+    dev = pci_create(bus, devfn, TYPE_VT82C686B_AC97_DEVICE);
     qdev_init_nofail(&dev->qdev);
 }
 
@@ -280,7 +296,7 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ac97_info = {
-    .name          = "VT82C686B_AC97",
+    .name          = TYPE_VT82C686B_AC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT686AC97State),
     .class_init    = via_ac97_class_init,
@@ -288,7 +304,7 @@ static const TypeInfo via_ac97_info = {
 
 static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686MC97State *s = DO_UPCAST(VT686MC97State, dev, dev);
+    VT686MC97State *s = VT82C686B_MC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -301,7 +317,7 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_create(bus, devfn, "VT82C686B_MC97");
+    dev = pci_create(bus, devfn, TYPE_VT82C686B_MC97_DEVICE);
     qdev_init_nofail(&dev->qdev);
 }
 
@@ -320,7 +336,7 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_mc97_info = {
-    .name          = "VT82C686B_MC97",
+    .name          = TYPE_VT82C686B_MC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT686MC97State),
     .class_init    = via_mc97_class_init,
@@ -329,7 +345,7 @@ static const TypeInfo via_mc97_info = {
 /* vt82c686 pm init */
 static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 {
-    VT686PMState *s = DO_UPCAST(VT686PMState, dev, dev);
+    VT686PMState *s = VT82C686B_PM_DEVICE(dev);
     uint8_t *pci_conf;
 
     pci_conf = s->dev.config;
@@ -365,10 +381,10 @@ I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     PCIDevice *dev;
     VT686PMState *s;
 
-    dev = pci_create(bus, devfn, "VT82C686B_PM");
+    dev = pci_create(bus, devfn, TYPE_VT82C686B_PM_DEVICE);
     qdev_prop_set_uint32(&dev->qdev, "smb_io_base", smb_io_base);
 
-    s = DO_UPCAST(VT686PMState, dev, dev);
+    s = VT82C686B_PM_DEVICE(dev);
 
     qdev_init_nofail(&dev->qdev);
 
@@ -398,7 +414,7 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_pm_info = {
-    .name          = "VT82C686B_PM",
+    .name          = TYPE_VT82C686B_PM_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT686PMState),
     .class_init    = via_pm_class_init,
@@ -417,7 +433,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BState *vt82c = DO_UPCAST(VT82C686BState, dev, d);
+    VT82C686BState *vt82c = VT82C686B_DEVICE(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -451,7 +467,8 @@ ISABus *vt82c686b_init(PCIBus *bus, int devfn)
 {
     PCIDevice *d;
 
-    d = pci_create_simple_multifunction(bus, devfn, true, "VT82C686B");
+    d = pci_create_simple_multifunction(bus, devfn, true,
+                                        TYPE_VT82C686B_DEVICE);
 
     return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
 }
@@ -477,7 +494,7 @@ static void via_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_info = {
-    .name          = "VT82C686B",
+    .name          = TYPE_VT82C686B_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(VT82C686BState),
     .class_init    = via_class_init,
-- 
2.1.4


