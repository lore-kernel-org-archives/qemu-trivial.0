Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ywnvl-0002IB-1g
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 04:40:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvf-0002H8-Gw
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvb-0001Bc-HX
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:11 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:22088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Ywnvb-0000vn-04; Mon, 25 May 2015 04:40:07 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLV99022; Mon, 25 May 2015 16:39:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 25 May 2015 16:38:09 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 May 2015 16:37:56 +0800
Message-ID: <1432543077-12656-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 2/3] hw/ide/pci: Fix memory leak
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
X-List-Received-Date: Mon, 25 May 2015 08:40:15 -0000

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
---
 hw/ide/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 1b3d1c1..c5c4441 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -464,6 +464,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
     irq = qemu_allocate_irqs(bmdma_irq, bm, 1);
     bus->irq = *irq;
     bm->pci_dev = d;
+    g_free(irq);
 }
 
 static const TypeInfo pci_ide_type_info = {
-- 
2.0.4



