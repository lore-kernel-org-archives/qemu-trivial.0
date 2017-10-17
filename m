Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWz-0007l6-1I
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWt-0007gM-Tb
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWs-0005Di-IU
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:43 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWl-0005A1-La; Mon, 16 Oct 2017 20:14:35 -0400
Received: by mail-qt0-x241.google.com with SMTP id j58so81960qtj.0;
	Mon, 16 Oct 2017 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AYTlDxMCQMLZI7wQ2VNpv0YnAPLdWV38wdYQS/QvKiY=;
	b=Qw9BjqEfL9cA3cmdBmV8/62sRbD9WRWLuKAZSrQoAsfAjP+zMwbSfZU8rHr1DLpcwF
	KpEr2Lg27rsCnyxurIuVmNK4ef2XgMPE5s5RUBu8hEr29azs2+qx6Jqp3Sa5UNgmKhud
	j3zVqDS1LCKk67Ka1Bvdzg5ZUXhj0Mo8EuH9CXM1DoevT4oqOaeyqDSIj5wWNRIwqJND
	mDwMfTD16pJplF3ZZxnZ/c4D4UjmiLcpT7PfKkLJTacOl8RCqnsIXhqE22Spu369bEhO
	Yv0o36JLAYuwViJrY5o0VN2HbozNznJyXH3UQDNuCUilJvEnWhDp4HRWw8me3Ul30tqW
	VcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AYTlDxMCQMLZI7wQ2VNpv0YnAPLdWV38wdYQS/QvKiY=;
	b=HTxO0MFZzP0G1RqQ3SqfVp7PaLSTbnwzMqUXDkzSqO2ZXRHatOMO/pY03EAxd5Ze8J
	G7m3bQL5cPZhQWYzz3BeP3PNqgpidiHuQdATks9a0itxSerCX6e5Kx5aDwMOcp5srOtv
	CnCfx9JST1Z+YJWJByuuRkk1XrfmBp16qWU1pSKoUdghdrrYbje72yuDbQGTIBJO7twE
	klqhZW+Kl6HPj0L3u1qEnOFiWjLCCpVnS78kFk5tVJjS3kzsIHz61xKNGtDcIDerH/RX
	T87CVfBNddz2ILjU//Uy+WGmGuE8D9uMSpjwY4z0gsPUyJOoYjgo6yiO7T6emsbEjiCL
	Bblw==
X-Gm-Message-State: AMCzsaVLAsbSfl+FTu+ThHfUFDJgwTVBNmjJ9pe2sOEzk2KktpLtgj9v
	UW/fewDHfLTXuoI5QFFdFrTmmLnieBI=
X-Google-Smtp-Source: AOwi7QDp84MOK2lcJSjwbts6Fm4PewxNdPR3fBYM1s+VchSDn2nUXNGUuIrVgtjuIMTMr+8btiKpqw==
X-Received: by 10.200.26.216 with SMTP id h24mr16969460qtk.175.1508199275165; 
	Mon, 16 Oct 2017 17:14:35 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:09 -0300
Message-Id: <20171017001209.32276-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 39/39] hw/dma/i8257: rename DMA_init() to
 i8257_dma_init()
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:47 -0000

- move the header from hw/isa/ to hw/dma/
- remove the old i386/pc dependency

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/{isa/i8257.h => dma/i8257_dma.h} | 6 ++++++
 include/hw/isa/isa.h                        | 2 --
 hw/dma/i82374.c                             | 3 ++-
 hw/dma/i8257.c                              | 4 ++--
 hw/i386/pc.c                                | 3 ++-
 hw/mips/mips_fulong2e.c                     | 3 ++-
 hw/mips/mips_jazz.c                         | 3 ++-
 hw/mips/mips_malta.c                        | 3 ++-
 hw/sparc/sun4m.c                            | 4 ----
 hw/sparc64/sun4u.c                          | 4 ----
 10 files changed, 18 insertions(+), 17 deletions(-)
 rename include/hw/{isa/i8257.h => dma/i8257_dma.h} (86%)

diff --git a/include/hw/isa/i8257.h b/include/hw/dma/i8257_dma.h
similarity index 86%
rename from include/hw/isa/i8257.h
rename to include/hw/dma/i8257_dma.h
index 88a2766a3f..0041565177 100644
--- a/include/hw/isa/i8257.h
+++ b/include/hw/dma/i8257_dma.h
@@ -1,6 +1,10 @@
 #ifndef HW_I8257_H
 #define HW_I8257_H
 
