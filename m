Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0B-0000qg-Qs
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh05-0000e0-9j
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000dJ-ED
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzy-0000bx-0j; Thu, 30 Apr 2015 01:26:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A972242B90;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BA8CC952;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4370 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:51 +0300
Message-Id: <22c3a64cad07503f7cdac2346cf2856e39f744a3.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gonglei <arei.gonglei@huawei.com>, Leon Alrae <leon.alrae@imgtec.com>
Subject: [Qemu-trivial] [PULL 38/42] target-mips: fix memory leak
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:06 -0000

From: Gonglei <arei.gonglei@huawei.com>

Coveristy reports that variable prom_buf/params_buf going
out of scope leaks the storage it points to.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


