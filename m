Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQhgF-0006M4-UJ
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQhgB-0006HS-AO
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:45:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQhg9-0004zQ-Uf
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:45:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQhg4-0004u0-45; Sun, 17 Dec 2017 17:45:00 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4D34B41178;
	Mon, 18 Dec 2017 01:44:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0257AD23;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30988 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:56 +0300
Message-Id: <2b1c8130b0580308dad4373f5c44f7103188ca37.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 51/61] hw/timer/mc146818: rename rtc_init() ->
 mc146818_rtc_init()
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
X-List-Received-Date: Sun, 17 Dec 2017 22:45:09 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/alpha/dp264.c               | 2 +-
 hw/i386/pc.c                   | 2 +-
 hw/isa/i82378.c                | 3 ++-
 hw/mips/mips_fulong2e.c        | 2 +-
 hw/mips/mips_jazz.c            | 2 +-
 hw/mips/mips_malta.c           | 2 +-
 hw/mips/mips_r4k.c             | 2 +-
 hw/ppc/pnv.c                   | 2 +-
 hw/timer/mc146818rtc.c         | 2 +-
 include/hw/timer/mc146818rtc.h | 3 ++-
 10 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 887a7401f1..766373eec7 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -78,7 +78,7 @@ static void clipper_init(MachineState *machine)
                            clipper_pci_map_irq);
=20
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
-    rtc_init(isa_bus, 1900, rtc_irq);
+    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
=20
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     isa_create_simple(isa_bus, "i8042");
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6a6041573f..fe5e8b53bb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1565,7 +1565,7 @@ void pc_basic_device_init(ISABus *isa_bus, qemu_irq=
 *gsi,
             rtc_irq =3D qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
         }
     }
-    *rtc_state =3D rtc_init(isa_bus, 2000, rtc_irq);
+    *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
=20
     qemu_register_boot_set(pc_boot_set, *rtc_state);
=20
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
=20
 #define TYPE_I82378 "i82378"
@@ -106,7 +107,7 @@ static void i82378_realize(PCIDevice *pci, Error **er=
rp)
     isa =3D isa_create_simple(isabus, "i82374");
=20
     /* timer */
-    isa_create_simple(isabus, "mc146818rtc");
+    isa_create_simple(isabus, TYPE_MC146818_RTC);
 }
=20
 static void i82378_init(Object *obj)
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 2a2a09c9de..725e25a134 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -365,7 +365,7 @@ static void mips_fulong2e_init(MachineState *machine)
     /* Super I/O */
     isa_create_simple(isa_bus, "i8042");
=20
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
=20
     serial_hds_isa_init(isa_bus, 0, MAX_SERIAL_PORTS);
     parallel_hds_isa_init(isa_bus, 1);
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 995419344d..22a3d5169c 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -288,7 +288,7 @@ static void mips_jazz_init(MachineState *machine,
     fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), -1, 0x80003000, fds)=
;
=20
     /* Real time clock */
-    rtc_init(isa_bus, 1980, NULL);
+    mc146818_rtc_init(isa_bus, 1980, NULL);
     memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
     memory_region_add_subregion(address_space, 0x80004000, rtc);
=20
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 88b4733743..37f19428d6 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1214,7 +1214,7 @@ void mips_malta_init(MachineState *machine)
     /* Super I/O */
     isa_create_simple(isa_bus, "i8042");
=20
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
     serial_hds_isa_init(isa_bus, 0, 2);
     parallel_hds_isa_init(isa_bus, 1);
=20
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 58d7bac18b..9884ee7e9f 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -270,7 +270,7 @@ void mips_r4k_init(MachineState *machine)
     i8259 =3D i8259_init(isa_bus, env->irq[2]);
     isa_bus_irqs(isa_bus, i8259);
=20
-    rtc_init(isa_bus, 2000, NULL);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
=20
     pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c35c439d81..94ffc8e137 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -655,7 +655,7 @@ static void ppc_powernv_init(MachineState *machine)
     serial_hds_isa_init(pnv->isa_bus, 0, MAX_SERIAL_PORTS);
=20
     /* Create an RTC ISA device too */
-    rtc_init(pnv->isa_bus, 2000, NULL);
+    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
=20
     /* OpenPOWER systems use a IPMI SEL Event message to notify the
      * host to powerdown */
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 7764be25ec..35a05a64cc 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -999,7 +999,7 @@ static void rtc_realizefn(DeviceState *dev, Error **e=
rrp)
     qdev_init_gpio_out(dev, &s->irq, 1);
 }
=20
-ISADevice *rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq interc=
ept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/mc146818rt=
c.h
index 7c8e64b203..fe6ed63f71 100644
--- a/include/hw/timer/mc146818rtc.h
+++ b/include/hw/timer/mc146818rtc.h
@@ -6,7 +6,8 @@
=20
 #define TYPE_MC146818_RTC "mc146818rtc"
=20
-ISADevice *rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq);
+ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
+                             qemu_irq intercept_irq);
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
=20
--=20
2.11.0


