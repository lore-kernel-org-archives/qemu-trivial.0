Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgk6-0003j8-Hj
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgk4-0003fK-1E
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjz-0006nJ-TR
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:55 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:40677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjw-0006iI-Qs; Thu, 14 Dec 2017 22:32:48 -0500
Received: by mail-qk0-x243.google.com with SMTP id b123so8876771qkg.7;
	Thu, 14 Dec 2017 19:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MazUQc/2jfX5eIAvm6c6hHf3gagACgsR6VFhJCLJ0qA=;
	b=Bw0HNvKMJ2f1oVfI3mE1yrAPtyEiNDi5WUD6VlGzMuVpbS9JbCReRF3UXYAkChGShI
	8jSfhtZoPCwTZL6FOUe/PB36LGPXyDtCldrfdVDQ42gnQBg3pqBkTJ2idJpuQMI2jQdZ
	1ErtRZnFnRk7OCubhW8Fl0TFLwMl8KyfWWJJ3GbIsTuA1XB4+LefWgFW6cD62P35EVcv
	jh3NAyq3KIqadcELMsQggI4VICNHYiSkNNsaB/PQLRzXzeYwQzUHCVv/c9dFQHdrdtpY
	D+4czGNxq8ZLatXo3Yb+DBW5cQFkloCWL+iBHVBgd73fICrRqAG+XIl/BsyFY+LKhfEf
	l2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MazUQc/2jfX5eIAvm6c6hHf3gagACgsR6VFhJCLJ0qA=;
	b=gohdWfW05ZMu8PEe08Vpx08EADdVyqbVz5JZUZwKZbJjS1umyjLiX8kCADVmvZhaWW
	vieFugGyU5sJYouOE/BPjdOryErCk9niJF99VpvC3d2gp3f++2r/+nacfpRXmnhPnCiP
	bw0QQkuWRNLgsFv3jDmXQ+OlLp9VO03sMkbOwZxqM7QEWx2UsPy81NmBiB4Hg1ieokK5
	/ss9IdN67xTAMLXCRfp4u8qyKIzkwVqYGP7ZYVWLDnVowWjmB4FMdkbaL3VokCaOjjds
	5sK6r/DwgRalWHgaDjAxdTGU0P5r/x+AShxPiyNGWpTHsVX0KDSO32Jccnau/C/mce7A
	fHzA==
X-Gm-Message-State: AKGB3mIxW/tei/CTCWdbPLsqmBq7MqY4skg3pbE016GyZa5DsoWavtTF
	325TGpfS260PiAYmKoZK6Go=
X-Google-Smtp-Source: ACJfBosBjFhecvTVeWHkx8IlTFUtlTF9PHYUoJkTTa3B3I5aRLIQFXoEZuqdlxq2CYOZGMxBCyxG/g==
X-Received: by 10.55.25.18 with SMTP id k18mr19327528qkh.336.1513308768255;
	Thu, 14 Dec 2017 19:32:48 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:47 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:PReP)
Date: Fri, 15 Dec 2017 00:30:10 -0300
Message-Id: <20171215033015.738-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 38/43] hw/net/ne2000: extract ne2k-isa
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:57 -0000

- add "hw/net/ne2000-isa.h"
- remove the old i386 dependency

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au> [PPC]
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
index 1d55ba3322..ab84e31cce 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -302,26 +302,6 @@ PCIBus *find_i440fx(void);
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
index fe5e8b53bb..3fcf318a95 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -69,6 +69,7 @@
 #include "qom/cpu.h"
 #include "hw/nmi.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/net/ne2000-isa.h"
 
 /* debug PC/ISA interrupts */
 //#define DEBUG_IRQ
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 9884ee7e9f..244bd41813 100644
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
index 6f8accc397..af08ac319a 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -42,6 +42,7 @@
 #include "hw/loader.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/isa/pc87312.h"
+#include "hw/net/ne2000-isa.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
-- 
2.15.1


