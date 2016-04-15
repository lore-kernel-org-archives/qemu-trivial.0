Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqwXj-0005xQ-NO
	for mharc-qemu-trivial@gnu.org; Fri, 15 Apr 2016 01:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqwXg-0005qU-JM
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 01:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqwXd-00010b-9v
	for qemu-trivial@nongnu.org; Fri, 15 Apr 2016 01:43:44 -0400
Received: from [59.151.112.132] (port=37958 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1aqwXW-0000xp-RS; Fri, 15 Apr 2016 01:43:37 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5628426"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Apr 2016 13:43:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0B0FD42B55E5;
	Fri, 15 Apr 2016 13:43:16 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Apr 2016 13:43:15 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trivial
	<qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
CC: Changlong Xie <xiecl.fnst@cn.fujitsu.com>, Wen Congyang
	<wency@cn.fujitsu.com>
Date: Fri, 15 Apr 2016 13:46:13 +0800
Message-ID: <1460699173-31401-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 0B0FD42B55E5.A4F41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v1 2/2] block: remove redundant stats of
 block_acct_start()
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
X-List-Received-Date: Fri, 15 Apr 2016 05:43:46 -0000

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block/accounting.c         |  4 ++--
 dma-helpers.c              |  2 +-
 hw/block/nvme.c            |  3 +--
 hw/block/virtio-blk.c      |  6 ++----
 hw/block/xen_disk.c        |  6 ++----
 hw/ide/atapi.c             | 12 ++++--------
 hw/ide/core.c              | 16 +++++++---------
 hw/ide/macio.c             |  9 +++------
 hw/scsi/scsi-disk.c        | 29 ++++++++++-------------------
 include/block/accounting.h |  4 ++--
 qemu-io-cmds.c             |  8 +++-----
 11 files changed, 37 insertions(+), 62 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 3f457c4..ac8abac 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -76,8 +76,8 @@ BlockAcctTimedStats *block_acct_interval_next(BlockAcctStats *stats,
     }
 }
 
