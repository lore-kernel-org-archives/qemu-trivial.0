Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwed-0002xq-DC
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweL-0002QA-4D
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweF-0003hw-Dr
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:01 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe3-0003Xv-VC; Thu, 28 May 2015 08:10:44 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98106; Thu, 28 May 2015 20:10:32 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:10:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:37 +0800
Message-ID: <1432814932-12608-15-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 14/29] hw/mips/mips_int.c: Fix memory leak
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
==24666== 64 bytes in 1 blocks are definitely lost in loss record 1,564 of 2,346
==24666==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==24666==    by 0x2F5B8B: malloc_and_trace (vl.c:2556)
==24666==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==24666==    by 0x3842F7: qemu_extend_irqs (irq.c:55)
==24666==    by 0x384383: qemu_allocate_irqs (irq.c:64)
==24666==    by 0x244186: cpu_mips_irq_init_cpu (mips_int.c:65)
==24666==    by 0x244E88: mips_fulong2e_init (mips_fulong2e.c:345)
==24666==    by 0x2F9F56: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/mips/mips_int.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index d740046..56b43da 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -66,6 +66,7 @@ void cpu_mips_irq_init_cpu(CPUMIPSState *env)
     for (i = 0; i < 8; i++) {
         env->irq[i] = qi[i];
     }
+    g_free(qi);
 }
 
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level)
-- 
2.0.4



