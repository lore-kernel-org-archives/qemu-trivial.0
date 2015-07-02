Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8M-0000Q4-JC
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8J-0000Lm-IB
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8E-0008P2-PW
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:15 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8E-0008Nt-7A; Thu, 02 Jul 2015 05:50:10 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28157; Thu, 02 Jul 2015 17:50:03 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:53 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:22 +0800
Message-ID: <1435830563-3072-10-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
References: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 09/10] hw/mips/mips_int.c: use
	qemu_allocate_irq to fix memory leak
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:16 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/mips/mips_int.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index d740046..e463a46 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -59,12 +59,11 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
 
 void cpu_mips_irq_init_cpu(CPUMIPSState *env)
 {
-    qemu_irq *qi;
     int i;
 
-    qi = qemu_allocate_irqs(cpu_mips_irq_request, mips_env_get_cpu(env), 8);
     for (i = 0; i < 8; i++) {
-        env->irq[i] = qi[i];
+        env->irq[i] = qemu_allocate_irq(cpu_mips_irq_request,
+                                        mips_env_get_cpu(env), i);
     }
 }
 
-- 
2.0.4



