Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhnEq-0001tX-UU
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 14:08:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC7-00011N-6f
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC5-0001AH-Dw
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:11 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmC0-00018K-MQ; Mon, 02 Jan 2012 13:01:04 -0500
Received: by mail-yw0-f45.google.com with SMTP id g71so10819143yhg.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=6BIsXAux0HJy3QpzHQDXQUhrdn3cR6y0sAlbXCmX83Q=;
	b=nyQ5e/vasUa+85ePgRlJgJQ1oBkvb7SkhBnTwrq/lv7aoqNtvJTaO73c6OW3+1tX05
	DBnX6dUU0wvZuhKG8YjffV+hsViHaQezxtCmFKjdKeGGOAXhAJkn3Qo5RANvaJHZbAAe
	QW/co21ePRgdbdRhJrFkvErYXglMWb8mggJ0I=
Received: by 10.236.141.37 with SMTP id f25mr5561199yhj.3.1325527264246;
	Mon, 02 Jan 2012 10:01:04 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:03 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:31 +0100
Message-Id: <1325527237-24146-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/8] block-migration: switch to QTAILQ
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
X-List-Received-Date: Mon, 02 Jan 2012 19:08:03 -0000

Block migration needs to insert at tail.  Use a QTAILQ, even though
the double links are strictly not necessary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block-migration.c |   44 ++++++++++++++++++++++----------------------
 1 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/block-migration.c b/block-migration.c
index 2b7edbc..b0f65c3 100644
--- a/block-migration.c
+++ b/block-migration.c
@@ -49,7 +49,7 @@ typedef struct BlkMigDevState {
     int64_t completed_sectors;
     int64_t total_sectors;
     int64_t dirty;
-    QSIMPLEQ_ENTRY(BlkMigDevState) entry;
+    QTAILQ_ENTRY(BlkMigDevState) entry;
     unsigned long *aio_bitmap;
 } BlkMigDevState;
 
@@ -62,14 +62,14 @@ typedef struct BlkMigBlock {
     QEMUIOVector qiov;
     BlockDriverAIOCB *aiocb;
     int ret;
-    QSIMPLEQ_ENTRY(BlkMigBlock) entry;
+    QTAILQ_ENTRY(BlkMigBlock) entry;
 } BlkMigBlock;
 
 typedef struct BlkMigState {
     int blk_enable;
     int shared_base;
-    QSIMPLEQ_HEAD(bmds_list, BlkMigDevState) bmds_list;
-    QSIMPLEQ_HEAD(blk_list, BlkMigBlock) blk_list;
+    QTAILQ_HEAD(bmds_list, BlkMigDevState) bmds_list;
+    QTAILQ_HEAD(blk_list, BlkMigBlock) blk_list;
     int submitted;
     int read_done;
     int transferred;
@@ -101,7 +101,7 @@ static void blk_send(QEMUFile *f, BlkMigBlock * blk)
 
 int blk_mig_active(void)
 {
-    return !QSIMPLEQ_EMPTY(&block_mig_state.bmds_list);
+    return !QTAILQ_EMPTY(&block_mig_state.bmds_list);
 }
 
 uint64_t blk_mig_bytes_transferred(void)
@@ -109,7 +109,7 @@ uint64_t blk_mig_bytes_transferred(void)
     BlkMigDevState *bmds;
     uint64_t sum = 0;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         sum += bmds->completed_sectors;
     }
     return sum << BDRV_SECTOR_BITS;
@@ -125,7 +125,7 @@ uint64_t blk_mig_bytes_total(void)
     BlkMigDevState *bmds;
     uint64_t sum = 0;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         sum += bmds->total_sectors;
     }
     return sum << BDRV_SECTOR_BITS;
@@ -194,7 +194,7 @@ static void blk_mig_read_cb(void *opaque, int ret)
     block_mig_state.total_time += (curr_time - block_mig_state.prev_time_offset);
     block_mig_state.prev_time_offset = curr_time;
 
-    QSIMPLEQ_INSERT_TAIL(&block_mig_state.blk_list, blk, entry);
+    QTAILQ_INSERT_TAIL(&block_mig_state.blk_list, blk, entry);
     bmds_set_aio_inflight(blk->bmds, blk->sector, blk->nr_sectors, 0);
 
     block_mig_state.submitted--;
