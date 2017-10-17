Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1N-00034y-Hi
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1K-00031S-SK
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1J-0003t7-Pd
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:10 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:49715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1H-0003rq-8P; Tue, 17 Oct 2017 12:47:07 -0400
Received: by mail-qk0-x244.google.com with SMTP id q83so2841160qke.6;
	Tue, 17 Oct 2017 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2I+aFjs0l4N/i2xRW8EjrNoOJqnDXO7wET7r+c9yca8=;
	b=S1Tn33p/+kCe0EtUeB0RvAR04qPi4L01J148UH1oth9VQeHpv8SVpE8gExFsmZ3VqG
	/zUVnuHuDOLrWx0oJeaD0qtLuHcQYWEu/9M//z2WkpSdc1774tFjOKTzaFMh+gndGM0O
	PglMDTy8olRlq0Qh1XhVPrqwP+C/aakK9OOre+PPPisn0Do6yZpKw1nkSL498RDC/ySn
	iqupnI2pxZa+SszzTvtx71i6OhnM1pAP6ovaPEdZGsVmTcf+7ajS/w/8iN+XRBP3qth7
	TOdoMOXcXHxR8vB5GREixJhw672mjjH6Wg4LUr5h+knbdOEARIO1YimwA/6EVWnUBBGJ
	5cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2I+aFjs0l4N/i2xRW8EjrNoOJqnDXO7wET7r+c9yca8=;
	b=CiRkxmuSdr9hOz8RrjD09MCTScAZ5vUw9KHAXIiGIjxRZ9ZFvORgLUi0m1bNUFwUPI
	HhEd8j5QU2PwtTGnlx+/mP8C/5q34l/KDoU5l/nk0SkWB2ldna/hWYCHG9ypNjAa3S8Y
	yF9KL0WGR61Mi/x7qgFBt0EJdOPWWZF5zBv8mxmbT3SlnkHcXaiwNWv1gxUxR8N//2va
	jswWnMNFgGp6bumTtZ6N1hy58MAwr75bIMAw2Y1MYlcpxxcyYwMzF20jfrE4dvXSbRO7
	/77s56tEnyx+K9uU1haExijitj72xQcH0iFdu9tFYy5R1P9ounzGrSlHy52s44wpbwyY
	dQHw==
X-Gm-Message-State: AMCzsaVn1iXohFt61/7xGdeElFPZDHjQiPKe9xXPPL95ELcul4rA5r2y
	ERJhzM81P82oJ9EQDEmtrZo=
X-Google-Smtp-Source: ABhQp+Q8AlpAy7D+goAQG42nleNO0rjJ1H5S72S99YrmuxaYNtSLejvUL8yt3AZHx+8vOtZUuqIhig==
X-Received: by 10.55.77.67 with SMTP id a64mr6825425qkb.172.1508258826602;
	Tue, 17 Oct 2017 09:47:06 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:47:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:23 -0300
Message-Id: <20171017164426.25277-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 39/42] hw/misc/pvpanic: extract public API
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:12 -0000

and remove the old i386/pc dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
no MAINTAINERS entry, does this belong to "PC Chipset"?

 include/hw/i386/pc.h      |  3 ---
 include/hw/misc/pvpanic.h | 21 +++++++++++++++++++++
 hw/i386/acpi-build.c      |  2 +-
 hw/misc/pvpanic.c         |  9 ++++-----
 4 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/misc/pvpanic.h

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 846d37b9fb..1a74ccd73b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -306,9 +306,6 @@ int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
 void pc_system_firmware_init(MemoryRegion *rom_memory,
                              bool isapc_ram_fw);
 
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
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
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
 
 #include "hw/nvram/fw_cfg.h"
-#include "hw/i386/pc.h"
+#include "hw/misc/pvpanic.h"
 
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
@@ -25,9 +25,8 @@
 /* The pv event value */
 #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
 
-#define TYPE_ISA_PVPANIC_DEVICE    "pvpanic"
 #define ISA_PVPANIC_DEVICE(obj)    \
-    OBJECT_CHECK(PVPanicState, (obj), TYPE_ISA_PVPANIC_DEVICE)
+    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
 
 static void handle_event(int event)
 {
@@ -104,7 +103,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 uint16_t pvpanic_port(void)
 {
-    Object *o = object_resolve_path_type("", TYPE_ISA_PVPANIC_DEVICE, NULL);
+    Object *o = object_resolve_path_type("", TYPE_PVPANIC, NULL);
     if (!o) {
         return 0;
     }
@@ -126,7 +125,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
 }
 
 static TypeInfo pvpanic_isa_info = {
-    .name          = TYPE_ISA_PVPANIC_DEVICE,
+    .name          = TYPE_PVPANIC,
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(PVPanicState),
     .instance_init = pvpanic_isa_initfn,
-- 
2.15.0.rc0


