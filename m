Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mf6-0005LF-72
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mey-0005Dv-Pj
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mew-0003Jf-QM
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mec-0003Fy-UB; Tue, 31 May 2016 12:36:31 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80EA663147;
	Tue, 31 May 2016 16:36:30 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QI011053; Tue, 31 May 2016 12:36:27 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org
Date: Tue, 31 May 2016 18:35:53 +0200
Message-Id: <1464712565-14857-5-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 31 May 2016 16:36:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 04/16] qed: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:36:57 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5


