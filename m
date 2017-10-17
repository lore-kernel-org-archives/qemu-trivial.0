Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWV-0007Kj-QR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWS-0007Gr-OU
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWR-0004yk-Bf
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:16 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:54494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWK-0004ug-K4; Mon, 16 Oct 2017 20:14:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id n5so13694qke.11;
	Mon, 16 Oct 2017 17:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V39AFlm93MIf+4sVJAz/gcgoqp6oYZva96tOLOC2P/4=;
	b=ZtydCnakAol+qC6at4TIDN5TWN6pvpAWFs0aEZUnUq8XFAf5lprJBMFwf3yILx0ujc
	1TYp5IabMM1KwOHOpOGUVGL8xeGbfr6vgNkL1O4aJU1dWUUwe1sPYTxGFE55uK6Pms8q
	118MmNBlniOtOAZm4u+2KXabAlhAMPVNM08gVpYSNLq0CBXogywUJGc8GuHlmhXDqIk0
	fEFFHZVfrvjTWWx7r9VFSBRP4OPPbZI6QQo9F5pZTMuyBHy01H0S3T54oYCXyCyb/bGV
	W7hoGff18vV7b7AgRw1ObtAUaJ1Wuigk0EuO8OWsfAmcCWW9ETG6IhSV9h7J8CWksBaE
	PDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=V39AFlm93MIf+4sVJAz/gcgoqp6oYZva96tOLOC2P/4=;
	b=pC9/Lg4/pJ+ZWhwBElA0JKPpcEUoS3GBLzBE8eqMo8j6URzGSuEXGqtVeT++4+xN/Z
	0o6oioXFpVvDrLZBU3eL0y1gBvTjs4JwPrYHt6xF4fnhkCZiKPAjuzFS9alEB2Yb7d4P
	ik1aUfahoIrEKYHTaAy+G79sLF7IlGULTAhVc2hW53Y7QnUQ83fog6cF1Fvq7VgsTDcA
	L9sWUrgsfAeYP2nC1M5psyp1Ks5G9DYE2fvshn15eRVaqDf5Ck5Qpa+thcrqtD0M2lPV
	gjSE0kfxM9dFSn171NM2SXQYytPPY0B2GnJ/UQuoKU93k4PPhJf4M3W4jsgvms0Tjx71
	n4GA==
X-Gm-Message-State: AMCzsaWdCTtdyvlbfLmNzHanZ1rR2MrvDzUnaGbHfkXDrCV78z5/gcy/
	pFjk0Si0zsdLbIai6AUXoGY=
X-Google-Smtp-Source: AOwi7QACmGEMxEwMpQgwLITlTbVFKb5VWXnYTQpsLYXEltf8BbWTIxTF7DELLrKJRbMDG9VpvqaAZA==
X-Received: by 10.55.33.203 with SMTP id f72mr16694142qki.176.1508199248118;
	Mon, 16 Oct 2017 17:14:08 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:03 -0300
Message-Id: <20171017001209.32276-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 33/39] hw/net/ne2000: extract ne2k-isa
 code from i386/pc to ne2000-isa.c
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:18 -0000

- add "hw/net/ne2000-isa.h"
- remove the old i386 dependency

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/net/ne2000.h             |  3 +++
 include/hw/i386/pc.h        | 20 --------------------
 include/hw/net/ne2000-isa.h | 33 +++++++++++++++++++++++++++++++++
 hw/i386/pc.c                |  1 +
 hw/mips/mips_r4k.c          |  1 +
 hw/net/ne2000-isa.c         |  6 ++----
 hw/net/ne2000.c             |  2 --
 hw/ppc/prep.c               |  1 +
 8 files changed, 41 insertions(+), 26 deletions(-)
 create mode 100644 include/hw/net/ne2000-isa.h

diff --git a/hw/net/ne2000.h b/hw/net/ne2000.h
index d213dccae3..adb8021bd1 100644
--- a/hw/net/ne2000.h
+++ b/hw/net/ne2000.h
@@ -1,6 +1,9 @@
 #ifndef HW_NE2000_H
 #define HW_NE2000_H
 
