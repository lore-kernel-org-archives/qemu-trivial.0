Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WizjP-0002wN-Gr
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 01:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaT-0003Gu-Il
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaK-0001Mi-ED
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:21 -0400
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:54296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wiua0-0001Fa-6q; Fri, 09 May 2014 19:51:52 -0400
Received: by mail-pa0-f42.google.com with SMTP id rd3so5023677pab.29
	for <multiple recipients>; Fri, 09 May 2014 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Q5YuinsQa4k/lh/jOusohun+WGJNWel9q7k3c6dR53U=;
	b=d93XhBkhCzGkb78Yq0Jh0fpzivZ2X55y4DxmLYWkhTUcNb7NGTNdELVKv0QS/ktbHj
	PKdLQ7kWZJCUk6p0xrLN5cE1e58zCa1TsBdKtiNwFsecpOgDBz1kF25pVzMw3vRVjKlM
	52f/bmtUEC6J6bZNo3KRfjrVKWE1NUgBr61OZSUPcWGxaPCWBXg+cmEBqhJaHC/X46tW
	Mxhdn5wzFtzUghaVMPCCpd2txXiPG2F/3UFLZYppuKSrS7SjMWF4A/rFeC9S3Q9OGjwr
	qr64W/GtZ6CtsSlVOUS317mxzkCdYumo5txsQmLQuIr3UjBueSwtbW6iygjNvHMgFERa
	usJg==
X-Received: by 10.66.180.200 with SMTP id dq8mr25858429pac.104.1399679511058; 
	Fri, 09 May 2014 16:51:51 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id op3sm9623456pbc.40.2014.05.09.16.51.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 16:51:50 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 May 2014 07:55:21 +0800
Message-Id: <fc7e1b7c4b8d366461aeadf11769d3c0b039b93e.1399641611.git.tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <y>
 <cover.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
X-Mailman-Approved-At: Sat, 10 May 2014 01:21:54 -0400
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/4] block: replace fprintf(stderr,
	...) with error_report() in block/
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
X-List-Received-Date: Fri, 09 May 2014 23:52:31 -0000

Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
have been removed because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 block-migration.c      |    4 +-
 block.c                |    4 +-
 block/linux-aio.c      |    4 +-
 block/nbd-client.h     |    2 +-
 block/qcow2-cluster.c  |    4 +-
 block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
 block/qcow2.c          |   16 +++----
 block/quorum.c         |    4 +-
 block/raw-posix.c      |    8 ++--
 block/raw-win32.c      |    6 +--
 block/ssh.c            |    4 +-
 block/vdi.c            |   14 +++---
 block/vmdk.c           |   21 ++++-----
 block/vpc.c            |    4 +-
 block/vvfat.c          |  108 ++++++++++++++++++++++-----------------------
 blockdev.c             |    6 +--
 16 files changed, 160 insertions(+), 163 deletions(-)

diff --git a/block-migration.c b/block-migration.c
index 56951e0..5bcf7c8 100644
--- a/block-migration.c
+++ b/block-migration.c
@@ -790,7 +790,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
 
             bs = bdrv_find(device_name);
             if (!bs) {
-                fprintf(stderr, "Error unknown block device %s\n",
+                error_report("Error unknown block device %s",
                         device_name);
                 return -EINVAL;
             }
@@ -833,7 +833,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                    (addr == 100) ? '\n' : '\r');
             fflush(stdout);
         } else if (!(flags & BLK_MIG_FLAG_EOS)) {
-            fprintf(stderr, "Unknown block migration flags: %#x\n", flags);
+            error_report("Unknown block migration flags: %#x", flags);
             return -EINVAL;
         }
         ret = qemu_file_get_error(f);
