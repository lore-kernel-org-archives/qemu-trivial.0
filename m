Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wmu3D-0008EL-TR
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 20:06:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu33-0007ru-08
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu2t-0004gy-Tl
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:06:20 -0400
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235]:42236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wmu2W-0004cY-LE; Tue, 20 May 2014 20:05:49 -0400
Received: by mail-pd0-f181.google.com with SMTP id z10so783762pdj.26
	for <multiple recipients>; Tue, 20 May 2014 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2CfmURbiDKQZTxfKkN+od1+jelWdTdMx7a8jeWYZwXM=;
	b=JmvDVc8xqBFOn7sH5xAZ9OsqWcUFbk06A2OP7RBuXOpqcmKKd82Gwn5il9WeBIreCd
	W8fiTTc2oynwo4ndm8WI0PKvxqdfIJ4T6ZfP2tXjB/4JCBEqk8V4v2FeRWGfFUrYR0tH
	KJuQrwzhOvLIKtduq0E6I6RnjtK0UX2x4loRN/D7EjfqTNRtoHbnukzauVnENt5RFI9G
	LICdETR5bhPmPy/FXKODKgNcspcWT0X6PFHggxOW/qCYoKzE3PTZJocCmxyQszhw1Ecm
	AwtUPM7wtMC4z+mr79dyMWtdjw+l+C2jV1VI9yI/eBYfYPNUe9cj/YcRzUBgpEOwzphi
	Hc0w==
X-Received: by 10.66.251.233 with SMTP id zn9mr55016172pac.67.1400630747457;
	Tue, 20 May 2014 17:05:47 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id bz4sm5042881pbb.12.2014.05.20.17.05.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 May 2014 17:05:46 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 May 2014 08:10:39 +0800
Message-Id: <1400631039-7208-3-git-send-email-tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::235
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com, jan.kiszka@web.de,
	afaerber@suse.de, Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] block: replace fprintf(stderr,
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
X-List-Received-Date: Wed, 21 May 2014 00:06:30 -0000

Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
have been removed because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 block-migration.c      |    5 +--
 block.c                |    4 +-
 block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
 block/qcow2.c          |   18 ++++----
 block/raw-posix.c      |   10 ++---
 block/raw-win32.c      |    6 +--
 block/ssh.c            |    2 +-
 block/vdi.c            |   15 ++++---
 block/vmdk.c           |   15 +++----
 block/vpc.c            |    4 +-
 block/vvfat.c          |   69 +++++++++++++++--------------
 blockdev.c             |    6 +--
 12 files changed, 132 insertions(+), 136 deletions(-)

diff --git a/block-migration.c b/block-migration.c
index 56951e0..1660565 100644
--- a/block-migration.c
+++ b/block-migration.c
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
index c90c71a..14f581b 100644
--- a/block.c
+++ b/block.c
@@ -2698,8 +2698,8 @@ static int bdrv_prwv_co(BlockDriverState *bs, int64_t offset,
      * if it has been enabled.
      */
     if (bs->io_limits_enabled) {
-        fprintf(stderr, "Disabling I/O throttling on '%s' due "
-                        "to synchronous I/O.\n", bdrv_get_device_name(bs));
+        error_report("Disabling I/O throttling on '%s' due "
+                     "to synchronous I/O.", bdrv_get_device_name(bs));
         bdrv_io_limits_disable(bs);
     }
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 9507aef..23d44b0 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -795,7 +795,7 @@ void qcow2_free_clusters(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_CLUSTER_FREE);
     ret = update_refcount(bs, offset, size, -1, type);
     if (ret < 0) {
-        fprintf(stderr, "qcow2_free_clusters failed: %s\n", strerror(-ret));
+        error_report("qcow2_free_clusters failed: %s", strerror(-ret));
         /* TODO Remember the clusters to free them later and avoid leaking */
     }
 }
@@ -1040,14 +1040,14 @@ static void inc_refcounts(BlockDriverState *bs,
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
@@ -1091,9 +1091,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1143,8 +1143,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
-                fprintf(stderr, "ERROR offset=%" PRIx64 ": Cluster is not "
-                    "properly aligned; L2 entry corrupted.\n", offset);
+                error_report("ERROR offset=%" PRIx64 ": Cluster is not "
+                             "properly aligned; L2 entry corrupted.", offset);
                 res->corruptions++;
             }
             break;
@@ -1162,7 +1162,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
+    error_report("ERROR: I/O error in check_refcounts_l2");
     g_free(l2_table);
     return -EIO;
 }
