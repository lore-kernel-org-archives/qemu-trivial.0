Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6hmW-0004Sx-QC
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 14:49:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e6hmU-0004RK-68
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 14:48:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e6hmS-00030U-PN
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 14:48:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e6hm9-0002u3-Jp; Mon, 23 Oct 2017 14:48:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE85D6A7D2;
	Mon, 23 Oct 2017 18:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AE85D6A7D2
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 702365D96F;
	Mon, 23 Oct 2017 18:48:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 20:48:29 +0200
Message-Id: <1508784509-29377-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 23 Oct 2017 18:48:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/ide/ahci: Move allwinner code into a
 separate file
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
X-List-Received-Date: Mon, 23 Oct 2017 18:49:00 -0000

The allwinner code is only needed for the allwinner board (for which
we also have a separate CONFIG_ALLWINNER_A10 config switch), so it
does not make sense that we compile this for all the other boards
that need AHCI, too. Let's move it to a separate file that is only
compiled when CONFIG_ALLWINNER_A10 is set.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/Makefile.objs    |   1 +
 hw/ide/ahci-allwinner.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/ide/ahci.c           |  95 ------------------------------------
 3 files changed, 128 insertions(+), 95 deletions(-)
 create mode 100644 hw/ide/ahci-allwinner.c

diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index 729e9bd..f0edca3 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -10,3 +10,4 @@ common-obj-$(CONFIG_IDE_VIA) += via.o
 common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
 common-obj-$(CONFIG_AHCI) += ahci.o
 common-obj-$(CONFIG_AHCI) += ich.o
+common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
new file mode 100644
index 0000000..c3f1604
--- /dev/null
+++ b/hw/ide/ahci-allwinner.c
@@ -0,0 +1,127 @@
+/*
+ * QEMU Allwinner AHCI Emulation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "qemu/error-report.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/dma.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/ahci_internal.h"
+
+#include "trace.h"
+
+#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
+
+static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
+                                        unsigned size)
+{
+    AllwinnerAHCIState *a = opaque;
+    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
+    uint64_t val = a->regs[addr / 4];
+
+    switch (addr / 4) {
+    case ALLWINNER_AHCI_PHYCS0R:
+        val |= 0x2 << 28;
+        break;
+    case ALLWINNER_AHCI_PHYCS2R:
+        val &= ~(0x1 << 24);
+        break;
+    }
+    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
+    return  val;
+}
+
+static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
+                                     uint64_t val, unsigned size)
+{
+    AllwinnerAHCIState *a = opaque;
+    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
+
+    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
+    a->regs[addr / 4] = val;
+}
+
+static const MemoryRegionOps allwinner_ahci_mem_ops = {
+    .read = allwinner_ahci_mem_read,
+    .write = allwinner_ahci_mem_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void allwinner_ahci_init(Object *obj)
+{
+    SysbusAHCIState *s = SYSBUS_AHCI(obj);
+    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
+
+    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
+                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
+    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
+                                &a->mmio);
+}
+
+static const VMStateDescription vmstate_allwinner_ahci = {
+    .name = "allwinner-ahci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
+                             ALLWINNER_AHCI_MMIO_SIZE / 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_allwinner_ahci;
+}
+
+static const TypeInfo allwinner_ahci_info = {
+    .name          = TYPE_ALLWINNER_AHCI,
+    .parent        = TYPE_SYSBUS_AHCI,
+    .instance_size = sizeof(AllwinnerAHCIState),
+    .instance_init = allwinner_ahci_init,
+    .class_init    = allwinner_ahci_class_init,
+};
+
+static void sysbus_ahci_register_types(void)
+{
+    type_register_static(&allwinner_ahci_info);
+}
+
+type_init(sysbus_ahci_register_types)
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 32d1296..373311f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1737,104 +1737,9 @@ static const TypeInfo sysbus_ahci_info = {
     .class_init    = sysbus_ahci_class_init,
 };
 
-#define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTSR     ((0xac - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_BISTDECR   ((0xb0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_DIAGNR0    ((0xb4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_DIAGNR1    ((0xb8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_OOBR       ((0xbc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS0R    ((0xc0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS1R    ((0xc4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PHYCS2R    ((0xc8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_TIMER1MS   ((0xe0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_GPARAM1R   ((0xe8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_GPARAM2R   ((0xec - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_PPARAMR    ((0xf0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_TESTR      ((0xf4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_VERSIONR   ((0xf8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_IDR        ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-#define ALLWINNER_AHCI_RWCR       ((0xfc - ALLWINNER_AHCI_MMIO_OFF) / 4)
-
-static uint64_t allwinner_ahci_mem_read(void *opaque, hwaddr addr,
-                                        unsigned size)
-{
-    AllwinnerAHCIState *a = opaque;
-    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
-    uint64_t val = a->regs[addr/4];
-
-    switch (addr / 4) {
-    case ALLWINNER_AHCI_PHYCS0R:
-        val |= 0x2 << 28;
-        break;
-    case ALLWINNER_AHCI_PHYCS2R:
-        val &= ~(0x1 << 24);
-        break;
-    }
-    trace_allwinner_ahci_mem_read(s, a, addr, val, size);
-    return  val;
-}
-
-static void allwinner_ahci_mem_write(void *opaque, hwaddr addr,
-                                     uint64_t val, unsigned size)
-{
-    AllwinnerAHCIState *a = opaque;
-    AHCIState *s = &(SYSBUS_AHCI(a)->ahci);
-
-    trace_allwinner_ahci_mem_write(s, a, addr, val, size);
-    a->regs[addr/4] = val;
-}
-
-static const MemoryRegionOps allwinner_ahci_mem_ops = {
-    .read = allwinner_ahci_mem_read,
-    .write = allwinner_ahci_mem_write,
-    .valid.min_access_size = 4,
-    .valid.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
-static void allwinner_ahci_init(Object *obj)
-{
-    SysbusAHCIState *s = SYSBUS_AHCI(obj);
-    AllwinnerAHCIState *a = ALLWINNER_AHCI(obj);
-
-    memory_region_init_io(&a->mmio, OBJECT(obj), &allwinner_ahci_mem_ops, a,
-                          "allwinner-ahci", ALLWINNER_AHCI_MMIO_SIZE);
-    memory_region_add_subregion(&s->ahci.mem, ALLWINNER_AHCI_MMIO_OFF,
-                                &a->mmio);
-}
-
-static const VMStateDescription vmstate_allwinner_ahci = {
-    .name = "allwinner-ahci",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, AllwinnerAHCIState,
-                             ALLWINNER_AHCI_MMIO_SIZE/4),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void allwinner_ahci_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &vmstate_allwinner_ahci;
-}
-
-static const TypeInfo allwinner_ahci_info = {
-    .name          = TYPE_ALLWINNER_AHCI,
-    .parent        = TYPE_SYSBUS_AHCI,
-    .instance_size = sizeof(AllwinnerAHCIState),
-    .instance_init = allwinner_ahci_init,
-    .class_init    = allwinner_ahci_class_init,
-};
-
 static void sysbus_ahci_register_types(void)
 {
     type_register_static(&sysbus_ahci_info);
-    type_register_static(&allwinner_ahci_info);
 }
 
 type_init(sysbus_ahci_register_types)
-- 
1.8.3.1


