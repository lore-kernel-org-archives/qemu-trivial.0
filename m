Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwea-0002qv-BM
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweI-0002Ms-Hp
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweD-0003gi-5R
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe3-0003Zc-An; Thu, 28 May 2015 08:10:43 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98105; Thu, 28 May 2015 20:10:32 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:10 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:41 +0800
Message-ID: <1432814932-12608-19-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 18/29] hw/m68k/mcf5206.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:03 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==16659== 1,912 (112 direct, 1,800 indirect) bytes in 1 blocks are definitely lost in loss record 1,254 of 1,285
==16659==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16659==    by 0x251F97: malloc_and_trace (vl.c:2556)
==16659==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16659==    by 0x2C994F: qemu_extend_irqs (irq.c:55)
==16659==    by 0x2C99DB: qemu_allocate_irqs (irq.c:64)
==16659==    by 0x225878: mcf5206_init (mcf5206.c:539)
==16659==    by 0x223991: an5206_init (an5206.c:61)
==16659==    by 0x256362: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/m68k/mcf5206.c     | 10 ++++++++--
 include/hw/m68k/mcf.h |  3 +--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 1727a46..67390e6 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -525,10 +525,11 @@ static const MemoryRegionOps m5206_mbar_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
+void mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
 {
     m5206_mbar_state *s;
     qemu_irq *pic;
+    int i;
 
     s = (m5206_mbar_state *)g_malloc0(sizeof(m5206_mbar_state));
 
@@ -543,6 +544,11 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
     s->uart[1] = mcf_uart_init(pic[13], serial_hds[1]);
     s->cpu = cpu;
 
+    for (i = 0; i < 9; i++) {
+        qemu_free_irq(pic[i]);
+    }
+    qemu_free_irq(pic[11]);
+    g_free(pic);
+
     m5206_mbar_reset(s);
-    return pic;
 }
diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index fbc8dc2..9bf4f5f 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -24,7 +24,6 @@ void mcf_fec_init(struct MemoryRegion *sysmem, NICInfo *nd,
                   hwaddr base, qemu_irq *irq);
 
 /* mcf5206.c */
-qemu_irq *mcf5206_init(struct MemoryRegion *sysmem,
-                       uint32_t base, M68kCPU *cpu);
+void mcf5206_init(struct MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu);
 
 #endif
-- 
2.0.4



