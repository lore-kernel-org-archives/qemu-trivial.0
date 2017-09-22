Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ5O-0005Pv-BS
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5I-0005KX-VD
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5F-0003ak-Rl
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:44 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ5C-0003YB-L4; Fri, 22 Sep 2017 11:41:38 -0400
Received: by mail-qt0-x241.google.com with SMTP id o3so882433qte.5;
	Fri, 22 Sep 2017 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WnfLy07d8CgOU9m6fr5W5G59F8m3luymQtirRIVYzcg=;
	b=Mr79v41eWvtK6a+LwPcSNTJssmgideWc6dtbJd0Kv+XXGQ9jQDPceMTo9e2beI6tq0
	CQYqzw+7q6i/VYXrCJbdX+cCYOrAY2yUmyejB9XQ4CC64wucEAOiBnxab1vp0byJp3p2
	v40ZGVO1VRhuJSpleGFsbguqQm74jr7TO4BJdQWuYbji6QpUdpV/DmJgmx0HHRoQsXlW
	GcVqmOJTBOqVRqauBs7N7PBqXJIlYFcjJDfsRyFVQuMB5MVolAX4arCe9YUPIZ9Q1Kok
	XlYn6w9m9QFPIcR/2erRrf2ROpWJG5zEUF4jSFxGtEVN53c/6Mkd1pSc9dIfhDYOBIhE
	n6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WnfLy07d8CgOU9m6fr5W5G59F8m3luymQtirRIVYzcg=;
	b=pFWeyw0RGe7amsCzb6+982kmq/cSI3gVmX1ssizbks0pZE1kv5VGVF08IlBeAzTUrn
	FT6MFrDhUvzdEgbnDLf5g8BzcSmxymaf//YT1jmhQT17iC/iIt3DrgINUcgxC/iIkIxF
	htTm9aMhGT7XnhIBBQ2T5JgHGihdYppVOvBU+IIkD3rFyq/Uff8vLgD8WQVe9WQ/t8sB
	6pbyaDN+Tf9VI6aUJbpDqFeGDq5cfVcJu49mHPY3Imv9nZAGmB8DXdM6kyDujhAZjE44
	Aaq5zV1zBR6hTi2vcqkLHheo5DKKnYetTeApGD7N7HoCgQioJI8pMmJ2pXWmrzPqP/d8
	Bz3w==
X-Gm-Message-State: AHPjjUglxZhyXTi0E+nEo8x1jBt+KCrsECp5DxtKE6qPUuJS0hBhtrEs
	OnDuu5Eil2egB/Zj45ngh9M=
X-Google-Smtp-Source: AOwi7QDptKm6D0UTjPTtgHxOjSTU74TWAucXbs8bSdUFHJpnfP1o0zUGSmp4V66x4vkZ9LASlontaw==
X-Received: by 10.200.33.235 with SMTP id 40mr8835211qtz.185.1506094898032;
	Fri, 22 Sep 2017 08:41:38 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:41:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Fri, 22 Sep 2017 12:40:00 -0300
Message-Id: <20170922154014.29350-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 20/34] hw/timer/i8254: rename pit_init() ->
 i8254_pit_init()
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:48 -0000

- add entry for i82378 in MAINTAINERS
- remove the old i386/pc dependency

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/i8254.h          | 5 +++--
 include/hw/timer/i8254_internal.h | 2 +-
 hw/alpha/dp264.c                  | 2 +-
 hw/i386/pc.c                      | 2 +-
 hw/isa/i82378.c                   | 2 +-
 hw/mips/mips_fulong2e.c           | 2 +-
 hw/mips/mips_jazz.c               | 2 +-
 hw/mips/mips_malta.c              | 2 +-
 hw/mips/mips_r4k.c                | 2 +-
 hw/timer/i8254.c                  | 1 -
 hw/timer/i8254_common.c           | 1 -
 MAINTAINERS                       | 1 +
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 5adae9fa44..5b12eb918e 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -26,6 +26,7 @@
 #define HW_I8254_H
 
 #include "hw/hw.h"
+#include "hw/qdev.h"
 #include "hw/isa/isa.h"
 
 #define PIT_FREQ 1193182
