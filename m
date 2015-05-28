Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwec-0002ud-8U
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweJ-0002P5-Vm
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweE-0003hN-5Q
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:10:59 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe0-0003VJ-1N; Thu, 28 May 2015 08:10:40 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98100; Thu, 28 May 2015 20:10:31 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:35 +0800
Message-ID: <1432814932-12608-13-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 12/29] hw/ppc/ppc440_bamboo.c: Fix memory
	leak spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:11:04 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==6366== 4,936 (256 direct, 4,680 indirect) bytes in 1 blocks are definitely lost in loss record 3,245 of 3,271
==6366==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==6366==    by 0x336F47: malloc_and_trace (vl.c:2556)
==6366==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==6366==    by 0x3C093B: qemu_extend_irqs (irq.c:55)
==6366==    by 0x3C09C7: qemu_allocate_irqs (irq.c:64)
==6366==    by 0x265091: ppcuic_init (ppc4xx_devs.c:317)
==6366==    by 0x26A90A: bamboo_init (ppc440_bamboo.c:205)
==6366==    by 0x33B312: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/ppc440_bamboo.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 778970a..23b091f 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -235,13 +235,28 @@ static void bamboo_init(MachineState *machine)
         serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[0],
                        DEVICE_BIG_ENDIAN);
+    } else {
+        qemu_free_irq(pic[0]);
     }
     if (serial_hds[1] != NULL) {
         serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
                        PPC_SERIAL_MM_BAUDBASE, serial_hds[1],
                        DEVICE_BIG_ENDIAN);
+    } else {
+        qemu_free_irq(pic[1]);
     }
 
+    for (i = 2; i < 14; i++) {
+        qemu_free_irq(pic[i]);
+    }
+    for (i = 15; i < 25; i++) {
+        qemu_free_irq(pic[i]);
+    }
+    for (i = 29; i < 32; i++) {
+        qemu_free_irq(pic[i]);
+    }
+    g_free(pic);
+
     if (pcibus) {
         /* Register network interfaces. */
         for (i = 0; i < nb_nics; i++) {
-- 
2.0.4



