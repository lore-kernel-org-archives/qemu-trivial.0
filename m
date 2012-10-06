Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TKXhS-0001GB-0p
	for mharc-qemu-trivial@gnu.org; Sat, 06 Oct 2012 12:58:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <morita.kazutaka@lab.ntt.co.jp>) id 1TKXhO-0001FW-RA
	for qemu-trivial@nongnu.org; Sat, 06 Oct 2012 12:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <morita.kazutaka@lab.ntt.co.jp>) id 1TKXhN-0004Xj-3Y
	for qemu-trivial@nongnu.org; Sat, 06 Oct 2012 12:57:58 -0400
Received: from sh.osrg.net ([192.16.179.4]:53087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <morita.kazutaka@lab.ntt.co.jp>)
	id 1TKXhM-0004XF-Im; Sat, 06 Oct 2012 12:57:57 -0400
Received: from fs.osrg.net (postfix@fs.osrg.net [10.0.0.12])
	by sh.osrg.net (8.14.3/8.14.3/OSRG-NET) with ESMTP id q96Gvn52006372;
	Sun, 7 Oct 2012 01:57:49 +0900
Received: from localhost (unknown [10.32.32.72])
	by fs.osrg.net (Postfix) with ESMTP id 21BFC3E005E;
	Sun,  7 Oct 2012 01:57:49 +0900 (JST)
From: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
To: qemu-devel@nongnu.org
Date: Sun,  7 Oct 2012 01:57:14 +0900
Message-Id: <1349542634-17251-1-git-send-email-morita.kazutaka@lab.ntt.co.jp>
X-Mailer: git-send-email 1.7.2.5
X-Dispatcher: imput version 20100215(IM150)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.3.7
	(sh.osrg.net [192.16.179.4]); Sun, 07 Oct 2012 01:57:49 +0900 (JST)
X-Virus-Scanned: clamav-milter 0.97.5 at sh
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 192.16.179.4
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] sheepdog: use bool for boolean variables
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
X-List-Received-Date: Sat, 06 Oct 2012 16:58:00 -0000

This improves readability.

Signed-off-by: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
---
 block/sheepdog.c |   70 +++++++++++++++++++++++++++---------------------------
 1 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index 4742f8a..3c88c59 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -201,12 +201,12 @@ static inline uint64_t fnv_64a_buf(void *buf, size_t len, uint64_t hval)
     return hval;
 }
 
-static inline int is_data_obj_writable(SheepdogInode *inode, unsigned int idx)
+static inline bool is_data_obj_writable(SheepdogInode *inode, unsigned int idx)
 {
     return inode->vdi_id == inode->data_vdi_id[idx];
 }
 
-static inline int is_data_obj(uint64_t oid)
+static inline bool is_data_obj(uint64_t oid)
 {
     return !(VDI_BIT & oid);
 }
@@ -231,7 +231,7 @@ static inline uint64_t vid_to_data_oid(uint32_t vid, uint32_t idx)
     return ((uint64_t)vid << VDI_SPACE_SHIFT) | idx;
 }
 
-static inline int is_snapshot(struct SheepdogInode *inode)
+static inline bool is_snapshot(struct SheepdogInode *inode)
 {
     return !!inode->snap_ctime;
 }
@@ -281,7 +281,7 @@ struct SheepdogAIOCB {
     Coroutine *coroutine;
     void (*aio_done_func)(SheepdogAIOCB *);
 
-    int canceled;
+    bool canceled;
     int nr_pending;
 };
 
