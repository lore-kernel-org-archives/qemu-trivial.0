Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiZx-0005Uc-4A
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:55:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZq-0005Oz-22
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZk-0001ZN-O1
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:41 -0400
Received: from mail-pd0-f174.google.com ([209.85.192.174]:57508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiZk-0001ZC-Bu
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:55:36 -0400
Received: by mail-pd0-f174.google.com with SMTP id p12so2672730pdj.19
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=LpSd48PUqLA4h82lDgNLsOqEV9cjS7G0P1nVWP99kaw=;
	b=XtJ6fkvA/qcND22iqejsehEucjZ67pGun9IkR52APoKcOD65W5sGBMluGN7dzycXP/
	YuevEq3GVRYyCDrnBIrb0c5+ZoIMNArL5Zs89n9JpBHAYSbCoFSs1SKQki1kOZ56JYjC
	YHkd/WW+dxMKlRHlFhjFhgFOf/cYgniFfZ8m0Wx6eID4ddiYuzZVS7+/wXGtlYq7wyX5
	RK8e+FPM4SXFqIvqx/Mn7bikXeg2TiXUeJEp76MqooRfHVGStioQcJ4kdqyaM0oWQjs5
	RdlxtjE3N8lbMJBmcmW5JdvF+m9r6UhWgBccGJisef+kun5c2qOxufV8xjKTgj59xpCW
	svnQ==
X-Received: by 10.66.82.132 with SMTP id i4mr25266320pay.172.1365314135470;
	Sat, 06 Apr 2013 22:55:35 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id to7sm26314878pab.0.2013.04.06.22.55.33
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 22:55:34 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun,  7 Apr 2013 15:53:32 +1000
Message-Id: <7b6749a93359d5c8b9e2e028383d0f158c7a45d0.1365313801.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQncMLWrMaGYHqfpkJfOxF3gBhyuie5YI3T1Dtr7dpzuV0nwIE9jLJVlzooG4iijFqNgW+Al
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.174
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v2 3/4] m25p80.c: Multiple debug verbosity
	levels
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
X-List-Received-Date: Sun, 07 Apr 2013 05:55:47 -0000

The debug printfs on every page program/read is extremely verbose. Add
a second level of debug for this.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |   40 +++++++++++++++++++++-------------------
 1 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index 44fc428..d853a2e 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -26,15 +26,17 @@
 #include "hw/ssi.h"
 #include "hw/devices.h"
 
-#ifdef M25P80_ERR_DEBUG
-#define DB_PRINT(...) do { \
-    fprintf(stderr,  ": %s: ", __func__); \
-    fprintf(stderr, ## __VA_ARGS__); \
-    } while (0);
-#else
-    #define DB_PRINT(...)
+#ifndef M25P80_ERR_DEBUG
+#define M25P80_ERR_DEBUG 0
 #endif
 
+#define DB_PRINT_L(level, ...) do { \
+    if (M25P80_ERR_DEBUG > (level)) { \
+        fprintf(stderr,  ": %s: ", __func__); \
+        fprintf(stderr, ## __VA_ARGS__); \
+    } \
+} while (0);
+
 /* Fields for FlashPartInfo->flags */
 
 /* erase capabilities */
@@ -317,7 +319,7 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
         abort();
     }
 
-    DB_PRINT("offset = %#x, len = %d\n", offset, len);
+    DB_PRINT_L(0, "offset = %#x, len = %d\n", offset, len);
     if ((s->pi->flags & capa_to_assert) != capa_to_assert) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d erase size not supported by"
                       " device\n", len);
@@ -350,8 +352,8 @@ void flash_write8(Flash *s, uint64_t addr, uint8_t data)
     }
 
     if ((prev ^ data) & data) {
-        DB_PRINT("programming zero to one! addr=%" PRIx64 "  %" PRIx8
-                 " -> %" PRIx8 "\n", addr, prev, data);
+        DB_PRINT_L(1, "programming zero to one! addr=%" PRIx64 "  %" PRIx8
+                   " -> %" PRIx8 "\n", addr, prev, data);
     }
 
     if (s->pi->flags & WR_1) {
@@ -404,7 +406,7 @@ static void complete_collecting_data(Flash *s)
 static void decode_new_cmd(Flash *s, uint32_t value)
 {
     s->cmd_in_progress = value;
-    DB_PRINT("decoded new command:%x\n", value);
+    DB_PRINT_L(0, "decoded new command:%x\n", value);
 
     switch (value) {
 
@@ -484,7 +486,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         break;
 
     case JEDEC_READ:
-        DB_PRINT("populated jedec code\n");
+        DB_PRINT_L(0, "populated jedec code\n");
         s->data[0] = (s->pi->jedec >> 16) & 0xff;
         s->data[1] = (s->pi->jedec >> 8) & 0xff;
         s->data[2] = s->pi->jedec & 0xff;
@@ -501,7 +503,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case BULK_ERASE:
         if (s->write_enable) {
-            DB_PRINT("chip erase\n");
+            DB_PRINT_L(0, "chip erase\n");
             flash_erase(s, 0, BULK_ERASE);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: chip erase with write "
@@ -527,7 +529,7 @@ static int m25p80_cs(SSISlave *ss, bool select)
         flash_sync_dirty(s, -1);
     }
 
-    DB_PRINT("%sselect\n", select ? "de" : "");
+    DB_PRINT_L(0, "%sselect\n", select ? "de" : "");
 
     return 0;
 }
@@ -540,16 +542,16 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
     switch (s->state) {
 
     case STATE_PAGE_PROGRAM:
-        DB_PRINT("page program cur_addr=%#" PRIx64 " data=%" PRIx8 "\n",
-                 s->cur_addr, (uint8_t)tx);
+        DB_PRINT_L(1, "page program cur_addr=%#" PRIx64 " data=%" PRIx8 "\n",
+                   s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr++;
         break;
 
     case STATE_READ:
         r = s->storage[s->cur_addr];
-        DB_PRINT("READ 0x%" PRIx64 "=%" PRIx8 "\n", s->cur_addr,
-                 (uint8_t)r);
+        DB_PRINT_L(1, "READ 0x%" PRIx64 "=%" PRIx8 "\n", s->cur_addr,
+                   (uint8_t)r);
         s->cur_addr = (s->cur_addr + 1) % s->size;
         break;
 
@@ -595,7 +597,7 @@ static int m25p80_init(SSISlave *ss)
     dinfo = drive_get_next(IF_MTD);
 
     if (dinfo && dinfo->bdrv) {
-        DB_PRINT("Binding to IF_MTD drive\n");
+        DB_PRINT_L(0, "Binding to IF_MTD drive\n");
         s->bdrv = dinfo->bdrv;
         /* FIXME: Move to late init */
         if (bdrv_read(s->bdrv, 0, s->storage, DIV_ROUND_UP(s->size,
-- 
1.7.0.4


