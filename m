Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW39b-0005Ec-21
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39Y-0005AZ-JC
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39W-0002M8-RN
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:48 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:44747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW39P-0002Ga-Ib; Thu, 21 Jun 2018 13:13:39 -0400
Received: by mail-qt0-x22c.google.com with SMTP id x5-v6so2802528qte.11;
	Thu, 21 Jun 2018 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8lxHEY1hwZ5p2Byd+3k4fljeLFiWOxsj4S6SPtGUAn8=;
	b=gMmu9P5yHTraKGMdiWZONbChp2vy2RX3WbyNAbrS7YvPDbiSlCEyYigwhMJBx7aGG0
	Zh6MZ7h5TR7Wuw9hn5gU8zcSwOcs/R0CtDyae25Kaq4DRkvrQeptHDzWOUm3WlGDLBZY
	SKeXC19f+2ZmzBu70whsqWgF8e3NPt3Z2iQBnLtmODzeqX8YiQ/ApQ9OI0MgnLZAFR2h
	1COjM00x0bcvVESLB7re+uee1niJJQmXIiEYeQd5+ROHjZ3LIO2k9EQGl4JCD0iK0jLk
	K/zqqK9YpaBOrlMmWjxX0CPFdo3GlGs5+eZCJJGqRD7S3yXsPQ/AWKp2AhW8cTzSgyuU
	qBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8lxHEY1hwZ5p2Byd+3k4fljeLFiWOxsj4S6SPtGUAn8=;
	b=fU+40gK5xBGoQdGc7KY7rg/qvj5VzJ3QoxmOmhDZK3KR09bz5eQTuN0FQbtUKsJ3Pl
	nIaJ06HeTZ96oiIJshuPl3cc8+G9CB712KvQCBWPCzatrMhXn29mYOIW2Qt2U4UAu3Pz
	R5ABcO5+DQpUifq9DNq50cvwIAYPDlmJh6N5xZFVs5FtppkcqZa+lXOSTykS/qsemNfg
	wOqOPdWZEjm9JKgFwV6ekRYL3wPeZ0JklxZywX8beADBVh/idwJOr5/0MkRMZYmmB8St
	08TIf4w/VhF8QzxjQA/f9gEuyKUVr7BpXeixxCZnr0kmzRqsyOncPUKDX/kbnDyk7JsO
	H01Q==
X-Gm-Message-State: APt69E0025mmAPng3xmUnl7Aiax8iqJKrcvT9nUap8Yuann5QgHaraGU
	pf0xedojufEAA0PzFH+bBZw=
X-Google-Smtp-Source: ADUXVKIGl4qBxF+QJpWktPe9YgSoCk7/7nGM6M1ftyQXt3X+81/qFMZUC/YrFs+V1FK6Iwrvuy8ZFA==
X-Received: by 2002:ac8:41d5:: with SMTP id
	o21-v6mr23905114qtm.265.1529601218871; 
	Thu, 21 Jun 2018 10:13:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Thu, 21 Jun 2018 14:12:57 -0300
Message-Id: <20180621171257.14897-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: [Qemu-trivial] [PATCH 11/11] hw/block/pflash_cfi: Convert from
 DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:50 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi01.c | 42 +++++++++++++++--------------------------
 hw/block/pflash_cfi02.c | 18 +++++++++---------
 hw/block/trace-events   | 13 +++++++++++++
 3 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index e4b5b3c273..bffb4c40e7 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -47,6 +47,7 @@
 #include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
