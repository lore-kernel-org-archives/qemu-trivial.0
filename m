Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mep-00056M-SH
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mej-0004zi-BI
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7med-0003GI-Jv
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7meT-0003Dn-MP; Tue, 31 May 2016 12:36:21 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 463226445D;
	Tue, 31 May 2016 16:36:21 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QG011053; Tue, 31 May 2016 12:36:18 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org
Date: Tue, 31 May 2016 18:35:51 +0200
Message-Id: <1464712565-14857-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 31 May 2016 16:36:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 02/16] parallels: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:36:42 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5


