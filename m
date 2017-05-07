Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GL4-0006lL-Ga
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0006gj-Vh
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GL0-0000jy-1b
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:10:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GKv-0000hg-Kf; Sun, 07 May 2017 03:10:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EA34B40481;
	Sun,  7 May 2017 10:10:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A11DE43B;
	Sun,  7 May 2017 10:02:32 +0300 (MSK)
Received: (nullmailer pid 26569 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:18 +0300
Message-Id: <cdc68b9a77e0296e2491b893763779cf2fe7a7c5.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/23] hw/core/generic-loader: Fix crash when
 running without CPU
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 07 May 2017 07:10:40 -0000

From: Thomas Huth <thuth@redhat.com>

When running QEMU with "-M none -device loader,file=kernel.elf", it
currently crashes with a segmentation fault, because the "none"-machine
does not have any CPU by default and the generic loader code tries
to dereference s->cpu. Fix it by adding an appropriate check for a
NULL pointer.

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/generic-loader.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 58f1f02902..46012673c3 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -137,20 +137,21 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
 #endif
 
     if (s->file) {
+        AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
+
         if (!s->force_raw) {
             size = load_elf_as(s->file, NULL, NULL, &entry, NULL, NULL,
-                               big_endian, 0, 0, 0, s->cpu->as);
+                               big_endian, 0, 0, 0, as);
 
             if (size < 0) {
                 size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
-                                      s->cpu->as);
+                                      as);
             }
         }
 
         if (size < 0 || s->force_raw) {
             /* Default to the maximum size being the machine's ram size */
-            size = load_image_targphys_as(s->file, s->addr, ram_size,
-                                          s->cpu->as);
+            size = load_image_targphys_as(s->file, s->addr, ram_size, as);
         } else {
             s->addr = entry;
         }
-- 
2.11.0


