Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxweV-0002i9-Le
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweD-0002JS-5M
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxwe9-0003eY-6u
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:53 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45228)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwdx-0003Qt-Su; Thu, 28 May 2015 08:10:40 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98087; Thu, 28 May 2015 20:10:28 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:28 +0800
Message-ID: <1432814932-12608-6-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 05/29] hw/isa/lpc_ich9.c: Fix memory leak
	spotted by valgrind
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
==25058== 8 bytes in 1 blocks are definitely lost in loss record 623 of 3,473
==25058==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==25058==    by 0x2EB657: malloc_and_trace (vl.c:2556)
==25058==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==25058==    by 0x377C27: qemu_extend_irqs (irq.c:55)
==25058==    by 0x377CB3: qemu_allocate_irqs (irq.c:64)
==25058==    by 0x222338: ich9_lpc_pm_init (lpc_ich9.c:365)
==25058==    by 0x255C42: pc_q35_init (pc_q35.c:255)
==25058==    by 0x2EFA22: main (vl.c:4249)

Since ich9_lpc_pm_init only requests one irq, so let it just call
qemu_allocate_irq.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/isa/lpc_ich9.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index dba7585..144b210 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -360,11 +360,8 @@ static void ich9_set_sci(void *opaque, int irq_num, int level)
 void ich9_lpc_pm_init(PCIDevice *lpc_pci)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(lpc_pci);
-    qemu_irq *sci_irq;
-
-    sci_irq = qemu_allocate_irqs(ich9_set_sci, lpc, 1);
-    ich9_pm_init(lpc_pci, &lpc->pm, sci_irq[0]);
 
+    ich9_pm_init(lpc_pci, &lpc->pm, qemu_allocate_irq(ich9_set_sci, lpc, 0));
     ich9_lpc_reset(&lpc->d.qdev);
 }
 
-- 
2.0.4



