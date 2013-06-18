Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UottX-00029g-Jn
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 07:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UottT-00024Z-Sr
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UottS-0001IN-H8
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:16:11 -0400
Received: from mail-pd0-f169.google.com ([209.85.192.169]:45850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UottS-0001ID-7a
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 07:16:10 -0400
Received: by mail-pd0-f169.google.com with SMTP id y10so3834088pdj.28
	for <qemu-trivial@nongnu.org>; Tue, 18 Jun 2013 04:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=c8/5jL2GWjF5ft8ZNbtEwnawloD8bbqkakDLAwfPwcc=;
	b=EfaSpgp9LoWXj0aCgf3yvSugA4VDsdlAnBiNEwTKqPeVfrehhKfP7dbkdyogeweTfm
	+sSh3gPFL8ezgRiAYOORxPzU+PhexbbIZWsxUtKUY9RV8F8SUvorpez4GUsyefViq4M5
	T8J1bqwWQm+qxLZ6BvKlAGUNCYGReNCwgKNC+4HAupGjovq4UWCCGjnrZQkbygT2DPaf
	hdPEzRdMUMNWKESh4Jd/GUN2gDr9PmssGzDy+EWrttqM9RAdkSdCmJe0oI5OhFxXvKI/
	5xY1bqdorEjbNE1bh6X3IBcBs1H5IDqPn4zi0ud4RUAMaJl4Lqd/SuVlyYT1hOx5CoCW
	AyPA==
X-Received: by 10.68.56.231 with SMTP id d7mr16566980pbq.49.1371554169442;
	Tue, 18 Jun 2013 04:16:09 -0700 (PDT)
Received: from localhost ([203.126.243.116]) by mx.google.com with ESMTPSA id
	ot10sm17860606pbb.12.2013.06.18.04.16.02 for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 04:16:08 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2013 21:08:57 +1000
Message-Id: <534fb11614b284a7d3873454ea10e2c22c28fbd9.1371553360.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnV8Sp3BZ8ql8nmWSuLlcWhSACLl54gAQChEoIjP4yRV8JBZN7LOeHCwB7KOYbqPeSoVC4P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.169
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 2/5] block/nand: Formatting sweep
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
X-List-Received-Date: Tue, 18 Jun 2013 11:16:14 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Make this code closer to passing checkpatch. Mostly missing braces, but
a few rogue tabs in there as well.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/block/nand.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 6309f93..de0a022 100644
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
1.8.3.rc1.44.gb387c77.dirty


