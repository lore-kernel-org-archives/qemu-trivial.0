Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxx75-000863-Mn
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:40:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx72-00080n-Rh
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx6y-0008CB-RV
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:40 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:49412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxx6k-0007jz-IF; Thu, 28 May 2015 08:40:23 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR96154; Thu, 28 May 2015 20:40:04 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:39:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:39:41 +0800
Message-ID: <1432816784-12436-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.55670CA4.02B2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 647bb6553a292016f77b692714681695
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 1/4] hw/display/cg3.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:40:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/display/cg3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 1e6ff2b..186d544 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -303,8 +303,9 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
         if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
-            error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
+            error_report("cg3: could not load prom '%s'", fcode_filename);
         }
+        g_free(fcode_filename);
     }
 
     memory_region_init_ram(&s->vram_mem, NULL, "cg3.vram", s->vram_size,
-- 
2.0.4



