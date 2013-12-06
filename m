Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0NI-0007ri-G3
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 13:43:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vp0NF-0007o3-P4
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 13:43:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vp0NE-0003qf-V7
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 13:43:37 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52105
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vp0ND-0003px-0n; Fri, 06 Dec 2013 13:43:35 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 4280A180577; Fri,  6 Dec 2013 19:43:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Fri,  6 Dec 2013 19:43:30 +0100
Message-Id: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw/arm/highbank: Simplify code (memory
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
X-List-Received-Date: Fri, 06 Dec 2013 18:43:38 -0000

The memory region can be included by value instead of by reference in the
device state (like it is done in other SoCs).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/arm/highbank.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index fe98ef1..54384b3 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -125,7 +125,7 @@ typedef struct {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion *iomem;
+    MemoryRegion iomem;
     uint32_t regs[NUM_REGS];
 } HighbankRegsState;
 
@@ -154,10 +154,9 @@ static int highbank_regs_init(SysBusDevice *dev)
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