+#include "hw/hw.h"
+#include "hw/isa/isa.h"
+#include "exec/ioport.h"
+
 #define TYPE_I8257 "i8257"
 
 typedef struct I8257Regs {
@@ -40,4 +44,6 @@ typedef struct I8257State {
     PortioList portio_pageh;
 } I8257State;
 
+void i8257_dma_init(ISABus *bus, int high_page_enable);
+
 #endif
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 95593408ef..b9dbab24b4 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -151,6 +151,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
-/* i8257.c */
-void DMA_init(ISABus *bus, int high_page_enable);
 #endif
diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 280e64f0fa..42b9eef659 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/isa/isa.h"
+#include "hw/dma/i8257_dma.h"
 
 #define TYPE_I82374 "i82374"
 #define I82374(obj) OBJECT_CHECK(I82374State, (obj), TYPE_I82374)
@@ -130,7 +131,7 @@ static void i82374_realize(DeviceState *dev, Error **errp)
     portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
                     s->iobase);
 
-    DMA_init(isa_bus, 1);
+    i8257_dma_init(isa_bus, 1);
     memset(s->commands, 0, sizeof(s->commands));
 }
 
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index bd23e893bf..a8f26b003b 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
-#include "hw/isa/i8257.h"
+#include "hw/dma/i8257_dma.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
 
@@ -622,7 +622,7 @@ static void i8257_register_types(void)
 
 type_init(i8257_register_types)
 
-void DMA_init(ISABus *bus, int high_page_enable)
+void i8257_dma_init(ISABus *bus, int high_page_enable)
 {
     ISADevice *isa1, *isa2;
     DeviceState *d;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a8d20ae89c..bb0c70f606 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -39,6 +39,7 @@
 #include "elf.h"
 #include "multiboot.h"
 #include "hw/timer/mc146818rtc.h"
+#include "hw/dma/i8257_dma.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
 #include "hw/audio/pcspk.h"
@@ -1467,7 +1468,7 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
         qdev_init_nofail(dev);
     }
 
-    DMA_init(isa_bus, 0);
+    i8257_dma_init(isa_bus, 0);
 
     for(i = 0; i < MAX_FD; i++) {
         fd[i] = drive_get(IF_FLOPPY, 0, i);
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index bf021ba018..7ebbffa8f2 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/i386/pc.h"
+#include "hw/dma/i8257_dma.h"
 #include "hw/char/serial.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
@@ -365,7 +366,7 @@ static void mips_fulong2e_init(MachineState *machine)
 
     /* init other devices */
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    DMA_init(isa_bus, 0);
+    i8257_dma_init(isa_bus, 0);
 
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_I8042);
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index f5112fab39..439bbd71fe 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -27,6 +27,7 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/i386/pc.h"
+#include "hw/dma/i8257_dma.h"
 #include "hw/char/serial.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
@@ -223,7 +224,7 @@ static void mips_jazz_init(MachineState *machine,
     /* ISA devices */
     i8259 = i8259_init(isa_bus, env->irq[4]);
     isa_bus_irqs(isa_bus, i8259);
-    DMA_init(isa_bus, 0);
+    i8257_dma_init(isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     pcspk_init(isa_bus, pit);
 
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 7e8194be17..6945fa47c3 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -27,6 +27,7 @@
 #include "cpu.h"
 #include "hw/hw.h"
 #include "hw/i386/pc.h"
+#include "hw/dma/i8257_dma.h"
 #include "hw/char/serial.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
@@ -1219,7 +1220,7 @@ void mips_malta_init(MachineState *machine)
     smbus_eeprom_init(smbus, 8, smbus_eeprom_buf, smbus_eeprom_size);
     g_free(smbus_eeprom_buf);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
-    DMA_init(isa_bus, 0);
+    i8257_dma_init(isa_bus, 0);
 
     /* Super I/O */
     isa_create_simple(isa_bus, TYPE_I8042);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 93424b186f..f6fda6eb13 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -100,10 +100,6 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
-void DMA_init(ISABus *bus, int high_page_enable)
-{
-}
-
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1cd283063e..6b45d487f0 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -86,10 +86,6 @@ typedef struct EbusState {
     MemoryRegion bar1;
 } EbusState;
 
-void DMA_init(ISABus *bus, int high_page_enable)
-{
-}
-
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
-- 
2.15.0.rc0


