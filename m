Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z09d8-00047U-Od
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 10:26:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09d1-0003tE-R0
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z09cv-0006z2-Uh
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 10:26:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z09cq-0006vU-Gl; Wed, 03 Jun 2015 10:26:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EF4C0407C7;
	Wed,  3 Jun 2015 17:26:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C31D7A5B;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27451 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:39 +0300
Message-Id: <aaaee0b273082ee2836dcc2f61a878ee291a8d9b.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 19/30] hw/ppc/prep.c: Fix misusing
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
X-List-Received-Date: Wed, 03 Jun 2015 14:26:51 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/prep.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7f52662..998ee2d 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -528,7 +528,6 @@ static void ppc_prep_init(MachineState *machine)
     PCIDevice *pci;
     ISABus *isa_bus;
     ISADevice *isa;
-    qemu_irq *cpu_exit_irq;
     int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
 
@@ -625,11 +624,11 @@ static void ppc_prep_init(MachineState *machine)
 
     /* PCI -> ISA bridge */
     pci = pci_create_simple(pci_bus, PCI_DEVFN(1, 0), "i82378");
-    cpu_exit_irq = qemu_allocate_irqs(cpu_request_exit, NULL, 1);
     cpu = POWERPC_CPU(first_cpu);
     qdev_connect_gpio_out(&pci->qdev, 0,
                           cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
-    qdev_connect_gpio_out(&pci->qdev, 1, *cpu_exit_irq);
+    qdev_connect_gpio_out(&pci->qdev, 1,
+                          qemu_allocate_irq(cpu_request_exit, NULL, 0));
     sysbus_connect_irq(&pcihost->busdev, 0, qdev_get_gpio_in(&pci->qdev, 9));
     sysbus_connect_irq(&pcihost->busdev, 1, qdev_get_gpio_in(&pci->qdev, 11));
     sysbus_connect_irq(&pcihost->busdev, 2, qdev_get_gpio_in(&pci->qdev, 9));
-- 
2.1.4


