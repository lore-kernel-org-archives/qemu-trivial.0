Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LH-000750-SL
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-00070l-Cs
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LD-0001Dv-3x
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L6-0000zA-Ny; Wed, 12 Dec 2018 12:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB1103002C65;
	Wed, 12 Dec 2018 17:30:22 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E43260C44;
	Wed, 12 Dec 2018 17:30:20 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:06 +0100
Message-Id: <20181212173007.11407-6-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 12 Dec 2018 17:30:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 5/6] hw/timer/puv3_ost: Convert from
 DPRINTF() macro to trace event
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:38 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/timer/puv3_ost.c   | 14 ++++++--------
 hw/timer/trace-events |  7 +++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 0b3d717e60..387b7a9bd1 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -12,9 +12,8 @@
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "qemu/main-loop.h"
-
-#undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
+#include "trace.h"
=20
 #define TYPE_PUV3_OST "puv3_ost"
 #define PUV3_OST(obj) OBJECT_CHECK(PUV3OSTState, (obj), TYPE_PUV3_OST)
@@ -51,9 +50,9 @@ static uint64_t puv3_ost_read(void *opaque, hwaddr offs=
et,
         ret =3D s->reg_OIER;
         break;
     default:
-        DPRINTF("Bad offset %x\n", (int)offset);
+        trace_puv3_ost_read_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, ret);
+    trace_puv3_ost_read(offset, ret);
     return ret;
 }
=20
@@ -62,7 +61,7 @@ static void puv3_ost_write(void *opaque, hwaddr offset,
 {
     PUV3OSTState *s =3D opaque;
=20
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, value);
+    trace_puv3_ost_write(offset, value);
     switch (offset) {
     case 0x00: /* Match Register 0 */
         s->reg_OSMR0 =3D value;
@@ -85,7 +84,7 @@ static void puv3_ost_write(void *opaque, hwaddr offset,
         s->reg_OIER =3D value;
         break;
     default:
-        DPRINTF("Bad offset %x\n", (int)offset);
+        trace_puv3_ost_write_bad(offset);
     }
 }
=20
@@ -103,8 +102,7 @@ static void puv3_ost_tick(void *opaque)
 {
     PUV3OSTState *s =3D opaque;
=20
-    DPRINTF("ost hit when ptimer counter from 0x%x to 0x%x!\n",
-            s->reg_OSCR, s->reg_OSMR0);
+    trace_puv3_ost_tick(s->reg_OSCR, s->reg_OSMR0);
=20
     s->reg_OSCR =3D s->reg_OSMR0;
     if (s->reg_OIER) {
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 75bd3b1042..c504fd52c0 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -72,3 +72,10 @@ sun4v_rtc_write(uint64_t addr, uint64_t value) "write:=
 addr 0x%" PRIx64 " value
=20
 # hw/timer/xlnx-zynqmp-rtc.c
 xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
+
+# hw/timer/puv3_ost.c
+puv3_ost_read_bad(uint32_t offset) "Bad offset 0x%x"
+puv3_ost_read(uint32_t offset, uint32_t value) "offset 0x%x, value 0x%x"
+puv3_ost_write(uint32_t offset, uint64_t value) "offset 0x%x, value 0x%"=
 PRIx64
+puv3_ost_write_bad(uint32_t offset) "Bad offset 0x%x"
+puv3_ost_tick(uint32_t oscr, uint32_t osmr0) "ost hit when ptimer counte=
r from 0x%x to 0x%x!"
--=20
2.19.2