-void block_acct_start(BlockAcctStats *stats, BlockAcctCookie *cookie,
-                      int64_t bytes, enum BlockAcctType type)
+void block_acct_start(BlockAcctCookie *cookie, int64_t bytes,
+                      enum BlockAcctType type)
 {
     assert(type < BLOCK_MAX_IOTYPE);
 
diff --git a/dma-helpers.c b/dma-helpers.c
index 4ad0bca..191b986 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -266,5 +266,5 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg)
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type)
 {
-    block_acct_start(blk_get_stats(blk), cookie, sg->size, type);
+    block_acct_start(cookie, sg->size, type);
 }
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 173988e..fe14efe 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -220,8 +220,7 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     NvmeRequest *req)
 {
     req->has_sg = false;
-    block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
-         BLOCK_ACCT_FLUSH);
+    block_acct_start(&req->acct, 0, BLOCK_ACCT_FLUSH);
     req->aiocb = blk_aio_flush(n->conf.blk, nvme_rw_cb, req);
 
     return NVME_NO_COMPLETE;
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 3f88f8c..e351efd 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -434,8 +434,7 @@ void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
 
 static void virtio_blk_handle_flush(VirtIOBlockReq *req, MultiReqBuffer *mrb)
 {
-    block_acct_start(blk_get_stats(req->dev->blk), &req->acct, 0,
-                     BLOCK_ACCT_FLUSH);
+    block_acct_start(&req->acct, 0, BLOCK_ACCT_FLUSH);
 
     /*
      * Make sure all outstanding writes are posted to the backing device.
@@ -532,8 +531,7 @@ void virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
             return;
         }
 
-        block_acct_start(blk_get_stats(req->dev->blk),
-                         &req->acct, req->qiov.size,
+        block_acct_start(&req->acct, req->qiov.size,
                          is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ);
 
         /* merge would exceed maximum number of requests or IO direction
diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index d4ce380..18f929a 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -551,8 +551,7 @@ static int ioreq_runio_qemu_aio(struct ioreq *ioreq)
 
     switch (ioreq->req.operation) {
     case BLKIF_OP_READ:
-        block_acct_start(blk_get_stats(blkdev->blk), &ioreq->acct,
-                         ioreq->v.size, BLOCK_ACCT_READ);
+        block_acct_start(&ioreq->acct, ioreq->v.size, BLOCK_ACCT_READ);
         ioreq->aio_inflight++;
         blk_aio_readv(blkdev->blk, ioreq->start / BLOCK_SIZE,
                       &ioreq->v, ioreq->v.size / BLOCK_SIZE,
@@ -564,8 +563,7 @@ static int ioreq_runio_qemu_aio(struct ioreq *ioreq)
             break;
         }
 
-        block_acct_start(blk_get_stats(blkdev->blk), &ioreq->acct,
-                         ioreq->v.size,
+        block_acct_start(&ioreq->acct, ioreq->v.size,
                          ioreq->req.operation == BLKIF_OP_WRITE ?
                          BLOCK_ACCT_WRITE : BLOCK_ACCT_FLUSH);
         ioreq->aio_inflight++;
diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 2bb606c..91627ec 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -110,8 +110,7 @@ static int
 cd_read_sector_sync(IDEState *s)
 {
     int ret;
-    block_acct_start(blk_get_stats(s->blk), &s->acct,
-                     4 * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
+    block_acct_start(&s->acct, 4 * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
 
 #ifdef DEBUG_IDE_ATAPI
     printf("cd_read_sector_sync: lba=%d\n", s->lba);
@@ -189,8 +188,7 @@ static int cd_read_sector(IDEState *s)
     printf("cd_read_sector: lba=%d\n", s->lba);
 #endif
 
-    block_acct_start(blk_get_stats(s->blk), &s->acct,
-                     4 * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
+    block_acct_start(&s->acct, 4 * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
 
     ide_buffered_readv(s, (int64_t)s->lba << 2, &s->qiov, 4,
                        cd_read_sector_cb, s);
@@ -339,8 +337,7 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
     s->elementary_transfer_size = 0;
 
     if (s->atapi_dma) {
-        block_acct_start(blk_get_stats(s->blk), &s->acct, size,
-                         BLOCK_ACCT_READ);
+        block_acct_start(&s->acct, size, BLOCK_ACCT_READ);
         s->status = READY_STAT | SEEK_STAT | DRQ_STAT;
         ide_start_dma(s, ide_atapi_cmd_read_dma_cb);
     } else {
@@ -462,8 +459,7 @@ static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
     s->io_buffer_size = 0;
     s->cd_sector_size = sector_size;
 
-    block_acct_start(blk_get_stats(s->blk), &s->acct, s->packet_transfer_size,
-                     BLOCK_ACCT_READ);
+    block_acct_start(&s->acct, s->packet_transfer_size, BLOCK_ACCT_READ);
 
     /* XXX: check if BUSY_STAT should be set */
     s->status = READY_STAT | SEEK_STAT | DRQ_STAT | BUSY_STAT;
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 41e6a2d..b3e1ff7 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -737,8 +737,7 @@ static void ide_sector_read(IDEState *s)
     s->iov.iov_len  = n * BDRV_SECTOR_SIZE;
     qemu_iovec_init_external(&s->qiov, &s->iov, 1);
 
-    block_acct_start(blk_get_stats(s->blk), &s->acct,
-                     n * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
+    block_acct_start(&s->acct, n * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
     s->pio_aiocb = ide_buffered_readv(s, sector_num, &s->qiov, n,
                                       ide_sector_read_cb, s);
 }
@@ -893,12 +892,12 @@ static void ide_sector_start_dma(IDEState *s, enum ide_dma_cmd dma_cmd)
 
     switch (dma_cmd) {
     case IDE_DMA_READ:
-        block_acct_start(blk_get_stats(s->blk), &s->acct,
-                         s->nsector * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
+        block_acct_start(&s->acct, s->nsector * BDRV_SECTOR_SIZE,
+                         BLOCK_ACCT_READ);
         break;
     case IDE_DMA_WRITE:
-        block_acct_start(blk_get_stats(s->blk), &s->acct,
-                         s->nsector * BDRV_SECTOR_SIZE, BLOCK_ACCT_WRITE);
+        block_acct_start(&s->acct, s->nsector * BDRV_SECTOR_SIZE,
+                         BLOCK_ACCT_WRITE);
         break;
     default:
         break;
@@ -1004,8 +1003,7 @@ static void ide_sector_write(IDEState *s)
     s->iov.iov_len  = n * BDRV_SECTOR_SIZE;
     qemu_iovec_init_external(&s->qiov, &s->iov, 1);
 
-    block_acct_start(blk_get_stats(s->blk), &s->acct,
-                     n * BDRV_SECTOR_SIZE, BLOCK_ACCT_WRITE);
+    block_acct_start(&s->acct, n * BDRV_SECTOR_SIZE, BLOCK_ACCT_WRITE);
     s->pio_aiocb = blk_aio_writev(s->blk, sector_num, &s->qiov, n,
                                   ide_sector_write_cb, s);
 }
@@ -1042,7 +1040,7 @@ static void ide_flush_cache(IDEState *s)
     }
 
     s->status |= BUSY_STAT;
-    block_acct_start(blk_get_stats(s->blk), &s->acct, 0, BLOCK_ACCT_FLUSH);
+    block_acct_start(&s->acct, 0, BLOCK_ACCT_FLUSH);
     s->pio_aiocb = blk_aio_flush(s->blk, ide_flush_cb, s);
 }
 
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 76256eb..a82031a 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -373,8 +373,7 @@ static void pmac_ide_transfer(DBDMA_io *io)
     MACIO_DPRINTF("\n");
 
     if (s->drive_kind == IDE_CD) {
-        block_acct_start(blk_get_stats(s->blk), &s->acct, io->len,
-                         BLOCK_ACCT_READ);
+        block_acct_start(&s->acct, io->len, BLOCK_ACCT_READ);
 
         pmac_ide_atapi_transfer_cb(io, 0);
         return;
@@ -382,12 +381,10 @@ static void pmac_ide_transfer(DBDMA_io *io)
 
     switch (s->dma_cmd) {
     case IDE_DMA_READ:
-        block_acct_start(blk_get_stats(s->blk), &s->acct, io->len,
-                         BLOCK_ACCT_READ);
+        block_acct_start(&s->acct, io->len, BLOCK_ACCT_READ);
         break;
     case IDE_DMA_WRITE:
-        block_acct_start(blk_get_stats(s->blk), &s->acct, io->len,
-                         BLOCK_ACCT_WRITE);
+        block_acct_start(&s->acct, io->len, BLOCK_ACCT_WRITE);
         break;
     default:
         break;
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index c3ce54a..62a7cb2c3 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -225,8 +225,7 @@ static void scsi_write_do_fua(SCSIDiskReq *r)
     }
 
     if (scsi_is_cmd_fua(&r->req.cmd)) {
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct, 0,
-                         BLOCK_ACCT_FLUSH);
+        block_acct_start(&r->acct, 0, BLOCK_ACCT_FLUSH);
         r->req.aiocb = blk_aio_flush(s->qdev.conf.blk, scsi_aio_complete, r);
         return;
     }
@@ -341,8 +340,7 @@ static void scsi_do_read(SCSIDiskReq *r, int ret)
                                     scsi_dma_complete, r);
     } else {
         n = scsi_init_iovec(r, SCSI_DMA_BUF_SIZE);
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
-                         n * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
+        block_acct_start(&r->acct, n * BDRV_SECTOR_SIZE, BLOCK_ACCT_READ);
         r->req.aiocb = blk_aio_readv(s->qdev.conf.blk, r->sector, &r->qiov, n,
                                      scsi_read_complete, r);
     }
