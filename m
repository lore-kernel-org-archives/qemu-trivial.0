Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoOL5-0000E9-B2
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 22:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WoOKu-0008Ts-4g
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 22:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WoOKk-0003A4-PG
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 22:38:56 -0400
Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229]:60386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WoOKR-00033B-HJ; Sat, 24 May 2014 22:38:28 -0400
Received: by mail-pb0-f41.google.com with SMTP id uo5so6010590pbc.28
	for <multiple recipients>; Sat, 24 May 2014 19:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HtjXUEjG7VWartLWmw3mgMJRJGY5vdNOIXyFIIf+FK4=;
	b=Ktt2b2QtmxTMeMucM08XstRmPiS47xwmiP1lSUgL0M/7UfjogSwUQdODEiyMR2d9Ml
	D6hAGBaklDcXWnQUO0RNYM/4L+Rv7gbdEDbUrLud9v1yu2UQfA3bIOmJ8g36wwbDdQSA
	6QaqGHPGxI4O3R8U5Zeq4deKyPnZvTB2ypPe55f1s1WC2Q2YKMXRSpmS1m4lc5omMS9r
	1sRI1LCk2AIyA3j+xA4OiXA0YMB99T75/xWScIDoLg0B8fTj/mK/tZICKEbGF+cIS2Ya
	Sz4dLNTIcgKOlPOdyC1/rp0HonezPvSC3q72aaBNRvIL7ARqhX8JSIVtYuvYvSdOFs2L
	Mbig==
X-Received: by 10.66.158.132 with SMTP id wu4mr17892831pab.66.1400985505974;
	Sat, 24 May 2014 19:38:25 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id
	oz7sm11456720pbc.41.2014.05.24.19.38.21 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 May 2014 19:38:25 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 May 2014 10:44:13 +0800
Message-Id: <1400985853-25594-1-git-send-email-tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::229
Cc: kwolf@redhat.com, peter.crosthwaite@xilinx.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, Le Tan <tamlokveer@gmail.com>, jan.kiszka@web.de,
	stefanha@redhat.com, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH v3] block: replace fprintf(stderr,
	...) with error_report()
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
X-List-Received-Date: Sun, 25 May 2014 02:39:05 -0000

Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
have been removed because @fmt of error_report() should not contain newline.
Also fix some coding style issues.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 block-migration.c      |    7 +-
 block.c                |   58 +++++-----
 block/qcow2-refcount.c |  274 ++++++++++++++++++++++++------------------------
 block/qcow2.c          |   54 +++++-----
 block/raw-posix.c      |  122 ++++++++++-----------
 block/raw-win32.c      |   59 ++++++-----
 block/ssh.c            |   26 ++---
 block/vdi.c            |   19 ++--
 block/vmdk.c           |   62 ++++++-----
 block/vpc.c            |   22 ++--
 block/vvfat.c          |  143 ++++++++++++-------------
 blockdev.c             |   27 +++--
 12 files changed, 441 insertions(+), 432 deletions(-)

diff --git a/block-migration.c b/block-migration.c
index 56951e0..004f548 100644
--- a/block-migration.c
+++ b/block-migration.c
@@ -33,7 +33,7 @@
 
 #define MAX_IS_ALLOCATED_SEARCH 65536
 
-//#define DEBUG_BLK_MIGRATION
+/* #define DEBUG_BLK_MIGRATION */
 
 #ifdef DEBUG_BLK_MIGRATION
 #define DPRINTF(fmt, ...) \
@@ -790,8 +790,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
 
             bs = bdrv_find(device_name);
             if (!bs) {
-                fprintf(stderr, "Error unknown block device %s\n",
-                        device_name);
+                error_report("Error unknown block device %s", device_name);
                 return -EINVAL;
             }
 
@@ -833,7 +832,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                    (addr == 100) ? '\n' : '\r');
             fflush(stdout);
         } else if (!(flags & BLK_MIG_FLAG_EOS)) {
-            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
+            error_report("Unknown block migration flags: %#x", flags);
             return -EINVAL;
         }
         ret = qemu_file_get_error(f);
diff --git a/block.c b/block.c
index c90c71a..e7f620d 100644
--- a/block.c
+++ b/block.c
@@ -453,7 +453,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
     };
 
     if (!drv->bdrv_create) {
-        error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
+        error_setg(errp, "Driver '%s' does not support image creation",
+                   drv->format_name);
         ret = -ENOTSUP;
         goto out;
     }
@@ -483,7 +484,7 @@ out:
     return ret;
 }
 
