Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08XQ-0007Os-Sn
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:16:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XP-0007KD-0i
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08XI-0004XZ-Va
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:16:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08X4-0004Kk-RY; Wed, 03 Jun 2015 09:16:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 79B3D407A2;
	Wed,  3 Jun 2015 16:16:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 52427A55;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27424 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:26 +0300
Message-Id: <6e38a4ba7889083b65729db2144cdbcefbaa303a.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 06/30] hw/ide/pci: Fix memory leak
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
X-List-Received-Date: Wed, 03 Jun 2015 13:16:56 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==16447== 16 bytes in 2 blocks are definitely lost in loss record 1,304 of 3,310
==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16447==    by 0x36FB47: qemu_extend_irqs (irq.c:55)
==16447==    by 0x36FBD3: qemu_allocate_irqs (irq.c:64)
==16447==    by 0x3B4B44: bmdma_init (pci.c:464)
==16447==    by 0x3B547B: pci_piix_init_ports (piix.c:144)
==16447==    by 0x3B55D2: pci_piix_ide_realize (piix.c:164)
==16447==    by 0x3EAEC6: pci_qdev_realize (pci.c:1790)
==16447==    by 0x36C685: device_set_realized (qdev.c:1058)
==16447==    by 0x47179E: property_set_bool (object.c:1514)
==16447==    by 0x470098: object_property_set (object.c:837)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/pci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 1b3d1c1..4b5e32d 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -452,8 +452,6 @@ static const struct IDEDMAOps bmdma_ops = {
 
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
 {
-    qemu_irq *irq;
-
     if (bus->dma == &bm->dma) {
         return;
     }
@@ -461,8 +459,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
     bm->dma.ops = &bmdma_ops;
     bus->dma = &bm->dma;
     bm->irq = bus->irq;
-    irq = qemu_allocate_irqs(bmdma_irq, bm, 1);
-    bus->irq = *irq;
+    bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);
     bm->pci_dev = d;
 }
 
-- 
2.1.4