@@ -48,8 +49,8 @@ typedef struct PITChannelInfo {
 #define TYPE_I8254 "isa-pit"
 #define TYPE_KVM_I8254 "kvm-pit"
 
-static inline ISADevice *pit_init(ISABus *bus, int base, int isa_irq,
-                                  qemu_irq alt_irq)
+static inline ISADevice *i8254_pit_init(ISABus *bus, int base, int isa_irq,
+                                        qemu_irq alt_irq)
 {
     DeviceState *dev;
     ISADevice *d;
diff --git a/include/hw/timer/i8254_internal.h b/include/hw/timer/i8254_internal.h
index dc09cc0467..c37a438f82 100644
--- a/include/hw/timer/i8254_internal.h
+++ b/include/hw/timer/i8254_internal.h
@@ -26,8 +26,8 @@
 #define QEMU_I8254_INTERNAL_H
 
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
+#include "qemu/timer.h"
 
 typedef struct PITChannelState {
     int count; /* can be 65536 */
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 1b121306c2..1bd5243648 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -81,7 +81,7 @@ static void clipper_init(MachineState *machine)
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     rtc_init(isa_bus, 1900, rtc_irq);
 
-    pit_init(isa_bus, 0x40, 0, NULL);
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
     isa_create_simple(isa_bus, "i8042");
 
     /* VGA setup.  Don't bother loading the bios.  */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f116cede91..5cb0ae67cd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1551,7 +1551,7 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
-            pit = pit_init(isa_bus, 0x40, pit_isa_irq, pit_alt_irq);
+            pit = i8254_pit_init(isa_bus, 0x40, pit_isa_irq, pit_alt_irq);
         }
         if (hpet) {
             /* connect PIT to output control line of the HPET */
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 4d29a9900c..7a8baef23c 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -97,7 +97,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
-    isa = pit_init(isabus, 0x40, 0, NULL);
+    isa = i8254_pit_init(isabus, 0x40, 0, NULL);
 
     /* speaker */
     pcspk_init(isabus, isa);
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 75318680e1..22e6c05fb5 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -363,7 +363,7 @@ static void mips_fulong2e_init(MachineState *machine)
     smbus_eeprom_init(smbus, 1, eeprom_spd, sizeof(eeprom_spd));
 
     /* init other devices */
-    pit = pit_init(isa_bus, 0x40, 0, NULL);
+    pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     DMA_init(isa_bus, 0);
 
     /* Super I/O */
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 7e6626dc88..5f37852499 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -222,7 +222,7 @@ static void mips_jazz_init(MachineState *machine,
     i8259 = i8259_init(isa_bus, env->irq[4]);
     isa_bus_irqs(isa_bus, i8259);
     DMA_init(isa_bus, 0);
-    pit = pit_init(isa_bus, 0x40, 0, NULL);
+    pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     pcspk_init(isa_bus, pit);
 
     /* Video card */
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 2adb9bcf89..de547d732f 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1217,7 +1217,7 @@ void mips_malta_init(MachineState *machine)
                           isa_get_irq(NULL, 9), NULL, 0, NULL);
     smbus_eeprom_init(smbus, 8, smbus_eeprom_buf, smbus_eeprom_size);
     g_free(smbus_eeprom_buf);
-    pit = pit_init(isa_bus, 0x40, 0, NULL);
+    pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     DMA_init(isa_bus, 0);
 
     /* Super I/O */
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 1272d4ef9d..48fad52540 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -280,7 +280,7 @@ void mips_r4k_init(MachineState *machine)
 
     rtc_init(isa_bus, 2000, NULL);
 
-    pit = pit_init(isa_bus, 0x40, 0, NULL);
+    pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
 
     serial_hds_isa_init(isa_bus, 0, MAX_SERIAL_PORTS);
 
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index 5e61ad50a8..dbc4a0baec 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "qemu/timer.h"
 #include "hw/timer/i8254.h"
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index ee064aa819..c850950699 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -24,7 +24,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "qemu/timer.h"
 #include "hw/timer/i8254.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 7f49f1d046..f7d377ead9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -705,6 +705,7 @@ F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
+F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: pc-bios/ppc_rom.bin
 
-- 
2.14.1


