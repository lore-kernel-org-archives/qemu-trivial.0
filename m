Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZS-0002k5-9J
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:07:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZM-0002Yy-Jw
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZI-0003wr-HO
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003sP-0R; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 71FC1438A2;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2799A5FC;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10327 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:14 +0400
Message-Id: <1388182050-10270-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/17] hw/arm/highbank: Simplify code (memory
	region in device state)
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
X-List-Received-Date: Fri, 27 Dec 2013 22:07:52 -0000

From: Stefan Weil <sw@weilnetz.de>

The memory region can be included by value instead of by reference in the
device state.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/highbank.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c75b425..d76a1d1 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -126,7 +126,7 @@ typedef struct {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion *iomem;
+    MemoryRegion iomem;
     uint32_t regs[NUM_REGS];
 } HighbankRegsState;
 
@@ -155,10 +155,9 @@ static int highbank_regs_init(SysBusDevice *dev)
 {
     HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
 
-    s->iomem = g_new(MemoryRegion, 1);
-    memory_region_init_io(s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
+    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
                           "highbank_regs", 0x1000);
-    sysbus_init_mmio(dev, s->iomem);
+    sysbus_init_mmio(dev, &s->iomem);
 
     return 0;
 }
-- 
1.7.10.4


