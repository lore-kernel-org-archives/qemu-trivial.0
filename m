Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuM6-0006oQ-Nr
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM2-0006io-Uy
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuM1-0005gi-Rg
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLt-0005b0-86; Tue, 28 Jun 2016 10:51:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLk-00065K-WA; Tue, 28 Jun 2016 15:50:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:47 +0100
Message-Id: <1467125451-16700-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 2/6] block/qcow2: Don't use cpu_to_*w()
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
X-List-Received-Date: Tue, 28 Jun 2016 14:51:12 -0000

Don't use the cpu_to_*w() functions, which we are trying to deprecate.
Instead either just use cpu_to_*() to do the byteswap, or use
st*_be_p() if we need to do the store somewhere other than to a
variable that's already the correct type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/qcow2-cluster.c  |  2 +-
 block/qcow2-refcount.c | 11 +++++------
 block/qcow2.c          |  6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 0fb4356..9c6be96 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -117,7 +117,7 @@ int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
 
     /* set new table */
     BLKDBG_EVENT(bs->file, BLKDBG_L1_GROW_ACTIVATE_TABLE);
-    cpu_to_be32w((uint32_t*)data, new_l1_size);
+    stl_be_p(data, new_l1_size);
     stq_be_p(data + 4, new_l1_table_offset);
     ret = bdrv_pwrite_sync(bs->file->bs, offsetof(QCowHeader, l1_size),
                            data, sizeof(data));
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 3bef410..233763d 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -562,8 +562,8 @@ static int alloc_refcount_block(BlockDriverState *bs,
         uint64_t d64;
         uint32_t d32;
     } data;
-    cpu_to_be64w(&data.d64, table_offset);
-    cpu_to_be32w(&data.d32, table_clusters);
+    data.d64 = cpu_to_be64(table_offset);
+    data.d32 = cpu_to_be32(table_clusters);
     BLKDBG_EVENT(bs->file, BLKDBG_REFBLOCK_ALLOC_SWITCH_TABLE);
     ret = bdrv_pwrite_sync(bs->file->bs,
                            offsetof(QCowHeader, refcount_table_offset),
@@ -2155,10 +2155,9 @@ write_refblocks:
     }
 
     /* Enter new reftable into the image header */
-    cpu_to_be64w(&reftable_offset_and_clusters.reftable_offset,
-                 reftable_offset);
-    cpu_to_be32w(&reftable_offset_and_clusters.reftable_clusters,
-                 size_to_clusters(s, reftable_size * sizeof(uint64_t)));
+    reftable_offset_and_clusters.reftable_offset = cpu_to_be64(reftable_offset);
+    reftable_offset_and_clusters.reftable_clusters =
+        cpu_to_be32(size_to_clusters(s, reftable_size * sizeof(uint64_t)));
     ret = bdrv_pwrite_sync(bs->file->bs, offsetof(QCowHeader,
                                                   refcount_table_offset),
                            &reftable_offset_and_clusters,
diff --git a/block/qcow2.c b/block/qcow2.c
index 23f666d..cd0081e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2693,9 +2693,9 @@ static int make_completely_empty(BlockDriverState *bs)
     /* "Create" an empty reftable (one cluster) directly after the image
      * header and an empty L1 table three clusters after the image header;
      * the cluster between those two will be used as the first refblock */
-    cpu_to_be64w(&l1_ofs_rt_ofs_cls.l1_offset, 3 * s->cluster_size);
-    cpu_to_be64w(&l1_ofs_rt_ofs_cls.reftable_offset, s->cluster_size);
-    cpu_to_be32w(&l1_ofs_rt_ofs_cls.reftable_clusters, 1);
+    l1_ofs_rt_ofs_cls.l1_offset = cpu_to_be64(3 * s->cluster_size);
+    l1_ofs_rt_ofs_cls.reftable_offset = cpu_to_be64(s->cluster_size);
+    l1_ofs_rt_ofs_cls.reftable_clusters = cpu_to_be32(1);
     ret = bdrv_pwrite_sync(bs->file->bs, offsetof(QCowHeader, l1_table_offset),
                            &l1_ofs_rt_ofs_cls, sizeof(l1_ofs_rt_ofs_cls));
     if (ret < 0) {
-- 
1.9.1


