Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxweV-0002hI-89
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweC-0002J1-FD
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwe7-0003dt-IG
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:52 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwdy-0003VC-O5; Thu, 28 May 2015 08:10:39 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98085; Thu, 28 May 2015 20:10:27 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:24 +0800
Message-ID: <1432814932-12608-2-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 01/29] hw/ide/ahci.c: Fix memory leak spotted
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
X-List-Received-Date: Thu, 28 May 2015 12:10:58 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==23381== 8 bytes in 1 blocks are definitely lost in loss record 438 of 2,785
==23381==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23381==    by 0x35478F: malloc_and_trace (vl.c:2556)
==23381==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23381==    by 0x3ED98B: qemu_extend_irqs (irq.c:55)
==23381==    by 0x3EDA17: qemu_allocate_irqs (irq.c:64)
==23381==    by 0x43D767: ahci_init (ahci.c:1356)
==23381==    by 0x43DAC5: sysbus_ahci_realize (ahci.c:1520)
==23381==    by 0x3EA4CC: device_set_realized (qdev.c:1058)
==23381==    by 0x516CD2: property_set_bool (object.c:1514)
==23381==    by 0x5155CC: object_property_set (object.c:837)
==23381==    by 0x5178EE: object_property_set_qobject (qom-qobject.c:24)
==23381==    by 0x51583B: object_property_set_bool (object.c:905)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ide/ahci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 9e5d862..4702a05 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1367,6 +1367,7 @@ void ahci_init(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
         ad->port.dma->ops = &ahci_dma_ops;
         ide_register_restart_cb(&ad->port);
     }
+    g_free(irqs);
 }
 
 void ahci_uninit(AHCIState *s)
-- 
2.0.4



