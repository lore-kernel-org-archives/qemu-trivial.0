Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9YJM-00069n-Pz
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJK-00066y-C6
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9YJJ-0002Ky-FF
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 09:41:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9YJ5-0002HX-81; Sun, 05 Jun 2016 09:41:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B84A54092E;
	Sun,  5 Jun 2016 16:41:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 104E6AF6;
	Sun,  5 Jun 2016 10:43:36 +0300 (MSK)
Received: (nullmailer pid 1168 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:15 +0300
Message-Id: <3cb91de6ba7069c8a118d59cf8a2c9cdd48085cd.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 38/52] parallels: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 13:41:51 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 99fc0f7..b9b5c6d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -204,7 +204,7 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
         return -EINVAL;
     }
 
-    to_allocate = (sector_num + *pnum + s->tracks - 1) / s->tracks - idx;
+    to_allocate = DIV_ROUND_UP(sector_num + *pnum, s->tracks) - idx;
     space = to_allocate * s->tracks;
     if (s->data_end + space > bdrv_getlength(bs->file->bs) >> BDRV_SECTOR_BITS) {
         int ret;
-- 
2.1.4