@@ -400,8 +398,7 @@ static void scsi_read_data(SCSIRequest *req)
     first = !r->started;
     r->started = true;
     if (first && scsi_is_cmd_fua(&r->req.cmd)) {
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct, 0,
-                         BLOCK_ACCT_FLUSH);
+        block_acct_start(&r->acct, 0, BLOCK_ACCT_FLUSH);
         r->req.aiocb = blk_aio_flush(s->qdev.conf.blk, scsi_do_read_cb, r);
     } else {
         scsi_do_read(r, 0);
@@ -545,8 +542,7 @@ static void scsi_write_data(SCSIRequest *req)
                                      scsi_dma_complete, r);
     } else {
         n = r->qiov.size / 512;
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
-                         n * BDRV_SECTOR_SIZE, BLOCK_ACCT_WRITE);
+        block_acct_start(&r->acct, n * BDRV_SECTOR_SIZE, BLOCK_ACCT_WRITE);
         r->req.aiocb = blk_aio_writev(s->qdev.conf.blk, r->sector, &r->qiov, n,
                                       scsi_write_complete, r);
     }
@@ -1547,8 +1543,7 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     if (!blk_enable_write_cache(s->qdev.conf.blk)) {
         /* The request is used as the AIO opaque value, so add a ref.  */
         scsi_req_ref(&r->req);
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct, 0,
-                         BLOCK_ACCT_FLUSH);
+        block_acct_start(&r->acct, 0, BLOCK_ACCT_FLUSH);
         r->req.aiocb = blk_aio_flush(s->qdev.conf.blk, scsi_aio_complete, r);
         return;
     }
