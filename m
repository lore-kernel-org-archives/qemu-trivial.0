Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyhDw-0000cf-VZ
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 09:54:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhDu-0000Z4-M1
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhDt-0006TA-NL
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:54:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YyhDp-0006SA-GW; Sat, 30 May 2015 09:54:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 92D5742A03;
	Sat, 30 May 2015 16:54:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 84F7793A;
	Sat, 30 May 2015 16:54:44 +0300 (MSK)
Received: (nullmailer pid 5719 invoked by uid 1000);
	Sat, 30 May 2015 13:54:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 30 May 2015 16:54:43 +0300
Message-Id: <1432994083-5677-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PATCH 2/2] hw/display/tcx.c: tcx_realizefn: fix
	memory leak,
	make FCode loading error fatal and improve error message
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
X-List-Received-Date: Sat, 30 May 2015 13:54:51 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/tcx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index a9f9f66..c2b32c3 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -1014,10 +1014,13 @@ static void tcx_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
-        if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
-            error_report("tcx: could not load prom '%s'", TCX_ROM_FILE);
-        }
     }
+    if (!fcode_filename || ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
+        error_report("tcx: could not load prom '%s'",
+                     fcode_filename ? fcode_filename : TCX_ROM_FILE);
+        exit(1);
+    }
+    g_free(fcode_filename);
 
     /* 0/DFB8 : 8-bit plane */
     s->vram = vram_base;
-- 
2.1.4


