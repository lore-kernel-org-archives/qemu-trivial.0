Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9V2A-0007iZ-H0
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 06:11:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V25-0007dl-Pj
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V24-0003ID-LD
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9V1s-0003ET-Sa; Sun, 05 Jun 2016 06:11:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49CE44091D;
	Sun,  5 Jun 2016 13:11:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6E670B30;
	Sun,  5 Jun 2016 10:43:39 +0300 (MSK)
Received: (nullmailer pid 1170 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:16 +0300
Message-Id: <87acf1e62e3ae363072b7f24792704dfdd772427.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 39/52] qcow/qcow2: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 10:11:53 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/qcow.c           | 4 ++--
 block/qcow2-cluster.c  | 4 ++--
 block/qcow2-refcount.c | 6 ++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index cb4bf02..c5cf813 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -868,8 +868,8 @@ static int qcow_create(const char *filename, QemuOpts *opts, Error **errp)
     }
 
     tmp = g_malloc0(BDRV_SECTOR_SIZE);
-    for (i = 0; i < ((sizeof(uint64_t)*l1_size + BDRV_SECTOR_SIZE - 1)/
-        BDRV_SECTOR_SIZE); i++) {
+    for (i = 0; i < DIV_ROUND_UP(sizeof(uint64_t) * l1_size, BDRV_SECTOR_SIZE);
+         i++) {
         ret = blk_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
                          tmp, BDRV_SECTOR_SIZE, 0);
         if (ret != BDRV_SECTOR_SIZE) {
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 892e0fb..c737973 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1868,8 +1868,8 @@ int qcow2_expand_zero_clusters(BlockDriverState *bs,
     }
 
     for (i = 0; i < s->nb_snapshots; i++) {
-        int l1_sectors = (s->snapshots[i].l1_size * sizeof(uint64_t) +
-                BDRV_SECTOR_SIZE - 1) / BDRV_SECTOR_SIZE;
+        int l1_sectors = DIV_ROUND_UP(s->snapshots[i].l1_size *
+                                      sizeof(uint64_t), BDRV_SECTOR_SIZE);
 
         l1_table = g_realloc(l1_table, l1_sectors * BDRV_SECTOR_SIZE);
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 7fa972a..66f187a 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -490,14 +490,12 @@ static int alloc_refcount_block(BlockDriverState *bs,
         uint64_t table_clusters =
             size_to_clusters(s, table_size * sizeof(uint64_t));
         blocks_clusters = 1 +
-            ((table_clusters + s->refcount_block_size - 1)
-            / s->refcount_block_size);
+            DIV_ROUND_UP(table_clusters, s->refcount_block_size);
         uint64_t meta_clusters = table_clusters + blocks_clusters;
 
         last_table_size = table_size;
         table_size = next_refcount_table_size(s, blocks_used +
-            ((meta_clusters + s->refcount_block_size - 1)
-            / s->refcount_block_size));
+            DIV_ROUND_UP(meta_clusters, s->refcount_block_size));
 
     } while (last_table_size != table_size);
 
-- 
2.1.4


