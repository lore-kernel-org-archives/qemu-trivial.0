Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V1K-00030r-7R
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1H-0002yd-SG
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1D-0003qh-Mo
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:47:07 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:51388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V1B-0003oo-17; Tue, 17 Oct 2017 12:47:01 -0400
Received: by mail-qk0-x244.google.com with SMTP id 17so2820561qkq.8;
	Tue, 17 Oct 2017 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ho1UKauFL0sQpkUuLjZ1/iGoh8B+B0eNv85u9OsQFHQ=;
	b=D+Rk5wJeIwRe6zaGPbOhmOOrCgdpjN7QuSW9an8utD1Khnj3eVpW1ylydsQ1Yu97yr
	RA4M3SBRkrBeFp345Kbezkg7+cnrODcXTet+ZVkETEUawfdmFFasSGJnR02EHfSqNCB6
	CjFfQ0cEj9UqWypfRJpzhqWAkFz+HnDvHpBzwFTUcwHC8oMcraQQYfLtVZ0vUxzsrOOw
	CKanQ3eVB2E95kRFc9YxX5gYcgNxWv2yaLcHflMTwMUYt2HUNpq0iKIGkfdN3yAzTpTX
	EyfPk9HVhki50nKLssUZ8Utk0FDJ665pp+BEaYdSfj4UkwJ9JPehcOo16ZaGlVBaAiEG
	ABSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ho1UKauFL0sQpkUuLjZ1/iGoh8B+B0eNv85u9OsQFHQ=;
	b=UqZmpn+1NC39snruyphdD47Ipf4UX2hMVpuLx/2JRN3prsYd7NcrUkRs4FE7BjljIo
	os0QSGljLd19DCHhne9vBzSfx+LQ5yzkxcW656cqY6sSDvhVEwGOQ/XxlfI6WddT8Qwd
	DhUcZ2UXEcRVa49juXAvRI5uPEHlZzob08o78HszZI9kAxEhNamAcFWHmh/CsQFjiVoJ
	SEHImXz5/ZdjWlkRodd7oV/q4K3DWbi7MfKs3SsOOBR7n6SeywVQ0HF3t9rkreaYtSEh
	R4Je7mPyQ0yKuVFhOjOoqXq+8mXcesMyfNrGRpD0uRkR7SZt+9CVnDmdCgJ6skmtSM/q
	N1mA==
X-Gm-Message-State: AMCzsaWLLZLPqekJJ/0NNS9lYW6AbAIgk8lUysT7XCsretT1eFfRynBm
	dM7DuCXR3CK/BwP9oXNClxY=
X-Google-Smtp-Source: ABhQp+Sa/A4FDOZ36cP37jRXZQSa49tCw2ZphiUCzOv5iJbfoYizH1Psv+iX/zm6jmUVF7UURLpOLQ==
X-Received: by 10.55.22.132 with SMTP id 4mr15068395qkw.39.1508258820455;
	Tue, 17 Oct 2017 09:47:00 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:59 -0700 (PDT)
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
Date: Tue, 17 Oct 2017 13:44:21 -0300
Message-Id: <20171017164426.25277-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 37/42] hw/display/vga: extract public API
 from i386/pc to "hw/display/vga.h"
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
X-List-Received-Date: Tue, 17 Oct 2017 16:47:09 -0000

and remove the old i386/pc dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/display/vga.h | 25 +++++++++++++++++++++++++
 include/hw/i386/pc.h     | 12 ------------
 hw/display/vga-isa-mm.c  |  3 +--
 hw/display/vga-isa.c     |  2 +-
 hw/display/vga.c         |  2 +-
 hw/mips/mips_jazz.c      |  1 +
 vl.c                     |  2 +-
 MAINTAINERS              |  1 +
 8 files changed, 31 insertions(+), 17 deletions(-)
 create mode 100644 include/hw/display/vga.h

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
index 68c4d6e23e..e887b45651 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -23,10 +23,9 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
+#include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
-#include "qemu/timer.h"
 
 #define VGA_RAM_SIZE (8192 * 1024)
 
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 26f69fd40a..469834add5 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -25,7 +25,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
+#include "hw/isa/isa.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
 #include "qemu/timer.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 22fd069ad2..59729f7031 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
+#include "hw/display/vga.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
 #include "vga_regs.h"
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index b9ffb33b45..ece4a153b2 100644
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
index 0e926a942b..81b67e4685 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -860,6 +860,7 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: hw/watchdog/wdt_ib700.c
+F: include/hw/display/vga.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
-- 
2.15.0.rc0


