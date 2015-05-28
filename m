Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxvlx-0004NA-6o
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvlv-0004Jg-0K
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvlp-0001UQ-AK
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:14:46 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:18641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxvlo-0001RD-8c; Thu, 28 May 2015 07:14:41 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA87065; Thu, 28 May 2015 19:14:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 19:14:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 19:13:44 +0800
Message-ID: <1432811625-13392-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 3/4] hw/ppc/e500.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 11:14:48 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/ppc/e500.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c10e1b5..f74e6f2 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1027,9 +1027,11 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                   NULL, NULL);
         if (kernel_size < 0) {
             fprintf(stderr, "qemu: could not load firmware '%s'\n", filename);
+            g_free(filename);
             exit(1);
         }
     }
+    g_free(filename);
 
     /* Reserve space for dtb */
     dt_base = (loadaddr + bios_size + DTC_LOAD_PAD) & ~DTC_PAD_MASK;
-- 
2.0.4



