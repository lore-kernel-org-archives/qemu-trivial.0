Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTg5-0003He-SV
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:34:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTfz-0003A8-Rd
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTfu-0000SL-OP
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:34:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTfk-0000Ot-LA; Tue, 24 Jun 2014 12:34:16 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B9F74407E;
	Tue, 24 Jun 2014 20:34:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1A6896B5;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15632 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:17 +0400
Message-Id: <1403626160-15546-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/14] hw/moxie/moxiesim.c: Remove unused
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
X-List-Received-Date: Tue, 24 Jun 2014 16:34:36 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The function moxie_intc_create() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/moxie/moxiesim.c |   13 -------------
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
1.7.10.4


