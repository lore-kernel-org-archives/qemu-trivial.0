Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqO-0006q4-CI
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqD-0006Rw-MI
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqC-0005Gj-Br
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:21 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:21696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCq9-0005E9-9L; Fri, 29 May 2015 01:28:17 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGS73955; Fri, 29 May 2015 13:28:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:28:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:27:09 +0800
Message-ID: <1432877231-5136-12-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5567F8EB.0090, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a11e9ccfc717ebcd6bb82306e9a279f5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 11/13] hw/alpha/typhoon.c: Fix misusing
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
X-List-Received-Date: Fri, 29 May 2015 05:28:23 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==7055== 8 bytes in 1 blocks are definitely lost in loss record 403 of 2,192
==7055==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==7055==    by 0x24410F: malloc_and_trace (vl.c:2556)
==7055==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x2B7A8B: qemu_extend_irqs (irq.c:55)
==7055==    by 0x2B7B17: qemu_allocate_irqs (irq.c:64)
==7055==    by 0x2197CB: typhoon_init (typhoon.c:844)
==7055==    by 0x2178FD: clipper_init (dp264.c:73)
==7055==    by 0x2484DA: main (vl.c:4249)
==7055==
==7055== 8 bytes in 1 blocks are definitely lost in loss record 404 of 2,192
==7055==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==7055==    by 0x24410F: malloc_and_trace (vl.c:2556)
==7055==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x2B7A8B: qemu_extend_irqs (irq.c:55)
==7055==    by 0x2B7B17: qemu_allocate_irqs (irq.c:64)
==7055==    by 0x219BA7: typhoon_init (typhoon.c:924)
==7055==    by 0x2178FD: clipper_init (dp264.c:73)
==7055==    by 0x2484DA: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
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
2.0.4



