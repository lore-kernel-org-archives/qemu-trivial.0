Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdi2H-000329-Dq
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2018 16:17:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi2E-00030D-Dj
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi2D-0007lm-DC
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:17:54 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:57655)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi26-0006ao-Gj; Thu, 12 Jul 2018 16:17:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 9CC8C1033C1;
	Thu, 12 Jul 2018 21:51:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id z2ksB-XYrTYU; Thu, 12 Jul 2018 21:51:21 +0200 (CEST)
Received: from ub-blade-01.bib.uni-mannheim.de
	(ub-blade-01.bib.uni-mannheim.de [134.155.36.5])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id 7080710335C;
	Thu, 12 Jul 2018 21:51:21 +0200 (CEST)
Received: from stweil by ub-blade-01.bib.uni-mannheim.de with local (Exim 4.89)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhcX-00078X-AJ; Thu, 12 Jul 2018 21:51:21 +0200
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Jeff Cody <jcody@redhat.com>,
	qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>
Date: Thu, 12 Jul 2018 21:51:20 +0200
Message-Id: <20180712195120.27394-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 134.155.96.80
Subject: [Qemu-trivial] [PATCH] block: Fix typos in comments (found by
 codespell)
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
X-List-Received-Date: Thu, 12 Jul 2018 20:17:55 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block.c         | 2 +-
 block/backup.c  | 4 ++--
 block/curl.c    | 2 +-
 block/gluster.c | 2 +-
 block/vhdx.c    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index a2fe05ea96..39f373e035 100644
--- a/block.c
+++ b/block.c
@@ -3002,7 +3002,7 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
  *
  * Reopens all BDS specified in the queue, with the appropriate
  * flags.  All devices are prepared for reopen, and failure of any
- * device will cause all device changes to be abandonded, and intermediate
+ * device will cause all device changes to be abandoned, and intermediate
  * data cleaned up.
  *
  * If all devices prepare successfully, then the changes are committed
diff --git a/block/backup.c b/block/backup.c
index 319fc922e8..8630d32926 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -91,7 +91,7 @@ static void cow_request_end(CowRequest *req)
 }
 
 /* Copy range to target with a bounce buffer and return the bytes copied. If
- * error occured, return a negative error number */
+ * error occurred, return a negative error number */
 static int coroutine_fn backup_cow_with_bounce_buffer(BackupBlockJob *job,
                                                       int64_t start,
                                                       int64_t end,
@@ -148,7 +148,7 @@ fail:
 
 }
 
-/* Copy range to target and return the bytes copied. If error occured, return a
+/* Copy range to target and return the bytes copied. If error occurred, return a
  * negative error number. */
 static int coroutine_fn backup_cow_with_offload(BackupBlockJob *job,
                                                 int64_t start,
diff --git a/block/curl.c b/block/curl.c
index aa42535783..229bb84a27 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -804,7 +804,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     }
     /* Prior CURL 7.19.4 return value of 0 could mean that the file size is not
      * know or the size is zero. From 7.19.4 CURL returns -1 if size is not
-     * known and zero if it is realy zero-length file. */
+     * known and zero if it is really zero-length file. */
 #if LIBCURL_VERSION_NUM >= 0x071304
     if (d < 0) {
         pstrcpy(state->errmsg, CURL_ERROR_SIZE,
diff --git a/block/gluster.c b/block/gluster.c
index a4e1c8ecd8..4fd55a9cc5 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1326,7 +1326,7 @@ static int qemu_gluster_has_zero_init(BlockDriverState *bs)
  * If @start is in a trailing hole or beyond EOF, return -ENXIO.
  * If we can't find out, return a negative errno other than -ENXIO.
  *
- * (Shamefully copied from file-posix.c, only miniscule adaptions.)
+ * (Shamefully copied from file-posix.c, only minuscule adaptions.)
  */
 static int find_allocation(BlockDriverState *bs, off_t start,
                            off_t *data, off_t *hole)
diff --git a/block/vhdx.c b/block/vhdx.c
index 4d0819750f..0795ca1985 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -185,7 +185,7 @@ uint32_t vhdx_checksum_calc(uint32_t crc, uint8_t *buf, size_t size,
 /* Validates the checksum of the buffer, with an in-place CRC.
  *
  * Zero is substituted during crc calculation for the original crc field,
- * and the crc field is restored afterwards.  But the buffer will be modifed
+ * and the crc field is restored afterwards.  But the buffer will be modified
  * during the calculation, so this may not be not suitable for multi-threaded
  * use.
  *
-- 
2.11.0


