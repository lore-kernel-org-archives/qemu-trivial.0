Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFg22-00066P-8v
	for mharc-qemu-trivial@gnu.org; Sun, 23 Sep 2012 02:51:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFg1z-00060r-Sf
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TFg1y-0007yl-HV
	for qemu-trivial@nongnu.org; Sun, 23 Sep 2012 02:51:07 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TFg1v-0007y2-7l; Sun, 23 Sep 2012 02:51:03 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5BA04728001E; Sun, 23 Sep 2012 08:51:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2yCz-Xi2VDKS; Sun, 23 Sep 2012 08:51:01 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 87A0E7280033; Sun, 23 Sep 2012 08:51:01 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 23 Sep 2012 08:51:01 +0200
Message-Id: <1348383061-29754-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw: Fix return value check for bdrv_read,
	bdrv_write
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
X-List-Received-Date: Sun, 23 Sep 2012 06:51:09 -0000

Those functions return -errno in case of an error.
The old code would typically only detect EPERM (1) errors.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/nand.c    |   34 ++++++++++++++++++++++------------
 hw/onenand.c |    2 +-
 hw/sd.c      |   16 +++++++++-------
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/hw/nand.c b/hw/nand.c
index e9501ae..01f3ada 100644
--- a/hw/nand.c
+++ b/hw/nand.c
@@ -654,7 +654,7 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
         sector = SECTOR(s->addr);
         off = (s->addr & PAGE_MASK) + s->offset;
         soff = SECTOR_OFFSET(s->addr);
-        if (bdrv_read(s->bdrv, sector, iobuf, PAGE_SECTORS) == -1) {
+        if (bdrv_read(s->bdrv, sector, iobuf, PAGE_SECTORS) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
@@ -666,21 +666,23 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
                             MIN(OOB_SIZE, off + s->iolen - PAGE_SIZE));
         }
 
-        if (bdrv_write(s->bdrv, sector, iobuf, PAGE_SECTORS) == -1)
+        if (bdrv_write(s->bdrv, sector, iobuf, PAGE_SECTORS) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, sector);
+        }
     } else {
         off = PAGE_START(s->addr) + (s->addr & PAGE_MASK) + s->offset;
         sector = off >> 9;
         soff = off & 0x1ff;
-        if (bdrv_read(s->bdrv, sector, iobuf, PAGE_SECTORS + 2) == -1) {
+        if (bdrv_read(s->bdrv, sector, iobuf, PAGE_SECTORS + 2) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, sector);
             return;
         }
 
         mem_and(iobuf + soff, s->io, s->iolen);
 
-        if (bdrv_write(s->bdrv, sector, iobuf, PAGE_SECTORS + 2) == -1)
+        if (bdrv_write(s->bdrv, sector, iobuf, PAGE_SECTORS + 2) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, sector);
+        }
     }
     s->offset = 0;
 }
@@ -704,31 +706,37 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
         i = SECTOR(addr);
         page = SECTOR(addr + (ADDR_SHIFT + s->erase_shift));
         for (; i < page; i ++)
-            if (bdrv_write(s->bdrv, i, iobuf, 1) == -1)
+            if (bdrv_write(s->bdrv, i, iobuf, 1) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n", __func__, i);
+            }
     } else {
         addr = PAGE_START(addr);
         page = addr >> 9;
-        if (bdrv_read(s->bdrv, page, iobuf, 1) == -1)
+        if (bdrv_read(s->bdrv, page, iobuf, 1) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
+        }
         memset(iobuf + (addr & 0x1ff), 0xff, (~addr & 0x1ff) + 1);
-        if (bdrv_write(s->bdrv, page, iobuf, 1) == -1)
+        if (bdrv_write(s->bdrv, page, iobuf, 1) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, page);
+        }
 
         memset(iobuf, 0xff, 0x200);
         i = (addr & ~0x1ff) + 0x200;
         for (addr += ((PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
                         i < addr; i += 0x200)
-            if (bdrv_write(s->bdrv, i >> 9, iobuf, 1) == -1)
+            if (bdrv_write(s->bdrv, i >> 9, iobuf, 1) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n",
                        __func__, i >> 9);
+            }
 
         page = i >> 9;
-        if (bdrv_read(s->bdrv, page, iobuf, 1) == -1)
+        if (bdrv_read(s->bdrv, page, iobuf, 1) < 0) {
             printf("%s: read error in sector %" PRIu64 "\n", __func__, page);
+        }
         memset(iobuf, 0xff, ((addr - 1) & 0x1ff) + 1);
-        if (bdrv_write(s->bdrv, page, iobuf, 1) == -1)
+        if (bdrv_write(s->bdrv, page, iobuf, 1) < 0) {
             printf("%s: write error in sector %" PRIu64 "\n", __func__, page);
+        }
     }
 }
 
