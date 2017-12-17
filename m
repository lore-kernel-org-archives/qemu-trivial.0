Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQm38-0005sz-2e
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 22:25:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQm35-0005py-2C
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:25:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQm33-000179-Tl
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 22:25:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQm2y-00013a-UE; Sun, 17 Dec 2017 22:24:57 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9340940FB0;
	Mon, 18 Dec 2017 06:24:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2FA1BD51;
	Mon, 18 Dec 2017 00:25:49 +0300 (MSK)
Received: (nullmailer pid 31002 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:28:03 +0300
Message-Id: <e03e0a8c0fcb59b032fb93dd90662201a38fc09a.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 58/61] hw/misc/pvpanic: extract public API
 from i386/pc to "hw/misc/pvpanic.h"
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
X-List-Received-Date: Mon, 18 Dec 2017 03:25:04 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

and remove the old i386/pc dependency.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i386/acpi-build.c      |  2 +-
 hw/misc/pvpanic.c         |  9 ++++-----
 include/hw/i386/pc.h      |  3 ---
 include/hw/misc/pvpanic.h | 21 +++++++++++++++++++++
 4 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/misc/pvpanic.h

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 73519ab3ac..63bbc610eb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -28,8 +28,8 @@
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
 #include "qom/cpu.h"
-#include "hw/i386/pc.h"
 #include "target/i386/cpu.h"
+#include "hw/misc/pvpanic.h"
 #include "hw/timer/hpet.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 3a0e4ba828..b26250dec9 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -17,7 +17,7 @@
 #include "qemu/log.h"
=20
 #include "hw/nvram/fw_cfg.h"
-#include "hw/i386/pc.h"
+#include "hw/misc/pvpanic.h"
=20
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
@@ -25,9 +25,8 @@
 /* The pv event value */
 #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
=20
-#define TYPE_ISA_PVPANIC_DEVICE    "pvpanic"
 #define ISA_PVPANIC_DEVICE(obj)    \
-    OBJECT_CHECK(PVPanicState, (obj), TYPE_ISA_PVPANIC_DEVICE)
+    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
=20
 static void handle_event(int event)
 {
@@ -104,7 +103,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, E=
rror **errp)
=20
 uint16_t pvpanic_port(void)
 {
-    Object *o =3D object_resolve_path_type("", TYPE_ISA_PVPANIC_DEVICE, =
NULL);
+    Object *o =3D object_resolve_path_type("", TYPE_PVPANIC, NULL);
     if (!o) {
         return 0;
     }
@@ -126,7 +125,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass=
, void *data)
 }
=20
 static TypeInfo pvpanic_isa_info =3D {
-    .name          =3D TYPE_ISA_PVPANIC_DEVICE,
+    .name          =3D TYPE_PVPANIC,
     .parent        =3D TYPE_ISA_DEVICE,
     .instance_size =3D sizeof(PVPanicState),
     .instance_init =3D pvpanic_isa_initfn,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ab84e31cce..6f77eb0665 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -306,9 +306,6 @@ int piix4_init(PCIBus *bus, ISABus **isa_bus, int dev=
fn);
 void pc_system_firmware_init(MemoryRegion *rom_memory,
                              bool isapc_ram_fw);
=20
-/* pvpanic.c */
-uint16_t pvpanic_port(void);
-
 /* acpi-build.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
new file mode 100644
index 0000000000..36a54e270c
--- /dev/null
+++ b/include/hw/misc/pvpanic.h
@@ -0,0 +1,21 @@
+/*
+ * QEMU simulated pvpanic device.
+ *
+ * Copyright Fujitsu, Corp. 2013
+ *
+ * Authors:
+ *     Wen Congyang <wency@cn.fujitsu.com>
+ *     Hu Tao <hutao@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef HW_MISC_PVPANIC_H
+#define HW_MISC_PVPANIC_H
+
+#define TYPE_PVPANIC "pvpanic"
+
+uint16_t pvpanic_port(void);
+
+#endif
--=20
2.11.0


