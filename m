Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoaSr-0002vV-Ui
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 07:54:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RoaSo-0002l2-My
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 07:54:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RoaSn-00075J-QL
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 07:54:34 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:39634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RoaSl-00074z-Mo; Sat, 21 Jan 2012 07:54:31 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5CC11728000B; Sat, 21 Jan 2012 13:54:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id OCOcBK1zG3GA; Sat, 21 Jan 2012 13:54:25 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 8F8D1728000C; Sat, 21 Jan 2012 13:54:25 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 21 Jan 2012 13:54:24 +0100
Message-Id: <1327150464-29682-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.7.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block/vdi: Zero unused parts when allocating
	a new block (fix #919242)
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
X-List-Received-Date: Sat, 21 Jan 2012 12:54:35 -0000

The new block was filled with zero when it was allocated by g_malloc0,
but when it was reused later and only partially used, data from the
previously allocated block were still present and written to the new
block.

This caused the problems reported by bug #919242
(https://bugs.launchpad.net/qemu/+bug/919242).

Now the unused parts of the new block which are before and after the data
are always filled with zero, so it is no longer necessary to zero the whole
block with g_malloc0.

I also updated the copyright comment.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/vdi.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 31cdfab..6a0011f 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -1,7 +1,7 @@
 /*
  * Block driver for the Virtual Disk Image (VDI) format
  *
- * Copyright (c) 2009 Stefan Weil
+ * Copyright (c) 2009, 2012 Stefan Weil
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -756,15 +756,19 @@ static void vdi_aio_write_cb(void *opaque, int ret)
                  (uint64_t)bmap_entry * s->block_sectors;
         block = acb->block_buffer;
         if (block == NULL) {
-            block = g_malloc0(s->block_size);
+            block = g_malloc(s->block_size);
             acb->block_buffer = block;
             acb->bmap_first = block_index;
             assert(!acb->header_modified);
             acb->header_modified = 1;
         }
         acb->bmap_last = block_index;
+        /* Copy data to be written to new block and zero unused parts. */
+        memset(block, 0, sector_in_block * SECTOR_SIZE);
         memcpy(block + sector_in_block * SECTOR_SIZE,
                acb->buf, n_sectors * SECTOR_SIZE);
+        memset(block + (sector_in_block + n_sectors) * SECTOR_SIZE, 0,
+               (s->block_sectors - n_sectors - sector_in_block) * SECTOR_SIZE);
         acb->hd_iov.iov_base = (void *)block;
         acb->hd_iov.iov_len = s->block_size;
         qemu_iovec_init_external(&acb->hd_qiov, &acb->hd_iov, 1);
-- 
1.7.7.3


