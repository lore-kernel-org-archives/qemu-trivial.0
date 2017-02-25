Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chmkf-0001ct-Vf
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 19:31:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkc-0001Qz-6N
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmka-0005zP-Lx
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:46 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chmkV-0005tM-05; Sat, 25 Feb 2017 19:31:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 49196745970;
	Sun, 26 Feb 2017 01:31:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 79BB8745962; Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Message-Id: <c554a16417ef22dbc29919a2747801be5ed7fede.1488068248.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2017 19:31:24 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v2 05/14] sm501: Add emulation of chip
 connected via PCI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2017 00:31:47 -0000

Only the display controller part is created automatically on PCI

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---

v2: Split off removing dependency on base address to separate patch

 hw/display/sm501.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 1cda127..d9219bd 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -31,6 +31,7 @@
 #include "ui/console.h"
 #include "hw/devices.h"
 #include "hw/sysbus.h"
+#include "hw/pci/pci.h"
 #include "qemu/range.h"
 #include "ui/pixel_ops.h"
 #include "exec/address-spaces.h"
@@ -1507,9 +1508,60 @@ static const TypeInfo sm501_sysbus_info = {
     .class_init    = sm501_sysbus_class_init,
 };
 
+#define TYPE_PCI_SM501 "sm501"
+#define PCI_SM501(obj) OBJECT_CHECK(SM501PCIState, (obj), TYPE_PCI_SM501)
+
+typedef struct {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+    SM501State state;
+    uint32_t vram_size;
+} SM501PCIState;
+
+static void sm501_realize_pci(PCIDevice *dev, Error **errp)
+{
+    SM501PCIState *s = PCI_SM501(dev);
+
+    sm501_init(&s->state, DEVICE(dev), s->vram_size);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &s->state.local_mem_region);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &s->state.mmio_region);
+}
+
+static Property sm501_pci_properties[] = {
+    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size,
+                       64 * 1024 * 1024),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sm501_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = sm501_realize_pci;
+    k->vendor_id = 0x126f;
+    k->device_id = 0x0501;
+    k->class_id = PCI_CLASS_DISPLAY_OTHER;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->desc = "SM501 Display Controller";
+    dc->props = sm501_pci_properties;
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo sm501_pci_info = {
+    .name          = TYPE_PCI_SM501,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(SM501PCIState),
+    .class_init    = sm501_pci_class_init,
+};
+
 static void sm501_register_types(void)
 {
     type_register_static(&sm501_sysbus_info);
+    type_register_static(&sm501_pci_info);
 }
 
 type_init(sm501_register_types)
-- 
2.7.4


