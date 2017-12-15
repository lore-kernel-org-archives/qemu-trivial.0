Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgk7-0003kW-Os
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk5-0003ho-F1
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk4-0006tn-CZ
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:57 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk0-0006nq-Eo; Thu, 14 Dec 2017 22:32:52 -0500
Received: by mail-qk0-x244.google.com with SMTP id 8so8864815qkj.3;
	Thu, 14 Dec 2017 19:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RWKrlr+C5nE6PQK6TbKGalsIks63vUtUV2oTs2l/1Dc=;
	b=VR2LgA1jOe2glfFHsDrATm8ZyI8Tgp8TXTmrLnRlT1eav2+AqsKf4/3lhpPs+16d9b
	p6YcY0eZ8NtiDc1fWDRdX27w2ms/0zfacJI22wk8PE1iVvq6lNqotfgLd3Bf8grGMe+3
	+RyRDMnHtmYFiEBaWM359W66q9EPnv1wK86xovXnl6M+Ux7WX5/UVtKx/CXUZJJjPm6A
	b/cJm40nluvjvyYelXgeEq65LmopfvXA3/xDBioOTNadbIHVuQb/GaZ2Q73etiaSKabu
	zb873t3htPDm1blYAYDSF1OPNlGqe+X9+fF0VXgdTegw5IsAryDvBQKOZWuz73XYGcjq
	MB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RWKrlr+C5nE6PQK6TbKGalsIks63vUtUV2oTs2l/1Dc=;
	b=KdFhTHUeEratZGH6eKyawi+ekDcL/74CAQf7eVjM9aYItWTDwWHRxO4n9FzPb16f4q
	3Quxdgf1Xh/h16GCF6njUtfdkdrEb3cOIcMKB+RyJg+P+UahnGHdrTb83rXHZxjSSGXr
	fCbyqBJPojclwEnMrg8CO2aOI7gRu8ax0qdrbc+QG7Tfe3F1L8QakAh2pcHgNlaHWEaa
	D5TPlb5VThCxSa4AOhxd80dmY9iPacrqpZJ2kxI32+rFMAB6Q53u9t+yqNelGhiI6VrI
	a9mx3X7JPDjV8EUnZLeERnPd5W4GaMSixapMMylPIlPIO9szTPLQy5dFuXih0yVF+SU7
	x0Rw==
X-Gm-Message-State: AKGB3mLkqJpYQn4MjV5or7+GP8ODATpKfXlEyLWR2NojZBY5W0jJ/Kbn
	+lwGVTYdLWyPQgrI91h73lk=
X-Google-Smtp-Source: ACJfBosaibVVXuG1Kld+4nkYusrUlcgKAnURTGkRQ9/FzxVQRl2YMMekBnY4W1psWRnx8vV0KnaFPw==
X-Received: by 10.55.23.24 with SMTP id i24mr19537608qkh.181.1513308771909;
	Thu, 14 Dec 2017 19:32:51 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:30:11 -0300
Message-Id: <20171215033015.738-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 39/43] hw/misc/pvpanic: extract public API
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:58 -0000

and remove the old i386/pc dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i386/pc.h      |  3 ---
 include/hw/misc/pvpanic.h | 21 +++++++++++++++++++++
 hw/i386/acpi-build.c      |  2 +-
 hw/misc/pvpanic.c         |  9 ++++-----
 4 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/misc/pvpanic.h

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ab84e31cce..6f77eb0665 100644
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
2.15.1


