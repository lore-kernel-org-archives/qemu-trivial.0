Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLCpy-0001pg-Fh
	for mharc-qemu-trivial@gnu.org; Tue, 22 May 2018 15:20:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLCpv-0001nj-73
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fLCpt-0003ha-S4
	for qemu-trivial@nongnu.org; Tue, 22 May 2018 15:20:43 -0400
Received: from mail-pl0-x233.google.com ([2607:f8b0:400e:c01::233]:36560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fLCpo-0003g3-RP; Tue, 22 May 2018 15:20:37 -0400
Received: by mail-pl0-x233.google.com with SMTP id v24-v6so11473201plo.3;
	Tue, 22 May 2018 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=NJmDF8WBf6oxf+CLPg8WXQzAYpEwZRvwXl/vpeGQkkQ=;
	b=JJElgu+UHajEOmbazoFA9IatlvVnDoNVU6tRC1nhv/yaiJjqlAD0mXJEMB/UWZvcZH
	tVoqjp533gtGHSN+aUb3cs/PrJr7XG3V9Y8OnWUECUwQJHTX39a5PM8YaOCEjKyPd0Gn
	aLhztikLHKQhQHuXCmX5JWjRcjh3L9Nk/D2Y6ferzrUQZtOp4typAz5TlA2ujlb2tnTD
	TRwnrrV/dxH4iqOo6eYCotWU5NbIYHKn/ddV9iN4EY5ueqw0D+19MMQUKV7tNEArNJvV
	trgFayon4n8TjPmOMlnlRBRbeZREtbI0ZYCgfMLUMYCS9Zb5TfBRyQ7qh9wF7m/RvFRr
	gPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=NJmDF8WBf6oxf+CLPg8WXQzAYpEwZRvwXl/vpeGQkkQ=;
	b=EJPqukF+dFAX3NmzacIas+gxj6urHbhemWoZYt3rM2FxSmHQ6mVGeitYHT97DR7+AQ
	tucPl7afB4SD/dWbU+A/skGuAlVrDhFunPAJ+bFHe1XIKwxhMHaQ98HsFLb4Wcx9qMhr
	F/nlGgXcQidCxMatVrBCkN2jbFsKrYPuPSS+je480byplVKDnEOfWlyQtKhdXtAMvGcF
	KLS7aQXS5l2dKpfYradbCshCEdMNX2ecdTCZTDs6QqBVbxlRypJhHDmjuZU9jh5+qok9
	/AgW9Oi39pbcYuUskAYSglIrsLIz6et0cNXhLZPD/78HsS9PLgfWGnlKMi+W277uFyk5
	xcTQ==
X-Gm-Message-State: ALKqPwcL+hPWhcqVUDPhqh+9FWQcxbMRV5bqVxXDsqw1Jk6ZP4zf6U6S
	RYHoum21rX93WLnETAizRCmSPXE+
X-Google-Smtp-Source: AB8JxZrCOSa/k1CJ5/SxJcFABOUNDo7NfR7jhjEloSvm403goWhV+g2lHqMog9ZdrgSG1DOadotIWQ==
X-Received: by 2002:a17:902:74c7:: with SMTP id
	f7-v6mr55517plt.385.1527016835614; 
	Tue, 22 May 2018 12:20:35 -0700 (PDT)
Received: from donizetti.event.priv ([72.28.93.232])
	by smtp.gmail.com with ESMTPSA id
	l90-v6sm29516940pfb.149.2018.05.22.12.20.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 May 2018 12:20:34 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	david@redhat.com,
	qemu-trivial@nongnu.org
Date: Tue, 22 May 2018 21:20:34 +0200
Message-Id: <20180522192034.13318-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::233
Subject: [Qemu-trivial] [PATCH] tcg: remove softfloat from --disable-tcg
 builds
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
X-List-Received-Date: Tue, 22 May 2018 19:20:44 -0000

Even though the presence of softfloat does not cause --disable-tcg builds to fail,
it is the single largest .o file in them.  Remove it, since TCG is the only client.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.target          |   2 +-
 hw/i386/x86-iommu-stub.c | 132 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/x86-iommu-stub.c

diff --git a/Makefile.target b/Makefile.target
index d0ec77a307..dad2cf8778 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -97,7 +97,7 @@ obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
 obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
 obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
 obj-$(CONFIG_TCG_INTERPRETER) += disas/tci.o
-obj-y += fpu/softfloat.o
+obj-$(CONFIG_TCG) += fpu/softfloat.o
 obj-y += target/$(TARGET_BASE_ARCH)/
 obj-y += disas.o
 obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o
diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
new file mode 100644
index 0000000000..8a01a2dd25
--- /dev/null
+++ b/hw/i386/x86-iommu-stub.c
@@ -0,0 +1,132 @@
+/*
+ * QEMU emulation of common X86 IOMMU
+ *
+ * Copyright (C) 2016 Peter Xu, Red Hat <peterx@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/boards.h"
+#include "hw/i386/x86-iommu.h"
+#include "hw/i386/pc.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+
+void x86_iommu_iec_register_notifier(X86IOMMUState *iommu,
+                                     iec_notify_fn fn, void *data)
+{
+    IEC_Notifier *notifier = g_new0(IEC_Notifier, 1);
+
+    notifier->iec_notify = fn;
+    notifier->private = data;
+
+    QLIST_INSERT_HEAD(&iommu->iec_notifiers, notifier, list);
+}
+
+void x86_iommu_iec_notify_all(X86IOMMUState *iommu, bool global,
+                              uint32_t index, uint32_t mask)
+{
+    IEC_Notifier *notifier;
+
+    trace_x86_iommu_iec_notify(global, index, mask);
+
+    QLIST_FOREACH(notifier, &iommu->iec_notifiers, list) {
+        if (notifier->iec_notify) {
+            notifier->iec_notify(notifier->private, global,
+                                 index, mask);
+        }
+    }
+}
+
+/* Default X86 IOMMU device */
+static X86IOMMUState *x86_iommu_default = NULL;
+
+static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
+{
+    assert(x86_iommu);
+
+    if (x86_iommu_default) {
+        error_report("QEMU does not support multiple vIOMMUs "
+                     "for x86 yet.");
+        exit(1);
+    }
+
+    x86_iommu_default = x86_iommu;
+}
+
+X86IOMMUState *x86_iommu_get_default(void)
+{
+    return x86_iommu_default;
+}
+
+IommuType x86_iommu_get_type(void)
+{
+    return x86_iommu_default->type;
+}
+
+static void x86_iommu_realize(DeviceState *dev, Error **errp)
+{
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
+    X86IOMMUClass *x86_class = X86_IOMMU_GET_CLASS(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    PCMachineState *pcms =
+        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
+    QLIST_INIT(&x86_iommu->iec_notifiers);
+
+    if (!pcms || !pcms->bus) {
+        error_setg(errp, "Machine-type '%s' not supported by IOMMU",
+                   mc->name);
+        return;
+    }
+
+    if (x86_class->realize) {
+        x86_class->realize(dev, errp);
+    }
+
+    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
+}
+
+static Property x86_iommu_properties[] = {
+    DEFINE_PROP_BOOL("intremap", X86IOMMUState, intr_supported, false),
+    DEFINE_PROP_BOOL("device-iotlb", X86IOMMUState, dt_supported, false),
+    DEFINE_PROP_BOOL("pt", X86IOMMUState, pt_supported, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void x86_iommu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = x86_iommu_realize;
+    dc->props = x86_iommu_properties;
+}
+
+static const TypeInfo x86_iommu_info = {
+    .name          = TYPE_X86_IOMMU_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(X86IOMMUState),
+    .class_init    = x86_iommu_class_init,
+    .class_size    = sizeof(X86IOMMUClass),
+    .abstract      = true,
+};
+
+static void x86_iommu_register_types(void)
+{
+    type_register_static(&x86_iommu_info);
+}
+
+type_init(x86_iommu_register_types)
-- 
2.17.0