+#include "hw/hw.h"
+#include "net/net.h"
+
 #define NE2000_PMEM_SIZE    (32*1024)
 #define NE2000_PMEM_START   (16*1024)
 #define NE2000_PMEM_END     (NE2000_PMEM_SIZE+NE2000_PMEM_START)
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6a2e947332..020792c2e8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -291,26 +291,6 @@ PCIBus *find_i440fx(void);
 extern PCIDevice *piix4_dev;
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
 
-/* ne2000.c */
-static inline bool isa_ne2000_init(ISABus *bus, int base, int irq, NICInfo *nd)
-{
-    DeviceState *dev;
-    ISADevice *isadev;
-
-    qemu_check_nic_model(nd, "ne2k_isa");
-
-    isadev = isa_try_create(bus, "ne2k_isa");
-    if (!isadev) {
-        return false;
-    }
-    dev = DEVICE(isadev);
-    qdev_prop_set_uint32(dev, "iobase", base);
-    qdev_prop_set_uint32(dev, "irq",    irq);
-    qdev_set_nic_properties(dev, nd);
-    qdev_init_nofail(dev);
-    return true;
-}
-
 /* pc_sysfw.c */
 void pc_system_firmware_init(MemoryRegion *rom_memory,
                              bool isapc_ram_fw);
diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
new file mode 100644
index 0000000000..ff2bed9c95
--- /dev/null
+++ b/include/hw/net/ne2000-isa.h
@@ -0,0 +1,33 @@
+/*
+ * QEMU NE2000 emulation -- isa bus windup
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "hw/hw.h"
+#include "hw/qdev.h"
+#include "hw/isa/isa.h"
+#include "net/net.h"
+
+#define TYPE_ISA_NE2000 "ne2k_isa"
+
+static inline ISADevice *isa_ne2000_init(ISABus *bus, int base, int irq,
+                                         NICInfo *nd)
+{
+    ISADevice *d;
+
+    qemu_check_nic_model(nd, "ne2k_isa");
+
+    d = isa_try_create(bus, TYPE_ISA_NE2000);
+    if (d) {
+        DeviceState *dev = DEVICE(d);
+
+        qdev_prop_set_uint32(dev, "iobase", base);
+        qdev_prop_set_uint32(dev, "irq",    irq);
+        qdev_set_nic_properties(dev, nd);
+        qdev_init_nofail(dev);
+    }
+    return d;
+}
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 39076aeb9f..08d01b46eb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -70,6 +70,7 @@
 #include "qom/cpu.h"
 #include "hw/nmi.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/net/ne2000-isa.h"
 
 /* debug PC/ISA interrupts */
 //#define DEBUG_IRQ
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 349da59912..33ff89f02c 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -18,6 +18,7 @@
 #include "hw/char/serial.h"
 #include "hw/isa/isa.h"
 #include "net/net.h"
+#include "hw/net/ne2000-isa.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/block/flash.h"
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index f3455339ee..70e5c1d3d4 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -22,17 +22,15 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
+#include "hw/net/ne2000-isa.h"
 #include "hw/qdev.h"
-#include "net/net.h"
 #include "ne2000.h"
+#include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 
-#define TYPE_ISA_NE2000 "ne2k_isa"
 #define ISA_NE2000(obj) OBJECT_CHECK(ISANE2000State, (obj), TYPE_ISA_NE2000)
 
 typedef struct ISANE2000State {
diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 3938e6ddd8..6874c8c6b9 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -22,9 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/pci/pci.h"
-#include "net/net.h"
 #include "ne2000.h"
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 16f4537093..1442bc39c5 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -43,6 +43,7 @@
 #include "hw/timer/mc146818rtc.h"
 #include "hw/input/i8042.h"
 #include "hw/isa/pc87312.h"
+#include "hw/net/ne2000-isa.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
-- 
2.15.0.rc0


