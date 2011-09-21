Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6KTQ-0001am-D5
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:56:16 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTL-0001KB-Iw
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>) id 1R6KTJ-0003zx-W2
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:56:11 -0400
Received: from egg.sh.bytemark.co.uk ([212.110.161.171]:49705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTG-0003xl-NM; Wed, 21 Sep 2011 06:56:06 -0400
Received: from bytemail.bytemark.co.uk ([212.110.161.227])
	by egg.sh.bytemark.co.uk with esmtp (Exim 4.69)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTD-0003mI-50; Wed, 21 Sep 2011 11:56:03 +0100
Received: from desk4.office.bytemark.co.uk ([89.16.168.152]
	helo=localhost.localdomain)
	by bytemail.bytemark.co.uk with esmtp (Exim 4.72)
	(envelope-from <nick@bytemark.co.uk>)
	id 1R6KTC-0004WD-Un; Wed, 21 Sep 2011 11:56:03 +0100
From: nick@bytemark.co.uk
To: nick@bytemark.co.uk,
	qemu-devel@nongnu.org
Date: Wed, 21 Sep 2011 11:55:50 +0100
Message-Id: <1316602550-13597-3-git-send-email-nick@bytemark.co.uk>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
References: <1316602550-13597-1-git-send-email-nick@bytemark.co.uk>
Organization: Bytemark Computer Consulting Ltd.  The Raylor Centre,
	James Street, York YO10 3DW,
	UK. Company registered in England and Wales no. 4484629. VAT
	registration no. GB 804 6718 29.
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 212.110.161.171
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] block/curl: Don't finish AIOCBs too early
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
X-List-Received-Date: Wed, 21 Sep 2011 10:56:13 -0000

From: Nick Thomas <nick@bytemark.co.uk>

The previous behaviour was to finish AIOCBs inside curl_aio_readv()
if the data was cached. This caused the following failed assertion
at hw/ide/pci.c:314: bmdma_cmd_writeb

"Assertion `bm->bus->dma->aiocb == ((void *)0)' failed."

By scheduling a QEMUBH and performing the completion inside the
callback, we avoid this problem.

Signed-off-by: Nick Thomas <nick@bytemark.co.uk>
---
 block/curl.c |   68 +++++++++++++++++++++++++++++++++++++++++----------------
 1 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 21fed93..4209ac8 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -47,7 +47,12 @@ struct BDRVCURLState;
 
 typedef struct CURLAIOCB {
     BlockDriverAIOCB common;
+    QEMUBH *bh;
     QEMUIOVector *qiov;
+
+    int64_t sector_num;
+    int nb_sectors;
+
     size_t start;
     size_t end;
 } CURLAIOCB;
@@ -440,43 +445,42 @@ static AIOPool curl_aio_pool = {
     .cancel             = curl_aio_cancel,
 };
 
-static BlockDriverAIOCB *curl_aio_readv(BlockDriverState *bs,
-        int64_t sector_num, QEMUIOVector *qiov, int nb_sectors,
-        BlockDriverCompletionFunc *cb, void *opaque)
+
+static void curl_readv_bh_cb(void *p)
 {
-    BDRVCURLState *s = bs->opaque;
-    CURLAIOCB *acb;
-    size_t start = sector_num * SECTOR_SIZE;
-    size_t end;
     CURLState *state;
 
-    acb = qemu_aio_get(&curl_aio_pool, bs, cb, opaque);
-    if (!acb)
-        return NULL;
+    CURLAIOCB *acb = p;
+    BDRVCURLState *s = acb->common.bs->opaque;
 
-    acb->qiov = qiov;
+    qemu_bh_delete(acb->bh);
+    acb->bh = NULL;
+
+    size_t start = acb->sector_num * SECTOR_SIZE;
+    size_t end;
 
     // In case we have the requested data already (e.g. read-ahead),
     // we can just call the callback and be done.
-
-    switch (curl_find_buf(s, start, nb_sectors * SECTOR_SIZE, acb)) {
+    switch (curl_find_buf(s, start, acb->nb_sectors * SECTOR_SIZE, acb)) {
         case FIND_RET_OK:
             qemu_aio_release(acb);
             // fall through
         case FIND_RET_WAIT:
-            return &acb->common;
+            return;
         default:
             break;
     }
 
     // No cache found, so let's start a new request
-
     state = curl_init_state(s);
-    if (!state)
-        return NULL;
+    if (!state) {
+        acb->common.cb(acb->common.opaque, -EIO);
+        qemu_aio_release(acb);
+        return;
+    }
 
     acb->start = 0;
-    acb->end = (nb_sectors * SECTOR_SIZE);
+    acb->end = (acb->nb_sectors * SECTOR_SIZE);
 
     state->buf_off = 0;
     if (state->orig_buf)
@@ -489,12 +493,38 @@ static BlockDriverAIOCB *curl_aio_readv(BlockDriverState *bs,
 
     snprintf(state->range, 127, "%zd-%zd", start, end);
     DPRINTF("CURL (AIO): Reading %d at %zd (%s)\n",
-            (nb_sectors * SECTOR_SIZE), start, state->range);
+            (acb->nb_sectors * SECTOR_SIZE), start, state->range);
     curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
 
     curl_multi_add_handle(s->multi, state->curl);
     curl_multi_do(s);
 
+}
+
+static BlockDriverAIOCB *curl_aio_readv(BlockDriverState *bs,
+        int64_t sector_num, QEMUIOVector *qiov, int nb_sectors,
+        BlockDriverCompletionFunc *cb, void *opaque)
+{
+    CURLAIOCB *acb;
+
+    acb = qemu_aio_get(&curl_aio_pool, bs, cb, opaque);
+
+    if (!acb) {
+        return NULL;
+    }
+
+    acb->qiov = qiov;
+    acb->sector_num = sector_num;
+    acb->nb_sectors = nb_sectors;
+
+    acb->bh = qemu_bh_new(curl_readv_bh_cb, acb);
+
+    if (!acb->bh) {
+        DPRINTF("CURL: qemu_bh_new failed\n");
+        return NULL;
+    }
+
+    qemu_bh_schedule(acb->bh);
     return &acb->common;
 }
 
-- 
1.7.0.4


