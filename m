Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1W1W-0004N6-B2
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 06:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1W1Q-0004Fh-HR
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 06:42:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1W1P-00009r-3G
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 06:42:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:25228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1W1K-0008W3-8B; Fri, 21 Apr 2017 06:42:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 276A17456BB;
	Fri, 21 Apr 2017 12:42:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 697DB7456D1; Fri, 21 Apr 2017 12:42:31 +0200 (CEST)
Message-Id: <05a1c43d060f8e8a3d143eff6f037488e2f4b0f9.1492770667.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492770667.git.balaton@eik.bme.hu>
References: <cover.1492770667.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Apr 2017 12:31:07 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v6 06/13] sm501: Add emulation of chip
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
X-List-Received-Date: Fri, 21 Apr 2017 10:42:41 -0000

Only the display controller part is created automatically on PCI

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

v2: Split off removing dependency on base address to separate patch
v3: Added reset function and PCI ID constant definitions in pci_ids.h
v4: Return error for invalid VRAM size, set bit in misc_control for PCI bus

 hw/display/sm501.c       | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci_ids.h |  3 +++
 2 files changed, 68 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 09c023d..c92a5fa 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -32,6 +32,7 @@
 #include "ui/console.h"
 #include "hw/devices.h"
 #include "hw/sysbus.h"
+#include "hw/pci/pci.h"
 #include "qemu/range.h"
 #include "ui/pixel_ops.h"
 #include "exec/address-spaces.h"
@@ -1547,9 +1548,73 @@ static const TypeInfo sm501_sysbus_info = {
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
+    if (get_local_mem_size(&s->state) != s->vram_size) {
+        error_setg(errp, "Invalid VRAM size, nearest valid size is %" PRIu32,
+                   get_local_mem_size(&s->state));
+        return;
+    }
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &s->state.local_mem_region);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &s->state.mmio_region);
+}
+
+static Property sm501_pci_properties[] = {
+    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * M_BYTE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sm501_reset_pci(DeviceState *dev)
+{
+    SM501PCIState *s = PCI_SM501(dev);
+    sm501_reset(&s->state);
+    /* Bits 2:0 of misc_control register is 001 for PCI */
+    s->state.misc_control |= 1;
+}
+
+static void sm501_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = sm501_realize_pci;
+    k->vendor_id = PCI_VENDOR_ID_SILICON_MOTION;
+    k->device_id = PCI_DEVICE_ID_SM501;
+    k->class_id = PCI_CLASS_DISPLAY_OTHER;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->desc = "SM501 Display Controller";
+    dc->props = sm501_pci_properties;
+    dc->reset = sm501_reset_pci;
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
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index d22ad8d..3752ddc 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -207,6 +207,9 @@
 
 #define PCI_VENDOR_ID_MARVELL            0x11ab
 
+#define PCI_VENDOR_ID_SILICON_MOTION     0x126f
+#define PCI_DEVICE_ID_SM501              0x0501
+
 #define PCI_VENDOR_ID_ENSONIQ            0x1274
 #define PCI_DEVICE_ID_ENSONIQ_ES1370     0x5000
 
-- 
2.7.4