diff --git a/block.c b/block.c
index b749d31..7dc4acb 100644
--- a/block.c
+++ b/block.c
@@ -2694,8 +2694,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
      * if it has been enabled.
      */
     if (bs->io_limits_enabled) {
-        fprintf(stderr, "Disabling I/O throttling on '%s' due "
-                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
+        error_report("Disabling I/O throttling on '%s' due "
+                     "to synchronous I/O.", bdrv_get_device_name(bs));
         bdrv_io_limits_disable(bs);
     }
 
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 53434e2..b706a59 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -162,8 +162,8 @@ BlockDriverAIOCB *laio_submit(BlockDriverState *bs, void *aio_ctx, int fd,
 	break;
     /* Currently Linux kernel does not support other operations */
     default:
-        fprintf(stderr, "%s: invalid AIO request type 0x%x.\n",
-                        __func__, type);
+        error_report("%s: invalid AIO request type 0x%x.",
+                     __func__, type);
         goto out_free_aiocb;
     }
     io_set_eventfd(&laiocb->iocb, event_notifier_get_fd(&s->e));
diff --git a/block/nbd-client.h b/block/nbd-client.h
index f2a6337..74178f4 100644
--- a/block/nbd-client.h
+++ b/block/nbd-client.h
@@ -9,7 +9,7 @@
 
 #if defined(DEBUG_NBD)
 #define logout(fmt, ...) \
-    fprintf(stderr, "nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
+    error_report("nbd\t%-24s" fmt, __func__, ##__VA_ARGS__)
 #else
 #define logout(fmt, ...) ((void)0)
 #endif
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 76d2bcf..b1c8daf 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -67,8 +67,8 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
     }
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "grow l1_table from %d to %" PRId64 "\n",
-            s->l1_size, new_l1_size);
+    error_report("grow l1_table from %d to %" PRId64,
+                 s->l1_size, new_l1_size);
 #endif
 
     new_l1_size2 = sizeof(uint64_t) * new_l1_size;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index e79895d..e494474 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -219,9 +219,9 @@ static int alloc_refcount_block(BlockDriverState *bs,
     }
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "qcow2: Allocate refcount block %d for %" PRIx64
-        " at %" PRIx64 "\n",
-        refcount_table_index, cluster_index << s->cluster_bits, new_block);
+    error_report("qcow2: Allocate refcount block %d for %" PRIx64
+                 " at %" PRIx64,
+                 refcount_table_index, cluster_index << s->cluster_bits, new_block);
 #endif
 
     if (in_same_refcount_block(s, new_block, cluster_index << s->cluster_bits)) {
@@ -335,8 +335,8 @@ static int alloc_refcount_block(BlockDriverState *bs,
     } while (last_table_size != table_size);
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "qcow2: Grow refcount table %" PRId32 " => %" PRId64 "\n",
-        s->refcount_table_size, table_size);
+    error_report("qcow2: Grow refcount table %" PRId32 " => %" PRId64,
+                 s->refcount_table_size, table_size);
 #endif
 
     /* Create the new refcount table and blocks */
@@ -510,7 +510,7 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
     int ret;
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "update_refcount: offset=%" PRId64 " size=%" PRId64 " addend=%d\n",
+    error_report("update_refcount: offset=%" PRId64 " size=%" PRId64 " addend=%d",
            offset, length, addend);
 #endif
     if (length < 0) {
@@ -661,9 +661,9 @@ retry:
     }
 
 #ifdef DEBUG_ALLOC2
-    fprintf(stderr, "alloc_clusters: size=%" PRId64 " -> %" PRId64 "\n",
-            size,
-            (s->free_cluster_index - nb_clusters) << s->cluster_bits);
+    error_report("alloc_clusters: size=%" PRId64 " -> %" PRId64,
+                 size,
+                 (s->free_cluster_index - nb_clusters) << s->cluster_bits);
 #endif
     return (s->free_cluster_index - nb_clusters) << s->cluster_bits;
 }
@@ -793,7 +793,7 @@ void qcow2_free_clusters(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_CLUSTER_FREE);
     ret = update_refcount(bs, offset, size, -1, type);
     if (ret < 0) {
-        fprintf(stderr, "qcow2_free_clusters failed: %s\n", strerror(-ret));
+        error_report("qcow2_free_clusters failed: %s", strerror(-ret));
         /* TODO Remember the clusters to free them later and avoid leaking */
     }
 }
@@ -1038,14 +1038,14 @@ static void inc_refcounts(BlockDriverState *bs,
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
@@ -1089,9 +1089,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1141,8 +1141,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
-                fprintf(stderr, "ERROR offset=%" PRIx64 ": Cluster is not "
-                    "properly aligned; L2 entry corrupted.\n", offset);
+                error_report("ERROR offset=%" PRIx64 ": Cluster is not "
+                             "properly aligned; L2 entry corrupted.", offset);
                 res->corruptions++;
             }
             break;
@@ -1160,7 +1160,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
+    error_report("ERROR: I/O error in check_refcounts_l2");
     g_free(l2_table);
     return -EIO;
 }
@@ -1213,8 +1213,8 @@ static int check_refcounts_l1(BlockDriverState *bs,
 
             /* L2 tables are cluster aligned */
             if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
+                error_report("ERROR l2_offset=%" PRIx64 ": Table is not "
+                             "cluster aligned; L1 entry corrupted", l2_offset);
                 res->corruptions++;
             }
 