@@ -740,18 +748,20 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
 
     if (s->bdrv) {
         if (s->mem_oob) {
-            if (bdrv_read(s->bdrv, SECTOR(addr), s->io, PAGE_SECTORS) == -1)
+            if (bdrv_read(s->bdrv, SECTOR(addr), s->io, PAGE_SECTORS) < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, SECTOR(addr));
+            }
             memcpy(s->io + SECTOR_OFFSET(s->addr) + PAGE_SIZE,
                             s->storage + (PAGE(s->addr) << OOB_SHIFT),
                             OOB_SIZE);
             s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
         } else {
             if (bdrv_read(s->bdrv, PAGE_START(addr) >> 9,
-                                    s->io, (PAGE_SECTORS + 2)) == -1)
+                                    s->io, (PAGE_SECTORS + 2)) < 0) {
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, PAGE_START(addr) >> 9);
+            }
             s->ioaddr = s->io + (PAGE_START(addr) & 0x1ff) + offset;
         }
     } else {
diff --git a/hw/onenand.c b/hw/onenand.c
index db6af68..0f7b755 100644
--- a/hw/onenand.c
+++ b/hw/onenand.c
@@ -351,7 +351,7 @@ static inline int onenand_erase(OneNANDState *s, int sec, int num)
     for (; num > 0; num--, sec++) {
         if (s->bdrv_cur) {
             int erasesec = s->secs_cur + (sec >> 5);
-            if (bdrv_write(s->bdrv_cur, sec, blankbuf, 1)) {
+            if (bdrv_write(s->bdrv_cur, sec, blankbuf, 1) < 0) {
                 goto fail;
             }
             if (bdrv_read(s->bdrv_cur, erasesec, tmpbuf, 1) < 0) {
diff --git a/hw/sd.c b/hw/sd.c
index 62a7751..f9c3c9c 100644
--- a/hw/sd.c
+++ b/hw/sd.c
@@ -1409,7 +1409,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 
     DPRINTF("sd_blk_read: addr = 0x%08llx, len = %d\n",
             (unsigned long long) addr, len);
-    if (!sd->bdrv || bdrv_read(sd->bdrv, addr >> 9, sd->buf, 1) == -1) {
+    if (!sd->bdrv || bdrv_read(sd->bdrv, addr >> 9, sd->buf, 1) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
         return;
     }
@@ -1417,7 +1417,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
     if (end > (addr & ~511) + 512) {
         memcpy(sd->data, sd->buf + (addr & 511), 512 - (addr & 511));
 
-        if (bdrv_read(sd->bdrv, end >> 9, sd->buf, 1) == -1) {
+        if (bdrv_read(sd->bdrv, end >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_read: read error on host side\n");
             return;
         }
@@ -1431,29 +1431,31 @@ static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
     uint64_t end = addr + len;
 
     if ((addr & 511) || len < 512)
-        if (!sd->bdrv || bdrv_read(sd->bdrv, addr >> 9, sd->buf, 1) == -1) {
+        if (!sd->bdrv || bdrv_read(sd->bdrv, addr >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_write: read error on host side\n");
             return;
         }
 
     if (end > (addr & ~511) + 512) {
         memcpy(sd->buf + (addr & 511), sd->data, 512 - (addr & 511));
-        if (bdrv_write(sd->bdrv, addr >> 9, sd->buf, 1) == -1) {
+        if (bdrv_write(sd->bdrv, addr >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_write: write error on host side\n");
             return;
         }
 
-        if (bdrv_read(sd->bdrv, end >> 9, sd->buf, 1) == -1) {
+        if (bdrv_read(sd->bdrv, end >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_write: read error on host side\n");
             return;
         }
         memcpy(sd->buf, sd->data + 512 - (addr & 511), end & 511);
-        if (bdrv_write(sd->bdrv, end >> 9, sd->buf, 1) == -1)
+        if (bdrv_write(sd->bdrv, end >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_write: write error on host side\n");
+        }
     } else {
         memcpy(sd->buf + (addr & 511), sd->data, len);
-        if (!sd->bdrv || bdrv_write(sd->bdrv, addr >> 9, sd->buf, 1) == -1)
+        if (!sd->bdrv || bdrv_write(sd->bdrv, addr >> 9, sd->buf, 1) < 0) {
             fprintf(stderr, "sd_blk_write: write error on host side\n");
+        }
     }
 }
 
-- 
1.7.10


