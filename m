Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mf4-0005JX-GX
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mey-0005Di-K7
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mew-0003Ja-Lp
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mei-0003GW-0X; Tue, 31 May 2016 12:36:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9664764D05;
	Tue, 31 May 2016 16:36:35 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QJ011053; Tue, 31 May 2016 12:36:31 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org
Date: Tue, 31 May 2016 18:35:54 +0200
Message-Id: <1464712565-14857-6-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 31 May 2016 16:36:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 05/16] block: Use DIV_ROUND_UP
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
2.5.5


