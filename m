Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mer-00057Y-67
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mem-00052F-6I
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mej-0003Gr-WF
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7meY-0003ES-IW; Tue, 31 May 2016 12:36:26 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 230D285367;
	Tue, 31 May 2016 16:36:26 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QH011053; Tue, 31 May 2016 12:36:22 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org
Date: Tue, 31 May 2016 18:35:52 +0200
Message-Id: <1464712565-14857-4-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 31 May 2016 16:36:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 03/16] qcow/qcow2: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:36:44 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5