@@ -1215,8 +1215,8 @@ static int check_refcounts_l1(BlockDriverState *bs,
 
             /* L2 tables are cluster aligned */
             if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
+                error_report("ERROR l2_offset=%" PRIx64 ": Table is not "
+                             "cluster aligned; L1 entry corrupted", l2_offset);
                 res->corruptions++;
             }
 
@@ -1232,7 +1232,7 @@ static int check_refcounts_l1(BlockDriverState *bs,
     return 0;
 
 fail:
-    fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+    error_report("ERROR: I/O error in check_refcounts_l1");
     res->check_errors++;
     g_free(l1_table);
     return -EIO;
@@ -1270,11 +1270,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1293,7 +1293,7 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
         ret = bdrv_pread(bs->file, l2_offset, l2_table,
                          s->l2_size * sizeof(uint64_t));
         if (ret < 0) {
-            fprintf(stderr, "ERROR: Could not read L2 table: %s\n",
+            error_report("ERROR: Could not read L2 table: %s",
                     strerror(-ret));
             res->check_errors++;
             goto fail;
@@ -1312,11 +1312,11 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1334,16 +1334,16 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1409,8 +1409,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
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
@@ -1418,7 +1418,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     /* fetch current refcount block content */
     ret = qcow2_cache_get(bs, s->refcount_block_cache, offset, &refcount_block);
     if (ret < 0) {
-        fprintf(stderr, "Could not fetch refcount block: %s\n", strerror(-ret));
+        error_report("Could not fetch refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1426,8 +1426,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
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
@@ -1437,7 +1437,7 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     ret = bdrv_write(bs->file, new_offset / BDRV_SECTOR_SIZE, refcount_block,
             s->cluster_sectors);
     if (ret < 0) {
-        fprintf(stderr, "Could not write refcount block: %s\n", strerror(-ret));
+        error_report("Could not write refcount block: %s", strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1446,8 +1446,8 @@ static int64_t realloc_refcount_block(BlockDriverState *bs, int reftable_index,
     s->refcount_table[reftable_index] = new_offset;
     ret = write_reftable_entry(bs, reftable_index);
     if (ret < 0) {
-        fprintf(stderr, "Could not update refcount table: %s\n",
-                strerror(-ret));
+        error_report("Could not update refcount table: %s",
+                     strerror(-ret));
         goto fail_free_cluster;
     }
 
@@ -1540,15 +1540,15 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
 
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
+           error_report("ERROR refcount block %" PRId64
+                        " is outside image", i);
             res->corruptions++;
             continue;
         }
@@ -1557,11 +1557,11 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1598,8 +1598,8 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1620,11 +1620,11 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -1811,9 +1811,9 @@ int qcow2_pre_write_overlap_check(BlockDriverState *bs, int ign, int64_t offset,
 
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
index a4b97e8..38da14d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
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
index 6586a0c..bd8b65e 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
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
@@ -945,7 +945,7 @@ static int aio_worker(void *arg)
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
index aa63c9d..6932905 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1060,7 +1060,7 @@ static void bdrv_ssh_init(void)
 
     r = libssh2_init(0);
     if (r != 0) {
-        fprintf(stderr, "libssh2 initialization failed, %d\n", r);
+        error_report("libssh2 initialization failed, %d", r);
         exit(EXIT_FAILURE);
     }
 
diff --git a/block/vdi.c b/block/vdi.c
index 27737af..53ada34 100644
--- a/block/vdi.c
+++ b/block/vdi.c
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
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 480ea37..fe6fd74 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
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
index c3af7ff..618aadf 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -758,7 +758,7 @@ static int read_directory(BDRVVVFATState* s, int mapping_index)
 	else
 	    direntry->begin=0; /* do that later */
         if (st.st_size > 0x7fffffff) {
-	    fprintf(stderr, "File %s is larger than 2GB\n", buffer);
+	        error_report("File %s is larger than 2GB", buffer);
             g_free(buffer);
             closedir(dir);
 	    return -2;
@@ -892,9 +892,8 @@ static int init_directories(BDRVVVFATState* s,
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
@@ -919,8 +918,8 @@ static int init_directories(BDRVVVFATState* s,
 	cluster = mapping->end;
 
 	if(cluster > s->cluster_count) {
-	    fprintf(stderr,"Directory does not fit in FAT%d (capacity %.2f MB)\n",
-		    s->fat_type, s->sector_count / 2000.0);
+	    error_report("Directory does not fit in FAT%d (capacity %.2f MB)",
+		             s->fat_type, s->sector_count / 2000.0);
 	    return -EINVAL;
 	}
 
@@ -1127,8 +1126,8 @@ DLOG(if (stderr == NULL) {
 
     switch (s->fat_type) {
     case 32:
-	    fprintf(stderr, "Big fat greek warning: FAT32 has not been tested. "
-                "You are welcome to do so!\n");
+	    error_report("Big fat greek warning: FAT32 has not been tested. "
+                     "You are welcome to do so!");
         break;
     case 16:
     case 12:
@@ -1154,8 +1153,8 @@ DLOG(if (stderr == NULL) {
     s->fat2 = NULL;
     s->downcase_short_names = 1;
 
-    fprintf(stderr, "vvfat %s chs %d,%d,%d\n",
-            dirname, cyls, heads, secs);
+    error_report("vvfat %s chs %d,%d,%d",
+                 dirname, cyls, heads, secs);
 
     s->sector_count = cyls * heads * secs - (s->first_sectors_number - 1);
 
@@ -1863,7 +1862,7 @@ static int check_directory_consistency(BDRVVVFATState *s,
 	ret++;
 
 	if (s->used_clusters[cluster_num] & USED_ANY) {
-	    fprintf(stderr, "cluster %d used more than once\n", (int)cluster_num);
+	    error_report("cluster %d used more than once", (int)cluster_num);
 	    return 0;
 	}
 	s->used_clusters[cluster_num] = USED_DIRECTORY;
@@ -1872,7 +1871,7 @@ DLOG(fprintf(stderr, "read cluster %d (sector %d)\n", (int)cluster_num, (int)clu
 	subret = vvfat_read(s->bs, cluster2sector(s, cluster_num), cluster,
 		s->sectors_per_cluster);
 	if (subret) {
-	    fprintf(stderr, "Error fetching direntries\n");
+	    error_report("Error fetching direntries");
 	fail:
             g_free(cluster);
 	    return 0;
@@ -1888,7 +1887,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 
 	    subret = parse_long_name(&lfn, direntries + i);
 	    if (subret < 0) {
-		fprintf(stderr, "Error in long name\n");
+		error_report("Error in long name");
 		goto fail;
 	    }
 	    if (subret == 0 || is_free(direntries + i))
@@ -1897,7 +1896,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    if (fat_chksum(direntries+i) != lfn.checksum) {
 		subret = parse_short_name(s, &lfn, direntries + i);
 		if (subret < 0) {
-		    fprintf(stderr, "Error in short name (%d)\n", subret);
+		    error_report("Error in short name (%d)", subret);
 		    goto fail;
 		}
 		if (subret > 0 || !strcmp((char*)lfn.name, ".")
@@ -1907,7 +1906,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 	    lfn.checksum = 0x100; /* cannot use long name twice */
 
 	    if (path_len + 1 + lfn.len >= PATH_MAX) {
-		fprintf(stderr, "Name too long: %s/%s\n", path, lfn.name);
+		error_report("Name too long: %s/%s", path, lfn.name);
 		goto fail;
 	    }
             pstrcpy(path2 + path_len + 1, sizeof(path2) - path_len - 1,
@@ -1974,8 +1973,8 @@ DLOG(checkpoint());
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
@@ -2323,8 +2322,8 @@ static int commit_one_file(BDRVVVFATState* s,
 
     fd = qemu_open(mapping->path, O_RDWR | O_CREAT | O_BINARY, 0666);
     if (fd < 0) {
-	fprintf(stderr, "Could not open %s... (%s, %d)\n", mapping->path,
-		strerror(errno), errno);
+	   error_report("Could not open %s... (%s, %d)", mapping->path,
+	               	strerror(errno), errno);
         g_free(cluster);
 	return fd;
     }
@@ -2716,8 +2715,8 @@ static int do_commit(BDRVVVFATState* s)
 
     ret = handle_renames_and_mkdirs(s);
     if (ret) {
-	fprintf(stderr, "Error handling renames (%d)\n", ret);
-        abort();
+	   error_report("Error handling renames (%d)", ret);
+       abort();
 	return ret;
     }
 
@@ -2727,22 +2726,22 @@ static int do_commit(BDRVVVFATState* s)
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
 
@@ -2794,9 +2793,9 @@ DLOG(checkpoint());
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
@@ -2819,8 +2818,8 @@ DLOG(checkpoint());
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
@@ -2828,7 +2827,7 @@ DLOG(checkpoint());
 			if (memcmp(direntries + k,
 				    array_get(&(s->directory), dir_index + k),
 				    sizeof(direntry_t))) {
-			    fprintf(stderr, "Warning: tried to write to write-protected file\n");
+			    error_report("Warning: tried to write to write-protected file");
 			    return -1;
 			}
 		    }
@@ -2845,8 +2844,8 @@ DLOG(checkpoint());
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
index 7810e9f..e36e731 100644
--- a/blockdev.c
+++ b/blockdev.c
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
-- 
1.7.9.5