@@ -1230,7 +1230,7 @@ static int check_refcounts_l1(BlockDriverState *bs,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+    error_report("ERROR: I/O error in check_refcounts_l1");
     res->check_errors++;
     g_free(l1_table);
     return -EIO;
@@ -1268,11 +1268,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1291,8 +1291,8 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
         ret = bdrv_pread(bs->file, l2_offset, l2_table,
                          s->l2_size * sizeof(uint64_t));
         if (ret < 0) {
-            fprintf(stderr, "ERROR: Could not read L2 table: %s\n",
-                    strerror(-ret));
+            error_report("ERROR: Could not read L2 table: %s",
+                         strerror(-ret));
             res->check_errors++;
             goto fail;
         }
@@ -1310,11 +1310,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1332,16 +1332,16 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1407,7 +1407,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     /* allocate new refcount block */
     new_offset = qcow2_alloc_clusters(bs, s->cluster_size);
     if (new_offset < 0) {
-        fprintf(stderr, "Could not allocate new cluster: %s\n",
+        error_report("Could not allocate new cluster: %s",
                 strerror(-new_offset));
         ret = new_offset;
         goto done;
@@ -1416,7 +1416,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     /* fetch current refcount block content */
     ret = qcow2_cache_get(bs, s->refcount_block_cache, offset, &refcount_block);
     if (ret < 0) {
-        fprintf(stderr, "Could not fetch refcount block: %s\n", strerror(-ret));
+        error_report("Could not fetch refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1424,8 +1424,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
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
@@ -1435,7 +1435,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     ret = bdrv_write(bs->file, new_offset / BDRV_SECTOR_SIZE, refcount_block,
             s->cluster_sectors);
     if (ret < 0) {
-        fprintf(stderr, "Could not write refcount block: %s\n", strerror(-ret));
+        error_report("Could not write refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1444,7 +1444,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     s->refcount_table[reftable_index] = new_offset;
     ret = write_reftable_entry(bs, reftable_index);
     if (ret < 0) {
-        fprintf(stderr, "Could not update refcount table: %s\n",
+        error_report("Could not update refcount table: %s",
                 strerror(-ret));
         goto fail_free_cluster;
     }
@@ -1538,15 +1538,15 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
 
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
+                         " is outside image\n", i);
             res->corruptions++;
             continue;
         }
@@ -1555,8 +1555,8 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
             inc_refcounts(bs, res, refcount_table, nb_clusters,
                 offset, s->cluster_size);
             if (refcount_table[cluster] != 1) {
-                fprintf(stderr, "%s refcount block %" PRId64
-                    " refcount=%d\n",
+                error_report("%s refcount block %" PRId64
+                    " refcount=%d",
                     fix & BDRV_FIX_ERRORS ? "Repairing" :
                                             "ERROR",
                     i, refcount_table[cluster]);
@@ -1596,7 +1596,7 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     for (i = 0, highest_cluster = 0; i < nb_clusters; i++) {
         refcount1 = get_refcount(bs, i);
         if (refcount1 < 0) {
-            fprintf(stderr, "Can't get refcount for cluster %" PRId64 ": %s\n",
+            error_report("Can't get refcount for cluster %" PRId64 ": %s",
                 i, strerror(-refcount1));
             res->check_errors++;
             continue;
@@ -1618,7 +1618,7 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                 num_fixed = &res->corruptions_fixed;
             }
 
-            fprintf(stderr, "%s cluster %" PRId64 " refcount=%d reference=%d\n",
+            error_report("%s cluster %" PRId64 " refcount=%d reference=%d",
                    num_fixed != NULL     ? "Repairing" :
                    refcount1 < refcount2 ? "ERROR" :
                                            "Leaked",
@@ -1809,9 +1809,9 @@ int qcow2_pre_write_overlap_check(BlockDriverState *bs, int ign, int64_t offset,
 
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
index a4b97e8..e01855b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2225,12 +2225,12 @@ static int qcow2_amend_options(BlockDriverState *bs,
             } else if (!strcmp(options[i].value.s, "1.1")) {
                 new_version = 3;
             } else {
-                fprintf(stderr, "Unknown compatibility level %s.\n",
+                error_report("Unknown compatibility level %s.",
                         options[i].value.s);
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
diff --git a/block/quorum.c b/block/quorum.c
index ecec3a5..6fe65a6 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -771,8 +771,8 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
         s->num_children == 2 && s->threshold == 2) {
         s->is_blkverify = true;
     } else if (qemu_opt_get_bool(opts, QUORUM_OPT_BLKVERIFY, false)) {
-        fprintf(stderr, "blkverify mode is set by setting blkverify=on "
-                "and using two files with vote_threshold=2\n");
+        error_report("blkverify mode is set by setting blkverify=on "
+                     "and using two files with vote_threshold=2");
     }
 
     /* allocate the children BlockDriverState array */
diff --git a/block/raw-posix.c b/block/raw-posix.c
index 3ce026d..27b34bf 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -187,7 +187,7 @@ static int raw_normalize_devicepath(const char **filename)
     fname = *filename;
     dp = strrchr(fname, '/');
     if (lstat(fname, &sb) < 0) {
-        fprintf(stderr, "%s: stat failed: %s\n",
+        error_report("%s: stat failed: %s",
             fname, strerror(errno));
         return -errno;
     }
@@ -202,9 +202,9 @@ static int raw_normalize_devicepath(const char **filename)
         snprintf(namebuf, PATH_MAX, "%.*s/r%s",
             (int)(dp - fname), fname, dp + 1);
     }
-    fprintf(stderr, "%s is a block device", fname);
+    error_report("%s is a block device", fname);
     *filename = namebuf;
-    fprintf(stderr, ", using %s\n", *filename);
+    error_report(", using %s", *filename);
 
     return 0;
 }
@@ -942,7 +942,7 @@ static int aio_worker(void *arg)
         ret = handle_aiocb_write_zeroes(aiocb);
         break;
     default:
-        fprintf(stderr, "invalid aio request (0x%x)\n", aiocb->aio_type);
+        error_report("invalid aio request (0x%x)", aiocb->aio_type);
         ret = -EINVAL;
         break;
     }
diff --git a/block/raw-win32.c b/block/raw-win32.c
index 064ea31..5f67285 100644
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
diff --git a/block/ssh.c b/block/ssh.c
index aa63c9d..955f0eb 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -49,7 +49,7 @@
 #define DPRINTF(fmt, ...)                           \
     do {                                            \
         if (DEBUG_SSH) {                            \
-            fprintf(stderr, "ssh: %-15s " fmt "\n", \
+            error_report("ssh: %-15s " fmt,         \
                     __func__, ##__VA_ARGS__);       \
         }                                           \
     } while (0)
@@ -1060,7 +1060,7 @@ static void bdrv_ssh_init(void)
 
     r = libssh2_init(0);
     if (r != 0) {
-        fprintf(stderr, "libssh2 initialization failed, %d\n", r);
+        error_report("libssh2 initialization failed, %d", r);
         exit(EXIT_FAILURE);
     }
 
diff --git a/block/vdi.c b/block/vdi.c
index 27737af..672c2d1 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -89,7 +89,7 @@ typedef unsigned char uuid_t[16];
 
 #if defined(CONFIG_VDI_DEBUG)
 #define logout(fmt, ...) \
-                fprintf(stderr, "vdi\t%-24s" fmt, __func__, ##__VA_ARGS__)
+                error_report("vdi\t%-24s" fmt, __func__, ##__VA_ARGS__)
 #else
 #define logout(fmt, ...) ((void)0)
 #endif
@@ -305,20 +305,20 @@ static int vdi_check(BlockDriverState *bs, BdrvCheckResult *res,
                 if (!VDI_IS_ALLOCATED(bmap[bmap_entry])) {
                     bmap[bmap_entry] = bmap_entry;
                 } else {
-                    fprintf(stderr, "ERROR: block index %" PRIu32
-                            " also used by %" PRIu32 "\n", bmap[bmap_entry], bmap_entry);
+                    error_report("ERROR: block index %" PRIu32
+                                 " also used by %" PRIu32, bmap[bmap_entry], bmap_entry);
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
+        error_report("ERROR: allocated blocks mismatch, is %" PRIu32
+                     ", should be %" PRIu32,
                blocks_allocated, s->header.blocks_allocated);
         res->corruptions++;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 06a1f9f..98b6871 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1396,8 +1396,8 @@ static int vmdk_write(BlockDriverState *bs, int64_t sector_num,
 
     if (sector_num > bs->total_sectors) {
         error_report("Wrong offset: sector_num=0x%" PRIx64
-                " total_sectors=0x%" PRIx64 "\n",
-                sector_num, bs->total_sectors);
+                     " total_sectors=0x%" PRIx64,
+                     sector_num, bs->total_sectors);
         return -EIO;
     }
 
@@ -1416,7 +1416,7 @@ static int vmdk_write(BlockDriverState *bs, int64_t sector_num,
             if (ret == VMDK_OK) {
                 /* Refuse write to allocated cluster for streamOptimized */
                 error_report("Could not write to allocated cluster"
-                              " for streamOptimized");
+                             " for streamOptimized");
                 return -EIO;
             } else {
                 /* allocate */
@@ -2005,24 +2005,21 @@ static int vmdk_check(BlockDriverState *bs, BdrvCheckResult *result,
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
diff --git a/block/vpc.c b/block/vpc.c
index 2e25f57..86f7890 100644
--- a/block/vpc.c
+++ b/block/vpc.c
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
diff --git a/block/vvfat.c b/block/vvfat.c
index c3af7ff..e73d940 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -60,7 +60,7 @@ static void checkpoint(void);
 
 #ifdef __MINGW32__
 void nonono(const char* file, int line, const char* msg) {
-    fprintf(stderr, "Nonono! %s:%d %s\n", file, line, msg);
+    error_report("Nonono! %s:%d %s", file, line, msg);
     exit(-5);
 }
 #undef assert
@@ -758,7 +758,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 	else
 	    direntry->begin=0; /* do that later */
         if (st.st_size > 0x7fffffff) {
-	    fprintf(stderr, "File %s is larger than 2GB\n", buffer);
+	    error_report("File %s is larger than 2GB", buffer);
             g_free(buffer);
             closedir(dir);
 	    return -2;
@@ -892,7 +892,7 @@ static int init_directories(BDRVVVFATState* s,
         if (mapping->mode & MODE_DIRECTORY) {
 	    mapping->begin = cluster;
 	    if(read_directory(s, i)) {
-		fprintf(stderr, "Could not read directory %s\n",
+		error_report("Could not read directory %s",
 			mapping->path);
 		return -1;
 	    }
@@ -919,7 +919,7 @@ static int init_directories(BDRVVVFATState* s,
 	cluster = mapping->end;
 
 	if(cluster > s->cluster_count) {
-	    fprintf(stderr,"Directory does not fit in FAT%d (capacity %.2f MB)\n",
+	    error_report("Directory does not fit in FAT%d (capacity %.2f MB)",
 		    s->fat_type, s->sector_count / 2000.0);
 	    return -EINVAL;
 	}
@@ -1127,8 +1127,8 @@ DLOG(if (stderr == NULL) {
 
     switch (s->fat_type) {
     case 32:
-	    fprintf(stderr, "Big fat greek warning: FAT32 has not been tested. "
-                "You are welcome to do so!\n");
+	    error_report("Big fat greek warning: FAT32 has not been tested. "
+                  	 "You are welcome to do so!");
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
 
@@ -1323,7 +1323,7 @@ static void print_direntry(const direntry_t* direntry)
     int j = 0;
     char buffer[1024];
 
-    fprintf(stderr, "direntry %p: ", direntry);
+    error_report("direntry %p: ", direntry);
     if(!direntry)
 	return;
     if(is_long_name(direntry)) {
@@ -1337,30 +1337,30 @@ static void print_direntry(const direntry_t* direntry)
 	for(i=28;i<32 && c[i] && c[i]!=0xff;i+=2)
 	    ADD_CHAR(c[i]);
 	buffer[j] = 0;
-	fprintf(stderr, "%s\n", buffer);
+	error_report("%s", buffer);
     } else {
 	int i;
 	for(i=0;i<11;i++)
 	    ADD_CHAR(direntry->name[i]);
 	buffer[j] = 0;
-	fprintf(stderr,"%s attributes=0x%02x begin=%d size=%d\n",
-		buffer,
-		direntry->attributes,
-		begin_of_direntry(direntry),le32_to_cpu(direntry->size));
+	error_report("%s attributes=0x%02x begin=%d size=%d",
+		     buffer,
+        	     direntry->attributes,
+                     begin_of_direntry(direntry),le32_to_cpu(direntry->size));
     }
 }
 
 static void print_mapping(const mapping_t* mapping)
 {
-    fprintf(stderr, "mapping (%p): begin, end = %d, %d, dir_index = %d, "
-        "first_mapping_index = %d, name = %s, mode = 0x%x, " ,
-        mapping, mapping->begin, mapping->end, mapping->dir_index,
-        mapping->first_mapping_index, mapping->path, mapping->mode);
+    error_report("mapping (%p): begin, end = %d, %d, dir_index = %d, "
+                 "first_mapping_index = %d, name = %s, mode = 0x%x, " ,
+                 mapping, mapping->begin, mapping->end, mapping->dir_index,
+                 mapping->first_mapping_index, mapping->path, mapping->mode);
 
     if (mapping->mode & MODE_DIRECTORY)
-	fprintf(stderr, "parent_mapping_index = %d, first_dir_index = %d\n", mapping->info.dir.parent_mapping_index, mapping->info.dir.first_dir_index);
+	error_report("parent_mapping_index = %d, first_dir_index = %d", mapping->info.dir.parent_mapping_index, mapping->info.dir.first_dir_index);
     else
-	fprintf(stderr, "offset = %d\n", mapping->info.file.offset);
+	error_report("offset = %d", mapping->info.file.offset);
 }
 #endif
 
@@ -1376,7 +1376,7 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
 	if (s->qcow) {
 	    int n;
             if (bdrv_is_allocated(s->qcow, sector_num, nb_sectors-i, &n)) {
-DLOG(fprintf(stderr, "sectors %d+%d allocated\n", (int)sector_num, n));
+DLOG(error_report("sectors %d+%d allocated", (int)sector_num, n));
                 if (bdrv_read(s->qcow, sector_num, buf + i*0x200, n)) {
                     return -1;
                 }
@@ -1384,7 +1384,7 @@ DLOG(fprintf(stderr, "sectors %d+%d allocated\n", (int)sector_num, n));
                 sector_num += n - 1;
                 continue;
             }
-DLOG(fprintf(stderr, "sector %d not allocated\n", (int)sector_num));
+DLOG(error_report("sector %d not allocated", (int)sector_num));
 	}
 	if(sector_num<s->faked_sectors) {
 	    if(sector_num<s->first_sectors_number)
@@ -1458,7 +1458,7 @@ typedef struct commit_t {
 static void clear_commits(BDRVVVFATState* s)
 {
     int i;
-DLOG(fprintf(stderr, "clear_commits (%d commits)\n", s->commits.next));
+DLOG(error_report("clear_commits (%d commits)", s->commits.next));
     for (i = 0; i < s->commits.next; i++) {
 	commit_t* commit = array_get(&(s->commits), i);
 	assert(commit->path || commit->action == ACTION_WRITEOUT);
@@ -1863,16 +1863,16 @@ static int check_directory_consistency(BDRVVVFATState *s,
 	ret++;
 
 	if (s->used_clusters[cluster_num] & USED_ANY) {
-	    fprintf(stderr, "cluster %d used more than once\n", (int)cluster_num);
+	    error_report("cluster %d used more than once", (int)cluster_num);
 	    return 0;
 	}
 	s->used_clusters[cluster_num] = USED_DIRECTORY;
 
-DLOG(fprintf(stderr, "read cluster %d (sector %d)\n", (int)cluster_num, (int)cluster2sector(s, cluster_num)));
+DLOG(error_report("read cluster %d (sector %d)", (int)cluster_num, (int)cluster2sector(s, cluster_num)));
 	subret = vvfat_read(s->bs, cluster2sector(s, cluster_num), cluster,
 		s->sectors_per_cluster);
 	if (subret) {
-	    fprintf(stderr, "Error fetching direntries\n");
+	    error_report("Error fetching direntries");
 	fail:
             g_free(cluster);
 	    return 0;
@@ -1881,14 +1881,14 @@ DLOG(fprintf(stderr, "read cluster %d (sector %d)\n", (int)cluster_num, (int)clu
 	for (i = 0; i < 0x10 * s->sectors_per_cluster; i++) {
 	    int cluster_count = 0;
 
-DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i));
+DLOG(error_report("check direntry %d:", i); print_direntry(direntries + i));
 	    if (is_volume_label(direntries + i) || is_dot(direntries + i) ||
 		    is_free(direntries + i))
 		continue;
 
 	    subret = parse_long_name(&lfn, direntries + i);
 	    if (subret < 0) {
-		fprintf(stderr, "Error in long name\n");
+		error_report("Error in long name");
 		goto fail;
 	    }
 	    if (subret == 0 || is_free(direntries + i))
@@ -1897,7 +1897,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    if (fat_chksum(direntries+i) != lfn.checksum) {
 		subret = parse_short_name(s, &lfn, direntries + i);
 		if (subret < 0) {
-		    fprintf(stderr, "Error in short name (%d)\n", subret);
+		    error_report("Error in short name (%d)", subret);
 		    goto fail;
 		}
 		if (subret > 0 || !strcmp((char*)lfn.name, ".")
@@ -1907,7 +1907,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    lfn.checksum = 0x100; /* cannot use long name twice */
 
 	    if (path_len + 1 + lfn.len >= PATH_MAX) {
-		fprintf(stderr, "Name too long: %s/%s\n", path, lfn.name);
+		error_report("Name too long: %s/%s", path, lfn.name);
 		goto fail;
 	    }
             pstrcpy(path2 + path_len + 1, sizeof(path2) - path_len - 1,
@@ -1915,13 +1915,13 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 
 	    if (is_directory(direntries + i)) {
 		if (begin_of_direntry(direntries + i) == 0) {
-		    DLOG(fprintf(stderr, "invalid begin for directory: %s\n", path2); print_direntry(direntries + i));
+		    DLOG(error_report("invalid begin for directory: %s", path2); print_direntry(direntries + i));
 		    goto fail;
 		}
 		cluster_count = check_directory_consistency(s,
 			begin_of_direntry(direntries + i), path2);
 		if (cluster_count == 0) {
-		    DLOG(fprintf(stderr, "problem in directory %s:\n", path2); print_direntry(direntries + i));
+		    DLOG(error_report("problem in directory %s:", path2); print_direntry(direntries + i));
 		    goto fail;
 		}
 	    } else if (is_file(direntries + i)) {
@@ -1930,7 +1930,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 		if (cluster_count !=
 			(le32_to_cpu(direntries[i].size) + s->cluster_size
 			 - 1) / s->cluster_size) {
-		    DLOG(fprintf(stderr, "Cluster count mismatch\n"));
+		    DLOG(error_report("Cluster count mismatch"));
 		    goto fail;
 		}
 	    } else
@@ -1974,7 +1974,7 @@ DLOG(checkpoint());
     check = vvfat_read(s->bs,
 	    s->first_sectors_number, s->fat2, s->sectors_per_fat);
     if (check) {
-	fprintf(stderr, "Could not copy fat\n");
+	error_report("Could not copy fat");
 	return 0;
     }
     assert (s->used_clusters);
@@ -1994,7 +1994,7 @@ DLOG(checkpoint());
 
     used_clusters_count = check_directory_consistency(s, 0, s->path);
     if (used_clusters_count <= 0) {
-	DLOG(fprintf(stderr, "problem in directory\n"));
+	DLOG(error_report("problem in directory"));
 	return 0;
     }
 
@@ -2002,7 +2002,7 @@ DLOG(checkpoint());
     for (i = check; i < sector2cluster(s, s->sector_count); i++) {
 	if (modified_fat_get(s, i)) {
 	    if(!s->used_clusters[i]) {
-		DLOG(fprintf(stderr, "FAT was modified (%d), but cluster is not used?\n", i));
+		DLOG(error_report("FAT was modified (%d), but cluster is not used?", i));
 		return 0;
 	    }
 	    check++;
@@ -2010,7 +2010,7 @@ DLOG(checkpoint());
 
 	if (s->used_clusters[i] == USED_ALLOCATED) {
 	    /* allocated, but not used... */
-	    DLOG(fprintf(stderr, "unused, modified cluster: %d\n", i));
+	    DLOG(error_report("unused, modified cluster: %d", i));
 	    return 0;
 	}
     }
@@ -2237,7 +2237,7 @@ static int commit_direntries(BDRVVVFATState* s,
     int ret, i;
     uint32_t c;
 
-DLOG(fprintf(stderr, "commit_direntries for %s, parent_mapping_index %d\n", mapping->path, parent_mapping_index));
+DLOG(error_report("commit_direntries for %s, parent_mapping_index %d", mapping->path, parent_mapping_index));
 
     assert(direntry);
     assert(mapping);
@@ -2323,8 +2323,8 @@ static int commit_one_file(BDRVVVFATState* s,
 
     fd = qemu_open(mapping->path, O_RDWR | O_CREAT | O_BINARY, 0666);
     if (fd < 0) {
-	fprintf(stderr, "Could not open %s... (%s, %d)\n", mapping->path,
-		strerror(errno), errno);
+	error_report("Could not open %s... (%s, %d)", mapping->path,
+		     strerror(errno), errno);
         g_free(cluster);
 	return fd;
     }
@@ -2386,7 +2386,7 @@ static void check1(BDRVVVFATState* s)
     for (i = 0; i < s->mapping.next; i++) {
 	mapping_t* mapping = array_get(&(s->mapping), i);
 	if (mapping->mode & MODE_DELETED) {
-	    fprintf(stderr, "deleted\n");
+	    error_report("deleted");
 	    continue;
 	}
 	assert(mapping->dir_index < s->directory.next);
@@ -2452,10 +2452,10 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
     int i;
 
 #ifdef DEBUG
-    fprintf(stderr, "handle_renames\n");
+    error_report("handle_renames");
     for (i = 0; i < s->commits.next; i++) {
 	commit_t* commit = array_get(&(s->commits), i);
-	fprintf(stderr, "%d, %s (%d, %d)\n", i, commit->path ? commit->path : "(null)", commit->param.rename.cluster, commit->action);
+	error_report("%d, %s (%d, %d)", i, commit->path ? commit->path : "(null)", commit->param.rename.cluster, commit->action);
     }
 #endif
 
@@ -2687,7 +2687,7 @@ static int handle_deletes(BDRVVVFATState* s)
 			return -4;
 		    deleted++;
 		}
-		DLOG(fprintf(stderr, "DELETE (%d)\n", i); print_mapping(mapping); print_direntry(entry));
+		DLOG(error_report("DELETE (%d)", i); print_mapping(mapping); print_direntry(entry));
 		remove_mapping(s, i);
 	    }
 	}
@@ -2716,7 +2716,7 @@ static int do_commit(BDRVVVFATState* s)
 
     ret = handle_renames_and_mkdirs(s);
     if (ret) {
-	fprintf(stderr, "Error handling renames (%d)\n", ret);
+	error_report("Error handling renames (%d)", ret);
         abort();
 	return ret;
     }
@@ -2727,21 +2727,21 @@ static int do_commit(BDRVVVFATState* s)
     /* recurse direntries from root (using bs->bdrv_read) */
     ret = commit_direntries(s, 0, -1);
     if (ret) {
-	fprintf(stderr, "Fatal: error while committing (%d)\n", ret);
+	error_report("Fatal: error while committing (%d)", ret);
         abort();
 	return ret;
     }
 
     ret = handle_commits(s);
     if (ret) {
-	fprintf(stderr, "Error handling commits (%d)\n", ret);
+	error_report("Error handling commits (%d)", ret);
         abort();
 	return ret;
     }
 
     ret = handle_deletes(s);
     if (ret) {
-	fprintf(stderr, "Error deleting\n");
+	error_report("Error deleting");
         abort();
 	return ret;
     }
@@ -2794,7 +2794,7 @@ DLOG(checkpoint());
 	mapping_t* mapping = find_mapping_for_cluster(s, i);
 	if (mapping) {
 	    if (mapping->read_only) {
-		fprintf(stderr, "Tried to write to write-protected file %s\n",
+		error_report("Tried to write to write-protected file %s",
 			mapping->path);
 		return -1;
 	    }
@@ -2819,7 +2819,7 @@ DLOG(checkpoint());
 		for (k = 0; k < (end - begin) * 0x10; k++) {
 		    /* do not allow non-ASCII filenames */
 		    if (parse_long_name(&lfn, direntries + k) < 0) {
-			fprintf(stderr, "Warning: non-ASCII filename\n");
+			error_report("Warning: non-ASCII filename");
 			return -1;
 		    }
 		    /* no access to the direntry of a read-only file */
@@ -2828,7 +2828,7 @@ DLOG(checkpoint());
 			if (memcmp(direntries + k,
 				    array_get(&(s->directory), dir_index + k),
 				    sizeof(direntry_t))) {
-			    fprintf(stderr, "Warning: tried to write to write-protected file\n");
+			    error_report("Warning: tried to write to write-protected file");
 			    return -1;
 			}
 		    }
@@ -2842,10 +2842,10 @@ DLOG(checkpoint());
     /*
      * Use qcow backend. Commit later.
      */
-DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sectors));
+DLOG(error_report("Write to qcow backend: %d + %d", (int)sector_num, nb_sectors));
     ret = bdrv_write(s->qcow, sector_num, buf, nb_sectors);
     if (ret < 0) {
-	fprintf(stderr, "Error writing to qcow backend\n");
+	error_report("Error writing to qcow backend");
 	return ret;
     }
 
@@ -3006,7 +3006,7 @@ static void checkpoint(void) {
     assert(!vvv->current_mapping || vvv->current_fd || (vvv->current_mapping->mode & MODE_DIRECTORY));
 #if 0
     if (((direntry_t*)vvv->directory.pointer)[1].attributes != 0xf)
-	fprintf(stderr, "Nonono!\n");
+	error_report("Nonono!");
     mapping_t* mapping;
     direntry_t* direntry;
     assert(vvv->mapping.size >= vvv->mapping.item_size * vvv->mapping.next);
diff --git a/blockdev.c b/blockdev.c
index 7810e9f..c922099 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -698,9 +698,9 @@ DriveInfo *drive_init(QemuOpts *all_opts, BlockInterfaceType block_default_type)
 
     /* Deprecated option boot=[on|off] */
     if (qemu_opt_get(legacy_opts, "boot") != NULL) {
-        fprintf(stderr, "qemu-kvm: boot=on|off is deprecated and will be "
-                "ignored. Future versions will reject this parameter. Please "
-                "update your scripts.\n");
+        error_report("qemu-kvm: boot=on|off is deprecated and will be "
+                     "ignored. Future versions will reject this parameter. Please "
+                     "update your scripts.");
     }
 
     /* Media type */
-- 
1.7.9.5