@@ -292,8 +292,8 @@ typedef struct BDRVSheepdogState {
     uint32_t max_dirty_data_idx;
 
     char name[SD_MAX_VDI_LEN];
-    int is_snapshot;
-    uint8_t cache_enabled;
+    bool is_snapshot;
+    bool cache_enabled;
 
     char *addr;
     char *port;
@@ -417,7 +417,7 @@ static void sd_aio_cancel(BlockDriverAIOCB *blockacb)
      */
     acb->ret = -EIO;
     qemu_coroutine_enter(acb->coroutine, NULL);
-    acb->canceled = 1;
+    acb->canceled = true;
 }
 
 static AIOPool sd_aio_pool = {
@@ -439,7 +439,7 @@ static SheepdogAIOCB *sd_aio_setup(BlockDriverState *bs, QEMUIOVector *qiov,
     acb->nb_sectors = nb_sectors;
 
     acb->aio_done_func = NULL;
-    acb->canceled = 0;
+    acb->canceled = false;
     acb->coroutine = qemu_coroutine_self();
     acb->ret = 0;
     acb->nr_pending = 0;
@@ -613,7 +613,7 @@ static int do_req(int sockfd, SheepdogReq *hdr, void *data,
 }
 
 static int coroutine_fn add_aio_request(BDRVSheepdogState *s, AIOReq *aio_req,
-                           struct iovec *iov, int niov, int create,
+                           struct iovec *iov, int niov, bool create,
                            enum AIOCBState aiocb_type);
 
 
@@ -646,7 +646,7 @@ static void coroutine_fn send_pending_req(BDRVSheepdogState *s, uint64_t oid)
         QLIST_REMOVE(aio_req, aio_siblings);
         QLIST_INSERT_HEAD(&s->inflight_aio_head, aio_req, aio_siblings);
         ret = add_aio_request(s, aio_req, acb->qiov->iov,
-                              acb->qiov->niov, 0, acb->aiocb_type);
+                              acb->qiov->niov, false, acb->aiocb_type);
         if (ret < 0) {
             error_report("add_aio_request is failed");
             free_aio_req(s, aio_req);
@@ -940,7 +940,7 @@ out:
 }
 
 static int coroutine_fn add_aio_request(BDRVSheepdogState *s, AIOReq *aio_req,
-                           struct iovec *iov, int niov, int create,
+                           struct iovec *iov, int niov, bool create,
                            enum AIOCBState aiocb_type)
 {
     int nr_copies = s->inode.nr_copies;
@@ -1019,7 +1019,7 @@ static int coroutine_fn add_aio_request(BDRVSheepdogState *s, AIOReq *aio_req,
 
 static int read_write_object(int fd, char *buf, uint64_t oid, int copies,
                              unsigned int datalen, uint64_t offset,
-                             int write, int create, uint8_t cache)
+                             bool write, bool create, bool cache)
 {
     SheepdogObjReq hdr;
     SheepdogObjRsp *rsp = (SheepdogObjRsp *)&hdr;
@@ -1068,18 +1068,18 @@ static int read_write_object(int fd, char *buf, uint64_t oid, int copies,
 }
 
 static int read_object(int fd, char *buf, uint64_t oid, int copies,
-                       unsigned int datalen, uint64_t offset, uint8_t cache)
+                       unsigned int datalen, uint64_t offset, bool cache)
 {
-    return read_write_object(fd, buf, oid, copies, datalen, offset, 0, 0,
-                             cache);
+    return read_write_object(fd, buf, oid, copies, datalen, offset, false,
+                             false, cache);
 }
 
 static int write_object(int fd, char *buf, uint64_t oid, int copies,
-                        unsigned int datalen, uint64_t offset, int create,
-                        uint8_t cache)
+                        unsigned int datalen, uint64_t offset, bool create,
+                        bool cache)
 {
-    return read_write_object(fd, buf, oid, copies, datalen, offset, 1, create,
-                             cache);
+    return read_write_object(fd, buf, oid, copies, datalen, offset, true,
+                             create, cache);
 }
 
 static int sd_open(BlockDriverState *bs, const char *filename, int flags)
@@ -1114,7 +1114,7 @@ static int sd_open(BlockDriverState *bs, const char *filename, int flags)
         goto out;
     }
 
