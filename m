Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LK-00077r-Hc
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LF-000726-TX
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-0001Fq-DG
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L4-0000vY-Bj; Wed, 12 Dec 2018 12:30:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40FC08B10F;
	Wed, 12 Dec 2018 17:30:16 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70CD260C46;
	Wed, 12 Dec 2018 17:30:14 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:03 +0100
Message-Id: <20181212173007.11407-3-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 12 Dec 2018 17:30:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/6] hw/dma/puv3_gpio: Convert from DPRINTF()
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:39 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 Makefile.objs        |  1 +
 hw/gpio/puv3_gpio.c  | 15 +++++++--------
 hw/gpio/trace-events |  6 ++++++
 3 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 hw/gpio/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 1e1ff387d7..fbc3bad1e1 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -243,6 +243,7 @@ trace-events-subdirs +=3D hw/vfio
 trace-events-subdirs +=3D hw/virtio
 trace-events-subdirs +=3D hw/watchdog
 trace-events-subdirs +=3D hw/xen
+trace-events-subdirs +=3D hw/gpio
 trace-events-subdirs +=3D io
 trace-events-subdirs +=3D linux-user
 trace-events-subdirs +=3D migration
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index 445afccf9f..1b52b2c291 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -11,9 +11,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/sysbus.h"
-
-#undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
+#include "trace.h"
=20
 #define TYPE_PUV3_GPIO "puv3_gpio"
 #define PUV3_GPIO(obj) OBJECT_CHECK(PUV3GPIOState, (obj), TYPE_PUV3_GPIO=
)
@@ -46,9 +45,9 @@ static uint64_t puv3_gpio_read(void *opaque, hwaddr off=
set,
         ret =3D s->reg_GPIR;
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_gpio_read_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, ret);
+    trace_puv3_gpio_read(offset, ret);
=20
     return ret;
 }
@@ -58,7 +57,7 @@ static void puv3_gpio_write(void *opaque, hwaddr offset=
,
 {
     PUV3GPIOState *s =3D opaque;
=20
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, value);
+    trace_puv3_gpio_write(offset, value);
     switch (offset) {
     case 0x04:
         s->reg_GPDR =3D value;
@@ -67,14 +66,14 @@ static void puv3_gpio_write(void *opaque, hwaddr offs=
et,
         if (s->reg_GPDR & value) {
             s->reg_GPLR |=3D value;
         } else {
-            DPRINTF("Write gpio input port error!");
+            trace_puv3_gpio_write_error();
         }
         break;
     case 0x0c:
         if (s->reg_GPDR & value) {
             s->reg_GPLR &=3D ~value;
         } else {
-            DPRINTF("Write gpio input port error!");
+            trace_puv3_gpio_write_error();
         }
         break;
     case 0x10: /* GRER */
@@ -85,7 +84,7 @@ static void puv3_gpio_write(void *opaque, hwaddr offset=
,
         s->reg_GPIR =3D value;
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_gpio_write_bad(offset);
     }
 }
=20
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
new file mode 100644
index 0000000000..5708899a79
--- /dev/null
+++ b/hw/gpio/trace-events
@@ -0,0 +1,6 @@
+# hw/gpio/puv3_gpio.c
+puv3_gpio_read_bad(unsigned offset) "Bad offset 0x%x"
+puv3_gpio_read(unsigned offset, uint32_t value) "offset 0x%x, value 0x%x=
"
+puv3_gpio_write(unsigned offset, uint64_t value) "offset 0x%x, value 0x%=
" PRIx64
+puv3_gpio_write_error(void) "Write gpio input port error!"
+puv3_gpio_write_bad(unsigned offset) "Bad offset 0x%x"
--=20
2.19.2


