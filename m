Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z090Q-0005fC-Vv
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:46:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090J-0005MB-7N
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z090F-0000vY-Qg
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:46:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0906-0000pf-Au; Wed, 03 Jun 2015 09:46:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 476AA407B3;
	Wed,  3 Jun 2015 16:46:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 932E3A63;
	Wed,  3 Jun 2015 16:08:54 +0300 (MSK)
Received: (nullmailer pid 27459 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:43 +0300
Message-Id: <5429273615e7b412402a7b22738737c09ab9f488.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 23/30] hw/alpha/typhoon.c: Fix misusing
	qemu_allocate_irqs for single irq
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
X-List-Received-Date: Wed, 03 Jun 2015 13:46:53 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/alpha/typhoon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 7df842d..421162e 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -841,7 +841,7 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
         }
     }
 
-    *p_rtc_irq = *qemu_allocate_irqs(typhoon_set_timer_irq, s, 1);
+    *p_rtc_irq = qemu_allocate_irq(typhoon_set_timer_irq, s, 0);
 
     /* Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
        but the address space hole reserved at this point is 8TB.  */
@@ -918,11 +918,11 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
     /* Init the ISA bus.  */
     /* ??? Technically there should be a cy82c693ub pci-isa bridge.  */
     {
-        qemu_irq isa_pci_irq, *isa_irqs;
+        qemu_irq *isa_irqs;
 
         *isa_bus = isa_bus_new(NULL, get_system_memory(), &s->pchip.reg_io);
-        isa_pci_irq = *qemu_allocate_irqs(typhoon_set_isa_irq, s, 1);
-        isa_irqs = i8259_init(*isa_bus, isa_pci_irq);
+        isa_irqs = i8259_init(*isa_bus,
+                              qemu_allocate_irq(typhoon_set_isa_irq, s, 0));
         isa_bus_irqs(*isa_bus, isa_irqs);
     }
 
-- 
2.1.4


