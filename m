Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwed-0002x0-24
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweK-0002PD-At
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweE-0003he-I0
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:00 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe3-0003Yd-5V; Thu, 28 May 2015 08:10:44 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98101; Thu, 28 May 2015 20:10:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:36 +0800
Message-ID: <1432814932-12608-14-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 13/29] hw/ppc/prep.c: Fix memory leak spotted
	by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:11:06 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==22156== 8 bytes in 1 blocks are definitely lost in loss record 469 of 3,966
==22156==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==22156==    by 0x337033: malloc_and_trace (vl.c:2556)
==22156==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==22156==    by 0x3C0A27: qemu_extend_irqs (irq.c:55)
==22156==    by 0x3C0AB3: qemu_allocate_irqs (irq.c:64)
==22156==    by 0x26C792: ppc_prep_init (prep.c:628)
==22156==    by 0x33B3FE: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/prep.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7f52662..310fa71 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -528,7 +528,7 @@ static void ppc_prep_init(MachineState *machine)
     PCIDevice *pci;
     ISABus *isa_bus;
     ISADevice *isa;
-    qemu_irq *cpu_exit_irq;
+    qemu_irq cpu_exit_irq;
     int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
 
@@ -625,11 +625,11 @@ static void ppc_prep_init(MachineState *machine)
 
     /* PCI -> ISA bridge */
     pci = pci_create_simple(pci_bus, PCI_DEVFN(1, 0), "i82378");
-    cpu_exit_irq = qemu_allocate_irqs(cpu_request_exit, NULL, 1);
+    cpu_exit_irq = qemu_allocate_irq(cpu_request_exit, NULL, 0);
     cpu = POWERPC_CPU(first_cpu);
     qdev_connect_gpio_out(&pci->qdev, 0,
                           cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
-    qdev_connect_gpio_out(&pci->qdev, 1, *cpu_exit_irq);
+    qdev_connect_gpio_out(&pci->qdev, 1, cpu_exit_irq);
     sysbus_connect_irq(&pcihost->busdev, 0, qdev_get_gpio_in(&pci->qdev, 9));
     sysbus_connect_irq(&pcihost->busdev, 1, qdev_get_gpio_in(&pci->qdev, 11));
     sysbus_connect_irq(&pcihost->busdev, 2, qdev_get_gpio_in(&pci->qdev, 9));
-- 
2.0.4