@@ -1728,8 +1723,7 @@ static void scsi_write_same_complete(void *opaque, int ret)
     data->sector += data->iov.iov_len / 512;
     data->iov.iov_len = MIN(data->nb_sectors * 512, data->iov.iov_len);
     if (data->iov.iov_len) {
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
-                         data->iov.iov_len, BLOCK_ACCT_WRITE);
+        block_acct_start(&r->acct, data->iov.iov_len, BLOCK_ACCT_WRITE);
         /* blk_aio_write doesn't like the qiov size being different from
          * nb_sectors, make sure they match.
          */
@@ -1777,9 +1771,8 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
 
         /* The request is used as the AIO opaque value, so add a ref.  */
         scsi_req_ref(&r->req);
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
-                         nb_sectors * s->qdev.blocksize,
-                        BLOCK_ACCT_WRITE);
+        block_acct_start(&r->acct, nb_sectors * s->qdev.blocksize,
+                         BLOCK_ACCT_WRITE);
         r->req.aiocb = blk_aio_write_zeroes(s->qdev.conf.blk,
                                 r->req.cmd.lba * (s->qdev.blocksize / 512),
                                 nb_sectors * (s->qdev.blocksize / 512),
@@ -1801,8 +1794,7 @@ static void scsi_disk_emulate_write_same(SCSIDiskReq *r, uint8_t *inbuf)
     }
 
     scsi_req_ref(&r->req);
-    block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
-                     data->iov.iov_len, BLOCK_ACCT_WRITE);
+    block_acct_start(&r->acct, data->iov.iov_len, BLOCK_ACCT_WRITE);
     r->req.aiocb = blk_aio_writev(s->qdev.conf.blk, data->sector,
                                   &data->qiov, data->iov.iov_len / 512,
                                   scsi_write_same_complete, data);
@@ -2066,8 +2058,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
     case SYNCHRONIZE_CACHE:
         /* The request is used as the AIO opaque value, so add a ref.  */
         scsi_req_ref(&r->req);
-        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct, 0,
-                         BLOCK_ACCT_FLUSH);
+        block_acct_start(&r->acct, 0, BLOCK_ACCT_FLUSH);
         r->req.aiocb = blk_aio_flush(s->qdev.conf.blk, scsi_aio_complete, r);
         return 0;
     case SEEK_10:
diff --git a/include/block/accounting.h b/include/block/accounting.h
index 2089163..5c4ca8b 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -67,8 +67,8 @@ void block_acct_cleanup(BlockAcctStats *stats);
 void block_acct_add_interval(BlockAcctStats *stats, unsigned interval_length);
 BlockAcctTimedStats *block_acct_interval_next(BlockAcctStats *stats,
                                               BlockAcctTimedStats *s);
-void block_acct_start(BlockAcctStats *stats, BlockAcctCookie *cookie,
-                      int64_t bytes, enum BlockAcctType type);
+void block_acct_start(BlockAcctCookie *cookie, int64_t bytes,
+                      enum BlockAcctType type);
 void block_acct_done(BlockAcctStats *stats, BlockAcctCookie *cookie);
 void block_acct_failed(BlockAcctStats *stats, BlockAcctCookie *cookie);
 void block_acct_invalid(BlockAcctStats *stats, enum BlockAcctType type);
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 382faa8..226dcf2 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1588,8 +1588,7 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     }
 
     gettimeofday(&ctx->t1, NULL);
-    block_acct_start(blk_get_stats(blk), &ctx->acct, ctx->qiov.size,
-                     BLOCK_ACCT_READ);
+    block_acct_start(&ctx->acct, ctx->qiov.size, BLOCK_ACCT_READ);
     blk_aio_readv(blk, ctx->offset >> 9, &ctx->qiov,
                   ctx->qiov.size >> 9, aio_read_done, ctx);
     return 0;
@@ -1685,8 +1684,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     }
 
     gettimeofday(&ctx->t1, NULL);
-    block_acct_start(blk_get_stats(blk), &ctx->acct, ctx->qiov.size,
-                     BLOCK_ACCT_WRITE);
+    block_acct_start(&ctx->acct, ctx->qiov.size, BLOCK_ACCT_WRITE);
     blk_aio_writev(blk, ctx->offset >> 9, &ctx->qiov,
                    ctx->qiov.size >> 9, aio_write_done, ctx);
     return 0;
@@ -1695,7 +1693,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
 static int aio_flush_f(BlockBackend *blk, int argc, char **argv)
 {
     BlockAcctCookie cookie;
-    block_acct_start(blk_get_stats(blk), &cookie, 0, BLOCK_ACCT_FLUSH);
+    block_acct_start(&cookie, 0, BLOCK_ACCT_FLUSH);
     blk_drain_all();
     block_acct_done(blk_get_stats(blk), &cookie);
     return 0;
-- 
1.9.3




