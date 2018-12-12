Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LM-00079y-Rz
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LG-00073P-Tp
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LF-0001IA-Vh
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L8-0000xF-Bp; Wed, 12 Dec 2018 12:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2E5D307D924;
	Wed, 12 Dec 2018 17:30:20 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D97BE60C44;
	Wed, 12 Dec 2018 17:30:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:05 +0100
Message-Id: <20181212173007.11407-5-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 12 Dec 2018 17:30:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/6] hw/misc/puv3_pm: Convert from DPRINTF()
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
X-List-Received-Date: Wed, 12 Dec 2018 17:30:44 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/misc/puv3_pm.c    | 11 +++++------
 hw/misc/trace-events |  6 ++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index 577cebaac7..4db7b1c22a 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -11,9 +11,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/sysbus.h"
-
-#undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
+#include "trace.h"
=20
 #define TYPE_PUV3_PM "puv3_pm"
 #define PUV3_PM(obj) OBJECT_CHECK(PUV3PMState, (obj), TYPE_PUV3_PM)
@@ -72,9 +71,9 @@ static uint64_t puv3_pm_read(void *opaque, hwaddr offse=
t,
         ret =3D 0x7;
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_pm_read_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, ret);
+    trace_puv3_pm_read(offset, ret);
=20
     return ret;
 }
@@ -104,9 +103,9 @@ static void puv3_pm_write(void *opaque, hwaddr offset=
,
     case 0x38:
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_pm_write_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, value);
+    trace_puv3_pm_write(offset, value);
 }
=20
 static const MemoryRegionOps puv3_pm_ops =3D {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 52466c77c4..d17a52c91d 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -132,3 +132,9 @@ iotkit_sysinfo_write(uint64_t offset, uint64_t data, =
unsigned size) "IoTKit SysI
 iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKi=
t SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
+
+# hw/misc/puv3_pm.c
+puv3_pm_read_bad(uint32_t offset) "Bad offset 0x%x"
+puv3_pm_read(uint32_t offset, uint32_t value) "offset 0x%x, value 0x%x"
+puv3_pm_write_bad(uint32_t offset) "Bad offset 0x%x"
+puv3_pm_write(uint32_t offset, uint64_t value) "offset 0x%x, value 0x%" =
PRIx64
--=20
2.19.2


