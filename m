Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URtsv-0002TZ-3J
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 20:36:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsr-0002PE-3u
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsp-0003Px-PV
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:36:29 -0400
Received: from mail-pd0-f171.google.com ([209.85.192.171]:55354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtsp-0003Pq-GI
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:36:27 -0400
Received: by mail-pd0-f171.google.com with SMTP id z10so2806931pdj.30
	for <qemu-trivial@nongnu.org>; Mon, 15 Apr 2013 17:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=bDrUbwuq74wfgyGO7qldEkAGtGzs5M/eqUnns5r2sNA=;
	b=EHLuZU6mTcRx4mous5HuGGGuipUY6Yz4I0PYMf2IXhpuRVHqvIU60QKJqbXCMWF9XI
	vFZSPhlOG7CGCSiVA0F76R4L+ATQ6rTCONwwqGhQrWavPWIuls68gydXLM+8DUM2pf9P
	6rwKjKvx4GjP798b0kUJ+9zXuOWiEZwMv2n7eBFHfmYpJqITW7kXq1zyrqPhkAz+tGCK
	ysnaBe2Dksvw2udNstrobdA6/3ZyLFuMNCDnWS1zwLLAw0+L7xy7iU/z0BHcGWcN+1ZU
	R7XLmBHiCURPGBsfxgSgaHLDKbOKRKYDcq5qWe4Pt1yO867UicugnVDvlMlFD0mt/akL
	M4hg==
X-Received: by 10.68.180.132 with SMTP id do4mr82212pbc.96.1366072586659;
	Mon, 15 Apr 2013 17:36:26 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id b3sm22208479pbw.4.2013.04.15.17.36.24
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 17:36:25 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 10:34:11 +1000
Message-Id: <24615dfeb14cd4e3a9bca02123192c88e62ca27f.1366071713.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
References: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQlpYcOFsMo4UDSMTZb/g2cjH+IUH9gyuTi7R70SV9JanetRNArY9680oJXTYNCLX3NY3Ibo
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.171
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v3 3/4] m25p80.c: Multiple debug verbosity
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
X-List-Received-Date: Tue, 16 Apr 2013 00:36:31 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

The debug printfs on every page program/read is extremely verbose. Add
a second level of debug for this.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/block/m25p80.c |   40 +++++++++++++++++++++-------------------
 1 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 9a24a31..a2816c1 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -26,15 +26,17 @@
 #include "hw/ssi.h"
 #include "hw/arm/devices.h"
 
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


