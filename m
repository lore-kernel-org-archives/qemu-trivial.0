Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1J8D-0005qr-Bu
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2017 16:56:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J86-0005iU-FK
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J85-000588-4q
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:42 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1J7y-00050b-Q3; Thu, 20 Apr 2017 16:56:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id C4DFC7456E4;
	Thu, 20 Apr 2017 22:56:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id DCA2B7456B5; Thu, 20 Apr 2017 22:56:16 +0200 (CEST)
Message-Id: <ed11eed8c9d73163af6a641bde1f3890df0ece26.1492721026.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492721026.git.balaton@eik.bme.hu>
References: <cover.1492721026.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 20 Apr 2017 22:43:46 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v5 12/13] sm501: Add vmstate descriptor
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
X-List-Received-Date: Thu, 20 Apr 2017 20:56:45 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

v3: Added local_mem_size_index to vmstate, add vmstate for sysbus version too

 hw/display/sm501.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 851c7c8..00722b0 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -66,6 +66,7 @@
 
 #define MMIO_BASE_OFFSET 0x3e00000
 #define MMIO_SIZE 0x200000
+#define DC_PALETTE_ENTRIES (0x400 * 3)
 
 /* SM501 register definitions taken from "linux/include/linux/sm501-regs.h" */
 
@@ -492,7 +493,7 @@ typedef struct SM501State {
     uint32_t uart0_mcr;
     uint32_t uart0_scr;
 
-    uint8_t dc_palette[0x400 * 3];
+    uint8_t dc_palette[DC_PALETTE_ENTRIES];
 
     uint32_t dc_panel_control;
     uint32_t dc_panel_panning_control;
@@ -1618,6 +1619,78 @@ static void sm501_init(SM501State *s, DeviceState *dev,
     s->con = graphic_console_init(DEVICE(dev), 0, &sm501_ops, s);
 }
 
+static const VMStateDescription vmstate_sm501_state = {
+    .name = "sm501-state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(local_mem_size_index, SM501State),
+        VMSTATE_UINT32(system_control, SM501State),
+        VMSTATE_UINT32(misc_control, SM501State),
+        VMSTATE_UINT32(gpio_31_0_control, SM501State),
+        VMSTATE_UINT32(gpio_63_32_control, SM501State),
+        VMSTATE_UINT32(dram_control, SM501State),
+        VMSTATE_UINT32(arbitration_control, SM501State),
+        VMSTATE_UINT32(irq_mask, SM501State),
+        VMSTATE_UINT32(misc_timing, SM501State),
+        VMSTATE_UINT32(power_mode_control, SM501State),
+        VMSTATE_UINT32(uart0_ier, SM501State),
+        VMSTATE_UINT32(uart0_lcr, SM501State),
+        VMSTATE_UINT32(uart0_mcr, SM501State),
+        VMSTATE_UINT32(uart0_scr, SM501State),
+        VMSTATE_UINT8_ARRAY(dc_palette, SM501State, DC_PALETTE_ENTRIES),
+        VMSTATE_UINT32(dc_panel_control, SM501State),
+        VMSTATE_UINT32(dc_panel_panning_control, SM501State),
+        VMSTATE_UINT32(dc_panel_fb_addr, SM501State),
+        VMSTATE_UINT32(dc_panel_fb_offset, SM501State),
+        VMSTATE_UINT32(dc_panel_fb_width, SM501State),
+        VMSTATE_UINT32(dc_panel_fb_height, SM501State),
+        VMSTATE_UINT32(dc_panel_tl_location, SM501State),
+        VMSTATE_UINT32(dc_panel_br_location, SM501State),
+        VMSTATE_UINT32(dc_panel_h_total, SM501State),
+        VMSTATE_UINT32(dc_panel_h_sync, SM501State),
+        VMSTATE_UINT32(dc_panel_v_total, SM501State),
+        VMSTATE_UINT32(dc_panel_v_sync, SM501State),
+        VMSTATE_UINT32(dc_panel_hwc_addr, SM501State),
+        VMSTATE_UINT32(dc_panel_hwc_location, SM501State),
+        VMSTATE_UINT32(dc_panel_hwc_color_1_2, SM501State),
+        VMSTATE_UINT32(dc_panel_hwc_color_3, SM501State),
+        VMSTATE_UINT32(dc_video_control, SM501State),
+        VMSTATE_UINT32(dc_crt_control, SM501State),
+        VMSTATE_UINT32(dc_crt_fb_addr, SM501State),
+        VMSTATE_UINT32(dc_crt_fb_offset, SM501State),
+        VMSTATE_UINT32(dc_crt_h_total, SM501State),
+        VMSTATE_UINT32(dc_crt_h_sync, SM501State),
+        VMSTATE_UINT32(dc_crt_v_total, SM501State),
+        VMSTATE_UINT32(dc_crt_v_sync, SM501State),
+        VMSTATE_UINT32(dc_crt_hwc_addr, SM501State),
+        VMSTATE_UINT32(dc_crt_hwc_location, SM501State),
+        VMSTATE_UINT32(dc_crt_hwc_color_1_2, SM501State),
+        VMSTATE_UINT32(dc_crt_hwc_color_3, SM501State),
+        VMSTATE_UINT32(twoD_source, SM501State),
+        VMSTATE_UINT32(twoD_destination, SM501State),
+        VMSTATE_UINT32(twoD_dimension, SM501State),
+        VMSTATE_UINT32(twoD_control, SM501State),
+        VMSTATE_UINT32(twoD_pitch, SM501State),
+        VMSTATE_UINT32(twoD_foreground, SM501State),
+        VMSTATE_UINT32(twoD_background, SM501State),
+        VMSTATE_UINT32(twoD_stretch, SM501State),
+        VMSTATE_UINT32(twoD_color_compare, SM501State),
+        VMSTATE_UINT32(twoD_color_compare_mask, SM501State),
+        VMSTATE_UINT32(twoD_mask, SM501State),
+        VMSTATE_UINT32(twoD_clip_tl, SM501State),
+        VMSTATE_UINT32(twoD_clip_br, SM501State),
+        VMSTATE_UINT32(twoD_mono_pattern_low, SM501State),
+        VMSTATE_UINT32(twoD_mono_pattern_high, SM501State),
+        VMSTATE_UINT32(twoD_window_width, SM501State),
+        VMSTATE_UINT32(twoD_source_base, SM501State),
+        VMSTATE_UINT32(twoD_destination_base, SM501State),
+        VMSTATE_UINT32(twoD_alpha, SM501State),
+        VMSTATE_UINT32(twoD_wrap, SM501State),
+        VMSTATE_END_OF_LIST()
+     }
+};
+
 #define TYPE_SYSBUS_SM501 "sysbus-sm501"
 #define SYSBUS_SM501(obj) \
     OBJECT_CHECK(SM501SysBusState, (obj), TYPE_SYSBUS_SM501)
