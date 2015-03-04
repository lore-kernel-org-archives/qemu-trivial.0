Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHZ-0001vr-NU
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHX-0001sX-Eq
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHW-0008OF-HX
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHM-0008LE-Nq; Wed, 04 Mar 2015 16:56:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4D9CD4092B;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 25EBB966;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17546 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:48 +0300
Message-Id: <43ad3bec8542696d771c63a66d034464404e3f11.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 31/47] macio: fix possible memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 21:56:44 -0000

From: Gonglei <arei.gonglei@huawei.com>

If ret = macio_initfn_ide() is less than 0, the timer_memory
will leak the memory it points to.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/macio/macio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index e0f1e88..bf96844 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -273,7 +273,7 @@ static int macio_newworld_initfn(PCIDevice *d)
     MacIOState *s = MACIO(d);
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
     SysBusDevice *sysbus_dev;
-    MemoryRegion *timer_memory = g_new(MemoryRegion, 1);
+    MemoryRegion *timer_memory = NULL;
     int i;
     int cur_irq = 0;
     int ret = macio_common_initfn(d);
@@ -301,6 +301,7 @@ static int macio_newworld_initfn(PCIDevice *d)
     }
 
     /* Timer */
+    timer_memory = g_new(MemoryRegion, 1);
     memory_region_init_io(timer_memory, OBJECT(s), &timer_ops, NULL, "timer",
                           0x1000);
     memory_region_add_subregion(&s->bar, 0x15000, timer_memory);
-- 
2.1.4


