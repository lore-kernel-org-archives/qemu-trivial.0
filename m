Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8N-0000S2-Pg
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8K-0000Lr-3q
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8G-0008Pc-Fs
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:16 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:58165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8F-0008Or-TK; Thu, 02 Jul 2015 05:50:12 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28161; Thu, 02 Jul 2015 17:50:04 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:23 +0800
Message-ID: <1435830563-3072-11-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 10/10] hw/openrisc/pic_cpu.c: use
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:17 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/openrisc/pic_cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/openrisc/pic_cpu.c b/hw/openrisc/pic_cpu.c
index 2af1d60..5060214 100644
--- a/hw/openrisc/pic_cpu.c
+++ b/hw/openrisc/pic_cpu.c
@@ -51,10 +51,8 @@ static void openrisc_pic_cpu_handler(void *opaque, int irq, int level)
 void cpu_openrisc_pic_init(OpenRISCCPU *cpu)
 {
     int i;
-    qemu_irq *qi;
-    qi = qemu_allocate_irqs(openrisc_pic_cpu_handler, cpu, NR_IRQS);
 
     for (i = 0; i < NR_IRQS; i++) {
-        cpu->env.irq[i] = qi[i];
+        cpu->env.irq[i] = qemu_allocate_irq(openrisc_pic_cpu_handler, cpu, i);
     }
 }
-- 
2.0.4