-    s->cache_enabled = 1;
+    s->cache_enabled = true;
     s->flush_fd = connect_to_sdog(s->addr, s->port);
     if (s->flush_fd < 0) {
         error_report("failed to connect");
@@ -1124,7 +1124,7 @@ static int sd_open(BlockDriverState *bs, const char *filename, int flags)
 
     if (snapid || tag[0] != '\0') {
         dprintf("%" PRIx32 " snapshot inode was open.\n", vid);
-        s->is_snapshot = 1;
+        s->is_snapshot = true;
     }
 
     fd = connect_to_sdog(s->addr, s->port);
@@ -1264,7 +1264,7 @@ static int sd_create(const char *filename, QEMUOptionParameter *options)
     BDRVSheepdogState *s;
     char vdi[SD_MAX_VDI_LEN], tag[SD_MAX_VDI_TAG_LEN];
     uint32_t snapid;
-    int prealloc = 0;
+    bool prealloc = false;
     const char *vdiname;
 
     s = g_malloc0(sizeof(BDRVSheepdogState));
@@ -1286,9 +1286,9 @@ static int sd_create(const char *filename, QEMUOptionParameter *options)
             backing_file = options->value.s;
         } else if (!strcmp(options->name, BLOCK_OPT_PREALLOC)) {
             if (!options->value.s || !strcmp(options->value.s, "off")) {
-                prealloc = 0;
+                prealloc = false;
             } else if (!strcmp(options->value.s, "full")) {
-                prealloc = 1;
+                prealloc = true;
             } else {
                 error_report("Invalid preallocation mode: '%s'",
                              options->value.s);
@@ -1416,7 +1416,7 @@ static int sd_truncate(BlockDriverState *bs, int64_t offset)
     datalen = SD_INODE_SIZE - sizeof(s->inode.data_vdi_id);
     s->inode.vdi_size = offset;
     ret = write_object(fd, (char *)&s->inode, vid_to_vdi_oid(s->inode.vdi_id),
-                       s->inode.nr_copies, datalen, 0, 0, s->cache_enabled);
+                       s->inode.nr_copies, datalen, 0, false, s->cache_enabled);
     close(fd);
 
     if (ret < 0) {
@@ -1455,7 +1455,7 @@ static void coroutine_fn sd_write_done(SheepdogAIOCB *acb)
         aio_req = alloc_aio_req(s, acb, vid_to_vdi_oid(s->inode.vdi_id),
                                 data_len, offset, 0, 0, offset);
         QLIST_INSERT_HEAD(&s->inflight_aio_head, aio_req, aio_siblings);
-        ret = add_aio_request(s, aio_req, &iov, 1, 0, AIOCB_WRITE_UDATA);
+        ret = add_aio_request(s, aio_req, &iov, 1, false, AIOCB_WRITE_UDATA);
         if (ret) {
             free_aio_req(s, aio_req);
             acb->ret = -EIO;
@@ -1509,7 +1509,7 @@ static int sd_create_branch(BDRVSheepdogState *s)
 
     memcpy(&s->inode, buf, sizeof(s->inode));
 
-    s->is_snapshot = 0;
+    s->is_snapshot = false;
     ret = 0;
     dprintf("%" PRIx32 " was newly created.\n", s->inode.vdi_id);
 
@@ -1564,7 +1564,7 @@ static int coroutine_fn sd_co_rw_vector(void *p)
     while (done != total) {
         uint8_t flags = 0;
         uint64_t old_oid = 0;
-        int create = 0;
+        bool create = false;
 
         oid = vid_to_data_oid(inode->data_vdi_id[idx], idx);
 
@@ -1579,10 +1579,10 @@ static int coroutine_fn sd_co_rw_vector(void *p)
             break;
         case AIOCB_WRITE_UDATA:
             if (!inode->data_vdi_id[idx]) {
-                create = 1;
+                create = true;
             } else if (!is_data_obj_writable(inode, idx)) {
                 /* Copy-On-Write */
-                create = 1;
+                create = true;
                 old_oid = oid;
                 flags = SD_FLAG_CMD_COW;
             }
@@ -1716,7 +1716,7 @@ static int coroutine_fn sd_co_flush_to_disk(BlockDriverState *bs)
     if (rsp->result == SD_RES_INVALID_PARMS) {
         dprintf("disable write cache since the server doesn't support it\n");
 
-        s->cache_enabled = 0;
+        s->cache_enabled = false;
         closesocket(s->flush_fd);
         return 0;
     }
@@ -1764,7 +1764,7 @@ static int sd_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
     }
 
     ret = write_object(fd, (char *)&s->inode, vid_to_vdi_oid(s->inode.vdi_id),
-                       s->inode.nr_copies, datalen, 0, 0, s->cache_enabled);
+                       s->inode.nr_copies, datalen, 0, false, s->cache_enabled);
     if (ret < 0) {
         error_report("failed to write snapshot's inode.");
         goto cleanup;
@@ -1851,7 +1851,7 @@ static int sd_snapshot_goto(BlockDriverState *bs, const char *snapshot_id)
         goto out;
     }
 
-    s->is_snapshot = 1;
+    s->is_snapshot = true;
 
     g_free(buf);
     g_free(old_s);
@@ -1968,8 +1968,8 @@ out:
 static int do_load_save_vmstate(BDRVSheepdogState *s, uint8_t *data,
                                 int64_t pos, int size, int load)
 {
-    int fd, create;
-    int ret = 0, remaining = size;
+    bool create;
+    int fd, ret = 0, remaining = size;
     unsigned int data_len;
     uint64_t vmstate_oid;
     uint32_t vdi_index;
-- 
1.7.2.5


