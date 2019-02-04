Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqnW7-0000z6-SY
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 18:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnW3-0000uT-6J
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:19:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnW2-0000mq-DE
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 18:19:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnVv-0000Zk-Eb; Mon, 04 Feb 2019 18:18:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4635C4E92A;
	Mon,  4 Feb 2019 23:18:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3C787A5;
	Mon,  4 Feb 2019 23:18:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jan Kiszka <jan.kiszka@web.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Beniamino Galvani <b.galvani@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>, Magnus Damm <magnus.damm@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue,  5 Feb 2019 00:18:07 +0100
Message-Id: <20190204231815.29661-4-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Feb 2019 23:18:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 03/11] hw/devices: Move TC6393XB
 declarations into a new header
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
X-List-Received-Date: Mon, 04 Feb 2019 23:19:04 -0000

The TC6393XB_RAM definition introduced in 64b40bc54a9 is no
more used since a0b753dfd39. Remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  1 +
 hw/arm/tosa.c                 |  2 +-
 hw/display/tc6393xb.c         |  2 +-
 include/hw/devices.h          | 10 ----------
 include/hw/display/tc6393xb.h | 26 ++++++++++++++++++++++++++
 5 files changed, 29 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/display/tc6393xb.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a76845581..52058a8983 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -699,6 +699,7 @@ F: hw/misc/mst_fpga.c
 F: hw/misc/max111x.c
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
+F: include/hw/display/tc6393xb.h
=20
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 7a925fa5e6..b6d464ab16 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -16,10 +16,10 @@
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "hw/arm/sharpsl.h"
 #include "hw/pcmcia.h"
 #include "hw/boards.h"
+#include "hw/display/tc6393xb.h"
 #include "hw/i2c/i2c.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index e1b1e302f2..5305c06816 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/host-utils.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
+#include "hw/display/tc6393xb.h"
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
diff --git a/include/hw/devices.h b/include/hw/devices.h
index b5f1662225..1e2141caad 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -50,14 +50,4 @@ void *tahvo_init(qemu_irq irq, int betty);
=20
 void retu_key_event(void *retu, int state);
=20
-/* tc6393xb.c */
-typedef struct TC6393xbState TC6393xbState;
-#define TC6393XB_RAM	0x110000 /* amount of ram for Video and USB */
-TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
-                             uint32_t base, qemu_irq irq);
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler);
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
-qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
-
 #endif
diff --git a/include/hw/display/tc6393xb.h b/include/hw/display/tc6393xb.=
h
new file mode 100644
index 0000000000..387c143b44
--- /dev/null
+++ b/include/hw/display/tc6393xb.h
@@ -0,0 +1,26 @@
+/*
+ * Toshiba TC6393XB I/O Controller.
+ * Found in Sharp Zaurus SL-6000 (tosa) or some
+ * Toshiba e-Series PDAs.
+ *
+ * Copyright (c) 2007 Herv=C3=A9 Poussineau
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_DISPLAY_TC6393XB_H
+#define HW_DISPLAY_TC6393XB_H
+
+#include "exec/memory.h"
+#include "hw/irq.h"
+
+typedef struct TC6393xbState TC6393xbState;
+
+TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
+                             uint32_t base, qemu_irq irq);
+void tc6393xb_gpio_out_set(TC6393xbState *s, int line, qemu_irq handler)=
;
+qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
+qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
+
+#endif
--=20
2.20.1


