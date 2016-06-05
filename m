Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7s-0001dR-4H
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7m-0001Th-BS
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7k-0003mR-4i
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7c-0003jm-6F; Sun, 05 Jun 2016 07:21:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ABFB040921;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CB5BBAFD;
	Sun,  5 Jun 2016 10:43:37 +0300 (MSK)
Received: (nullmailer pid 1172 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:17 +0300
Message-Id: <34f4f511c85698b7fc53a34a84090bebf0d683d3.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 40/52] qed: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 11:21:50 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/qed-check.c | 3 +--
 block/qed.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/qed-check.c b/block/qed-check.c
index 622f308..dcd4f03 100644
--- a/block/qed-check.c
+++ b/block/qed-check.c
@@ -234,8 +234,7 @@ int qed_check(BDRVQEDState *s, BdrvCheckResult *result, bool fix)
     }
 
     check.result->bfi.total_clusters =
-        (s->header.image_size + s->header.cluster_size - 1) /
-            s->header.cluster_size;
+        DIV_ROUND_UP(s->header.image_size, s->header.cluster_size);
     ret = qed_check_l1_table(&check, s->l1_table);
     if (ret == 0) {
         /* Only check for leaks if entire image was scanned successfully */
diff --git a/block/qed.c b/block/qed.c
index b591d4a..0f62192 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -143,8 +143,7 @@ static void qed_write_header(BDRVQEDState *s, BlockCompletionFunc cb,
      * them, and write back.
      */
 
-    int nsectors = (sizeof(QEDHeader) + BDRV_SECTOR_SIZE - 1) /
-                   BDRV_SECTOR_SIZE;
+    int nsectors = DIV_ROUND_UP(sizeof(QEDHeader), BDRV_SECTOR_SIZE);
     size_t len = nsectors * BDRV_SECTOR_SIZE;
     QEDWriteHeaderCB *write_header_cb = gencb_alloc(sizeof(*write_header_cb),
                                                     cb, opaque);
-- 
2.1.4


