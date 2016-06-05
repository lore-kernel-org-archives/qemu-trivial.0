Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TwP-0004MQ-DL
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 05:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwL-0004IZ-CX
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwK-0004px-Gx
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51831)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Tw6-0004lF-Ui; Sun, 05 Jun 2016 05:01:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E465840914;
	Sun,  5 Jun 2016 12:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 784D4B03;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1174 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:18 +0300
Message-Id: <e2d186ecfdf6b2f2d400f28b7f1e46613a452af1.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 41/52] block: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 09:01:50 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/vvfat.c      | 3 +--
 hw/block/tc58128.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index a39dbe6..6d2e21c 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1960,8 +1960,7 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 		/* check file size with FAT */
 		cluster_count = get_cluster_count_for_direntry(s, direntries + i, path2);
 		if (cluster_count !=
-			(le32_to_cpu(direntries[i].size) + s->cluster_size
-			 - 1) / s->cluster_size) {
+            DIV_ROUND_UP(le32_to_cpu(direntries[i].size), s->cluster_size)) {
 		    DLOG(fprintf(stderr, "Cluster count mismatch\n"));
 		    goto fail;
 		}
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index 7909d50..1d9f7ee 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -45,7 +45,7 @@ static void init_dev(tc58128_dev * dev, const char *filename)
             }
 	} else {
 	    /* Build first block with number of blocks */
-	    blocks = (ret + 528 * 32 - 1) / (528 * 32);
+            blocks = DIV_ROUND_UP(ret, 528 * 32);
 	    dev->flash_contents[0] = blocks & 0xff;
 	    dev->flash_contents[1] = (blocks >> 8) & 0xff;
 	    dev->flash_contents[2] = (blocks >> 16) & 0xff;
-- 
2.1.4


