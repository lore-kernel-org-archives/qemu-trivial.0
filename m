Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XgvD9-0001lJ-MY
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 08:40:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgvD4-0001de-1o
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:40:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>) id 1XgvCz-0008A0-G1
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 08:40:13 -0400
Received: from [58.251.49.30] (port=39204 helo=mail.sangfor.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhanghy@sangfor.com>)
	id 1XgvCp-0007sm-ER; Wed, 22 Oct 2014 08:40:00 -0400
Received: from localhost (mail.sangfor.com [127.0.0.1])
	by mail.sangfor.com (Postfix) with ESMTP id EB70C17C0297;
	Wed, 22 Oct 2014 20:20:41 +0800 (CST)
Received: from mail.sangfor.com ([127.0.0.1])
	by localhost (mail.sangfor.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrZNLZ0ec73o; Wed, 22 Oct 2014 20:20:41 +0800 (CST)
Received: from vv-PC (unknown [10.10.6.254])
	by mail.sangfor.com (Postfix) with ESMTPA id 7386917C0294;
	Wed, 22 Oct 2014 20:20:41 +0800 (CST)
Date: Wed, 22 Oct 2014 20:39:51 +0800
From: "Zhang Haoyu" <zhanghy@sangfor.com>
To: "qemu-devel" <qemu-devel@nongnu.org>
Message-ID: <201410222039495960337@sangfor.com>
X-mailer: Foxmail 6, 15, 201, 20 [cn]
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 58.251.49.30
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Subject: [Qemu-trivial] [PATCH v5] snapshot: use local variable to
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
X-List-Received-Date: Wed, 22 Oct 2014 12:40:18 -0000

Use local variable to bdrv_pwrite_sync L1 table,
needless to make conversion of cached L1 table between
big-endian and host style.

Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
v4 -> v5:
- delete superfluous check of "l1_size2 != 0"
  after qemu_try_blockalign(l1_size2)

v3 -> v4:
 - convert local L1 table to host-style before copy it
   back to s->l1_table

v2 -> v3:
 - replace g_try_malloc0 with qemu_try_blockalign
 - copy the latest local L1 table back to s->l1_table
   after successfully bdrv_pwrite_sync L1 table

v1 -> v2:
 - remove the superflous assignment, l1_table = NULL;
 - replace 512 with BDRV_SECTOR_SIZE, and align_offset with ROUND_UP
 - remove needless check of if (l1_table) before g_free(l1_table)

 block/qcow2-refcount.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2bcaaf9..4cf6639 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -881,14 +881,17 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 {
     BDRVQcowState *s = bs->opaque;
     uint64_t *l1_table, *l2_table, l2_offset, offset, l1_size2;
-    bool l1_allocated = false;
     int64_t old_offset, old_l2_offset;
     int i, j, l1_modified = 0, nb_csectors, refcount;
     int ret;
 
     l2_table = NULL;
-    l1_table = NULL;
     l1_size2 = l1_size * sizeof(uint64_t);
+    l1_table = qemu_try_blockalign(bs->file, l1_size2);
+    if (l1_table == NULL) {
+        ret = -ENOMEM;
+        goto fail;
+    }
 
     s->cache_discards = true;
 
@@ -896,13 +899,6 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
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
@@ -912,8 +908,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
             be64_to_cpus(&l1_table[i]);
     } else {
         assert(l1_size == s->l1_size);
-        l1_table = s->l1_table;
-        l1_allocated = false;
+        memcpy(l1_table, s->l1_table, l1_size2);
     }
 
     for(i = 0; i < l1_size; i++) {
@@ -1055,13 +1050,14 @@ fail:
         }
 
         ret = bdrv_pwrite_sync(bs->file, l1_table_offset, l1_table, l1_size2);
-
-        for (i = 0; i < l1_size; i++) {
-            be64_to_cpus(&l1_table[i]);
+        if (ret == 0) {
+            for (i = 0; i < l1_size; i++) {
+                be64_to_cpus(&l1_table[i]);
+            }
+            memcpy(s->l1_table, l1_table, l1_size2);
         }
     }
-    if (l1_allocated)
-        g_free(l1_table);
+    g_free(l1_table);
     return ret;
 }
 
-- 
1.7.12.4


