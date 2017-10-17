Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWJ-000772-EM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWF-000731-K1
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWE-0004rH-AQ
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:03 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44239)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FW9-0004ns-DZ; Mon, 16 Oct 2017 20:13:57 -0400
Received: by mail-qk0-x241.google.com with SMTP id r64so37704qkc.1;
	Mon, 16 Oct 2017 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dWaTggjfQiuK0GltWZQOE6k1QOCcCLfjBd2bgyLRn8I=;
	b=Ti+CVrNXohNvjNpmBn0qBR2x5kFlgQmUgaxkBF7ixCQ2pG9z2aG4Dgtt+i9aFIHRTu
	jOlvOFmMSCl07fj/b4RQSKF/LUcRakJ2MkhPlW7u33qaPtyKQV6fR7ZFPAPUPZ/Df7w8
	lAPQSx71E+KisEDgF35tqC7OCP5yG0aDSdAxCZ0Kd67n0WKDfuKakfxuniFFKwfu10TW
	X3DEFt2xmLNOTAGev/SLd7O77XzjYcPd7WAOjNTeD610CBFihGNRsw2Pk34CWChyaoRc
	Ri3t0ZnPhCwhHNAXj1HnChY/hcLc7k/rvPCl33ZJYViY6mjzAuiLkGBAw1p++x/3d52m
	bhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dWaTggjfQiuK0GltWZQOE6k1QOCcCLfjBd2bgyLRn8I=;
	b=CO4XgwoVN8T7PKAzPFUEaoJQCBvNk6K6yFZzfTtLXsalnhOKskWAeuvjdTXU7utOIG
	e5ADU63z40YK7dUqp5kMQf4ZDXzOUnHJtd1PXPeCsuwnmWjXwCTiihAEGq/qxK1vauQ8
	DRwEnCtXpB48BJq5aYAjJOlHHxKkpAusc1iyfviwPyEqmhWv8dQMOrsTL+Ybs2Mkvx7n
	YL/C3VaprUvybFx/i/rOZFGV1zzvIlijYXLzKxQ14WZvF7qYQxi2iYgHqo4junthxA/2
	/YsIFodVyn2KsFknzYestC98DAsmBZq7lZH5839uDel0oe/vOkoq/ilX9Bt3YD1E5tZn
	R18w==
X-Gm-Message-State: AMCzsaXcu8EJOzr+OAY0g5uvmfTQzFCBI4nLrouBB60p7su+RFBisbky
	h4e0P7F6tDWe2GJvc+XV5RE=
X-Google-Smtp-Source: ABhQp+TacNakPsuqHK+dM1U4doGz+CvJOE83b2dxwtjFR1RcJcnkklCT99/0rPQ1RnT8BTH/jhL7Cg==
X-Received: by 10.55.126.2 with SMTP id z2mr7213956qkc.129.1508199236936;
	Mon, 16 Oct 2017 17:13:56 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:00 -0300
Message-Id: <20171017001209.32276-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 30/39] hw/display/vga: remove the old
 i386/pc dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:04 -0000

move public API to "hw/display/vga.h" and private registers
to "hw/display/vga_int_regs.h"

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga_int.h                 |  3 ++-
 hw/display/{vga.h => vga_int_regs.h} |  0
 include/hw/display/vga.h             | 25 +++++++++++++++++++++++++
 include/hw/i386/pc.h                 | 12 ------------
 hw/display/vga-isa-mm.c              |  4 +---
 hw/display/vga-isa.c                 |  2 +-
 hw/display/vga.c                     |  4 ++--
 hw/mips/mips_jazz.c                  |  1 +
 vl.c                                 |  2 +-
 MAINTAINERS                          |  1 +
 10 files changed, 34 insertions(+), 20 deletions(-)
 rename hw/display/{vga.h => vga_int_regs.h} (100%)
 create mode 100644 include/hw/display/vga.h

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index ad34a1f048..fe23b81442 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -25,8 +25,9 @@
 #ifndef HW_VGA_INT_H
 #define HW_VGA_INT_H
 
-#include "hw/hw.h"
+#include "exec/ioport.h"
 #include "exec/memory.h"
+#include "ui/console.h"
 
 #define ST01_V_RETRACE      0x08
 #define ST01_DISP_ENABLE    0x01
diff --git a/hw/display/vga.h b/hw/display/vga_int_regs.h
similarity index 100%
rename from hw/display/vga.h
rename to hw/display/vga_int_regs.h
diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
new file mode 100644
index 0000000000..0401a3a292
--- /dev/null
+++ b/include/hw/display/vga.h
@@ -0,0 +1,25 @@
+/*
+ * QEMU VGA Emulator.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_HW_DISPLAY_VGA_H
+#define QEMU_HW_DISPLAY_VGA_H
+
+#include "exec/memory.h"
+
+enum vga_retrace_method {
+    VGA_RETRACE_DUMB,
+    VGA_RETRACE_PRECISE
+};
+
+extern enum vga_retrace_method vga_retrace_method;
+
+int isa_vga_mm_init(hwaddr vram_base,
+                    hwaddr ctrl_base, int it_shift,
+                    MemoryRegion *address_space);
+
+#endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b1b4c918af..25ba378bd8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -302,18 +302,6 @@ PCIBus *find_i440fx(void);
 extern PCIDevice *piix4_dev;
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
 
-/* vga.c */
-enum vga_retrace_method {
-    VGA_RETRACE_DUMB,
-    VGA_RETRACE_PRECISE
-};
-
-extern enum vga_retrace_method vga_retrace_method;
-
-int isa_vga_mm_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space);
-
 /* ne2000.c */
 static inline bool isa_ne2000_init(ISABus *bus, int base, int irq, NICInfo *nd)
 {
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 51ccbccc41..e887b45651 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -23,11 +23,9 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "ui/console.h"
-#include "hw/i386/pc.h"
+#include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
-#include "qemu/timer.h"
 
 #define VGA_RAM_SIZE (8192 * 1024)
 
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 1af95562f2..9af43abee8 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -26,7 +26,7 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "ui/console.h"
-#include "hw/i386/pc.h"
+#include "hw/isa/isa.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
 #include "qemu/timer.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index ed24ef7076..0da4942a09 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -24,9 +24,9 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "vga.h"
+#include "hw/display/vga.h"
 #include "ui/console.h"
-#include "hw/i386/pc.h"
+#include "vga_int_regs.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 5f37852499..25f0294236 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -39,6 +39,7 @@
 #include "hw/loader.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/timer/i8254.h"
+#include "hw/display/vga.h"
 #include "hw/audio/pcspk.h"
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
diff --git a/vl.c b/vl.c
index 0d1f612629..f0b7106feb 100644
--- a/vl.c
+++ b/vl.c
@@ -57,9 +57,9 @@ int main(int argc, char **argv)
 #include "hw/boards.h"
 #include "sysemu/accel.h"
 #include "hw/usb.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
+#include "hw/display/vga.h"
 #include "hw/bt.h"
 #include "sysemu/watchdog.h"
 #include "hw/smbios/smbios.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index ddaba2702c..9907b3dae2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -860,6 +860,7 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: hw/watchdog/wdt_ib700.c
+F: include/hw/display/vga.h
 F: include/hw/dma/i8257_dma.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/timer/hpet.h
-- 
2.15.0.rc0


