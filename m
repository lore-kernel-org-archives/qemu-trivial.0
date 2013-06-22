Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UqKCQ-0002UQ-KA
	for mharc-qemu-trivial@gnu.org; Sat, 22 Jun 2013 05:33:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UqKCL-0002KJ-FC
	for qemu-trivial@nongnu.org; Sat, 22 Jun 2013 05:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UqKCK-0007xd-IU
	for qemu-trivial@nongnu.org; Sat, 22 Jun 2013 05:33:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UqKCF-0007to-Hu; Sat, 22 Jun 2013 05:33:27 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A058B41E5E;
	Sat, 22 Jun 2013 13:33:26 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id D76AF568; Sat, 22 Jun 2013 13:24:39 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Sat, 22 Jun 2013 13:24:30 +0400
Message-Id: <1371893076-9643-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371893076-9643-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371893076-9643-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/17] block/nand: Formatting sweep
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
X-List-Received-Date: Sat, 22 Jun 2013 09:33:34 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Make this code closer to passing checkpatch. Mostly missing braces, but
a few rogue tabs in there as well.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/nand.c |   33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 087ca14..43401a0 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -298,10 +298,8 @@ static void nand_command(NANDFlashState *s)
 
     case NAND_CMD_BLOCKERASE2:
         s->addr &= (1ull << s->addrlen * 8) - 1;
-        if (nand_flash_ids[s->chip_id].options & NAND_SAMSUNG_LP)
-            s->addr <<= 16;
-        else
-            s->addr <<= 8;
+        s->addr <<= nand_flash_ids[s->chip_id].options & NAND_SAMSUNG_LP ?
+                                                                    16 : 8;
 
         if (s->wp) {
             s->blk_erase(s);
@@ -464,10 +462,11 @@ void nand_setpins(DeviceState *dev, uint8_t cle, uint8_t ale,
     s->ce = ce;
     s->wp = wp;
     s->gnd = gnd;
-    if (wp)
+    if (wp) {
         s->status |= NAND_IOSTATUS_UNPROTCT;
-    else
+    } else {
         s->status &= ~NAND_IOSTATUS_UNPROTCT;
+    }
 }
 
 void nand_getpins(DeviceState *dev, int *rb)
@@ -489,13 +488,12 @@ void nand_setio(DeviceState *dev, uint32_t value)
                 return;
             }
         }
-        if (value == NAND_CMD_READ0)
+        if (value == NAND_CMD_READ0) {
             s->offset = 0;
-	else if (value == NAND_CMD_READ1) {
+        } else if (value == NAND_CMD_READ1) {
             s->offset = 0x100;
             value = NAND_CMD_READ0;
-        }
-	else if (value == NAND_CMD_READ2) {
+        } else if (value == NAND_CMD_READ2) {
             s->offset = 1 << s->page_shift;
             value = NAND_CMD_READ0;
         }
@@ -508,8 +506,9 @@ void nand_setio(DeviceState *dev, uint32_t value)
                 s->cmd == NAND_CMD_BLOCKERASE2 ||
                 s->cmd == NAND_CMD_NOSERIALREAD2 ||
                 s->cmd == NAND_CMD_RANDOMREAD2 ||
-                s->cmd == NAND_CMD_RESET)
+                s->cmd == NAND_CMD_RESET) {
             nand_command(s);
+        }
 
         if (s->cmd != NAND_CMD_RANDOMREAD2) {
             s->addrlen = 0;
@@ -596,8 +595,9 @@ uint32_t nand_getio(DeviceState *dev)
             s->iolen = (1 << s->page_shift) + (1 << s->oob_shift) - offset;
     }
 
-    if (s->ce || s->iolen <= 0)
+    if (s->ce || s->iolen <= 0) {
         return 0;
+    }
 
     for (offset = s->buswidth; offset--;) {
         x |= s->ioaddr[offset] << (offset << 3);
@@ -696,8 +696,9 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
     uint8_t iobuf[0x200] = { [0 ... 0x1ff] = 0xff, };
     addr = s->addr & ~((1 << (ADDR_SHIFT + s->erase_shift)) - 1);
 
-    if (PAGE(addr) >= s->pages)
+    if (PAGE(addr) >= s->pages) {
         return;
+    }
 
     if (!s->bdrv) {
         memset(s->storage + PAGE_START(addr),
@@ -725,11 +726,12 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
         memset(iobuf, 0xff, 0x200);
         i = (addr & ~0x1ff) + 0x200;
         for (addr += ((PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
-                        i < addr; i += 0x200)
+                        i < addr; i += 0x200) {
             if (bdrv_write(s->bdrv, i >> 9, iobuf, 1) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n",
                        __func__, i >> 9);
             }
+        }
 
         page = i >> 9;
         if (bdrv_read(s->bdrv, page, iobuf, 1) < 0) {
@@ -745,8 +747,9 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
 static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
                 uint64_t addr, int offset)
 {
-    if (PAGE(addr) >= s->pages)
+    if (PAGE(addr) >= s->pages) {
         return;
+    }
 
     if (s->bdrv) {
         if (s->mem_oob) {
-- 
1.7.10.4


