Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Z-00023p-Un
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0U-0001qr-7V
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0005fY-9N
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005dB-1w; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3FA8942FBE;
	Sat, 27 Jul 2013 11:33:29 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 4036820287F; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:21 +0400
Message-Id: <1374910406-15273-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 06/11] PPC: dbdma: macio: Fix format
	specifiers (build regression)
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:40 -0000

From: Stefan Weil <sw@weilnetz.de>

Fix a number of warnings for 32 bit builds (tested on MingW and Linux):

  CC    hw/ide/macio.o
qemu/hw/ide/macio.c: In function 'pmac_ide_atapi_transfer_cb':
qemu/hw/ide/macio.c:134:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'hwaddr' [-Werror=format]
qemu/hw/ide/macio.c: In function 'pmac_ide_transfer_cb':
qemu/hw/ide/macio.c:215:5: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'int64_t' [-Werror=format]
qemu/hw/ide/macio.c:222:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'hwaddr' [-Werror=format]
qemu/hw/ide/macio.c:264:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'hwaddr' [-Werror=format]
cc1: all warnings being treated as errors
make: *** [hw/ide/macio.o] Error 1

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Acked-by: Alexander Graf <agraf@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/macio.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 38ad924..ef4ba2b 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -131,7 +131,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
         int sector_num = (s->lba << 2) + (s->io_buffer_index >> 9);
         int nsector = io->len >> 9;
 
-        MACIO_DPRINTF("precopying unaligned %d bytes to %#lx\n",
+        MACIO_DPRINTF("precopying unaligned %d bytes to %#" HWADDR_PRIx "\n",
                       unaligned, io->addr + io->len - unaligned);
 
         bdrv_read(s->bs, sector_num + nsector, io->remainder, 1);
@@ -212,14 +212,15 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
         s->nsector -= n;
     }
 
-    MACIO_DPRINTF("remainder: %d io->len: %d nsector: %d sector_num: %ld\n",
+    MACIO_DPRINTF("remainder: %d io->len: %d nsector: %d "
+                  "sector_num: %" PRId64 "\n",
                   io->remainder_len, io->len, s->nsector, sector_num);
     if (io->remainder_len && io->len) {
         /* guest wants the rest of its previous transfer */
         int remainder_len = MIN(io->remainder_len, io->len);
         uint8_t *p = &io->remainder[0x200 - remainder_len];
 
-        MACIO_DPRINTF("copying remainder %d bytes at %#lx\n",
+        MACIO_DPRINTF("copying remainder %d bytes at %#" HWADDR_PRIx "\n",
                       remainder_len, io->addr);
 
         switch (s->dma_cmd) {
@@ -261,7 +262,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
     if (unaligned) {
         int nsector = io->len >> 9;
 
-        MACIO_DPRINTF("precopying unaligned %d bytes to %#lx\n",
+        MACIO_DPRINTF("precopying unaligned %d bytes to %#" HWADDR_PRIx "\n",
                       unaligned, io->addr + io->len - unaligned);
 
         switch (s->dma_cmd) {
-- 
1.7.10.4


