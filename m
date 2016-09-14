Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6HM-00011g-Ea
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:14:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HH-0000vq-EC
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HF-0003o4-9P
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk6H8-0003iP-P7; Wed, 14 Sep 2016 05:14:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 047C341858;
	Wed, 14 Sep 2016 12:14:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EBC30B0C;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17360 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:50 +0300
Message-Id: <7298462dd3a957b444f5c2d9b42d0de56757f3ed.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 24/27] sheepdog: remove useless casts
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
X-List-Received-Date: Wed, 14 Sep 2016 09:14:51 -0000

From: Laurent Vivier <lvivier@redhat.com>

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>
CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/sheepdog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index 66e1cb2..ccbf7e1 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -1049,7 +1049,7 @@ static int parse_vdiname(BDRVSheepdogState *s, const char *filename,
     const char *host_spec, *vdi_spec;
     int nr_sep, ret;
 
-    strstart(filename, "sheepdog:", (const char **)&filename);
+    strstart(filename, "sheepdog:", &filename);
     p = q = g_strdup(filename);
 
     /* count the number of separators */
@@ -2652,7 +2652,7 @@ static int sd_snapshot_list(BlockDriverState *bs, QEMUSnapshotInfo **psn_tab)
     req.opcode = SD_OP_READ_VDIS;
     req.data_length = max;
 
-    ret = do_req(fd, s->aio_context, (SheepdogReq *)&req,
+    ret = do_req(fd, s->aio_context, &req,
                  vdi_inuse, &wlen, &rlen);
 
     closesocket(fd);
-- 
2.1.4


