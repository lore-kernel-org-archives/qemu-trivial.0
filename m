Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zyu-0005Ss-2w
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zym-0005EX-Jn
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyl-0008Ay-As
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyf-00088M-8R; Mon, 22 Jun 2015 07:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 412D441E4B;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 681ECA56;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9250 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:13 +0300
Message-Id: <6b5aff23d85680022d5324ea911657930034e1c5.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/21] piix: piix3 QOMify
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
X-List-Received-Date: Mon, 22 Jun 2015 11:33:34 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci-host/piix.c | 57 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index ed2424c..ad55f99 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -91,6 +91,10 @@ typedef struct PIIX3State {
     MemoryRegion rcr_mem;
 } PIIX3State;
 
+#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
+#define PIIX3_PCI_DEVICE(obj) \
+    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
+
 #define TYPE_I440FX_PCI_DEVICE "i440FX"
 #define I440FX_PCI_DEVICE(obj) \
     OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
@@ -368,13 +372,15 @@ PCIBus *i440fx_init(PCII440FXState **pi440fx_state,
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI. */
     if (xen_enabled()) {
-        piix3 = DO_UPCAST(PIIX3State, dev,
-                pci_create_simple_multifunction(b, -1, true, "PIIX3-xen"));
+        PCIDevice *pci_dev = pci_create_simple_multifunction(b,
+                             -1, true, "PIIX3-xen");
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         pci_bus_irqs(b, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                 piix3, XEN_PIIX_NUM_PIRQS);
     } else {
-        piix3 = DO_UPCAST(PIIX3State, dev,
-                pci_create_simple_multifunction(b, -1, true, "PIIX3"));
+        PCIDevice *pci_dev = pci_create_simple_multifunction(b,
+                             -1, true, "PIIX3");
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         pci_bus_irqs(b, piix3_set_irq, pci_slot_get_pirq, piix3,
                 PIIX_NUM_PIRQS);
         pci_bus_set_route_irq_fn(b, piix3_route_intx_pin_to_irq);
@@ -480,7 +486,7 @@ static void piix3_write_config(PCIDevice *dev,
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQC, 4)) {
-        PIIX3State *piix3 = DO_UPCAST(PIIX3State, dev, dev);
+        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
         int pic_irq;
 
         pci_bus_fire_intx_routing_notifier(piix3->dev.bus);
@@ -634,7 +640,7 @@ static const MemoryRegionOps rcr_ops = {
 
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX3State *d = DO_UPCAST(PIIX3State, dev, dev);
+    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
 
     isa_bus_new(DEVICE(d), get_system_memory(),
                 pci_address_space_io(dev));
@@ -647,7 +653,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     qemu_register_reset(piix3_reset, d);
 }
 
-static void piix3_class_init(ObjectClass *klass, void *data)
+static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -656,7 +662,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
     k->realize      = piix3_realize;
-    k->config_write = piix3_write_config;
     k->vendor_id    = PCI_VENDOR_ID_INTEL;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
@@ -668,38 +673,37 @@ static void piix3_class_init(ObjectClass *klass, void *data)
     dc->cannot_instantiate_with_device_add_yet = true;
 }
 
+static const TypeInfo piix3_pci_type_info = {
+    .name = TYPE_PIIX3_PCI_DEVICE,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PIIX3State),
+    .abstract = true,
+    .class_init = pci_piix3_class_init,
+};
+
+static void piix3_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->config_write = piix3_write_config;
+}
+
 static const TypeInfo piix3_info = {
     .name          = "PIIX3",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
+    .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_class_init,
 };
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    dc->desc        = "ISA bridge";
-    dc->vmsd        = &vmstate_piix3;
-    dc->hotpluggable   = false;
-    k->realize      = piix3_realize;
     k->config_write = piix3_write_config_xen;
-    k->vendor_id    = PCI_VENDOR_ID_INTEL;
-    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
-    k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
-    k->class_id     = PCI_CLASS_BRIDGE_ISA;
-    /*
-     * Reason: part of PIIX3 southbridge, needs to be wired up by
-     * pc_piix.c's pc_init1()
-     */
-    dc->cannot_instantiate_with_device_add_yet = true;
 };
 
 static const TypeInfo piix3_xen_info = {
     .name          = "PIIX3-xen",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
+    .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_xen_class_init,
 };
 
@@ -772,6 +776,7 @@ static const TypeInfo i440fx_pcihost_info = {
 static void i440fx_register_types(void)
 {
     type_register_static(&i440fx_info);
+    type_register_static(&piix3_pci_type_info);
     type_register_static(&piix3_info);
     type_register_static(&piix3_xen_info);
     type_register_static(&i440fx_pcihost_info);
-- 
2.1.4


