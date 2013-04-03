Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNF2z-0006kC-7N
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 00:11:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2u-0006ev-SF
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2t-0007tZ-Je
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:11:36 -0400
Received: from mail-da0-x22d.google.com ([2607:f8b0:400e:c00::22d]:42189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF2t-0007tN-AY
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:11:35 -0400
Received: by mail-da0-f45.google.com with SMTP id v40so481605dad.32
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 21:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=d9XUUeCu055A3WsZVpG5cfu1qvRoAZxN9zTbxQdibwI=;
	b=DYX8CfvNJbRI1tiIPcMb4kKCkreiG8JGIiUPSeWOjCbCvcIr7Y3mVhZ8L9CFaCqQp4
	uy8T4DRQ/cvoWjRroIv0a4LWwBoPPkHvchDjPItIC11e7VCDHW3QIKioziHVE0adeX8q
	ZpkPQJC3zd/uawO3qc8VrZYox4iYZNlmF92tlBYFgzJU60AG+BFoZrua/cV2xb6ddTzO
	anhrj2yuTKZytahHsI3MCYqMwr5EODMg8gU154r2ovaLJztCNaxhzDppUnrAeRmUJ461
	71sQTdCjkLABpqZjZPzWOeBLezYwMspgR6gbOBH0apkJj/WfH+1v88270GuMuDWYIYqw
	MhLQ==
X-Received: by 10.68.253.68 with SMTP id zy4mr192057pbc.38.1364962294516;
	Tue, 02 Apr 2013 21:11:34 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id wm3sm4271313pbc.4.2013.04.02.21.11.32
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 21:11:33 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  3 Apr 2013 14:09:18 +1000
Message-Id: <23eb820038d1ab906e7efc49491945467138508d.1364961975.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQmzC1SpVwl2QISOS4C9QDzl9Lb9gHhT00PMinFF3eRuulOlLY3wz87Vyd3w0puWIx1GNPAl
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22d
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 3/4] m25p80.c: Multiple debug verbosity
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
X-List-Received-Date: Wed, 03 Apr 2013 04:11:39 -0000

The debug printfs on every page program/read is extremely verbose. Add
add second level of debug for this.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |   36 +++++++++++++++++++-----------------
 1 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index 1f7fb28..f8aa0e9 100644
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
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %dk erase size not supported by"
                       " device\n", len);
@@ -350,8 +352,8 @@ void flash_write8(Flash *s, uint64_t addr, uint8_t data)
     }
 
     if ((prev ^ data) & data) {
-        DB_PRINT("programming zero to one! addr=%lx  %x -> %x\n",
-                  addr, prev, data);
+        DB_PRINT_L(1, "programming zero to one! addr=%x  %x -> %x\n",
+                  (unsigned)addr, (unsigned)prev, (unsigned)data);
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
@@ -540,7 +542,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
     switch (s->state) {
 
     case STATE_PAGE_PROGRAM:
-        DB_PRINT("page program cur_addr=%lx data=%x\n", (unsigned)s->cur_addr,
+        DB_PRINT_L(1, "page program cur_addr=%x data=%x\n", (unsigned)s->cur_addr,
                  (unsigned)(uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr++;
@@ -548,7 +550,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
 
     case STATE_READ:
         r = s->storage[s->cur_addr];
-        DB_PRINT("READ 0x%lx=%x\n", (unsigned)s->cur_addr, (unsigned)r);
+        DB_PRINT_L(1, "READ %#x=%x\n", (unsigned)s->cur_addr, (unsigned)r);
         s->cur_addr = (s->cur_addr + 1) % s->size;
         break;
 
@@ -594,7 +596,7 @@ static int m25p80_init(SSISlave *ss)
     dinfo = drive_get_next(IF_MTD);
 
     if (dinfo && dinfo->bdrv) {
-        DB_PRINT("Binding to IF_MTD drive\n");
+        DB_PRINT_L(0, "Binding to IF_MTD drive\n");
         s->bdrv = dinfo->bdrv;
         /* FIXME: Move to late init */
         if (bdrv_read(s->bdrv, 0, s->storage, DIV_ROUND_UP(s->size,
-- 
1.7.0.4