@@ -263,7 +263,7 @@ static void set_dirty_tracking(int enable)
 {
     BlkMigDevState *bmds;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         bdrv_set_dirty_tracking(bmds->bs, enable);
     }
 }
@@ -301,7 +301,7 @@ static void init_blk_migration_it(void *opaque, BlockDriverState *bs)
                            bs->device_name);
         }
 
-        QSIMPLEQ_INSERT_TAIL(&block_mig_state.bmds_list, bmds, entry);
+        QTAILQ_INSERT_TAIL(&block_mig_state.bmds_list, bmds, entry);
     }
 }
 
@@ -326,7 +326,7 @@ static int blk_mig_save_bulked_block(Monitor *mon, QEMUFile *f)
     int progress;
     int ret = 0;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         if (bmds->bulk_completed == 0) {
             if (mig_save_device_bulk(mon, f, bmds) == 1) {
                 /* completed bulk section for this device */
@@ -361,7 +361,7 @@ static void blk_mig_reset_dirty_cursor(void)
 {
     BlkMigDevState *bmds;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         bmds->cur_dirty = 0;
     }
 }
@@ -438,7 +438,7 @@ static int blk_mig_save_dirty_block(Monitor *mon, QEMUFile *f, int is_async)
     BlkMigDevState *bmds;
     int ret = 0;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         if (mig_save_device_dirty(mon, f, bmds, is_async) == 0) {
             ret = 1;
             break;
@@ -456,7 +456,7 @@ static void flush_blks(QEMUFile* f)
             __FUNCTION__, block_mig_state.submitted, block_mig_state.read_done,
             block_mig_state.transferred);
 
-    while ((blk = QSIMPLEQ_FIRST(&block_mig_state.blk_list)) != NULL) {
+    while ((blk = QTAILQ_FIRST(&block_mig_state.blk_list)) != NULL) {
         if (qemu_file_rate_limit(f)) {
             break;
         }
@@ -466,7 +466,7 @@ static void flush_blks(QEMUFile* f)
         }
         blk_send(f, blk);
 
-        QSIMPLEQ_REMOVE_HEAD(&block_mig_state.blk_list, entry);
+        QTAILQ_REMOVE(&block_mig_state.blk_list, blk, entry);
         g_free(blk->buf);
         g_free(blk);
 
@@ -485,7 +485,7 @@ static int64_t get_remaining_dirty(void)
     BlkMigDevState *bmds;
     int64_t dirty = 0;
 
-    QSIMPLEQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
+    QTAILQ_FOREACH(bmds, &block_mig_state.bmds_list, entry) {
         dirty += bdrv_get_dirty_count(bmds->bs);
     }
 
@@ -525,16 +525,16 @@ static void blk_mig_cleanup(Monitor *mon)
 
     set_dirty_tracking(0);
 
-    while ((bmds = QSIMPLEQ_FIRST(&block_mig_state.bmds_list)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&block_mig_state.bmds_list, entry);
+    while ((bmds = QTAILQ_FIRST(&block_mig_state.bmds_list)) != NULL) {
+        QTAILQ_REMOVE(&block_mig_state.bmds_list, bmds, entry);
         bdrv_set_in_use(bmds->bs, 0);
         drive_put_ref(drive_get_by_blockdev(bmds->bs));
         g_free(bmds->aio_bitmap);
         g_free(bmds);
     }
 
-    while ((blk = QSIMPLEQ_FIRST(&block_mig_state.blk_list)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&block_mig_state.blk_list, entry);
+    while ((blk = QTAILQ_FIRST(&block_mig_state.blk_list)) != NULL) {
+        QTAILQ_REMOVE(&block_mig_state.blk_list, blk, entry);
         g_free(blk->buf);
         g_free(blk);
     }
@@ -717,8 +717,8 @@ static void block_set_params(int blk_enable, int shared_base, void *opaque)
 
 void blk_mig_init(void)
 {
-    QSIMPLEQ_INIT(&block_mig_state.bmds_list);
-    QSIMPLEQ_INIT(&block_mig_state.blk_list);
+    QTAILQ_INIT(&block_mig_state.bmds_list);
+    QTAILQ_INIT(&block_mig_state.blk_list);
 
     register_savevm_live(NULL, "block", 0, 1, block_set_params,
                          block_save_live, NULL, block_load, &block_mig_state);
-- 
1.7.7.1



