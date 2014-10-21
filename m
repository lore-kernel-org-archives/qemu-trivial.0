Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XgZ0o-0004E0-Gh
	for mharc-qemu-trivial@gnu.org; Tue, 21 Oct 2014 08:58:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgVNJ-0008Cd-V4
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 05:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgVNE-0002qa-5P
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 05:05:05 -0400
Received: from [58.251.49.30] (port=33948 helo=mail.sangfor.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgVND-0002qM-Ir
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 05:05:00 -0400
Received: from localhost (mail.sangfor.com [127.0.0.1])
	by mail.sangfor.com (Postfix) with ESMTP id 79AC817C0054;
	Tue, 21 Oct 2014 15:45:09 +0800 (CST)
Received: from mail.sangfor.com ([127.0.0.1])
	by localhost (mail.sangfor.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id by4bANuuSc-e; Tue, 21 Oct 2014 15:45:09 +0800 (CST)
Received: from vv-PC (unknown [10.10.6.254])
	by mail.sangfor.com (Postfix) with ESMTPA id 0B98517C0051;
	Tue, 21 Oct 2014 15:45:09 +0800 (CST)
Date: Tue, 21 Oct 2014 16:04:13 +0800
From: "Zhang Haoyu" <zhanghy@sangfor.com>
To: "qemu-devel" <qemu-devel@nongnu.org>
Message-ID: <201410211604116199416@sangfor.com>
X-mailer: Foxmail 6, 15, 201, 20 [cn]
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 58.251.49.30
X-Mailman-Approved-At: Tue, 21 Oct 2014 08:58:05 -0400
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: [Qemu-trivial] [PATCH] snapshot: use local variable to
	bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Tue, 21 Oct 2014 09:05:12 -0000

Use local variable to bdrv_pwrite_sync L1 table,
needless to make conversion of cached L1 table between
big-endian and host style.

Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
---
 block/qcow2-refcount.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2bcaaf9..8b318e8 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -881,7 +881,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 {
     BDRVQcowState *s = bs->opaque;
     uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
-    bool l1_allocated = false;
     int64_t old_offset, old_l2_offset;
     int i, j, l1_modified = 0, nb_csectors, refcount;
     int ret;
@@ -889,6 +888,11 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     l2_table = NULL;
     l1_table = NULL;
     l1_size2 = l1_size * sizeof(uint64_t);
+    l1_table = g_try_malloc0(align_offset(l1_size2, 512));
+    if (l1_size2 && l1_table == NULL) {
+        ret = -ENOMEM;
+        goto fail;
+    }
 
     s->cache_discards = true;
 
@@ -896,13 +900,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
      * l1_table_offset when it is the current s->l1_table_offset! Be careful
      * when changing this! */
     if (l1_table_offset != s->l1_table_offset) {
-        l1_table = g_try_malloc0(align_offset(l1_size2, 512));
-        if (l1_size2 && l1_table == NULL) {
-            ret = -ENOMEM;
-            goto fail;
-        }
-        l1_allocated = true;
-
         ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
         if (ret < 0) {
             goto fail;
@@ -912,8 +909,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
             be64_to_cpus(&l1_table[i]);
     } else {
         assert(l1_size == s->l1_size);
-        l1_table = s->l1_table;
-        l1_allocated = false;
+        memcpy(l1_table, s->l1_table, l1_size2);
     }
 
     for(i = 0; i < l1_size; i++) {
@@ -1055,12 +1051,8 @@ fail:
         }
 
         ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
-
-        for (i = 0; i < l1_size; i++) {
-            be64_to_cpus(&l1_table[i]);
-        }
     }
-    if (l1_allocated)
+    if (l1_table)
         g_free(l1_table);
     return ret;
 }
-- 
1.7.12.4