@@ -1677,6 +1750,17 @@ static void sm501_reset_sysbus(DeviceState *dev)
     sm501_reset(&s->state);
 }
 
+static const VMStateDescription vmstate_sm501_sysbus = {
+    .name = TYPE_SYSBUS_SM501,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, SM501SysBusState, 1,
+                       vmstate_sm501_state, SM501State),
+        VMSTATE_END_OF_LIST()
+     }
+};
+
 static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1686,6 +1770,7 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
     dc->desc = "SM501 Multimedia Companion";
     dc->props = sm501_sysbus_properties;
     dc->reset = sm501_reset_sysbus;
+    dc->vmsd = &vmstate_sm501_sysbus;
     /* Note: pointer property "chr-state" may remain null, thus
      * no need for dc->cannot_instantiate_with_device_add_yet = true;
      */
@@ -1738,6 +1823,18 @@ static void sm501_reset_pci(DeviceState *dev)
     s->state.misc_control |= 1;
 }
 
+static const VMStateDescription vmstate_sm501_pci = {
+    .name = TYPE_PCI_SM501,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, SM501PCIState),
+        VMSTATE_STRUCT(state, SM501PCIState, 1,
+                       vmstate_sm501_state, SM501State),
+        VMSTATE_END_OF_LIST()
+     }
+};
+
 static void sm501_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1752,6 +1849,7 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
     dc->props = sm501_pci_properties;
     dc->reset = sm501_reset_pci;
     dc->hotpluggable = false;
+    dc->vmsd = &vmstate_sm501_pci;
 }
 
 static const TypeInfo sm501_pci_info = {
-- 
2.7.4


