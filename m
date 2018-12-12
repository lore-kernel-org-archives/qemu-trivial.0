Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gX8LH-00073s-6Z
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2018 12:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LE-00070Z-8F
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1gX8LD-0001Dj-1J
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2018 12:30:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1gX8L8-0000uS-NZ; Wed, 12 Dec 2018 12:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1001D307D86D;
	Wed, 12 Dec 2018 17:30:14 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-190.brq.redhat.com
	[10.40.204.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F73B60C44;
	Wed, 12 Dec 2018 17:30:12 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Wed, 12 Dec 2018 18:30:02 +0100
Message-Id: <20181212173007.11407-2-lvivier@redhat.com>
In-Reply-To: <20181212173007.11407-1-lvivier@redhat.com>
References: <20181212173007.11407-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 12 Dec 2018 17:30:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/6] hw/dma/puv3_dma: Convert from DPRINTF()
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
 hw/dma/puv3_dma.c   | 11 +++++------
 hw/dma/trace-events |  6 ++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/dma/puv3_dma.c b/hw/dma/puv3_dma.c
index b97a6c1767..38ebb3f307 100644
--- a/hw/dma/puv3_dma.c
+++ b/hw/dma/puv3_dma.c
@@ -11,9 +11,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/sysbus.h"
-
-#undef DEBUG_PUV3
 #include "hw/unicore32/puv3.h"
+#include "trace.h"
=20
 #define PUV3_DMA_CH_NR          (6)
 #define PUV3_DMA_CH_MASK        (0xff)
@@ -42,9 +41,9 @@ static uint64_t puv3_dma_read(void *opaque, hwaddr offs=
et,
         ret =3D s->reg_CFG[PUV3_DMA_CH(offset)];
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_dma_read_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, ret);
+    trace_puv3_dma_read(offset, ret);
=20
     return ret;
 }
@@ -61,9 +60,9 @@ static void puv3_dma_write(void *opaque, hwaddr offset,
         s->reg_CFG[PUV3_DMA_CH(offset)] =3D value;
         break;
     default:
-        DPRINTF("Bad offset 0x%x\n", offset);
+        trace_puv3_dma_write_bad(offset);
     }
-    DPRINTF("offset 0x%x, value 0x%x\n", offset, value);
+    trace_puv3_dma_write(offset, value);
 }
=20
 static const MemoryRegionOps puv3_dma_ops =3D {
diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 22f53d0ff2..56d4f5a32a 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -20,3 +20,9 @@ sparc32_dma_enable_lower(void) "Lower DMA enable"
=20
 # hw/dma/i8257.c
 i8257_unregistered_dma(int nchan, int dma_pos, int dma_len) "unregistere=
d DMA channel used nchan=3D%d dma_pos=3D%d dma_len=3D%d"
+
+# hw/dma/puv3_dma.c
+puv3_dma_read_bad(unsigned offset) "Bad offset 0x%x"
+puv3_dma_read(unsigned offset, uint32_t value) "offset 0x%x, value 0x%x"
+puv3_dma_write_bad(unsigned offset) "Bad offset 0x%x"
+puv3_dma_write(unsigned offset, uint64_t value) "offset 0x%x, value 0x%"=
 PRIx64
--=20
2.19.2


