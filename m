Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm8aK-0005rl-DR
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 14:11:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aH-0005oz-R9
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aG-0002JF-Vx
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:11:53 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:39092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1Qm8aG-0002He-PT; Wed, 27 Jul 2011 14:11:52 -0400
Received: by mail-ww0-f53.google.com with SMTP id 26so1519597wwf.10
	for <multiple recipients>; Wed, 27 Jul 2011 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WDA6Rf+GCjw+nUwLOjdOVmVyQY8QFxIcZA67PaGLpXo=;
	b=irpqRxZv+Pwaaj9uQPlVecaNnK5uxmKkCHjZQZ9M8Wj0kuCE2VNGkhaQkoUiz7+cLv
	pu9mTdQAHlz0ydQRMnR/R2YgdI7XS6YBuWnsU05RQIbvCXIwzVezy6QmR4zR5IxryZGl
	7nA0DfuqkODfl2Az4xEUi4rCOxJRUK/9T3z/Q=
Received: by 10.227.55.20 with SMTP id s20mr6510896wbg.15.1311790312344;
	Wed, 27 Jul 2011 11:11:52 -0700 (PDT)
Received: from obol602.localdomain (net-2-37-106-50.cust.dsl.vodafone.it
	[2.37.106.50])
	by mx.google.com with ESMTPS id fn12sm108836wbb.38.2011.07.27.11.11.48
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 11:11:49 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2011 20:12:00 +0200
Message-Id: <1311790322-10889-2-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
References: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/3] block: removed unused function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 18:11:55 -0000


Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 block.c |   13 -------------
 block.h |    2 --
 2 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index 9549b9e..b2d3983 100644
--- a/block.c
+++ b/block.c
@@ -1108,19 +1108,6 @@ int bdrv_pwrite_sync(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-/*
- * Writes to the file and ensures that no writes are reordered across this
- * request (acts as a barrier)
- *
- * Returns 0 on success, -errno in error cases.
- */
-int bdrv_write_sync(BlockDriverState *bs, int64_t sector_num,
-    const uint8_t *buf, int nb_sectors)
-{
-    return bdrv_pwrite_sync(bs, BDRV_SECTOR_SIZE * sector_num,
-        buf, BDRV_SECTOR_SIZE * nb_sectors);
-}
-
 /**
  * Truncate file to 'offset' bytes (needed only for file protocols)
  */
diff --git a/block.h b/block.h
index 59cc410..e672bc6 100644
--- a/block.h
+++ b/block.h
@@ -85,8 +85,6 @@ int bdrv_pwrite(BlockDriverState *bs, int64_t offset,
                 const void *buf, int count);
 int bdrv_pwrite_sync(BlockDriverState *bs, int64_t offset,
     const void *buf, int count);
-int bdrv_write_sync(BlockDriverState *bs, int64_t sector_num,
-    const uint8_t *buf, int nb_sectors);
 int bdrv_truncate(BlockDriverState *bs, int64_t offset);
 int64_t bdrv_getlength(BlockDriverState *bs);
 int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
-- 
1.7.1