+#include "trace.h"
 
 #define PFLASH_BUG(fmt, ...) \
 do { \
@@ -120,7 +121,7 @@ static void pflash_timer (void *opaque)
 {
     pflash_t *pfl = opaque;
 
-    DPRINTF("%s: command %02x done\n", __func__, pfl->cmd);
+    trace_pflash_timer_expired(pfl->cmd);
     /* Reset flash */
     pfl->status ^= 0x80;
     memory_region_rom_device_set_romd(&pfl->mem, true);
@@ -218,15 +219,14 @@ static uint32_t pflash_devid_query(pflash_t *pfl, hwaddr offset)
     switch (boff & 0xFF) {
     case 0:
         resp = pfl->ident0;
-        DPRINTF("%s: Manufacturer Code %04x\n", __func__, resp);
+        trace_pflash_manufacturer_id(resp);
         break;
     case 1:
         resp = pfl->ident1;
-        DPRINTF("%s: Device ID Code %04x\n", __func__, resp);
+        trace_pflash_device_id(resp);
         break;
     default:
-        DPRINTF("%s: Read Device Information offset=%x\n", __func__,
-                (unsigned)offset);
+        trace_pflash_device_info(offset);
         return 0;
         break;
     }
@@ -251,8 +251,7 @@ static uint32_t pflash_data_read(pflash_t *pfl, hwaddr offset,
     switch (width) {
     case 1:
         ret = p[offset];
-        DPRINTF("%s: data offset " TARGET_FMT_plx " %02x\n",
-                __func__, offset, ret);
+        trace_pflash_data_read8(offset, ret);
         break;
     case 2:
         if (be) {
@@ -262,8 +261,7 @@ static uint32_t pflash_data_read(pflash_t *pfl, hwaddr offset,
             ret = p[offset];
             ret |= p[offset + 1] << 8;
         }
-        DPRINTF("%s: data offset " TARGET_FMT_plx " %04x\n",
-                __func__, offset, ret);
+        trace_pflash_data_read16(offset, ret);
         break;
     case 4:
         if (be) {
@@ -277,8 +275,7 @@ static uint32_t pflash_data_read(pflash_t *pfl, hwaddr offset,
             ret |= p[offset + 2] << 16;
             ret |= p[offset + 3] << 24;
         }
-        DPRINTF("%s: data offset " TARGET_FMT_plx " %08x\n",
-                __func__, offset, ret);
+        trace_pflash_data_read32(offset, ret);
         break;
     default:
         DPRINTF("BUG in %s\n", __func__);
@@ -294,11 +291,7 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
     uint32_t ret;
 
     ret = -1;
-
-#if 0
-    DPRINTF("%s: reading offset " TARGET_FMT_plx " under cmd %02x width %d\n",
-            __func__, offset, pfl->cmd, width);
-#endif
+    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
@@ -349,15 +342,14 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
             switch (boff) {
             case 0:
                 ret = pfl->ident0 << 8 | pfl->ident1;
-                DPRINTF("%s: Manufacturer Code %04x\n", __func__, ret);
+                trace_pflash_manufacturer_id(ret);
                 break;
             case 1:
                 ret = pfl->ident2 << 8 | pfl->ident3;
-                DPRINTF("%s: Device ID Code %04x\n", __func__, ret);
+                trace_pflash_device_id(ret);
                 break;
             default:
-                DPRINTF("%s: Read Device Information boff=%x\n", __func__,
-                        (unsigned)boff);
+                trace_pflash_device_info(boff);
                 ret = 0;
                 break;
             }
@@ -425,9 +417,7 @@ static inline void pflash_data_write(pflash_t *pfl, hwaddr offset,
 {
     uint8_t *p = pfl->storage;
 
-    DPRINTF("%s: block write offset " TARGET_FMT_plx
-            " value %x counter %016" PRIx64 "\n",
-            __func__, offset, value, pfl->counter);
+    trace_pflash_data_write(offset, value, width, pfl->counter);
     switch (width) {
     case 1:
         p[offset] = value;
@@ -466,9 +456,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
 
     cmd = value;
 
-    DPRINTF("%s: writing offset " TARGET_FMT_plx " value %08x width %d wcycle 0x%x\n",
-            __func__, offset, value, width, pfl->wcycle);
-
+    trace_pflash_write(offset, value, width, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
@@ -656,8 +644,8 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  reset_flash:
+    trace_pflash_reset();
     memory_region_rom_device_set_romd(&pfl->mem, true);
-
     pfl->wcycle = 0;
     pfl->cmd = 0;
 }
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 6c18e5e578..0f8b7b8c7b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -43,6 +43,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/host-utils.h"
 #include "hw/sysbus.h"
+#include "trace.h"
 
 //#define PFLASH_DEBUG
 #ifdef PFLASH_DEBUG
@@ -124,7 +125,7 @@ static void pflash_timer (void *opaque)
 {
     pflash_t *pfl = opaque;
 
-    DPRINTF("%s: command %02x done\n", __func__, pfl->cmd);
+    trace_pflash_timer_expired(pfl->cmd);
     /* Reset flash */
     pfl->status ^= 0x80;
     if (pfl->bypass) {
@@ -143,8 +144,8 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
     uint32_t ret;
     uint8_t *p;
 
-    DPRINTF("%s: offset " TARGET_FMT_plx "\n", __func__, offset);
     ret = -1;
+    trace_pflash_read(offset, pfl->cmd, width, pfl->wcycle);
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
@@ -172,7 +173,7 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
         switch (width) {
         case 1:
             ret = p[offset];
-//            DPRINTF("%s: data offset %08x %02x\n", __func__, offset, ret);
+            trace_pflash_data_read8(offset, ret);
             break;
         case 2:
             if (be) {
@@ -182,7 +183,7 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
                 ret = p[offset];
                 ret |= p[offset + 1] << 8;
             }
-//            DPRINTF("%s: data offset %08x %04x\n", __func__, offset, ret);
+            trace_pflash_data_read16(offset, ret);
             break;
         case 4:
             if (be) {
@@ -196,7 +197,7 @@ static uint32_t pflash_read (pflash_t *pfl, hwaddr offset,
                 ret |= p[offset + 2] << 16;
                 ret |= p[offset + 3] << 24;
             }
-//            DPRINTF("%s: data offset %08x %08x\n", __func__, offset, ret);
+            trace_pflash_data_read32(offset, ret);
             break;
         }
         break;
@@ -274,8 +275,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
 #endif
         goto reset_flash;
     }
-    DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d %d\n", __func__,
-            offset, value, width, pfl->wcycle);
+    trace_pflash_write(offset, value, width, pfl->wcycle);
     offset &= pfl->chip_len - 1;
 
     DPRINTF("%s: offset " TARGET_FMT_plx " %08x %d\n", __func__,
@@ -345,8 +345,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0:
-            DPRINTF("%s: write data offset " TARGET_FMT_plx " %08x %d\n",
-                    __func__, offset, value, width);
+            trace_pflash_data_write(offset, value, width, 0);
             p = pfl->storage;
             if (!pfl->ro) {
                 switch (width) {
@@ -483,6 +482,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
 
     /* Reset flash */
  reset_flash:
+    trace_pflash_reset();
     pfl->bypass = 0;
     pfl->wcycle = 0;
     pfl->cmd = 0;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index d842c45409..f1017fac39 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -4,6 +4,19 @@
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 
+# hw/block/pflash_cfi0?.c
+pflash_reset(void) "reset"
+pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "offset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
+pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle) "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
+pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
+pflash_data_read8(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%02x"
+pflash_data_read16(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%04x"
+pflash_data_read32(uint64_t offset, uint32_t value) "data offset:0x%04"PRIx64" value:0x%08x"
+pflash_data_write(uint64_t offset, uint32_t value, int width, uint64_t counter) "data offset:0x%04"PRIx64" value:0x%08x width:%d counter:0x%016"PRIx64
+pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
+pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
+pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04lx"
+
 # hw/block/virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
 virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p ret %d"
-- 
2.18.0.rc2


