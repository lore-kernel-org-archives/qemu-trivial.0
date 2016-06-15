Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDDUD-0006NL-7F
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jun 2016 12:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDU6-0006J7-Ro
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bDDU2-0003zc-Vq
	for qemu-trivial@nongnu.org; Wed, 15 Jun 2016 12:16:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bDDTn-0003wo-Uf; Wed, 15 Jun 2016 12:15:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90D3C6030;
	Wed, 15 Jun 2016 16:15:47 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FGElUu011275; Wed, 15 Jun 2016 12:15:45 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>, qemu-block@nongnu.org
Date: Wed, 15 Jun 2016 18:14:37 +0200
Message-Id: <1466007277-17525-8-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 15 Jun 2016 16:15:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 7/7] sheepdog: remove useless casts
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
X-List-Received-Date: Wed, 15 Jun 2016 16:16:11 -0000

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>
CC: qemu-block@nongnu.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 block/sheepdog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index 23fbace..95e6a11 100644
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
2.5.5


