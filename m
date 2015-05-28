Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxvmQ-000587-Ps
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:15:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxvmJ-0004u6-Tc
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxvmG-0002BA-Oz
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:11 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:18611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YxvmG-0001P6-6g; Thu, 28 May 2015 07:15:08 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA87043; Thu, 28 May 2015 19:14:25 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 19:14:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 19:13:42 +0800
Message-ID: <1432811625-13392-2-git-send-email-zhaoshenglong@huawei.com>
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
Subject: [Qemu-trivial] [PATCH 1/4] hw/display/cg3.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 11:15:18 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/display/cg3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 1e6ff2b..b86e5c0 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -302,6 +302,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
+        g_free(fcode_filename);
         if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
             error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
         }
-- 
2.0.4



