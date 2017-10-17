Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V15-0002nR-Tc
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V11-0002iq-Cx
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V10-0003j5-8t
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:51 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:56601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0r-0003e2-Lh; Tue, 17 Oct 2017 12:46:41 -0400
Received: by mail-qk0-x243.google.com with SMTP id l194so2827439qke.13;
	Tue, 17 Oct 2017 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8wN3GveUfSIjtBplX2Bgk3Vkf3vDHwf7ltzrBmJwM1o=;
	b=vAoHOQkdnDTNEA6L+I4wKt9eGD1Rp/7XkzvgoUVyK8K0W1PO7KAtUADQ8PpekREWWq
	lP4BtKsNFG6cZbPzTFErO4nHk1r29IRn42wmQWPPfRgCIEM0AvXNLGrHt8mNfBymnH+z
	/qYwUDIhJJL9yDSRjczu0VuxYh3Ix4DEnM29zO/k3w8w4L2oKbSM+n1qlUFR6/X4L23A
	9zGFH7TfsC6mpxzUrnYEKF9F+ploZEdy+dTGMUPEGi2jExy8+vAUwiikXx9r7RF6ObLb
	Ivb+VNapcV1YGF0vxyXMEVDjLdZsqGs4RwIGKiu/YnC9pTr30hYHlgKhMytNbl5HCCGZ
	ekxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8wN3GveUfSIjtBplX2Bgk3Vkf3vDHwf7ltzrBmJwM1o=;
	b=cUgWamRpkDEoOp59BPVamkmFbiAX9WKuD4XxU1NtFeFxpCZ+lAEAIryeiGKQsTrSUT
	K5jDorVofgmI+xeL4TS8Kk6+gpzDQqB+dYTtsIBQ2f7J1Mw7sfhhuVHDEJR9MdWWcJnK
	cGxl+KjVEeuY2QPf5smMLbRn95ZZvSKmAb8PlnbCJ39ZbV+N38ubVasggf/Ex5hvS9Os
	3RW8A5EZv/YebREZnBE1GEr9GMC+Sv/6P7YvVHCepgdRSdzls5VRdGxEWFwPRWe6vjhf
	kvfkb8de9GbGKjVCd09hxxw+S1UmSCLxXH2UfUZjNjz8a64J6Kf2oqmCbIe1TDlR2ptX
	g3XQ==
X-Gm-Message-State: AMCzsaVcbQWdsdD6v0vNbSiOpx3IYrekRAHqJ/647VYzCMH7t5bcAaiT
	iPLCJWUrjhOu9Cpy/Gy1BfA=
X-Google-Smtp-Source: ABhQp+TldyhGb7/mD/xJlBtlga8TUvlHPANYJG70WsM85MOu+JhCcFqOFJgg0UY1F+rH3izVASj3Qg==
X-Received: by 10.55.154.146 with SMTP id c140mr19419373qke.131.1508258801036; 
	Tue, 17 Oct 2017 09:46:41 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:16 -0300
Message-Id: <20171017164426.25277-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 32/42] hw/timer/mc146818: rename
 rtc_init() -> mc146818_rtc_init()
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:53 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/timer/mc146818rtc.h | 3 ++-
 hw/alpha/dp264.c               | 2 +-
 hw/i386/pc.c                   | 2 +-
 hw/isa/i82378.c                | 3 ++-
 hw/mips/mips_fulong2e.c        | 2 +-
 hw/mips/mips_jazz.c            | 2 +-
 hw/mips/mips_malta.c           | 2 +-
 hw/mips/mips_r4k.c             | 2 +-
 hw/ppc/pnv.c                   | 2 +-
 hw/timer/mc146818rtc.c         | 2 +-
 10 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/mc146818rtc.h
index 7c8e64b203..fe6ed63f71 100644
--- a/include/hw/timer/mc146818rtc.h
+++ b/include/hw/timer/mc146818rtc.h
@@ -6,7 +6,8 @@
 
 #define TYPE_MC146818_RTC "mc146818rtc"
 
-ISADevice *rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq);
+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
+                             qemu_irq intercept_irq);
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
 
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 1bd5243648..f20f252e3c 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -79,7 +79,7 @@ static void clipper_init(MachineState *machine)
                            clipper_pci_map_irq);
 
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
-    rtc_init(isa_bus, 1900, rtc_irq);
+    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
 
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     isa_create_simple(isa_bus, "i8042");
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b565c6086c..88e64d84c3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1543,7 +1543,7 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
             rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
         }
     }
-    *rtc_state = rtc_init(isa_bus, 2000, rtc_irq);
+    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index a9c15f858d..a5d67bc6d7 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -21,6 +21,7 @@
 #include "hw/pci/pci.h"
 #include "hw/i386/pc.h"
 #include "hw/timer/i8254.h"
+#include "hw/timer/mc146818rtc.h"
 #include "hw/audio/pcspk.h"
 
 #define TYPE_I82378 "i82378"
@@ -106,7 +107,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     isa = isa_create_simple(isabus, "i82374");
 
     /* timer */
-    isa_create_simple(isabus, "mc146818rtc");
+    isa_create_simple(isabus, TYPE_MC146818_RTC);
 }
 
 static void i82378_init(Object *obj)
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 22e6c05fb5..a8292305e8 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -369,7 +369,7 @@ static void mips_fulong2e_init(MachineState *machine)
     /* Super I/O */
     isa_create_simple(isa_bus, "i8042");
 
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     serial_hds_isa_init(isa_bus, 0, MAX_SERIAL_PORTS);
     parallel_hds_isa_init(isa_bus, 1);
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 5f37852499..b9ffb33b45 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -292,7 +292,7 @@ static void mips_jazz_init(MachineState *machine,
     fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds);
 
     /* Real time clock */
-    rtc_init(isa_bus, 1980, NULL);
+    mc146818_rtc_init(isa_bus, 1980, NULL);
     memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
     memory_region_add_subregion(address_space, 0x80004000, rtc);
 
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index de547d732f..8e0e264cf8 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1223,7 +1223,7 @@ void mips_malta_init(MachineState *machine)
     /* Super I/O */
     isa_create_simple(isa_bus, "i8042");
 
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
     serial_hds_isa_init(isa_bus, 0, 2);
     parallel_hds_isa_init(isa_bus, 1);
 
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 48fad52540..cdb91e31c5 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -278,7 +278,7 @@ void mips_r4k_init(MachineState *machine)
     i8259 = i8259_init(isa_bus, env->irq[2]);
     isa_bus_irqs(isa_bus, i8259);
 
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d46d91c76f..0e47757bff 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -651,7 +651,7 @@ static void ppc_powernv_init(MachineState *machine)
     serial_hds_isa_init(pnv->isa_bus, 0, MAX_SERIAL_PORTS);
 
     /* Create an RTC ISA device too */
-    rtc_init(pnv->isa_bus, 2000, NULL);
+    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
 
     /* OpenPOWER systems use a IPMI SEL Event message to notify the
      * host to powerdown */
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 7764be25ec..35a05a64cc 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -999,7 +999,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     qdev_init_gpio_out(dev, &s->irq, 1);
 }
 
-ISADevice *rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
-- 
2.15.0.rc0


