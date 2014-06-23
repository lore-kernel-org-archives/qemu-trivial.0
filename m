Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzDNP-0004wK-VP
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 19:10:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WzDNN-0004qG-0Q
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 19:10:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WzDNM-0002xW-7p
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 19:10:12 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WzDNK-0002wO-DV; Mon, 23 Jun 2014 19:10:10 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WzDNJ-0004Bw-Kg; Tue, 24 Jun 2014 00:10:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 00:10:09 +0100
Message-Id: <1403565009-16087-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>
Subject: [Qemu-trivial] [PATCH] hw/moxie/moxiesim.c: Remove unused
	moxie_intc_create()
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
X-List-Received-Date: Mon, 23 Jun 2014 23:10:14 -0000

The function moxie_intc_create() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In any case the recommendation these days would be to do this
kind of simple create-configure-init-wire-up inline in the
machine model code...

 hw/moxie/moxiesim.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index f4357cf..430f841 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -94,19 +94,6 @@ static void main_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-static inline DeviceState *
-moxie_intc_create(hwaddr base, qemu_irq irq, int kind_of_intr)
-{
-    DeviceState *dev;
-
-    dev = qdev_create(NULL, "moxie,intc");
-    qdev_prop_set_uint32(dev, "kind-of-intr", kind_of_intr);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-    return dev;
-}
-
 static void moxiesim_init(MachineState *machine)
 {
     MoxieCPU *cpu = NULL;
-- 
2.0.0


