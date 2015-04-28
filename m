Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn1Yo-00057A-3C
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 05:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Yl-00050s-BE
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Yh-0000aM-2q
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:12:07 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:63228)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yn1Yg-0000Yn-G2; Tue, 28 Apr 2015 05:12:03 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BFF62302; Tue, 28 Apr 2015 17:11:13 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 28 Apr 2015 17:11:01 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 28 Apr 2015 17:11:02 +0800
Message-ID: <1430212264-9672-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.553F4EB1.0105, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9a0fe9ad3a7fb45c2d9398a5f3173cb5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Leon Alrae <leon.alrae@imgtec.com>
Subject: [Qemu-trivial] [PATCH 1/3] target-mips: fix memory leak
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
X-List-Received-Date: Tue, 28 Apr 2015 09:12:08 -0000

From: Gonglei <arei.gonglei@huawei.com>

Coveristy reports that variable prom_buf/params_buf going
out of scope leaks the storage it points to.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/mips/mips_fulong2e.c | 1 +
 hw/mips/mips_malta.c    | 1 +
 hw/mips/mips_r4k.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 4aae64a..dea941a 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -168,6 +168,7 @@ static int64_t load_kernel (CPUMIPSState *env)
     rom_add_blob_fixed("prom", prom_buf, prom_size,
                        cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
 
+    g_free(prom_buf);
     return kernel_entry;
 }
 
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index b0fa71a..482250d 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -861,6 +861,7 @@ static int64_t load_kernel (void)
     rom_add_blob_fixed("prom", prom_buf, prom_size,
                        cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
 
+    g_free(prom_buf);
     return kernel_entry;
 }
 
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 66e2a58..f4dcacd 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -139,6 +139,7 @@ static int64_t load_kernel(void)
     rom_add_blob_fixed("params", params_buf, params_size,
                        (16 << 20) - 264);
 
+    g_free(params_buf);
     return entry;
 }
 
-- 
1.7.12.4



