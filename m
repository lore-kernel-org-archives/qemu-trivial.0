Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yyh8y-0006RL-OP
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 09:49:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yyh8w-0006NX-8I
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:49:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yyh8v-0005A8-GO
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 09:49:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yyh8r-000595-8a; Sat, 30 May 2015 09:49:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1B22742A03;
	Sat, 30 May 2015 16:49:27 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DB8D093A;
	Sat, 30 May 2015 16:49:26 +0300 (MSK)
Received: (nullmailer pid 5570 invoked by uid 1000);
	Sat, 30 May 2015 13:49:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 30 May 2015 16:49:26 +0300
Message-Id: <1432993766-5528-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PATCH 1/2] hw/display/cg3.c: cg3_realizefn: fix
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
X-List-Received-Date: Sat, 30 May 2015 13:49:43 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/cg3.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 1e6ff2b..5f869a7 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -302,10 +302,12 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
-        if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
-            error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
-        }
     }
+    if (!fcode_filename || ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
+        error_report("cg3: could not load prom '%s'",
+                     fcode_filename ? fcode_filename : CG3_ROM_FILE);
+    }
+    g_free(fcode_filename);
 
     memory_region_init_ram(&s->vram_mem, NULL, "cg3.vram", s->vram_size,
                            &error_abort);
-- 
2.1.4


