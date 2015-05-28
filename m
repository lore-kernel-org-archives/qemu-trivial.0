Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwed-0002yq-TM
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweI-0002Mq-HB
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweA-0003fP-VH
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:58 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwdz-0003V6-Km; Thu, 28 May 2015 08:10:40 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98099; Thu, 28 May 2015 20:10:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:02 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:33 +0800
Message-ID: <1432814932-12608-11-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 10/29] hw/sparc/sun4m.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:11:06 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==23693== 8 bytes in 1 blocks are definitely lost in loss record 424 of 2,014
==23693==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23693==    by 0x21B93F: malloc_and_trace (vl.c:2556)
==23693==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x2700DF: qemu_extend_irqs (irq.c:55)
==23693==    by 0x27016B: qemu_allocate_irqs (irq.c:64)
==23693==    by 0x1EC7DE: sun4m_hw_init (sun4m.c:1027)
==23693==    by 0x1ECE17: ss5_init (sun4m.c:1374)
==23693==    by 0x21FD0A: main (vl.c:4249)
==23693==
==23693==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23693==    by 0x21B93F: malloc_and_trace (vl.c:2556)
==23693==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x2700DF: qemu_extend_irqs (irq.c:55)
==23693==    by 0x27016B: qemu_allocate_irqs (irq.c:64)
==23693==    by 0x1EC074: cpu_devinit (sun4m.c:882)
==23693==    by 0x1EC13A: sun4m_hw_init (sun4m.c:911)
==23693==    by 0x1ECE17: ss5_init (sun4m.c:1374)
==23693==    by 0x21FD0A: main (vl.c:4249)
==23693==
==23693== 1,920 bytes in 15 blocks are definitely lost in loss record 1,952 of 2,014
==23693==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23693==    by 0x21B93F: malloc_and_trace (vl.c:2556)
==23693==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x2700DF: qemu_extend_irqs (irq.c:55)
==23693==    by 0x27016B: qemu_allocate_irqs (irq.c:64)
==23693==    by 0x1EC179: sun4m_hw_init (sun4m.c:915)
==23693==    by 0x1ECE17: ss5_init (sun4m.c:1374)
==23693==    by 0x21FD0A: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/sparc/sun4m.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a69bf2d..3d5707b 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -897,7 +897,6 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
         espdma_irq, ledma_irq;
     qemu_irq esp_reset, dma_enable;
     qemu_irq fdc_tc;
-    qemu_irq *cpu_halt;
     unsigned long kernel_size;
     DriveInfo *fd[MAX_FD];
     FWCfgState *fw_cfg;
@@ -928,6 +927,10 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
                                        hwdef->intctl_base + 0x10000ULL,
                                        cpu_irqs);
 
+    for (i = 0; i < MAX_CPUS; i++) {
+        g_free(cpu_irqs[i]);
+    }
+
     for (i = 0; i < 32; i++) {
         slavio_irq[i] = qdev_get_gpio_in(slavio_intctl, i);
     }
@@ -1024,9 +1027,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
     escc_init(hwdef->serial_base, slavio_irq[15], slavio_irq[15],
               serial_hds[0], serial_hds[1], ESCC_CLOCK, 1);
 
-    cpu_halt = qemu_allocate_irqs(cpu_halt_signal, NULL, 1);
     if (hwdef->apc_base) {
-        apc_init(hwdef->apc_base, cpu_halt[0]);
+        apc_init(hwdef->apc_base, qemu_allocate_irq(cpu_halt_signal, NULL, 0));
     }
 
     if (hwdef->fd_base) {
@@ -1036,7 +1038,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
         sun4m_fdctrl_init(slavio_irq[22], hwdef->fd_base, fd,
                           &fdc_tc);
     } else {
-        fdc_tc = *qemu_allocate_irqs(dummy_fdc_tc, NULL, 1);
+        fdc_tc = qemu_allocate_irq(dummy_fdc_tc, NULL, 0);
     }
 
     slavio_misc_init(hwdef->slavio_base, hwdef->aux1_base, hwdef->aux2_base,
-- 
2.0.4