-int bdrv_create_file(const char* filename, QEMUOptionParameter *options,
+int bdrv_create_file(const char *filename, QEMUOptionParameter *options,
                      Error **errp)
 {
     BlockDriver *drv;
@@ -2186,7 +2187,7 @@ int bdrv_commit(BlockDriverState *bs)
 
     if (!drv)
         return -ENOMEDIUM;
-    
+
     if (!bs->backing_hd) {
         return -ENOTSUP;
     }
@@ -2412,8 +2413,7 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
                 continue;
             }
             if (tracked_request_overlaps(req, self->overlap_offset,
-                                         self->overlap_bytes))
-            {
+                                         self->overlap_bytes)) {
                 /* Hitting this means there was a reentrant request, for
                  * example, a block driver issuing nested requests.  This must
                  * never happen since it means deadlock.
@@ -2465,7 +2465,8 @@ int bdrv_change_backing_file(BlockDriverState *bs,
 
     if (ret == 0) {
         pstrcpy(bs->backing_file, sizeof(bs->backing_file), backing_file ?: "");
-        pstrcpy(bs->backing_format, sizeof(bs->backing_format), backing_fmt ?: "");
+        pstrcpy(bs->backing_format, sizeof(bs->backing_format),
+                backing_fmt ?: "");
     }
     return ret;
 }
@@ -2698,8 +2699,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
      * if it has been enabled.
      */
     if (bs->io_limits_enabled) {
-        fprintf(stderr, "Disabling I/O throttling on '%s' due "
-                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
+        error_report("Disabling I/O throttling on '%s' due "
+                     "to synchronous I/O.", bdrv_get_device_name(bs));
         bdrv_io_limits_disable(bs);
     }
 
@@ -3362,8 +3363,8 @@ static int coroutine_fn bdrv_co_do_pwritev(BlockDriverState *bs,
         qemu_iovec_init_external(&tail_qiov, &tail_iov, 1);
 
         BLKDBG_EVENT(bs, BLKDBG_PWRITEV_RMW_TAIL);
-        ret = bdrv_aligned_preadv(bs, &req, (offset + bytes) & ~(align - 1), align,
-                                  align, &tail_qiov, 0);
+        ret = bdrv_aligned_preadv(bs, &req, (offset + bytes) & ~(align - 1),
+                                  align, align, &tail_qiov, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -3515,7 +3516,8 @@ BlockdevOnError bdrv_get_on_error(BlockDriverState *bs, bool is_read)
     return is_read ? bs->on_read_error : bs->on_write_error;
 }
 
-BlockErrorAction bdrv_get_error_action(BlockDriverState *bs, bool is_read, int error)
+BlockErrorAction bdrv_get_error_action(BlockDriverState *bs, bool is_read,
+                                       int error)
 {
     BlockdevOnError on_err = is_read ? bs->on_read_error : bs->on_write_error;
 
@@ -4372,17 +4374,18 @@ static int multiwrite_merge(BlockDriverState *bs, BlockRequest *reqs,
 {
     int i, outidx;
 
-    // Sort requests by start sector
+    /* Sort requests by start sector */
     qsort(reqs, num_reqs, sizeof(*reqs), &multiwrite_req_compare);
 
-    // Check if adjacent requests touch the same clusters. If so, combine them,
-    // filling up gaps with zero sectors.
+    /* Check if adjacent requests touch the same clusters. If so, combine them,
+     * filling up gaps with zero sectors.
+     */
     outidx = 0;
     for (i = 1; i < num_reqs; i++) {
         int merge = 0;
         int64_t oldreq_last = reqs[outidx].sector + reqs[outidx].nb_sectors;
 
-        // Handle exactly sequential writes and overlapping writes.
+        /* Handle exactly sequential writes and overlapping writes. */
         if (reqs[i].sector <= oldreq_last) {
             merge = 1;
         }
@@ -4397,15 +4400,16 @@ static int multiwrite_merge(BlockDriverState *bs, BlockRequest *reqs,
             qemu_iovec_init(qiov,
                 reqs[outidx].qiov->niov + reqs[i].qiov->niov + 1);
 
-            // Add the first request to the merged one. If the requests are
-            // overlapping, drop the last sectors of the first request.
+            /* Add the first request to the merged one. If the requests are
+             * overlapping, drop the last sectors of the first request.
+             */
             size = (reqs[i].sector - reqs[outidx].sector) << 9;
             qemu_iovec_concat(qiov, reqs[outidx].qiov, 0, size);
 
-            // We should need to add any zeros between the two requests
-            assert (reqs[i].sector <= oldreq_last);
+            /* We should need to add any zeros between the two requests */
+            assert(reqs[i].sector <= oldreq_last);
 
-            // Add the second request
+            /* Add the second request */
             qemu_iovec_concat(qiov, reqs[i].qiov, 0, reqs[i].qiov->size);
 
             reqs[outidx].nb_sectors = qiov->size >> 9;
@@ -4454,7 +4458,7 @@ int bdrv_aio_multiwrite(BlockDriverState *bs, BlockRequest *reqs, int num_reqs)
         return 0;
     }
 
-    // Create MultiwriteCB structure
+    /* Create MultiwriteCB structure */
     mcb = g_malloc0(sizeof(*mcb) + num_reqs * sizeof(*mcb->callbacks));
     mcb->num_requests = 0;
     mcb->num_callbacks = num_reqs;
@@ -4464,7 +4468,7 @@ int bdrv_aio_multiwrite(BlockDriverState *bs, BlockRequest *reqs, int num_reqs)
         mcb->callbacks[i].opaque = reqs[i].opaque;
     }
 
-    // Check for mergable requests
+    /* Check for mergable requests */
     num_reqs = multiwrite_merge(bs, reqs, num_reqs, mcb);
 
     trace_bdrv_aio_multiwrite(mcb, mcb->num_callbacks, num_reqs);
@@ -4575,7 +4579,7 @@ typedef struct BlockDriverAIOCBCoroutine {
     BlockRequest req;
     bool is_write;
     bool *done;
-    QEMUBH* bh;
+    QEMUBH *bh;
 } BlockDriverAIOCBCoroutine;
 
 static void bdrv_aio_co_cancel_em(BlockDriverAIOCB *blockacb)
@@ -5219,7 +5223,8 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockDriverState *bs)
     return list;
 }
 
-int bdrv_get_dirty(BlockDriverState *bs, BdrvDirtyBitmap *bitmap, int64_t sector)
+int bdrv_get_dirty(BlockDriverState *bs, BdrvDirtyBitmap *bitmap,
+                   int64_t sector)
 {
     if (bitmap) {
         return hbitmap_get(bitmap->bitmap, sector);
@@ -5425,8 +5430,9 @@ void bdrv_img_create(const char *filename, const char *fmt,
         }
     }
 
-    // The size for the image must always be specified, with one exception:
-    // If we are using a backing file, we can obtain the size from there
+    /* The size for the image must always be specified, with one exception:
+     * If we are using a backing file, we can obtain the size from there
+     */
     size = get_option_parameter(param, BLOCK_OPT_SIZE);
     if (size && size->value.n == -1) {
         if (backing_file && backing_file->value.s) {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 9507aef..f1688ab 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -52,7 +52,7 @@ int qcow2_refcount_init(BlockDriverState *bs)
                          s->refcount_table, refcount_table_size2);
         if (ret != refcount_table_size2)
             goto fail;
-        for(i = 0; i < s->refcount_table_size; i++)
+        for (i = 0; i < s->refcount_table_size; i++)
             be64_to_cpus(&s->refcount_table[i]);
     }
     return 0;
@@ -104,7 +104,7 @@ static int get_refcount(BlockDriverState *bs, int64_t cluster_index)
         return 0;
 
     ret = qcow2_cache_get(bs, s->refcount_block_cache, refcount_block_offset,
-        (void**) &refcount_block);
+        (void **) &refcount_block);
     if (ret < 0) {
         return ret;
     }
@@ -114,7 +114,7 @@ static int get_refcount(BlockDriverState *bs, int64_t cluster_index)
     refcount = be16_to_cpu(refcount_block[block_index]);
 
     ret = qcow2_cache_put(bs, s->refcount_block_cache,
-        (void**) &refcount_block);
+        (void **) &refcount_block);
     if (ret < 0) {
         return ret;
     }
@@ -176,8 +176,8 @@ static int alloc_refcount_block(BlockDriverState *bs,
 
         /* If it's already there, we're done */
         if (refcount_block_offset) {
-             return load_refcount_block(bs, refcount_block_offset,
-                 (void**) refcount_block);
+            return load_refcount_block(bs, refcount_block_offset,
+                                       (void **) refcount_block);
         }
     }
 
@@ -227,7 +227,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
     if (in_same_refcount_block(s, new_block, cluster_index << s->cluster_bits)) {
         /* Zero the new refcount block before updating it */
         ret = qcow2_cache_get_empty(bs, s->refcount_block_cache, new_block,
-            (void**) refcount_block);
+            (void **) refcount_block);
         if (ret < 0) {
             goto fail_block;
         }
@@ -255,7 +255,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
         /* Initialize the new refcount block only after updating its refcount,
          * update_refcount uses the refcount cache itself */
         ret = qcow2_cache_get_empty(bs, s->refcount_block_cache, new_block,
-            (void**) refcount_block);
+            (void **) refcount_block);
         if (ret < 0) {
             goto fail_block;
         }
@@ -289,7 +289,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
         return -EAGAIN;
     }
 
-    ret = qcow2_cache_put(bs, s->refcount_block_cache, (void**) refcount_block);
+    ret = qcow2_cache_put(bs, s->refcount_block_cache, (void **) refcount_block);
     if (ret < 0) {
         goto fail_block;
     }
@@ -357,7 +357,8 @@ static int alloc_refcount_block(BlockDriverState *bs,
     }
 
     /* Fill the refcount blocks */
-    uint64_t table_clusters = size_to_clusters(s, table_size * sizeof(uint64_t));
+    uint64_t table_clusters = size_to_clusters(s,
+                                               table_size * sizeof(uint64_t));
     int block = 0;
     for (i = 0; i < table_clusters + blocks_clusters; i++) {
         new_blocks[block++] = cpu_to_be16(1);
@@ -373,7 +374,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
     }
 
     /* Write refcount table to disk */
-    for(i = 0; i < table_size; i++) {
+    for (i = 0; i < table_size; i++) {
         cpu_to_be64s(&new_table[i]);
     }
 
@@ -384,14 +385,14 @@ static int alloc_refcount_block(BlockDriverState *bs,
         goto fail_table;
     }
 
-    for(i = 0; i < table_size; i++) {
+    for (i = 0; i < table_size; i++) {
         be64_to_cpus(&new_table[i]);
     }
 
     /* Hook up the new refcount table in the qcow2 header */
     uint8_t data[12];
-    cpu_to_be64w((uint64_t*)data, table_offset);
-    cpu_to_be32w((uint32_t*)(data + 8), table_clusters);
+    cpu_to_be64w((uint64_t *)data, table_offset);
+    cpu_to_be32w((uint32_t *)(data + 8), table_clusters);
     BLKDBG_EVENT(bs->file, BLKDBG_REFBLOCK_ALLOC_SWITCH_TABLE);
     ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, refcount_table_offset),
         data, sizeof(data));
@@ -412,7 +413,7 @@ static int alloc_refcount_block(BlockDriverState *bs,
     qcow2_free_clusters(bs, old_table_offset, old_table_size * sizeof(uint64_t),
                         QCOW2_DISCARD_OTHER);
 
-    ret = load_refcount_block(bs, new_block, (void**) refcount_block);
+    ret = load_refcount_block(bs, new_block, (void **) refcount_block);
     if (ret < 0) {
         return ret;
     }
@@ -426,7 +427,7 @@ fail_table:
     g_free(new_table);
 fail_block:
     if (*refcount_block != NULL) {
-        qcow2_cache_put(bs, s->refcount_block_cache, (void**) refcount_block);
+        qcow2_cache_put(bs, s->refcount_block_cache, (void **) refcount_block);
     }
     return ret;
 }
@@ -484,8 +485,7 @@ found:
     QTAILQ_FOREACH_SAFE(p, &s->discards, next, next) {
         if (p == d
             || p->offset > d->offset + d->bytes
-            || d->offset > p->offset + p->bytes)
-        {
+            || d->offset > p->offset + p->bytes) {
             continue;
         }
 
@@ -510,8 +510,8 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
     int ret;
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "update_refcount: offset=%" PRId64 " size=%" PRId64 " addend=%d\n",
-           offset, length, addend);
+    fprintf(stderr, "update_refcount: offset=%" PRId64 " size=%" PRId64
+            " addend=%d\n", offset, length, addend);
 #endif
     if (length < 0) {
         return -EINVAL;
@@ -526,9 +526,8 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
 
     start = start_of_cluster(s, offset);
     last = start_of_cluster(s, offset + length - 1);
-    for(cluster_offset = start; cluster_offset <= last;
-        cluster_offset += s->cluster_size)
-    {
+    for (cluster_offset = start; cluster_offset <= last;
+         cluster_offset += s->cluster_size) {
         int block_index, refcount;
         int64_t cluster_index = cluster_offset >> s->cluster_bits;
         int64_t table_index =
@@ -538,7 +537,7 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
         if (table_index != old_table_index) {
             if (refcount_block) {
                 ret = qcow2_cache_put(bs, s->refcount_block_cache,
-                    (void**) &refcount_block);
+                    (void **) &refcount_block);
                 if (ret < 0) {
                     goto fail;
                 }
@@ -583,7 +582,7 @@ fail:
     if (refcount_block) {
         int wret;
         wret = qcow2_cache_put(bs, s->refcount_block_cache,
-            (void**) &refcount_block);
+            (void **) &refcount_block);
         if (wret < 0) {
             return ret < 0 ? ret : wret;
         }
@@ -643,7 +642,7 @@ static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size)
 
     nb_clusters = size_to_clusters(s, size);
 retry:
-    for(i = 0; i < nb_clusters; i++) {
+    for (i = 0; i < nb_clusters; i++) {
         uint64_t next_cluster_index = s->free_cluster_index++;
         refcount = get_refcount(bs, next_cluster_index);
 
@@ -657,8 +656,7 @@ retry:
     /* Make sure that all offsets in the "allocated" range are representable
      * in an int64_t */
     if (s->free_cluster_index > 0 &&
-        s->free_cluster_index - 1 > (INT64_MAX >> s->cluster_bits))
-    {
+        s->free_cluster_index - 1 > (INT64_MAX >> s->cluster_bits)) {
         return -EFBIG;
     }
 
@@ -708,7 +706,7 @@ int qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
     do {
         /* Check how many clusters there are free */
         cluster_index = offset >> s->cluster_bits;
-        for(i = 0; i < nb_clusters; i++) {
+        for (i = 0; i < nb_clusters; i++) {
             refcount = get_refcount(bs, cluster_index++);
 
             if (refcount < 0) {
@@ -795,7 +793,7 @@ void qcow2_free_clusters(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_CLUSTER_FREE);
     ret = update_refcount(bs, offset, size, -1, type);
     if (ret < 0) {
-        fprintf(stderr, "qcow2_free_clusters failed: %s\n", strerror(-ret));
+        error_report("qcow2_free_clusters failed: %s", strerror(-ret));
         /* TODO Remember the clusters to free them later and avoid leaking */
     }
 }
@@ -869,7 +867,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
             goto fail;
         }
 
-        for(i = 0;i < l1_size; i++)
+        for (i = 0; i < l1_size; i++)
             be64_to_cpus(&l1_table[i]);
     } else {
         assert(l1_size == s->l1_size);
@@ -877,19 +875,19 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
         l1_allocated = 0;
     }
 
-    for(i = 0; i < l1_size; i++) {
+    for (i = 0; i < l1_size; i++) {
         l2_offset = l1_table[i];
         if (l2_offset) {
             old_l2_offset = l2_offset;
             l2_offset &= L1E_OFFSET_MASK;
 
             ret = qcow2_cache_get(bs, s->l2_table_cache, l2_offset,
-                (void**) &l2_table);
+                (void **) &l2_table);
             if (ret < 0) {
                 goto fail;
             }
 
-            for(j = 0; j < s->l2_size; j++) {
+            for (j = 0; j < s->l2_size; j++) {
                 uint64_t cluster_index;
 
                 offset = be64_to_cpu(l2_table[j]);
@@ -897,50 +895,50 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                 offset &= ~QCOW_OFLAG_COPIED;
 
                 switch (qcow2_get_cluster_type(offset)) {
-                    case QCOW2_CLUSTER_COMPRESSED:
-                        nb_csectors = ((offset >> s->csize_shift) &
-                                       s->csize_mask) + 1;
-                        if (addend != 0) {
-                            ret = update_refcount(bs,
-                                (offset & s->cluster_offset_mask) & ~511,
-                                nb_csectors * 512, addend,
-                                QCOW2_DISCARD_SNAPSHOT);
-                            if (ret < 0) {
-                                goto fail;
-                            }
-                        }
-                        /* compressed clusters are never modified */
-                        refcount = 2;
-                        break;
-
-                    case QCOW2_CLUSTER_NORMAL:
-                    case QCOW2_CLUSTER_ZERO:
-                        cluster_index = (offset & L2E_OFFSET_MASK) >> s->cluster_bits;
-                        if (!cluster_index) {
-                            /* unallocated */
-                            refcount = 0;
-                            break;
-                        }
-                        if (addend != 0) {
-                            refcount = qcow2_update_cluster_refcount(bs,
-                                    cluster_index, addend,
-                                    QCOW2_DISCARD_SNAPSHOT);
-                        } else {
-                            refcount = get_refcount(bs, cluster_index);
-                        }
-
-                        if (refcount < 0) {
-                            ret = refcount;
+                case QCOW2_CLUSTER_COMPRESSED:
+                    nb_csectors = ((offset >> s->csize_shift) &
+                                   s->csize_mask) + 1;
+                    if (addend != 0) {
+                        ret = update_refcount(bs,
+                            (offset & s->cluster_offset_mask) & ~511,
+                            nb_csectors * 512, addend,
+                            QCOW2_DISCARD_SNAPSHOT);
+                        if (ret < 0) {
                             goto fail;
                         }
-                        break;
-
-                    case QCOW2_CLUSTER_UNALLOCATED:
+                    }
+                    /* compressed clusters are never modified */
+                    refcount = 2;
+                    break;
+
+                case QCOW2_CLUSTER_NORMAL:
+                case QCOW2_CLUSTER_ZERO:
+                    cluster_index = (offset & L2E_OFFSET_MASK) >> s->cluster_bits;
+                    if (!cluster_index) {
+                        /* unallocated */
                         refcount = 0;
                         break;
+                    }
+                    if (addend != 0) {
+                        refcount = qcow2_update_cluster_refcount(bs,
+                                cluster_index, addend,
+                                QCOW2_DISCARD_SNAPSHOT);
+                    } else {
+                        refcount = get_refcount(bs, cluster_index);
+                    }
 
-                    default:
-                        abort();
+                    if (refcount < 0) {
+                        ret = refcount;
+                        goto fail;
+                    }
+                    break;
+
+                case QCOW2_CLUSTER_UNALLOCATED:
+                    refcount = 0;
+                    break;
+
+                default:
+                    abort();
                 }
 
                 if (refcount == 1) {
@@ -956,7 +954,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                 }
             }
 
-            ret = qcow2_cache_put(bs, s->l2_table_cache, (void**) &l2_table);
+            ret = qcow2_cache_put(bs, s->l2_table_cache, (void **) &l2_table);
             if (ret < 0) {
                 goto fail;
             }
@@ -984,7 +982,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     ret = bdrv_flush(bs);
 fail:
     if (l2_table) {
-        qcow2_cache_put(bs, s->l2_table_cache, (void**) &l2_table);
+        qcow2_cache_put(bs, s->l2_table_cache, (void **) &l2_table);
     }
 
     s->cache_discards = false;
@@ -1036,18 +1034,18 @@ static void inc_refcounts(BlockDriverState *bs,
 
     start = start_of_cluster(s, offset);
     last = start_of_cluster(s, offset + size - 1);
-    for(cluster_offset = start; cluster_offset <= last;
+    for (cluster_offset = start; cluster_offset <= last;
         cluster_offset += s->cluster_size) {
         k = cluster_offset >> s->cluster_bits;
         if (k >= refcount_table_size) {
-            fprintf(stderr, "Warning: cluster offset=0x%" PRIx64 " is after "
-                "the end of the image file, can't properly check refcounts.\n",
-                cluster_offset);
+            error_report("Warning: cluster offset=0x%" PRIx64 " is after "
+                         "the end of the image file, can't properly check refcounts.",
+                         cluster_offset);
             res->check_errors++;
         } else {
             if (++refcount_table[k] == 0) {
-                fprintf(stderr, "ERROR: overflow cluster offset=0x%" PRIx64
-                    "\n", cluster_offset);
+                error_report("ERROR: overflow cluster offset=0x%" PRIx64,
+                             cluster_offset);
                 res->corruptions++;
             }
         }
@@ -1084,16 +1082,16 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         goto fail;
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = be64_to_cpu(l2_table[i]);
 
         switch (qcow2_get_cluster_type(l2_entry)) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-                fprintf(stderr, "ERROR: cluster %" PRId64 ": "
-                    "copied flag must never be set for compressed "
-                    "clusters\n", l2_entry >> s->cluster_bits);
+                error_report("ERROR: cluster %" PRId64 ": "
+                             "copied flag must never be set for compressed "
+                             "clusters", l2_entry >> s->cluster_bits);
                 l2_entry &= ~QCOW_OFLAG_COPIED;
                 res->corruptions++;
             }
@@ -1138,13 +1136,13 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             }
 
             /* Mark cluster as used */
-            inc_refcounts(bs, res, refcount_table,refcount_table_size,
+            inc_refcounts(bs, res, refcount_table, refcount_table_size,
                 offset, s->cluster_size);
 
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
-                fprintf(stderr, "ERROR offset=%" PRIx64 ": Cluster is not "
-                    "properly aligned; L2 entry corrupted.\n", offset);
+                error_report("ERROR offset=%" PRIx64 ": Cluster is not "
+                             "properly aligned; L2 entry corrupted.", offset);
                 res->corruptions++;
             }
             break;
@@ -1162,7 +1160,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
+    error_report("ERROR: I/O error in check_refcounts_l2");
     g_free(l2_table);
     return -EIO;
 }
@@ -1200,12 +1198,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
         if (bdrv_pread(bs->file, l1_table_offset,
                        l1_table, l1_size2) != l1_size2)
             goto fail;
-        for(i = 0;i < l1_size; i++)
+        for (i = 0; i < l1_size; i++)
             be64_to_cpus(&l1_table[i]);
     }
 
     /* Do the actual checks */
-    for(i = 0; i < l1_size; i++) {
+    for (i = 0; i < l1_size; i++) {
         l2_offset = l1_table[i];
         if (l2_offset) {
             /* Mark L2 table as used */
@@ -1215,8 +1213,8 @@ static int check_refcounts_l1(BlockDriverState *bs,
 
             /* L2 tables are cluster aligned */
             if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
+                error_report("ERROR l2_offset=%" PRIx64 ": Table is not "
+                             "cluster aligned; L1 entry corrupted", l2_offset);
                 res->corruptions++;
             }
 
@@ -1232,7 +1230,7 @@ static int check_refcounts_l1(BlockDriverState *bs,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+    error_report("ERROR: I/O error in check_refcounts_l1");
     res->check_errors++;
     g_free(l1_table);
     return -EIO;
@@ -1270,11 +1268,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
             continue;
         }
         if ((refcount == 1) != ((l1_entry & QCOW_OFLAG_COPIED) != 0)) {
-            fprintf(stderr, "%s OFLAG_COPIED L2 cluster: l1_index=%d "
-                    "l1_entry=%" PRIx64 " refcount=%d\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" :
-                                            "ERROR",
-                    i, l1_entry, refcount);
+            error_report("%s OFLAG_COPIED L2 cluster: l1_index=%d "
+                         "l1_entry=%" PRIx64 " refcount=%d",
+                         fix & BDRV_FIX_ERRORS ? "Repairing" :
+                                                 "ERROR",
+                         i, l1_entry, refcount);
             if (fix & BDRV_FIX_ERRORS) {
                 s->l1_table[i] = refcount == 1
                                ? l1_entry |  QCOW_OFLAG_COPIED
@@ -1293,7 +1291,7 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
         ret = bdrv_pread(bs->file, l2_offset, l2_table,
                          s->l2_size * sizeof(uint64_t));
         if (ret < 0) {
-            fprintf(stderr, "ERROR: Could not read L2 table: %s\n",
+            error_report("ERROR: Could not read L2 table: %s",
                     strerror(-ret));
             res->check_errors++;
             goto fail;
@@ -1312,11 +1310,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
                     continue;
                 }
                 if ((refcount == 1) != ((l2_entry & QCOW_OFLAG_COPIED) != 0)) {
-                    fprintf(stderr, "%s OFLAG_COPIED data cluster: "
-                            "l2_entry=%" PRIx64 " refcount=%d\n",
-                            fix & BDRV_FIX_ERRORS ? "Repairing" :
-                                                    "ERROR",
-                            l2_entry, refcount);
+                    error_report("%s OFLAG_COPIED data cluster: "
+                                 "l2_entry=%" PRIx64 " refcount=%d",
+                                 fix & BDRV_FIX_ERRORS ? "Repairing" :
+                                                         "ERROR",
+                                 l2_entry, refcount);
                     if (fix & BDRV_FIX_ERRORS) {
                         l2_table[j] = cpu_to_be64(refcount == 1
                                     ? l2_entry |  QCOW_OFLAG_COPIED
@@ -1334,16 +1332,16 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
             ret = qcow2_pre_write_overlap_check(bs, QCOW2_OL_ACTIVE_L2,
                                                 l2_offset, s->cluster_size);
             if (ret < 0) {
-                fprintf(stderr, "ERROR: Could not write L2 table; metadata "
-                        "overlap check failed: %s\n", strerror(-ret));
+                error_report("ERROR: Could not write L2 table; metadata "
+                             "overlap check failed: %s", strerror(-ret));
                 res->check_errors++;
                 goto fail;
             }
 
             ret = bdrv_pwrite(bs->file, l2_offset, l2_table, s->cluster_size);
             if (ret < 0) {
-                fprintf(stderr, "ERROR: Could not write L2 table: %s\n",
-                        strerror(-ret));
+                error_report("ERROR: Could not write L2 table: %s",
+                             strerror(-ret));
                 res->check_errors++;
                 goto fail;
             }
@@ -1409,8 +1407,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     /* allocate new refcount block */
     new_offset = qcow2_alloc_clusters(bs, s->cluster_size);
     if (new_offset < 0) {
-        fprintf(stderr, "Could not allocate new cluster: %s\n",
-                strerror(-new_offset));
+        error_report("Could not allocate new cluster: %s",
+                     strerror(-new_offset));
         ret = new_offset;
         goto done;
     }
@@ -1418,7 +1416,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     /* fetch current refcount block content */
     ret = qcow2_cache_get(bs, s->refcount_block_cache, offset, &refcount_block);
     if (ret < 0) {
-        fprintf(stderr, "Could not fetch refcount block: %s\n", strerror(-ret));
+        error_report("Could not fetch refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1426,8 +1424,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
      * no refcount block yet (regarding this check) */
     ret = qcow2_pre_write_overlap_check(bs, 0, new_offset, s->cluster_size);
     if (ret < 0) {
-        fprintf(stderr, "Could not write refcount block; metadata overlap "
-                "check failed: %s\n", strerror(-ret));
+        error_report("Could not write refcount block; metadata overlap "
+                     "check failed: %s", strerror(-ret));
         /* the image will be marked corrupt, so don't even attempt on freeing
          * the cluster */
         goto done;
@@ -1437,7 +1435,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     ret = bdrv_write(bs->file, new_offset / BDRV_SECTOR_SIZE, refcount_block,
             s->cluster_sectors);
     if (ret < 0) {
-        fprintf(stderr, "Could not write refcount block: %s\n", strerror(-ret));
+        error_report("Could not write refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1446,8 +1444,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     s->refcount_table[reftable_index] = new_offset;
     ret = write_reftable_entry(bs, reftable_index);
     if (ret < 0) {
-        fprintf(stderr, "Could not update refcount table: %s\n",
-                strerror(-ret));
+        error_report("Could not update refcount table: %s",
+                     strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1517,10 +1515,10 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     }
 
     /* snapshots */
-    for(i = 0; i < s->nb_snapshots; i++) {
+    for (i = 0; i < s->nb_snapshots; i++) {
         sn = s->snapshots + i;
         ret = check_refcounts_l1(bs, res, refcount_table, nb_clusters,
-            sn->l1_table_offset, sn->l1_size, 0);
+                                 sn->l1_table_offset, sn->l1_size, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -1533,22 +1531,22 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
         s->refcount_table_offset,
         s->refcount_table_size * sizeof(uint64_t));
 
-    for(i = 0; i < s->refcount_table_size; i++) {
+    for (i = 0; i < s->refcount_table_size; i++) {
         uint64_t offset, cluster;
         offset = s->refcount_table[i];
         cluster = offset >> s->cluster_bits;
 
         /* Refcount blocks are cluster aligned */
         if (offset_into_cluster(s, offset)) {
-            fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
-                "cluster aligned; refcount table entry corrupted\n", i);
+            error_report("ERROR refcount block %" PRId64 " is not "
+                         "cluster aligned; refcount table entry corrupted", i);
             res->corruptions++;
             continue;
         }
 
         if (cluster >= nb_clusters) {
-            fprintf(stderr, "ERROR refcount block %" PRId64
-                    " is outside image\n", i);
+            error_report("ERROR refcount block %" PRId64
+                        " is outside image", i);
             res->corruptions++;
             continue;
         }
@@ -1557,11 +1555,11 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
             inc_refcounts(bs, res, refcount_table, nb_clusters,
                 offset, s->cluster_size);
             if (refcount_table[cluster] != 1) {
-                fprintf(stderr, "%s refcount block %" PRId64
-                    " refcount=%d\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" :
-                                            "ERROR",
-                    i, refcount_table[cluster]);
+                error_report("%s refcount block %" PRId64
+                             " refcount=%d",
+                             fix & BDRV_FIX_ERRORS ? "Repairing" :
+                                                     "ERROR",
+                             i, refcount_table[cluster]);
 
                 if (fix & BDRV_FIX_ERRORS) {
                     int64_t new_offset;
@@ -1598,8 +1596,8 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     for (i = 0, highest_cluster = 0; i < nb_clusters; i++) {
         refcount1 = get_refcount(bs, i);
         if (refcount1 < 0) {
-            fprintf(stderr, "Can't get refcount for cluster %" PRId64 ": %s\n",
-                i, strerror(-refcount1));
+            error_report("Can't get refcount for cluster %" PRId64 ": %s",
+                         i, strerror(-refcount1));
             res->check_errors++;
             continue;
         }
@@ -1620,11 +1618,11 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                 num_fixed = &res->corruptions_fixed;
             }
 
-            fprintf(stderr, "%s cluster %" PRId64 " refcount=%d reference=%d\n",
-                   num_fixed != NULL     ? "Repairing" :
-                   refcount1 < refcount2 ? "ERROR" :
-                                           "Leaked",
-                   i, refcount1, refcount2);
+            error_report("%s cluster %" PRId64 " refcount=%d reference=%d",
+                         num_fixed != NULL     ? "Repairing" :
+                         refcount1 < refcount2 ? "ERROR" :
+                                                 "Leaked",
+                         i, refcount1, refcount2);
 
             if (num_fixed) {
                 ret = update_refcount(bs, i << s->cluster_bits, 1,
@@ -1811,9 +1809,9 @@ int qcow2_pre_write_overlap_check(BlockDriverState *bs, int ign, int64_t offset,
 
         assert(metadata_ol_bitnr < QCOW2_OL_MAX_BITNR);
 
-        fprintf(stderr, "qcow2: Preventing invalid write on metadata (overlaps "
-                "with %s); image marked as corrupt.\n",
-                metadata_ol_names[metadata_ol_bitnr]);
+        error_report("qcow2: Preventing invalid write on metadata (overlaps "
+                     "with %s); image marked as corrupt.",
+                     metadata_ol_names[metadata_ol_bitnr]);
         message = g_strdup_printf("Prevented %s overwrite",
                 metadata_ol_names[metadata_ol_bitnr]);
         data = qobject_from_jsonf("{ 'device': %s, 'msg': %s, 'offset': %"
diff --git a/block/qcow2.c b/block/qcow2.c
index a4b97e8..7877031 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -71,7 +71,7 @@ static int qcow2_probe(const uint8_t *buf, int buf_size, const char *filename)
 }
 
 
-/* 
+/*
  * read qcow2 extension and fill bs
  * start reading from start_offset
  * finish reading upon magic of value 0 or when end_offset reached
@@ -88,7 +88,8 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
     int ret;
 
 #ifdef DEBUG_EXT
-    printf("qcow2_read_extensions: start=%ld end=%ld\n", start_offset, end_offset);
+    printf("qcow2_read_extensions: start=%ld end=%ld\n",
+           start_offset, end_offset);
 #endif
     offset = start_offset;
     while (offset < end_offset) {
@@ -143,7 +144,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
 
         case QCOW2_EXT_MAGIC_FEATURE_TABLE:
             if (p_feature_table != NULL) {
-                void* feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
+                void *feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
                 ret = bdrv_pread(bs->file, offset , feature_table, ext.len);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: ext_feature_table: "
@@ -684,7 +685,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
             error_setg_errno(errp, -ret, "Could not read L1 table");
             goto fail;
         }
-        for(i = 0;i < s->l1_size; i++) {
+        for(i = 0; i < s->l1_size; i++) {
             be64_to_cpus(&s->l1_table[i]);
         }
     }
@@ -874,8 +875,9 @@ static int qcow2_set_key(BlockDriverState *bs, const char *key)
     if (len > 16)
         len = 16;
     /* XXX: we could compress the chars to 7 bits to increase
-       entropy */
-    for(i = 0;i < len;i++) {
+     * entropy
+     */
+    for (i = 0; i < len; i++) {
         keybuf[i] = key[i];
     }
     s->crypt_method = s->crypt_method_header;
@@ -1330,7 +1332,7 @@ static void qcow2_invalidate_cache(BlockDriverState *bs, Error **errp)
 static size_t header_ext_add(char *buf, uint32_t magic, const void *s,
     size_t len, size_t buflen)
 {
-    QCowExtension *ext_backing_fmt = (QCowExtension*) buf;
+    QCowExtension *ext_backing_fmt = (QCowExtension *) buf;
     size_t ext_len = sizeof(QCowExtension) + ((len + 7) & ~7);
 
     if (buflen < ext_len) {
@@ -1369,7 +1371,7 @@ int qcow2_update_header(BlockDriverState *bs)
     buf = qemu_blockalign(bs, buflen);
 
     /* Header structure */
-    header = (QCowHeader*) buf;
+    header = (QCowHeader *) buf;
 
     if (buflen < sizeof(*header)) {
         ret = -ENOSPC;
@@ -1505,7 +1507,7 @@ int qcow2_update_header(BlockDriverState *bs)
         /* Using strncpy is ok here, since buf is not NUL-terminated. */
         strncpy(buf, bs->backing_file, buflen);
 
-        header->backing_file_offset = cpu_to_be64(buf - ((char*) header));
+        header->backing_file_offset = cpu_to_be64(buf - ((char *) header));
         header->backing_file_size   = cpu_to_be32(backing_file_len);
     }
 
@@ -1602,8 +1604,7 @@ static int qcow2_create2(const char *filename, int64_t total_size,
     int cluster_bits;
     cluster_bits = ffs(cluster_size) - 1;
     if (cluster_bits < MIN_CLUSTER_BITS || cluster_bits > MAX_CLUSTER_BITS ||
-        (1 << cluster_bits) != cluster_size)
-    {
+        (1 << cluster_bits) != cluster_size) {
         error_setg(errp, "Cluster size must be a power of two between %d and "
                    "%dk", 1 << MIN_CLUSTER_BITS, 1 << (MAX_CLUSTER_BITS - 10));
         return -EINVAL;
@@ -1621,9 +1622,9 @@ static int qcow2_create2(const char *filename, int64_t total_size,
      * 2 GB for 64k clusters, and we don't want to have a 2 GB initial file
      * size for any qcow2 image.
      */
-    BlockDriverState* bs;
+    BlockDriverState *bs;
     QCowHeader *header;
-    uint64_t* refcount_table;
+    uint64_t *refcount_table;
     Error *local_err = NULL;
     int ret;
 
@@ -1694,7 +1695,7 @@ static int qcow2_create2(const char *filename, int64_t total_size,
      * refcount of the cluster that is occupied by the header and the refcount
      * table)
      */
-    BlockDriver* drv = bdrv_find_format("qcow2");
+    BlockDriver *drv = bdrv_find_format("qcow2");
     assert(drv != NULL);
     ret = bdrv_open(&bs, filename, NULL, NULL,
         BDRV_O_RDWR | BDRV_O_CACHE_WB | BDRV_O_NO_FLUSH, drv, &local_err);
@@ -2054,11 +2055,11 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs)
         },
     };
     if (s->qcow_version == 2) {
-        *spec_info->qcow2 = (ImageInfoSpecificQCow2){
+        *spec_info->qcow2 = (ImageInfoSpecificQCow2) {
             .compat = g_strdup("0.10"),
         };
     } else if (s->qcow_version == 3) {
-        *spec_info->qcow2 = (ImageInfoSpecificQCow2){
+        *spec_info->qcow2 = (ImageInfoSpecificQCow2) {
             .compat             = g_strdup("1.1"),
             .lazy_refcounts     = s->compatible_features &
                                   QCOW2_COMPAT_LAZY_REFCOUNTS,
@@ -2210,8 +2211,7 @@ static int qcow2_amend_options(BlockDriverState *bs,
     int ret;
     int i;
 
-    for (i = 0; options[i].name; i++)
-    {
+    for (i = 0; options[i].name; i++) {
         if (!options[i].assigned) {
             /* only change explicitly defined options */
             continue;
@@ -2225,12 +2225,12 @@ static int qcow2_amend_options(BlockDriverState *bs,
             } else if (!strcmp(options[i].value.s, "1.1")) {
                 new_version = 3;
             } else {
-                fprintf(stderr, "Unknown compatibility level %s.\n",
-                        options[i].value.s);
+                error_report("Unknown compatibility level %s.",
+                             options[i].value.s);
                 return -EINVAL;
             }
         } else if (!strcmp(options[i].name, "preallocation")) {
-            fprintf(stderr, "Cannot change preallocation mode.\n");
+            error_report("Cannot change preallocation mode.");
             return -ENOTSUP;
         } else if (!strcmp(options[i].name, "size")) {
             new_size = options[i].value.n;
@@ -2240,14 +2240,14 @@ static int qcow2_amend_options(BlockDriverState *bs,
             backing_format = options[i].value.s;
         } else if (!strcmp(options[i].name, "encryption")) {
             if ((options[i].value.n != !!s->crypt_method)) {
-                fprintf(stderr, "Changing the encryption flag is not "
-                        "supported.\n");
+                error_report("Changing the encryption flag is not "
+                             "supported.");
                 return -ENOTSUP;
             }
         } else if (!strcmp(options[i].name, "cluster_size")) {
             if (options[i].value.n != s->cluster_size) {
-                fprintf(stderr, "Changing the cluster size is not "
-                        "supported.\n");
+                error_report("Changing the cluster size is not "
+                             "supported.");
                 return -ENOTSUP;
             }
         } else if (!strcmp(options[i].name, "lazy_refcounts")) {
@@ -2287,8 +2287,8 @@ static int qcow2_amend_options(BlockDriverState *bs,
     if (s->use_lazy_refcounts != lazy_refcounts) {
         if (lazy_refcounts) {
             if (s->qcow_version < 3) {
-                fprintf(stderr, "Lazy refcounts only supported with compatibility "
-                        "level 1.1 and above (use compat=1.1 or greater)\n");
+                error_report("Lazy refcounts only supported with compatibility "
+                             "level 1.1 and above (use compat=1.1 or greater)");
                 return -EINVAL;
             }
             s->compatible_features |= QCOW2_COMPAT_LAZY_REFCOUNTS;
diff --git a/block/raw-posix.c b/block/raw-posix.c
index 6586a0c..96b61a9 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -39,7 +39,7 @@
 #include <IOKit/storage/IOMediaBSDClient.h>
 #include <IOKit/storage/IOMedia.h>
 #include <IOKit/storage/IOCDMedia.h>
-//#include <IOKit/storage/IOCDTypes.h>
+/* #include <IOKit/storage/IOCDTypes.h> */
 #include <CoreFoundation/CoreFoundation.h>
 #endif
 
@@ -62,7 +62,7 @@
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
 #include <linux/falloc.h>
 #endif
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 #include <sys/disk.h>
 #include <sys/cdio.h>
 #endif
@@ -89,9 +89,9 @@
 #include <xfs/xfs.h>
 #endif
 
-//#define DEBUG_FLOPPY
+/* #define DEBUG_FLOPPY */
 
-//#define DEBUG_BLOCK
+/* #define DEBUG_BLOCK */
 #if defined(DEBUG_BLOCK)
 #define DEBUG_BLOCK_PRINT(formatCstr, ...) do { if (qemu_log_enabled()) \
     { qemu_log(formatCstr, ## __VA_ARGS__); qemu_log_flush(); } } while (0)
@@ -121,7 +121,7 @@
    reopen it to see if the disk has been changed */
 #define FD_OPEN_TIMEOUT (1000000000)
 
-#define MAX_BLOCKSIZE	4096
+#define MAX_BLOCKSIZE 4096
 
 typedef struct BDRVRawState {
     int fd;
@@ -190,8 +190,8 @@ static int raw_normalize_devicepath(const char **filename)
     fname = *filename;
     dp = strrchr(fname, '/');
     if (lstat(fname, &sb) < 0) {
-        fprintf(stderr, "%s: stat failed: %s\n",
-            fname, strerror(errno));
+        error_report("%s: stat failed: %s",
+                     fname, strerror(errno));
         return -errno;
     }
 
@@ -205,9 +205,9 @@ static int raw_normalize_devicepath(const char **filename)
         snprintf(namebuf, PATH_MAX, "%.*s/r%s",
             (int)(dp - fname), fname, dp + 1);
     }
-    fprintf(stderr, "%s is a block device", fname);
+
     *filename = namebuf;
-    fprintf(stderr, ", using %s\n", *filename);
+    error_report("%s is a block device, using %s", fname, *filename);
 
     return 0;
 }
@@ -725,7 +725,7 @@ static ssize_t handle_aiocb_rw(RawPosixAIOData *aiocb)
          * we can just use plain pread/pwrite without any problems.
          */
         if (aiocb->aio_niov == 1) {
-             return handle_aiocb_rw_linear(aiocb, aiocb->aio_iov->iov_base);
+            return handle_aiocb_rw_linear(aiocb, aiocb->aio_iov->iov_base);
         }
         /*
          * We have more than one iovec, and all are properly aligned.
@@ -945,7 +945,7 @@ static int aio_worker(void *arg)
         ret = handle_aiocb_write_zeroes(aiocb);
         break;
     default:
-        fprintf(stderr, "invalid aio request (0x%x)\n", aiocb->aio_type);
+        error_report("invalid aio request (0x%x)", aiocb->aio_type);
         ret = -EINVAL;
         break;
     }
@@ -1079,9 +1079,9 @@ static int raw_truncate(BlockDriverState *bs, int64_t offset)
             return -errno;
         }
     } else if (S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode)) {
-       if (offset > raw_getlength(bs)) {
-           return -EINVAL;
-       }
+        if (offset > raw_getlength(bs)) {
+            return -EINVAL;
+        }
     } else {
         return -ENOTSUP;
     }
@@ -1166,7 +1166,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
     int fd = s->fd;
     int64_t size;
     struct stat sb;
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     int reopened = 0;
 #endif
     int ret;
@@ -1175,12 +1175,12 @@ static int64_t raw_getlength(BlockDriverState *bs)
     if (ret < 0)
         return ret;
 
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
 #ifdef DIOCGMEDIASIZE
-	if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+    if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -1197,7 +1197,7 @@ again:
         size = lseek(fd, 0LL, SEEK_END);
 #endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-        switch(s->type) {
+        switch (s->type) {
         case FTYPE_CD:
             /* XXX FreeBSD acd returns UINT_MAX sectors for an empty drive */
             if (size == 2048LL * (unsigned)-1)
@@ -1485,56 +1485,60 @@ static BlockDriver bdrv_file = {
 /* host device */
 
 #if defined(__APPLE__) && defined(__MACH__)
-static kern_return_t FindEjectableCDMedia( io_iterator_t *mediaIterator );
-static kern_return_t GetBSDPath( io_iterator_t mediaIterator, char *bsdPath, CFIndex maxPathSize );
+static kern_return_t FindEjectableCDMedia(io_iterator_t *mediaIterator);
+static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
+                                CFIndex maxPathSize);
 
-kern_return_t FindEjectableCDMedia( io_iterator_t *mediaIterator )
+kern_return_t FindEjectableCDMedia(io_iterator_t *mediaIterator)
 {
     kern_return_t       kernResult;
     mach_port_t     masterPort;
     CFMutableDictionaryRef  classesToMatch;
 
-    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
+    kernResult = IOMasterPort(MACH_PORT_NULL, &masterPort);
     if ( KERN_SUCCESS != kernResult ) {
-        printf( "IOMasterPort returned %d\n", kernResult );
+        printf("IOMasterPort returned %d\n", kernResult);
     }
 
-    classesToMatch = IOServiceMatching( kIOCDMediaClass );
-    if ( classesToMatch == NULL ) {
-        printf( "IOServiceMatching returned a NULL dictionary.\n" );
+    classesToMatch = IOServiceMatching(kIOCDMediaClass);
+    if (classesToMatch == NULL) {
+        printf("IOServiceMatching returned a NULL dictionary.\n");
     } else {
-    CFDictionarySetValue( classesToMatch, CFSTR( kIOMediaEjectableKey ), kCFBooleanTrue );
+        CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
+                             kCFBooleanTrue);
     }
-    kernResult = IOServiceGetMatchingServices( masterPort, classesToMatch, mediaIterator );
-    if ( KERN_SUCCESS != kernResult )
+    kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
+                                              mediaIterator);
+    if (KERN_SUCCESS != kernResult)
     {
-        printf( "IOServiceGetMatchingServices returned %d\n", kernResult );
+        printf("IOServiceGetMatchingServices returned %d\n", kernResult);
     }
 
     return kernResult;
 }
 
-kern_return_t GetBSDPath( io_iterator_t mediaIterator, char *bsdPath, CFIndex maxPathSize )
+kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath, CFIndex maxPathSize)
 {
     io_object_t     nextMedia;
     kern_return_t   kernResult = KERN_FAILURE;
     *bsdPath = '\0';
-    nextMedia = IOIteratorNext( mediaIterator );
-    if ( nextMedia )
-    {
+    nextMedia = IOIteratorNext(mediaIterator);
+    if (nextMedia) {
         CFTypeRef   bsdPathAsCFString;
-    bsdPathAsCFString = IORegistryEntryCreateCFProperty( nextMedia, CFSTR( kIOBSDNameKey ), kCFAllocatorDefault, 0 );
-        if ( bsdPathAsCFString ) {
+        bsdPathAsCFString = IORegistryEntryCreateCFProperty(nextMedia,
+                                CFSTR(kIOBSDNameKey), kCFAllocatorDefault, 0);
+        if (bsdPathAsCFString) {
             size_t devPathLength;
-            strcpy( bsdPath, _PATH_DEV );
-            strcat( bsdPath, "r" );
-            devPathLength = strlen( bsdPath );
-            if ( CFStringGetCString( bsdPathAsCFString, bsdPath + devPathLength, maxPathSize - devPathLength, kCFStringEncodingASCII ) ) {
+            strcpy(bsdPath, _PATH_DEV);
+            strcat(bsdPath, "r");
+            devPathLength = strlen(bsdPath);
+            if (CFStringGetCString(bsdPathAsCFString, bsdPath + devPathLength,
+                    maxPathSize - devPathLength, kCFStringEncodingASCII)) {
                 kernResult = KERN_SUCCESS;
             }
-            CFRelease( bsdPathAsCFString );
+            CFRelease(bsdPathAsCFString);
         }
-        IOObjectRelease( nextMedia );
+        IOObjectRelease(nextMedia);
     }
 
     return kernResult;
@@ -1612,13 +1616,13 @@ static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
     if (strstart(filename, "/dev/cdrom", NULL)) {
         kern_return_t kernResult;
         io_iterator_t mediaIterator;
-        char bsdPath[ MAXPATHLEN ];
+        char bsdPath[MAXPATHLEN];
         int fd;
 
-        kernResult = FindEjectableCDMedia( &mediaIterator );
-        kernResult = GetBSDPath( mediaIterator, bsdPath, sizeof( bsdPath ) );
+        kernResult = FindEjectableCDMedia(&mediaIterator);
+        kernResult = GetBSDPath(mediaIterator, bsdPath, sizeof(bsdPath));
 
-        if ( bsdPath[ 0 ] != '\0' ) {
+        if (bsdPath[0] != '\0') {
             strcat(bsdPath,"s0");
             /* some CDs don't have a partition 0 */
             fd = qemu_open(bsdPath, O_RDONLY | O_BINARY | O_LARGEFILE);
@@ -1631,15 +1635,15 @@ static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
             qdict_put(options, "filename", qstring_from_str(filename));
         }
 
-        if ( mediaIterator )
-            IOObjectRelease( mediaIterator );
+        if (mediaIterator)
+            IOObjectRelease(mediaIterator);
     }
 #endif
 
     s->type = FTYPE_FILE;
 #if defined(__linux__)
     {
-        char resolved_path[ MAXPATHLEN ], *temp;
+        char resolved_path[MAXPATHLEN], *temp;
 
         temp = realpath(filename, resolved_path);
         if (temp && strstart(temp, "/dev/sg", NULL)) {
@@ -1866,14 +1870,14 @@ static BlockDriver bdrv_host_device = {
     .create_options     = raw_create_options,
     .bdrv_co_write_zeroes = hdev_co_write_zeroes,
 
-    .bdrv_aio_readv	= raw_aio_readv,
-    .bdrv_aio_writev	= raw_aio_writev,
+    .bdrv_aio_readv = raw_aio_readv,
+    .bdrv_aio_writev = raw_aio_writev,
     .bdrv_aio_flush	= raw_aio_flush,
     .bdrv_aio_discard   = hdev_aio_discard,
     .bdrv_refresh_limits = raw_refresh_limits,
 
     .bdrv_truncate      = raw_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_getlength = raw_getlength,
     .bdrv_get_info = raw_get_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
@@ -1999,7 +2003,7 @@ static BlockDriver bdrv_host_floppy = {
     .protocol_name      = "host_floppy",
     .instance_size      = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
-    .bdrv_probe_device	= floppy_probe_device,
+    .bdrv_probe_device = floppy_probe_device,
     .bdrv_parse_filename = floppy_parse_filename,
     .bdrv_file_open     = floppy_open,
     .bdrv_close         = raw_close,
@@ -2011,7 +2015,7 @@ static BlockDriver bdrv_host_floppy = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush = raw_aio_flush,
     .bdrv_refresh_limits = raw_refresh_limits,
 
     .bdrv_truncate      = raw_truncate,
@@ -2124,7 +2128,7 @@ static BlockDriver bdrv_host_cdrom = {
     .protocol_name      = "host_cdrom",
     .instance_size      = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
-    .bdrv_probe_device	= cdrom_probe_device,
+    .bdrv_probe_device = cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
     .bdrv_file_open     = cdrom_open,
     .bdrv_close         = raw_close,
@@ -2136,7 +2140,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush = raw_aio_flush,
     .bdrv_refresh_limits = raw_refresh_limits,
 
     .bdrv_truncate      = raw_truncate,
@@ -2156,7 +2160,7 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __linux__ */
 
-#if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 static int cdrom_open(BlockDriverState *bs, QDict *options, int flags,
                       Error **errp)
 {
@@ -2255,7 +2259,7 @@ static BlockDriver bdrv_host_cdrom = {
     .protocol_name      = "host_cdrom",
     .instance_size      = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
-    .bdrv_probe_device	= cdrom_probe_device,
+    .bdrv_probe_device = cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
     .bdrv_file_open     = cdrom_open,
     .bdrv_close         = raw_close,
@@ -2267,7 +2271,7 @@ static BlockDriver bdrv_host_cdrom = {
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
-    .bdrv_aio_flush	= raw_aio_flush,
+    .bdrv_aio_flush = raw_aio_flush,
     .bdrv_refresh_limits = raw_refresh_limits,
 
     .bdrv_truncate      = raw_truncate,
diff --git a/block/raw-win32.c b/block/raw-win32.c
index 064ea31..78e3a9a 100644
--- a/block/raw-win32.c
+++ b/block/raw-win32.c
@@ -131,7 +131,7 @@ static int aio_worker(void *arg)
         }
         break;
     default:
-        fprintf(stderr, "invalid aio request (0x%x)\n", aiocb->aio_type);
+        error_report("invalid aio request (0x%x)", aiocb->aio_type);
         ret = -EINVAL;
         break;
     }
@@ -172,21 +172,21 @@ int qemu_ftruncate64(int fd, int64_t length)
     BOOL res;
 
     if ((GetVersion() & 0x80000000UL) && (length >> 32) != 0)
-	return -1;
+        return -1;
 
     h = (HANDLE)_get_osfhandle(fd);
 
     /* get current position, ftruncate do not change position */
     li.HighPart = 0;
-    li.LowPart = SetFilePointer (h, 0, &li.HighPart, FILE_CURRENT);
+    li.LowPart = SetFilePointer(h, 0, &li.HighPart, FILE_CURRENT);
     if (li.LowPart == INVALID_SET_FILE_POINTER && GetLastError() != NO_ERROR) {
-	return -1;
+        return -1;
     }
 
     high = length >> 32;
     dw = SetFilePointer(h, (DWORD) length, &high, FILE_BEGIN);
     if (dw == INVALID_SET_FILE_POINTER && GetLastError() != NO_ERROR) {
-	return -1;
+        return -1;
     }
     res = SetEndOfFile(h);
 
@@ -199,7 +199,7 @@ static int set_sparse(int fd)
 {
     DWORD returned;
     return (int) DeviceIoControl((HANDLE)_get_osfhandle(fd), FSCTL_SET_SPARSE,
-				 NULL, 0, NULL, 0, &returned, NULL);
+                                 NULL, 0, NULL, 0, &returned, NULL);
 }
 
 static void raw_probe_alignment(BlockDriverState *bs)
@@ -358,7 +358,7 @@ static BlockDriverAIOCB *raw_aio_readv(BlockDriverState *bs,
     BDRVRawState *s = bs->opaque;
     if (s->aio) {
         return win32_aio_submit(bs, s->aio, s->hfile, sector_num, qiov,
-                                nb_sectors, cb, opaque, QEMU_AIO_READ); 
+                                nb_sectors, cb, opaque, QEMU_AIO_READ);
     } else {
         return paio_submit(bs, s->hfile, sector_num, qiov, nb_sectors,
                            cb, opaque, QEMU_AIO_READ);
@@ -372,7 +372,7 @@ static BlockDriverAIOCB *raw_aio_writev(BlockDriverState *bs,
     BDRVRawState *s = bs->opaque;
     if (s->aio) {
         return win32_aio_submit(bs, s->aio, s->hfile, sector_num, qiov,
-                                nb_sectors, cb, opaque, QEMU_AIO_WRITE); 
+                                nb_sectors, cb, opaque, QEMU_AIO_WRITE);
     } else {
         return paio_submit(bs, s->hfile, sector_num, qiov, nb_sectors,
                            cb, opaque, QEMU_AIO_WRITE);
@@ -410,11 +410,11 @@ static int raw_truncate(BlockDriverState *bs, int64_t offset)
      */
     dwPtrLow = SetFilePointer(s->hfile, low, &high, FILE_BEGIN);
     if (dwPtrLow == INVALID_SET_FILE_POINTER && GetLastError() != NO_ERROR) {
-        fprintf(stderr, "SetFilePointer error: %lu\n", GetLastError());
+        error_report("SetFilePointer error: %lu", GetLastError());
         return -EIO;
     }
     if (SetEndOfFile(s->hfile) == 0) {
-        fprintf(stderr, "SetEndOfFile error: %lu\n", GetLastError());
+        error_report("SetEndOfFile error: %lu", GetLastError());
         return -EIO;
     }
     return 0;
@@ -429,7 +429,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
     DWORD count;
     BOOL status;
 
-    switch(s->type) {
+    switch (s->type) {
     case FTYPE_FILE:
         l.LowPart = GetFileSize(s->hfile, (PDWORD)&l.HighPart);
         if (l.LowPart == 0xffffffffUL && GetLastError() != NO_ERROR)
@@ -456,7 +456,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
 static int64_t raw_get_allocated_file_size(BlockDriverState *bs)
 {
     typedef DWORD (WINAPI * get_compressed_t)(const char *filename,
-                                              DWORD * high);
+                                              DWORD *high);
     get_compressed_t get_compressed;
     struct _stati64 st;
     const char *filename = bs->filename;
@@ -516,22 +516,22 @@ static QEMUOptionParameter raw_create_options[] = {
 };
 
 static BlockDriver bdrv_file = {
-    .format_name	= "file",
-    .protocol_name	= "file",
-    .instance_size	= sizeof(BDRVRawState),
+    .format_name    = "file",
+    .protocol_name  = "file",
+    .instance_size  = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = raw_parse_filename,
-    .bdrv_file_open	= raw_open,
-    .bdrv_close		= raw_close,
-    .bdrv_create	= raw_create,
+    .bdrv_file_open = raw_open,
+    .bdrv_close     = raw_close,
+    .bdrv_create    = raw_create,
     .bdrv_has_zero_init = bdrv_has_zero_init_1,
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
     .bdrv_aio_flush     = raw_aio_flush,
 
-    .bdrv_truncate	= raw_truncate,
-    .bdrv_getlength	= raw_getlength,
+    .bdrv_truncate  = raw_truncate,
+    .bdrv_getlength = raw_getlength,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
@@ -548,9 +548,9 @@ static int find_cdrom(char *cdrom_name, int cdrom_name_size)
 
     memset(drives, 0, sizeof(drives));
     GetLogicalDriveStrings(sizeof(drives), drives);
-    while(pdrv[0] != '\0') {
+    while (pdrv[0] != '\0') {
         type = GetDriveType(pdrv);
-        switch(type) {
+        switch (type) {
         case DRIVE_CDROM:
             snprintf(cdrom_name, cdrom_name_size, "\\\\.\\%c:", pdrv[0]);
             return 0;
@@ -640,7 +640,8 @@ static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
         if (((filename[0] >= 'a' && filename[0] <= 'z') ||
              (filename[0] >= 'A' && filename[0] <= 'Z')) &&
             filename[1] == ':' && filename[2] == '\0') {
-            snprintf(device_name, sizeof(device_name), "\\\\.\\%c:", filename[0]);
+            snprintf(device_name, sizeof(device_name),
+                     "\\\\.\\%c:", filename[0]);
             filename = device_name;
         }
     }
@@ -671,14 +672,14 @@ done:
 }
 
 static BlockDriver bdrv_host_device = {
-    .format_name	= "host_device",
-    .protocol_name	= "host_device",
-    .instance_size	= sizeof(BDRVRawState),
+    .format_name    = "host_device",
+    .protocol_name  = "host_device",
+    .instance_size  = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = hdev_parse_filename,
-    .bdrv_probe_device	= hdev_probe_device,
-    .bdrv_file_open	= hdev_open,
-    .bdrv_close		= raw_close,
+    .bdrv_probe_device  = hdev_probe_device,
+    .bdrv_file_open = hdev_open,
+    .bdrv_close     = raw_close,
 
     .bdrv_aio_readv     = raw_aio_readv,
     .bdrv_aio_writev    = raw_aio_writev,
diff --git a/block/ssh.c b/block/ssh.c
index aa63c9d..8dc4e80 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -191,7 +191,7 @@ static int parse_uri(const char *filename, QDict *options, Error **errp)
         goto err;
     }
 
-    if(uri->user && strcmp(uri->user, "") != 0) {
+    if (uri->user && strcmp(uri->user, "") != 0) {
         qdict_put(options, "user", qstring_from_str(uri->user));
     }
 
@@ -219,10 +219,10 @@ static int parse_uri(const char *filename, QDict *options, Error **errp)
 
  err:
     if (qp) {
-      query_params_free(qp);
+        query_params_free(qp);
     }
     if (uri) {
-      uri_free(uri);
+        uri_free(uri);
     }
     return -EINVAL;
 }
@@ -235,7 +235,8 @@ static void ssh_parse_filename(const char *filename, QDict *options,
         qdict_haskey(options, "port") ||
         qdict_haskey(options, "path") ||
         qdict_haskey(options, "host_key_check")) {
-        error_setg(errp, "user, host, port, path, host_key_check cannot be used at the same time as a file option");
+        error_setg(errp, "user, host, port, path, host_key_check cannot be "
+                   "used at the same time as a file option");
         return;
     }
 
@@ -289,8 +290,8 @@ static int check_host_key_knownhosts(BDRVSSHState *s,
         break;
     case LIBSSH2_KNOWNHOST_CHECK_MISMATCH:
         ret = -EINVAL;
-        session_error_report(s, "host key does not match the one in known_hosts (found key %s)",
-                             found->key);
+        session_error_report(s, "host key does not match the one in "
+                             "known_hosts (found key %s)", found->key);
         goto out;
     case LIBSSH2_KNOWNHOST_CHECK_NOTFOUND:
         ret = -EINVAL;
@@ -302,8 +303,8 @@ static int check_host_key_knownhosts(BDRVSSHState *s,
         goto out;
     default:
         ret = -EINVAL;
-        session_error_report(s, "unknown error matching the host key with known_hosts (%d)",
-                             r);
+        session_error_report(s, "unknown error matching the host key with "
+                             "known_hosts (%d)", r);
         goto out;
     }
 
@@ -368,7 +369,7 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
         return -EINVAL;
     }
 
-    if(compare_fingerprint((unsigned char *) fingerprint, fingerprint_len,
+    if (compare_fingerprint((unsigned char *) fingerprint, fingerprint_len,
                            hash) != 0) {
         error_report("remote host key does not match host_key_check '%s'",
                      hash);
@@ -418,7 +419,8 @@ static int authenticate(BDRVSSHState *s, const char *user)
     userauthlist = libssh2_userauth_list(s->session, user, strlen(user));
     if (strstr(userauthlist, "publickey") == NULL) {
         ret = -EPERM;
-        error_report("remote server does not support \"publickey\" authentication");
+        error_report("remote server does not support \"publickey\" "
+                     "authentication");
         goto out;
     }
 
@@ -440,7 +442,7 @@ static int authenticate(BDRVSSHState *s, const char *user)
         goto out;
     }
 
-    for(;;) {
+    for (;;) {
         r = libssh2_agent_get_identity(agent, &identity, prev_identity);
         if (r == 1) {           /* end of list */
             break;
@@ -1060,7 +1062,7 @@ static void bdrv_ssh_init(void)
 
     r = libssh2_init(0);
     if (r != 0) {
-        fprintf(stderr, "libssh2 initialization failed, %d\n", r);
+        error_report("libssh2 initialization failed, %d", r);
         exit(EXIT_FAILURE);
     }
 
diff --git a/block/vdi.c b/block/vdi.c
index 27737af..2883066 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -65,7 +65,7 @@ typedef unsigned char uuid_t[16];
 /* Code configuration options. */
 
 /* Enable debug messages. */
-//~ #define CONFIG_VDI_DEBUG
+/* ~ #define CONFIG_VDI_DEBUG */
 
 /* Support write operations on VDI images. */
 #define CONFIG_VDI_WRITE
@@ -305,21 +305,22 @@ static int vdi_check(BlockDriverState *bs, BdrvCheckResult *res,
                 if (!VDI_IS_ALLOCATED(bmap[bmap_entry])) {
                     bmap[bmap_entry] = bmap_entry;
                 } else {
-                    fprintf(stderr, "ERROR: block index %" PRIu32
-                            " also used by %" PRIu32 "\n", bmap[bmap_entry], bmap_entry);
+                    error_report("ERROR: block index %" PRIu32
+                                 " also used by %" PRIu32,
+                                 bmap[bmap_entry], bmap_entry);
                     res->corruptions++;
                 }
             } else {
-                fprintf(stderr, "ERROR: block index %" PRIu32
-                        " too large, is %" PRIu32 "\n", block, bmap_entry);
+                error_report("ERROR: block index %" PRIu32
+                             " too large, is %" PRIu32, block, bmap_entry);
                 res->corruptions++;
             }
         }
     }
     if (blocks_allocated != s->header.blocks_allocated) {
-        fprintf(stderr, "ERROR: allocated blocks mismatch, is %" PRIu32
-               ", should be %" PRIu32 "\n",
-               blocks_allocated, s->header.blocks_allocated);
+        error_report("ERROR: allocated blocks mismatch, is %" PRIu32
+                     ", should be %" PRIu32,
+                     blocks_allocated, s->header.blocks_allocated);
         res->corruptions++;
     }
 
@@ -730,7 +731,7 @@ static int vdi_create(const char *filename, QEMUOptionParameter *options,
     blocks = (bytes + block_size - 1) / block_size;
 
     bmap_size = blocks * sizeof(uint32_t);
-    bmap_size = ((bmap_size + SECTOR_SIZE - 1) & ~(SECTOR_SIZE -1));
+    bmap_size = ((bmap_size + SECTOR_SIZE - 1) & ~(SECTOR_SIZE - 1));
 
     memset(&header, 0, sizeof(header));
     pstrcpy(header.text, sizeof(header.text), VDI_TEXT);
diff --git a/block/vmdk.c b/block/vmdk.c
index 480ea37..35d7efd 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -630,8 +630,7 @@ static int vmdk_open_vmdk4(BlockDriverState *bs,
             le32_to_cpu(footer.footer_marker.type) != MARKER_FOOTER ||
             le64_to_cpu(footer.eos_marker.val) != 0  ||
             le32_to_cpu(footer.eos_marker.size) != 0  ||
-            le32_to_cpu(footer.eos_marker.type) != MARKER_END_OF_STREAM)
-        {
+            le32_to_cpu(footer.eos_marker.type) != MARKER_END_OF_STREAM) {
             return -EINVAL;
         }
 
@@ -742,16 +741,16 @@ static int vmdk_open_sparse(BlockDriverState *bs,
 
     magic = ldl_be_p(buf);
     switch (magic) {
-        case VMDK3_MAGIC:
-            return vmdk_open_vmfs_sparse(bs, file, flags, errp);
-            break;
-        case VMDK4_MAGIC:
-            return vmdk_open_vmdk4(bs, file, flags, errp);
-            break;
-        default:
-            error_setg(errp, "Image not in VMDK format");
-            return -EINVAL;
-            break;
+    case VMDK3_MAGIC:
+        return vmdk_open_vmfs_sparse(bs, file, flags, errp);
+        break;
+    case VMDK4_MAGIC:
+        return vmdk_open_vmdk4(bs, file, flags, errp);
+        break;
+    default:
+        error_setg(errp, "Image not in VMDK format");
+        return -EINVAL;
+        break;
     }
 }
 
@@ -783,7 +782,7 @@ static int vmdk_parse_extents(const char *desc, BlockDriverState *bs,
             goto next_line;
         } else if (!strcmp(type, "FLAT")) {
             if (ret != 5 || flat_offset < 0) {
-                error_setg(errp, "Invalid extent lines: \n%s", p);
+                error_setg(errp, "Invalid extent lines:\n%s", p);
                 return -EINVAL;
             }
         } else if (!strcmp(type, "VMFS")) {
@@ -830,7 +829,8 @@ static int vmdk_parse_extents(const char *desc, BlockDriverState *bs,
             if (!buf) {
                 ret = -EINVAL;
             } else {
-                ret = vmdk_open_sparse(bs, extent_file, bs->open_flags, buf, errp);
+                ret = vmdk_open_sparse(bs, extent_file, bs->open_flags,
+                                       buf, errp);
             }
             if (ret) {
                 g_free(buf);
@@ -899,14 +899,14 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
 
     magic = ldl_be_p(buf);
     switch (magic) {
-        case VMDK3_MAGIC:
-        case VMDK4_MAGIC:
-            ret = vmdk_open_sparse(bs, bs->file, flags, buf, errp);
-            s->desc_offset = 0x200;
-            break;
-        default:
-            ret = vmdk_open_desc_file(bs, flags, buf, errp);
-            break;
+    case VMDK3_MAGIC:
+    case VMDK4_MAGIC:
+        ret = vmdk_open_sparse(bs, bs->file, flags, buf, errp);
+        s->desc_offset = 0x200;
+        break;
+    default:
+        ret = vmdk_open_desc_file(bs, flags, buf, errp);
+        break;
     }
     if (ret) {
         goto fail;
@@ -2018,24 +2018,21 @@ static int vmdk_check(BlockDriverState *bs, BdrvCheckResult *result,
         }
         extent = find_extent(s, sector_num, extent);
         if (!extent) {
-            fprintf(stderr,
-                    "ERROR: could not find extent for sector %" PRId64 "\n",
-                    sector_num);
+            error_report("ERROR: could not find extent for sector %" PRId64,
+                         sector_num);
             break;
         }
         ret = get_cluster_offset(bs, extent, NULL,
                                  sector_num << BDRV_SECTOR_BITS,
                                  0, &cluster_offset);
         if (ret == VMDK_ERROR) {
-            fprintf(stderr,
-                    "ERROR: could not get cluster_offset for sector %"
-                    PRId64 "\n", sector_num);
+            error_report("ERROR: could not get cluster_offset for sector %"
+                         PRId64, sector_num);
             break;
         }
         if (ret == VMDK_OK && cluster_offset >= bdrv_getlength(extent->file)) {
-            fprintf(stderr,
-                    "ERROR: cluster offset for sector %"
-                    PRId64 " points after EOF\n", sector_num);
+            error_report("ERROR: cluster offset for sector %"
+                         PRId64 " points after EOF", sector_num);
             break;
         }
         sector_num += extent->cluster_sectors;
@@ -2123,7 +2120,8 @@ static QEMUOptionParameter vmdk_create_options[] = {
         .type = OPT_STRING,
         .help =
             "VMDK flat extent format, can be one of "
-            "{monolithicSparse (default) | monolithicFlat | twoGbMaxExtentSparse | twoGbMaxExtentFlat | streamOptimized} "
+            "{monolithicSparse (default) | monolithicFlat | "
+            "twoGbMaxExtentSparse | twoGbMaxExtentFlat | streamOptimized} "
     },
     {
         .name = BLOCK_OPT_ZEROED_GRAIN,
diff --git a/block/vpc.c b/block/vpc.c
index 2e25f57..e0bb333 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -138,7 +138,7 @@ typedef struct BDRVVPCState {
     Error *migration_blocker;
 } BDRVVPCState;
 
-static uint32_t vpc_checksum(uint8_t* buf, size_t size)
+static uint32_t vpc_checksum(uint8_t *buf, size_t size)
 {
     uint32_t res = 0;
     int i;
@@ -153,7 +153,7 @@ static uint32_t vpc_checksum(uint8_t* buf, size_t size)
 static int vpc_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
     if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
-	return 100;
+        return 100;
     return 0;
 }
 
@@ -203,8 +203,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     checksum = be32_to_cpu(footer->checksum);
     footer->checksum = 0;
     if (vpc_checksum(s->footer_buf, HEADER_SIZE) != checksum)
-        fprintf(stderr, "block-vpc: The header checksum of '%s' is "
-            "incorrect.\n", bs->filename);
+        error_report("block-vpc: The header checksum of '%s' is "
+                     "incorrect.", bs->filename);
 
     /* Write 'checksum' back to footer, or else will leave it with zero. */
     footer->checksum = be32_to_cpu(checksum);
@@ -353,7 +353,8 @@ static inline int64_t get_sector_offset(BlockDriverState *bs,
     pagetable_index = offset / s->block_size;
     pageentry_index = (offset % s->block_size) / 512;
 
-    if (pagetable_index >= s->max_table_entries || s->pagetable[pagetable_index] == 0xffffffff)
+    if (pagetable_index >= s->max_table_entries ||
+        s->pagetable[pagetable_index] == 0xffffffff)
         return -1; // not allocated
 
     bitmap_offset = 512 * (uint64_t) s->pagetable[pagetable_index];
@@ -413,7 +414,7 @@ static inline int64_t get_sector_offset(BlockDriverState *bs,
  *
  * Returns 0 on success and < 0 on error
  */
-static int rewrite_footer(BlockDriverState* bs)
+static int rewrite_footer(BlockDriverState *bs)
 {
     int ret;
     BDRVVPCState *s = bs->opaque;
@@ -433,7 +434,7 @@ static int rewrite_footer(BlockDriverState* bs)
  *
  * Returns the sectors' offset in the image file on success and < 0 on error
  */
-static int64_t alloc_block(BlockDriverState* bs, int64_t sector_num)
+static int64_t alloc_block(BlockDriverState *bs, int64_t sector_num)
 {
     BDRVVPCState *s = bs->opaque;
     int64_t bat_offset;
@@ -605,8 +606,8 @@ static coroutine_fn int vpc_co_write(BlockDriverState *bs, int64_t sector_num,
  * the hardware EIDE and ATA-2 limit of 16 heads (max disk size of 127 GB)
  * and instead allow up to 255 heads.
  */
-static int calculate_geometry(int64_t total_sectors, uint16_t* cyls,
-    uint8_t* heads, uint8_t* secs_per_cyl)
+static int calculate_geometry(int64_t total_sectors, uint16_t *cyls,
+    uint8_t *heads, uint8_t *secs_per_cyl)
 {
     uint32_t cyls_times_heads;
 
@@ -783,8 +784,7 @@ static int vpc_create(const char *filename, QEMUOptionParameter *options,
     total_sectors = total_size / BDRV_SECTOR_SIZE;
     for (i = 0; total_sectors > (int64_t)cyls * heads * secs_per_cyl; i++) {
         if (calculate_geometry(total_sectors + i, &cyls, &heads,
-                               &secs_per_cyl))
-        {
+                               &secs_per_cyl)) {
             ret = -EFBIG;
             goto fail;
         }
diff --git a/block/vvfat.c b/block/vvfat.c
index c3af7ff..63a69b1 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -54,17 +54,18 @@
 
 #undef stderr
 #define stderr STDERR
-FILE* stderr = NULL;
+FILE *stderr = NULL;
 
 static void checkpoint(void);
 
 #ifdef __MINGW32__
-void nonono(const char* file, int line, const char* msg) {
+void nonono(const char *file, int line, const char *msg)
+{
     fprintf(stderr, "Nonono! %s:%d %s\n", file, line, msg);
     exit(-5);
 }
 #undef assert
-#define assert(a) do {if (!(a)) nonono(__FILE__, __LINE__, #a);}while(0)
+#define assert(a) do {if (!(a)) nonono(__FILE__, __LINE__, #a); } while (0)
 #endif
 
 #else
@@ -75,22 +76,22 @@ void nonono(const char* file, int line, const char* msg) {
 
 /* dynamic array functions */
 typedef struct array_t {
-    char* pointer;
-    unsigned int size,next,item_size;
+    char *pointer;
+    unsigned int size, next, item_size;
 } array_t;
 
-static inline void array_init(array_t* array,unsigned int item_size)
+static inline void array_init(array_t *array, unsigned int item_size)
 {
     array->pointer = NULL;
-    array->size=0;
-    array->next=0;
-    array->item_size=item_size;
+    array->size = 0;
+    array->next = 0;
+    array->item_size = item_size;
 }
 
-static inline void array_free(array_t* array)
+static inline void array_free(array_t *array)
 {
     g_free(array->pointer);
-    array->size=array->next=0;
+    array->size=array->next = 0;
 }
 
 /* does not automatically grow */
@@ -743,38 +744,38 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 	/* create directory entry for this file */
 	direntry=create_short_and_long_name(s, i, entry->d_name,
 		is_dot || is_dotdot);
-	direntry->attributes=(S_ISDIR(st.st_mode)?0x10:0x20);
-	direntry->reserved[0]=direntry->reserved[1]=0;
-	direntry->ctime=fat_datetime(st.st_ctime,1);
-	direntry->cdate=fat_datetime(st.st_ctime,0);
-	direntry->adate=fat_datetime(st.st_atime,0);
-	direntry->begin_hi=0;
-	direntry->mtime=fat_datetime(st.st_mtime,1);
-	direntry->mdate=fat_datetime(st.st_mtime,0);
+	direntry->attributes = (S_ISDIR(st.st_mode)?0x10:0x20);
+	direntry->reserved[0] = direntry->reserved[1]=0;
+	direntry->ctime = fat_datetime(st.st_ctime, 1);
+	direntry->cdate = fat_datetime(st.st_ctime, 0);
+	direntry->adate = fat_datetime(st.st_atime, 0);
+	direntry->begin_hi = 0;
+	direntry->mtime = fat_datetime(st.st_mtime, 1);
+	direntry->mdate = fat_datetime(st.st_mtime, 0);
 	if(is_dotdot)
 	    set_begin_of_direntry(direntry, first_cluster_of_parent);
 	else if(is_dot)
 	    set_begin_of_direntry(direntry, first_cluster);
 	else
-	    direntry->begin=0; /* do that later */
+	    direntry->begin = 0; /* do that later */
         if (st.st_size > 0x7fffffff) {
-	    fprintf(stderr, "File %s is larger than 2GB\n", buffer);
+	        error_report("File %s is larger than 2GB", buffer);
             g_free(buffer);
             closedir(dir);
 	    return -2;
         }
-	direntry->size=cpu_to_le32(S_ISDIR(st.st_mode)?0:st.st_size);
+	direntry->size = cpu_to_le32(S_ISDIR(st.st_mode)?0:st.st_size);
 
 	/* create mapping for this file */
 	if(!is_dot && !is_dotdot && (S_ISDIR(st.st_mode) || st.st_size)) {
-	    s->current_mapping=(mapping_t*)array_get_next(&(s->mapping));
+	    s->current_mapping = (mapping_t*)array_get_next(&(s->mapping));
 	    s->current_mapping->begin=0;
 	    s->current_mapping->end=st.st_size;
 	    /*
 	     * we get the direntry of the most recent direntry, which
 	     * contains the short name and all the relevant information.
 	     */
-	    s->current_mapping->dir_index=s->directory.next-1;
+	    s->current_mapping->dir_index = s->directory.next-1;
 	    s->current_mapping->first_mapping_index = -1;
 	    if (S_ISDIR(st.st_mode)) {
 		s->current_mapping->mode = MODE_DIRECTORY;
@@ -784,7 +785,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 		s->current_mapping->mode = MODE_UNDEFINED;
 		s->current_mapping->info.file.offset = 0;
 	    }
-	    s->current_mapping->path=buffer;
+	    s->current_mapping->path = buffer;
 	    s->current_mapping->read_only =
 		(st.st_mode & (S_IWUSR | S_IWGRP | S_IWOTH)) == 0;
 	}
@@ -793,7 +794,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 
     /* fill with zeroes up to the end of the cluster */
     while(s->directory.next%(0x10*s->sectors_per_cluster)) {
-	direntry_t* direntry=array_get_next(&(s->directory));
+	direntry_t* direntry = array_get_next(&(s->directory));
 	memset(direntry,0,sizeof(direntry_t));
     }
 
@@ -892,9 +893,8 @@ static int init_directories(BDRVVVFATState* s,
         if (mapping->mode & MODE_DIRECTORY) {
 	    mapping->begin = cluster;
 	    if(read_directory(s, i)) {
-		fprintf(stderr, "Could not read directory %s\n",
-			mapping->path);
-		return -1;
+		  error_report("Could not read directory %s", mapping->path);
+		  return -1;
 	    }
 	    mapping = array_get(&(s->mapping), i);
 	} else {
@@ -919,8 +919,8 @@ static int init_directories(BDRVVVFATState* s,
 	cluster = mapping->end;
 
 	if(cluster > s->cluster_count) {
-	    fprintf(stderr,"Directory does not fit in FAT%d (capacity %.2f MB)\n",
-		    s->fat_type, s->sector_count / 2000.0);
+	    error_report("Directory does not fit in FAT%d (capacity %.2f MB)",
+		             s->fat_type, s->sector_count / 2000.0);
 	    return -EINVAL;
 	}
 
@@ -1127,8 +1127,8 @@ DLOG(if (stderr == NULL) {
 
     switch (s->fat_type) {
     case 32:
-	    fprintf(stderr, "Big fat greek warning: FAT32 has not been tested. "
-                "You are welcome to do so!\n");
+	    error_report("Big fat greek warning: FAT32 has not been tested. "
+                     "You are welcome to do so!");
         break;
     case 16:
     case 12:
@@ -1154,8 +1154,8 @@ DLOG(if (stderr == NULL) {
     s->fat2 = NULL;
     s->downcase_short_names = 1;
 
-    fprintf(stderr, "vvfat %s chs %d,%d,%d\n",
-            dirname, cyls, heads, secs);
+    error_report("vvfat %s chs %d,%d,%d",
+                 dirname, cyls, heads, secs);
 
     s->sector_count = cyls * heads * secs - (s->first_sectors_number - 1);
 
@@ -1863,16 +1863,17 @@ static int check_directory_consistency(BDRVVVFATState *s,
 	ret++;
 
 	if (s->used_clusters[cluster_num] & USED_ANY) {
-	    fprintf(stderr, "cluster %d used more than once\n", (int)cluster_num);
+	    error_report("cluster %d used more than once", (int)cluster_num);
 	    return 0;
 	}
 	s->used_clusters[cluster_num] = USED_DIRECTORY;
 
-DLOG(fprintf(stderr, "read cluster %d (sector %d)\n", (int)cluster_num, (int)cluster2sector(s, cluster_num)));
+DLOG(fprintf(stderr, "read cluster %d (sector %d)\n", (int)cluster_num,
+     (int)cluster2sector(s, cluster_num)));
 	subret = vvfat_read(s->bs, cluster2sector(s, cluster_num), cluster,
 		s->sectors_per_cluster);
 	if (subret) {
-	    fprintf(stderr, "Error fetching direntries\n");
+	    error_report("Error fetching direntries");
 	fail:
             g_free(cluster);
 	    return 0;
@@ -1888,8 +1889,8 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 
 	    subret = parse_long_name(&lfn, direntries + i);
 	    if (subret < 0) {
-		fprintf(stderr, "Error in long name\n");
-		goto fail;
+    		error_report("Error in long name");
+    		goto fail;
 	    }
 	    if (subret == 0 || is_free(direntries + i))
 		continue;
@@ -1897,7 +1898,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    if (fat_chksum(direntries+i) != lfn.checksum) {
 		subret = parse_short_name(s, &lfn, direntries + i);
 		if (subret < 0) {
-		    fprintf(stderr, "Error in short name (%d)\n", subret);
+		    error_report("Error in short name (%d)", subret);
 		    goto fail;
 		}
 		if (subret > 0 || !strcmp((char*)lfn.name, ".")
@@ -1907,8 +1908,8 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    lfn.checksum = 0x100; /* cannot use long name twice */
 
 	    if (path_len + 1 + lfn.len >= PATH_MAX) {
-		fprintf(stderr, "Name too long: %s/%s\n", path, lfn.name);
-		goto fail;
+    		error_report("Name too long: %s/%s", path, lfn.name);
+    		goto fail;
 	    }
             pstrcpy(path2 + path_len + 1, sizeof(path2) - path_len - 1,
                     (char*)lfn.name);
@@ -1967,15 +1968,15 @@ DLOG(checkpoint());
      * - if all is fine, return number of used clusters
      */
     if (s->fat2 == NULL) {
-	int size = 0x200 * s->sectors_per_fat;
-	s->fat2 = g_malloc(size);
-	memcpy(s->fat2, s->fat.pointer, size);
+        int size = 0x200 * s->sectors_per_fat;
+        s->fat2 = g_malloc(size);
+        memcpy(s->fat2, s->fat.pointer, size);
     }
     check = vvfat_read(s->bs,
 	    s->first_sectors_number, s->fat2, s->sectors_per_fat);
     if (check) {
-	fprintf(stderr, "Could not copy fat\n");
-	return 0;
+    	error_report("Could not copy fat");
+    	return 0;
     }
     assert (s->used_clusters);
     for (i = 0; i < sector2cluster(s, s->sector_count); i++)
@@ -1987,15 +1988,15 @@ DLOG(checkpoint());
      * (check_directory_consistency() will unmark those still present). */
     if (s->qcow)
 	for (i = 0; i < s->mapping.next; i++) {
-	    mapping_t* mapping = array_get(&(s->mapping), i);
-	    if (mapping->first_mapping_index < 0)
-		mapping->mode |= MODE_DELETED;
+        mapping_t* mapping = array_get(&(s->mapping), i);
+        if (mapping->first_mapping_index < 0)
+    	mapping->mode |= MODE_DELETED;
 	}
 
     used_clusters_count = check_directory_consistency(s, 0, s->path);
     if (used_clusters_count <= 0) {
-	DLOG(fprintf(stderr, "problem in directory\n"));
-	return 0;
+        DLOG(fprintf(stderr, "problem in directory\n"));
+        return 0;
     }
 
     check = s->last_cluster_of_root_directory;
@@ -2323,8 +2324,8 @@ static int commit_one_file(BDRVVVFATState* s,
 
     fd = qemu_open(mapping->path, O_RDWR | O_CREAT | O_BINARY, 0666);
     if (fd < 0) {
-	fprintf(stderr, "Could not open %s... (%s, %d)\n", mapping->path,
-		strerror(errno), errno);
+	   error_report("Could not open %s... (%s, %d)", mapping->path,
+	               	strerror(errno), errno);
         g_free(cluster);
 	return fd;
     }
@@ -2716,8 +2717,8 @@ static int do_commit(BDRVVVFATState* s)
 
     ret = handle_renames_and_mkdirs(s);
     if (ret) {
-	fprintf(stderr, "Error handling renames (%d)\n", ret);
-        abort();
+	   error_report("Error handling renames (%d)", ret);
+       abort();
 	return ret;
     }
 
@@ -2727,22 +2728,22 @@ static int do_commit(BDRVVVFATState* s)
     /* recurse direntries from root (using bs->bdrv_read) */
     ret = commit_direntries(s, 0, -1);
     if (ret) {
-	fprintf(stderr, "Fatal: error while committing (%d)\n", ret);
-        abort();
+	   error_report("Fatal: error while committing (%d)", ret);
+       abort();
 	return ret;
     }
 
     ret = handle_commits(s);
     if (ret) {
-	fprintf(stderr, "Error handling commits (%d)\n", ret);
-        abort();
+	   error_report("Error handling commits (%d)", ret);
+       abort();
 	return ret;
     }
 
     ret = handle_deletes(s);
     if (ret) {
-	fprintf(stderr, "Error deleting\n");
-        abort();
+	   error_report("Error deleting");
+       abort();
 	return ret;
     }
 
@@ -2794,9 +2795,9 @@ DLOG(checkpoint());
 	mapping_t* mapping = find_mapping_for_cluster(s, i);
 	if (mapping) {
 	    if (mapping->read_only) {
-		fprintf(stderr, "Tried to write to write-protected file %s\n",
-			mapping->path);
-		return -1;
+		  error_report("Tried to write to write-protected file %s",
+		               mapping->path);
+		  return -1;
 	    }
 
 	    if (mapping->mode & MODE_DIRECTORY) {
@@ -2819,8 +2820,8 @@ DLOG(checkpoint());
 		for (k = 0; k < (end - begin) * 0x10; k++) {
 		    /* do not allow non-ASCII filenames */
 		    if (parse_long_name(&lfn, direntries + k) < 0) {
-			fprintf(stderr, "Warning: non-ASCII filename\n");
-			return -1;
+			     error_report("Warning: non-ASCII filename");
+			     return -1;
 		    }
 		    /* no access to the direntry of a read-only file */
 		    else if (is_short_name(direntries+k) &&
@@ -2828,7 +2829,7 @@ DLOG(checkpoint());
 			if (memcmp(direntries + k,
 				    array_get(&(s->directory), dir_index + k),
 				    sizeof(direntry_t))) {
-			    fprintf(stderr, "Warning: tried to write to write-protected file\n");
+			    error_report("Warning: tried to write to write-protected file");
 			    return -1;
 			}
 		    }
@@ -2845,8 +2846,8 @@ DLOG(checkpoint());
 DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sectors));
     ret = bdrv_write(s->qcow, sector_num, buf, nb_sectors);
     if (ret < 0) {
-	fprintf(stderr, "Error writing to qcow backend\n");
-	return ret;
+	   error_report("Error writing to qcow backend");
+	   return ret;
     }
 
     for (i = sector2cluster(s, sector_num);
diff --git a/blockdev.c b/blockdev.c
index 7810e9f..2c6f559 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -158,8 +158,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
 
     QTAILQ_FOREACH(dinfo, &drives, next) {
         if (dinfo->type == type &&
-	    dinfo->bus == bus &&
-	    dinfo->unit == unit)
+            dinfo->bus == bus &&
+            dinfo->unit == unit)
             return dinfo;
     }
 
@@ -180,8 +180,8 @@ int drive_get_max_bus(BlockInterfaceType type)
 
     max_bus = -1;
     QTAILQ_FOREACH(dinfo, &drives, next) {
-        if(dinfo->type == type &&
-           dinfo->bus > max_bus)
+        if (dinfo->type == type &&
+            dinfo->bus > max_bus)
             max_bus = dinfo->bus;
     }
     return max_bus;
@@ -698,9 +698,9 @@ DriveInfo *drive_init(QemuOpts *all_opts, BlockInterfaceType block_default_type)
 
     /* Deprecated option boot=[on|off] */
     if (qemu_opt_get(legacy_opts, "boot") != NULL) {
-        fprintf(stderr, "qemu-kvm: boot=on|off is deprecated and will be "
-                "ignored. Future versions will reject this parameter. Please "
-                "update your scripts.\n");
+        error_report("qemu-kvm: boot=on|off is deprecated and will be "
+                     "ignored. Future versions will reject this parameter. "
+                     "Please update your scripts.");
     }
 
     /* Media type */
@@ -729,7 +729,7 @@ DriveInfo *drive_init(QemuOpts *all_opts, BlockInterfaceType block_default_type)
     qdict_put(bs_opts, "read-only",
               qstring_from_str(read_only ? "on" : "off"));
     qdict_put(bs_opts, "copy-on-read",
-              qstring_from_str(copy_on_read ? "on" :"off"));
+              qstring_from_str(copy_on_read ? "on" : "off"));
 
     /* Controller type */
     value = qemu_opt_get(legacy_opts, "if");
@@ -815,14 +815,14 @@ DriveInfo *drive_init(QemuOpts *all_opts, BlockInterfaceType block_default_type)
     }
 
     if (unit_id == -1) {
-       unit_id = 0;
-       while (drive_get(type, bus_id, unit_id) != NULL) {
+        unit_id = 0;
+        while (drive_get(type, bus_id, unit_id) != NULL) {
            unit_id++;
            if (max_devs && unit_id >= max_devs) {
                unit_id -= max_devs;
                bus_id++;
            }
-       }
+        }
     }
 
     if (max_devs && unit_id >= max_devs) {
@@ -925,7 +925,7 @@ DriveInfo *drive_init(QemuOpts *all_opts, BlockInterfaceType block_default_type)
     dinfo->unit = unit_id;
     dinfo->devaddr = devaddr;
 
-    switch(type) {
+    switch (type) {
     case IF_IDE:
     case IF_SCSI:
     case IF_XEN:
@@ -2139,8 +2139,7 @@ void qmp_drive_mirror(const char *device, const char *target,
     }
 
     if ((sync == MIRROR_SYNC_MODE_FULL || !source)
-        && mode != NEW_IMAGE_MODE_EXISTING)
-    {
+        && mode != NEW_IMAGE_MODE_EXISTING) {
         /* create new image w/o backing file */
         assert(format && drv);
         bdrv_img_create(target, format,
-- 
1.7.9.5


