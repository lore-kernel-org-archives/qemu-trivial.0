Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjy-0003aa-NC
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjw-0003Yq-HR
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjv-0006gr-Cv
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:48 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:45735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjr-0006dV-VE; Thu, 14 Dec 2017 22:32:44 -0500
Received: by mail-qk0-x241.google.com with SMTP id d141so8869491qkc.12;
	Thu, 14 Dec 2017 19:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NtGh/ED/FU3xYwxri1X4Ro9AN8sWqlTlcENtEy+lsMY=;
	b=BwACVHvy53Ky9yWMHLf0XfKW0Zyq6jZtjZ5neFwrKxSjkbPEP3OlkYN0KfFydOszUP
	KwfR2XpEzHcP63a9LiyyEwI+4QAD7682azOTPVKiOsZNVz1EizvlFGy6S7/BJqWR2AHI
	rAFGQoj3FncInEjBHlWPSk//4BBzMI8/G3XeCMdPM7tENmx3W7vKKl7g8N4AbCQRZ9CZ
	35W+4Mwi/Sm18zWeR0i0KzYE1sc8Vkync7SDGhRZv6bHyd7k8thjXXnyqkEgN3WAK5mB
	6ltP0DxYjYMm0qlK5+4xfUMgdlMnO5IqxjkVfVDX58OTAbXACrlrUwm8VNWrxcziLOIL
	yMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NtGh/ED/FU3xYwxri1X4Ro9AN8sWqlTlcENtEy+lsMY=;
	b=O44s21zmVXnWs7kIyj6OoN7Ti9GXve8gNcsG+zwbmiFKrb4KY+5nQoGF+WwDh1K3E6
	QU2b4MpIhhKOBBfxCeG1zdLzZuzvkBAKnxh82ViWomn3LEbRDAWyWTd27aR4QI3z82CP
	eUGg5WOGIgQGnMheX7AYdRaKtjvLEBardenuFksTnaYUe7tIAYdvzVlMPejqOpNJba6R
	fmvZkLGq7bZ7t6/NhTh/jN8lZ7WdbWehmn/edmi6ypWQ9rubt8CkATa4Ab9WHueM/ovw
	ELkgR49typndyMOL6JfZAD4OwUtWjJZYX/vaxa7U5lFtCxxEaz53u+BndDmnrVrOmNKT
	kdaw==
X-Gm-Message-State: AKGB3mK0b4/eU9fOgRrI6B5CS1l47cWc7dGdl+5ouIj8Ih6znrM6qAzH
	Ejka8jhc1SMtZ78tniDJ0jE=
X-Google-Smtp-Source: ACJfBovlDbzi5aqXHnefTo42fJEMOXli4uo/3kOOpN8m34v0chLR9EQX/4eDEMLL/Lp6/2sKwiLxRQ==
X-Received: by 10.55.53.75 with SMTP id c72mr16372777qka.2.1513308763425;
	Thu, 14 Dec 2017 19:32:43 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@mips.com>
Date: Fri, 15 Dec 2017 00:30:09 -0300
Message-Id: <20171215033015.738-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 37/43] hw/display/vga: extract public API
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:50 -0000

and remove the old i386/pc dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index 3794473108..1d55ba3322 100644
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
index 4163b532e0..a0412000a5 100644
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
index 22a3d5169c..0d2c0683ba 100644
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
index c1ba52306a..e9012bb009 100644
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
index f299dc2c19..8ae268d772 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -881,6 +881,7 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: hw/watchdog/wdt_ib700.c
+F: include/hw/display/vga.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
-- 
2.15.1


