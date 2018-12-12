Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LH-00074D-FS
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-00070T-74
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LD-0001Do-2S
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L9-0000wJ-21; Wed, 12 Dec 2018 12:30:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78F0013341;
	Wed, 12 Dec 2018 17:30:18 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3B0D60C44;
	Wed, 12 Dec 2018 17:30:16 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:04 +0100
Message-Id: <20181212173007.11407-4-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 12 Dec 2018 17:30:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/6] hw/dma/puv3_intc: Convert from DPRINTF()
 macro to trace event
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:37 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/intc/puv3_intc.c  | 13 ++++++-------
 hw/intc/trace-events |  7 +++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/intc/puv3_intc.c b/hw/intc/puv3_intc.c
index ef8488aacc..6c1f36bba6 100644
--- a/hw/intc/puv3_intc.c
+++ b/hw/intc/puv3_intc.c
@@ -10,9 +10,8 @@
  */
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-
-#undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
+#include "trace.h"
=20
 #define TYPE_PUV3_INTC "puv3_intc"
 #define PUV3_INTC(obj) OBJECT_CHECK(PUV3INTCState, (obj), TYPE_PUV3_INTC=
)
@@ -42,7 +41,7 @@ static void puv3_intc_handler(void *opaque, int irq, in=
t level)
 {
     PUV3INTCState *s =3D opaque;
=20
-    DPRINTF("irq 0x%x, level 0x%x\n", irq, level);
+    trace_puv3_intc_handler(irq, level);
     if (level) {
         s->reg_ICPR |=3D (1 << irq);
     } else {
@@ -65,9 +64,9 @@ static uint64_t puv3_intc_read(void *opaque, hwaddr off=
set,
         ret =3D s->reg_ICPR; /* the same value with ICPR */
         break;
     default:
-        DPRINTF("Bad offset %x\n", (int)offset);
+        trace_puv3_intc_read_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, ret);
+    trace_puv3_intc_read(offset, ret);
     return ret;
 }
=20
@@ -76,7 +75,7 @@ static void puv3_intc_write(void *opaque, hwaddr offset=
,
 {
     PUV3INTCState *s =3D opaque;
=20
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, value);
+    trace_puv3_intc_write(offset, value);
     switch (offset) {
     case 0x00: /* INTC_ICLR */
     case 0x14: /* INTC_ICCR */
@@ -85,7 +84,7 @@ static void puv3_intc_write(void *opaque, hwaddr offset=
,
         s->reg_ICMR =3D value;
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", (int)offset);
+        trace_puv3_intc_write_bad(offset);
         return;
     }
     puv3_intc_update(s);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 7769869a13..e42d0cfb2d 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -200,3 +200,10 @@ nvic_sysreg_write(uint64_t addr, uint32_t value, uns=
igned size) "NVIC sysreg wri
 heathrow_write(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx6=
4" %u: 0x%"PRIx64
 heathrow_read(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx64=
" %u: 0x%"PRIx64
 heathrow_set_irq(int num, int level) "set_irq: num=3D0x%02x level=3D%d"
+
+# hw/intc/puv3_intc.c
+puv3_intc_handler(int irq, int level) "irq 0x%x, level 0x%x"
+puv3_intc_read_bad(uint32_t offset) "Bad offset 0x%x"
+puv3_intc_read(uint32_t offset, uint32_t value) "offset 0x%x, value 0x%x=
"
+puv3_intc_write(uint32_t offset, uint64_t value) "offset 0x%x, value 0x%=
" PRIx64
+puv3_intc_write_bad(uint32_t offset) "Bad offset 0x%x"
--=20
2.19.2


