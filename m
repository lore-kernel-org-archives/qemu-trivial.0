Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAaFA-0006th-9n
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 08:39:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gAaF8-0006sE-MK
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gAaF7-0003uX-VC
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:39:06 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gAaF3-0003ri-PG; Thu, 11 Oct 2018 08:39:01 -0400
Received: by mail-pf1-x442.google.com with SMTP id j23-v6so4360387pfi.4;
	Thu, 11 Oct 2018 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tIgbGdT1Js69FSqrBpKKCdcfOhzLf5Ok2XTZqJxW29k=;
	b=Oc50QXSXA1PR3ATGYGAXt+fIW3mnVZ64ZQTAcizZlzeh9F1ZUKvsDYC0saUNIEqZfm
	tQaJnlNWfdYidz5S2oyP/2/aIsnlKg9Zdz0biGUdCmBgEOnFesWpytSEsSyt/SoUQHCF
	mDs+qOEg4BsCvpoxin5rA64obS1eMYxO5KjvLR2iVyTtP5bNYSxEbLE4lQ9MluthSVDF
	FaGkOcRtPqYkjAkjAa1/sLqhhpeUpvPa47vN9GZNieoJct4yI6ryO9sEabSp1aHHfNCZ
	RREQgiYvcc7e3zIVFO6OKw9CqY/EFILVxrQqcDANt+DifiFCAre86oJyADpcOVwRt557
	mnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tIgbGdT1Js69FSqrBpKKCdcfOhzLf5Ok2XTZqJxW29k=;
	b=YcS4b4gN0/vItf0JrahY+Ditcdn3p7P+rQS2RKwY5cvH0VfzuP1QGZWdy5v+EF6iHz
	2MM+GrDhIgoi0PXr4MBjpIrjMoG31YU3wQSnYoYs2gvZGVlUoYjTm64hJkNtt7jjIU45
	3Lb+2aaSVceaYu4qMCk4KnPtzHF6cFOLX99gp0NSSBVStABhV1zt/mo/Ybj7ouXZhZgt
	xsSnxBK+vEgEHT7D4tVb5n0lmtdam8rcWkn15ohaZIqzq3vuUhNM/sIe/ejcBNpzQdJ0
	yeyBGGv4/twehbBrMmDkhMCr0XxZV0XypjVwSAksyKbo23g9NwbtPmGYcBeoPxhRgI6B
	/MMQ==
X-Gm-Message-State: ABuFfoiPqzstMzIhxhjrq0K2Q/+o45mKgf6SAeFFflDiwUDQeQubKUBT
	gQg2wHkckVHLy4NGOJsxUdA=
X-Google-Smtp-Source: ACcGV61Qm3vkI9I/6Wyi2s4MFqEo1IINLj4K1xHs0ZdJFNhz6vy1/zLhBkMdjtptj17on0UNcIqwSw==
X-Received: by 2002:a62:4799:: with SMTP id
	p25-v6mr1395221pfi.197.1539261540941; 
	Thu, 11 Oct 2018 05:39:00 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([103.65.40.100])
	by smtp.gmail.com with ESMTPSA id
	h6-v6sm30349539pfc.6.2018.10.11.05.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 05:39:00 -0700 (PDT)
From: Li Qiang <liq3ea@gmail.com>
To: mst@redhat.com,
	marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Thu, 11 Oct 2018 05:38:54 -0700
Message-Id: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-trivial] [PATCH] piix: use TYPE_FOO constants than string
 constats
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
X-List-Received-Date: Thu, 11 Oct 2018 12:39:07 -0000

Make them more QOMConventional.
Cc:qemu-trivial@nongnu.org 

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 hw/pci-host/piix.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 230d5d2ea3..5881e63364 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -95,6 +95,9 @@ typedef struct PIIX3State {
 #define I440FX_PCI_DEVICE(obj) \
     OBJECT_CHECK(PCII440FXState, (obj), TYPE_I440FX_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
+
 struct PCII440FXState {
     /*< private >*/
     PCIDevice parent_obj;
@@ -413,13 +416,13 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
      * These additional routes can be discovered through ACPI. */
     if (xen_enabled()) {
         PCIDevice *pci_dev = pci_create_simple_multifunction(b,
-                             -1, true, "PIIX3-xen");
+                             -1, true, TYPE_PIIX3_XEN_DEVICE);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         pci_bus_irqs(b, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                 piix3, XEN_PIIX_NUM_PIRQS);
     } else {
         PCIDevice *pci_dev = pci_create_simple_multifunction(b,
-                             -1, true, "PIIX3");
+                             -1, true, TYPE_PIIX3_DEVICE);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         pci_bus_irqs(b, piix3_set_irq, pci_slot_get_pirq, piix3,
                 PIIX_NUM_PIRQS);
@@ -737,7 +740,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix3_info = {
-    .name          = "PIIX3",
+    .name          = TYPE_PIIX3_DEVICE,
     .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_class_init,
 };
@@ -750,7 +753,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 };
 
 static const TypeInfo piix3_xen_info = {
-    .name          = "PIIX3-xen",
+    .name          = TYPE_PIIX3_XEN_DEVICE,
     .parent        = TYPE_PIIX3_PCI_DEVICE,
     .class_init    = piix3_xen_class_init,
 };
-- 
2.11.0


