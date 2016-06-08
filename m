Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyZ-0001SG-3L
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:08:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyU-0001OB-Pn
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:08:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyS-0007ig-FT
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:08:02 -0400
Received: from [59.151.112.132] (port=21216 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy9-0007Jd-DK; Tue, 07 Jun 2016 21:07:42 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A3D6D41C0B97;
	Wed,  8 Jun 2016 09:07:26 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:26 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Jeff Cody
	<jcody@redhat.com>
CC: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong
	<yunhong.jiang@intel.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>, 
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Wed, 8 Jun 2016 09:11:30 +0800
Message-ID: <1465348292-26750-9-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: A3D6D41C0B97.A3EAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 08/10] Implement new driver for block
 replication
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
X-List-Received-Date: Wed, 08 Jun 2016 01:08:05 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block/Makefile.objs |   1 +
 block/replication.c | 657 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 658 insertions(+)
 create mode 100644 block/replication.c

diff --git a/block/Makefile.objs b/block/Makefile.objs
index fbfe647..5e28b45 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -23,6 +23,7 @@ block-obj-$(CONFIG_LIBSSH2) += ssh.o
 block-obj-y += accounting.o dirty-bitmap.o
 block-obj-y += write-threshold.o
 block-obj-y += backup.o
+block-obj-y += replication.o
 
 block-obj-y += crypto.o
 
diff --git a/block/replication.c b/block/replication.c
new file mode 100644
index 0000000..1dabb5d
--- /dev/null
+++ b/block/replication.c
@@ -0,0 +1,657 @@
+/*
+ * Replication Block filter
+ *
+ * Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
+ * Copyright (c) 2016 Intel Corporation
+ * Copyright (c) 2016 FUJITSU LIMITED
+ *
+ * Author:
+ *   Wen Congyang <wency@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "block/nbd.h"
+#include "block/blockjob.h"
+#include "block/block_int.h"
+#include "block/block_backup.h"
+#include "sysemu/block-backend.h"
+#include "qapi/error.h"
+#include "replication.h"
+
+typedef struct BDRVReplicationState {
+    ReplicationMode mode;
+    int replication_state;
+    BdrvChild *active_disk;
+    BdrvChild *hidden_disk;
+    BdrvChild *secondary_disk;
+    char *top_id;
+    ReplicationState *rs;
+    Error *blocker;
+    int orig_hidden_flags;
+    int orig_secondary_flags;
+    int error;
+} BDRVReplicationState;
+
+enum {
+    BLOCK_REPLICATION_NONE,             /* block replication is not started */
+    BLOCK_REPLICATION_RUNNING,          /* block replication is running */
+    BLOCK_REPLICATION_FAILOVER,         /* failover is running in background */
+    BLOCK_REPLICATION_FAILOVER_FAILED,  /* failover failed */
+    BLOCK_REPLICATION_DONE,             /* block replication is done */
+};
+
+static void replication_start(ReplicationState *rs, ReplicationMode mode,
+                              Error **errp);
+static void replication_do_checkpoint(ReplicationState *rs, Error **errp);
+static void replication_get_error(ReplicationState *rs, Error **errp);
+static void replication_stop(ReplicationState *rs, bool failover,
+                             Error **errp);
+
+#define REPLICATION_MODE        "mode"
+#define REPLICATION_TOP_ID      "top-id"
+static QemuOptsList replication_runtime_opts = {
+    .name = "replication",
+    .head = QTAILQ_HEAD_INITIALIZER(replication_runtime_opts.head),
+    .desc = {
+        {
+            .name = REPLICATION_MODE,
+            .type = QEMU_OPT_STRING,
+        },
+        {
+            .name = REPLICATION_TOP_ID,
+            .type = QEMU_OPT_STRING,
+        },
+        { /* end of list */ }
+    },
+};
+
+static ReplicationOps replication_ops = {
+    .start = replication_start,
+    .checkpoint = replication_do_checkpoint,
+    .get_error = replication_get_error,
+    .stop = replication_stop,
+};
+
+static int replication_open(BlockDriverState *bs, QDict *options,
+                            int flags, Error **errp)
+{
+    int ret;
+    BDRVReplicationState *s = bs->opaque;
+    Error *local_err = NULL;
+    QemuOpts *opts = NULL;
+    const char *mode;
+    const char *top_id;
+
+    ret = -EINVAL;
+    opts = qemu_opts_create(&replication_runtime_opts, NULL, 0, &error_abort);
+    qemu_opts_absorb_qdict(opts, options, &local_err);
+    if (local_err) {
+        goto fail;
+    }
+
+    mode = qemu_opt_get(opts, REPLICATION_MODE);
+    if (!mode) {
+        error_setg(&local_err, "Missing the option mode");
+        goto fail;
+    }
+
+    if (!strcmp(mode, "primary")) {
+        s->mode = REPLICATION_MODE_PRIMARY;
+    } else if (!strcmp(mode, "secondary")) {
+        s->mode = REPLICATION_MODE_SECONDARY;
+        top_id = qemu_opt_get(opts, REPLICATION_TOP_ID);
+        s->top_id = g_strdup(top_id);
+        if (!s->top_id) {
+            error_setg(&local_err, "Missing the option top-id");
+            goto fail;
+        }
+    } else {
+        error_setg(&local_err,
+                   "The option mode's value should be primary or secondary");
+        goto fail;
+    }
+
+    s->rs = replication_new(bs, &replication_ops);
+
+    ret = 0;
+
+fail:
+    qemu_opts_del(opts);
+    error_propagate(errp, local_err);
+
+    return ret;
+}
+
+static void replication_close(BlockDriverState *bs)
+{
+    BDRVReplicationState *s = bs->opaque;
+
+    if (s->replication_state == BLOCK_REPLICATION_RUNNING) {
+        replication_stop(s->rs, false, NULL);
+    }
+
+    if (s->mode == REPLICATION_MODE_SECONDARY) {
+        g_free(s->top_id);
+    }
+
+    replication_remove(s->rs);
+}
+
+static int64_t replication_getlength(BlockDriverState *bs)
+{
+    return bdrv_getlength(bs->file->bs);
+}
+
+static int replication_get_io_status(BDRVReplicationState *s)
+{
+    switch (s->replication_state) {
+    case BLOCK_REPLICATION_NONE:
+        return -EIO;
+    case BLOCK_REPLICATION_RUNNING:
+        return 0;
+    case BLOCK_REPLICATION_FAILOVER:
+        return s->mode == REPLICATION_MODE_PRIMARY ? -EIO : 0;
+    case BLOCK_REPLICATION_FAILOVER_FAILED:
+        return s->mode == REPLICATION_MODE_PRIMARY ? -EIO : 1;
+    case BLOCK_REPLICATION_DONE:
+        /*
+         * active commit job completes, and active disk and secondary_disk
+         * is swapped, so we can operate bs->file directly
+         */
+        return s->mode == REPLICATION_MODE_PRIMARY ? -EIO : 0;
+    default:
+        abort();
+    }
+}
+
+static int replication_return_value(BDRVReplicationState *s, int ret)
+{
+    if (s->mode == REPLICATION_MODE_SECONDARY) {
+        return ret;
+    }
+
+    if (ret < 0) {
+        s->error = ret;
+        ret = 0;
+    }
+
+    return ret;
+}
+
+static coroutine_fn int replication_co_readv(BlockDriverState *bs,
+                                             int64_t sector_num,
+                                             int remaining_sectors,
+                                             QEMUIOVector *qiov)
+{
+    BDRVReplicationState *s = bs->opaque;
+    BdrvChild *child = s->secondary_disk;
+    BlockJob *job = NULL;
+    CowRequest req;
+    int ret;
+
+    if (s->mode == REPLICATION_MODE_PRIMARY) {
+        /* We only use it to forward primary write requests */
+        return -EIO;
+    }
+
+    ret = replication_get_io_status(s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (child && child->bs) {
+        job = child->bs->job;
+    }
+
+    if (job) {
+        backup_wait_for_overlapping_requests(child->bs->job, sector_num,
+                                             remaining_sectors);
+        backup_cow_request_begin(&req, child->bs->job, sector_num,
+                                 remaining_sectors);
+        ret = bdrv_co_readv(bs->file->bs, sector_num, remaining_sectors,
+                            qiov);
+        backup_cow_request_end(&req);
+        goto out;
+    }
+
+    ret = bdrv_co_readv(bs->file->bs, sector_num, remaining_sectors, qiov);
+out:
+    return replication_return_value(s, ret);
+}
+
+static coroutine_fn int replication_co_writev(BlockDriverState *bs,
+                                              int64_t sector_num,
+                                              int remaining_sectors,
+                                              QEMUIOVector *qiov)
+{
+    BDRVReplicationState *s = bs->opaque;
+    QEMUIOVector hd_qiov;
+    uint64_t bytes_done = 0;
+    BdrvChild *top = bs->file;
+    BdrvChild *base = s->secondary_disk;
+    BlockDriverState *target;
+    int ret, n;
+
+    ret = replication_get_io_status(s);
+    if (ret < 0) {
+        goto out;
+    }
+
+    if (ret == 0) {
+        ret = bdrv_co_writev(top->bs, sector_num,
+                             remaining_sectors, qiov);
+        return replication_return_value(s, ret);
+    }
+
+    /*
+     * Failover failed, only write to active disk if the sectors
+     * have already been allocated in active disk/hidden disk.
+     */
+    qemu_iovec_init(&hd_qiov, qiov->niov);
+    while (remaining_sectors > 0) {
+        ret = bdrv_is_allocated_above(top->bs, base->bs, sector_num,
+                                      remaining_sectors, &n);
+        if (ret < 0) {
+            goto out1;
+        }
+
+        qemu_iovec_reset(&hd_qiov);
+        qemu_iovec_concat(&hd_qiov, qiov, bytes_done, n * BDRV_SECTOR_SIZE);
+
+        target = ret ? (top->bs) : (base->bs);
+        ret = bdrv_co_writev(target, sector_num, n, &hd_qiov);
+        if (ret < 0) {
+            goto out1;
+        }
+
+        remaining_sectors -= n;
+        sector_num += n;
+        bytes_done += n * BDRV_SECTOR_SIZE;
+    }
+
+out1:
+    qemu_iovec_destroy(&hd_qiov);
+out:
+    return ret;
+}
+
+static bool replication_recurse_is_first_non_filter(BlockDriverState *bs,
+                                                    BlockDriverState *candidate)
+{
+    return bdrv_recurse_is_first_non_filter(bs->file->bs, candidate);
+}
+
+static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
+{
+    Error *local_err = NULL;
+    int ret;
+
+    if (!s->secondary_disk->bs->job) {
+        error_setg(errp, "Backup job was cancelled unexpectedly");
+        return;
+    }
+
+    backup_do_checkpoint(s->secondary_disk->bs->job, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    ret = s->active_disk->bs->drv->bdrv_make_empty(s->active_disk->bs);
+    if (ret < 0) {
+        error_setg(errp, "Cannot make active disk empty");
+        return;
+    }
+
+    ret = s->hidden_disk->bs->drv->bdrv_make_empty(s->hidden_disk->bs);
+    if (ret < 0) {
+        error_setg(errp, "Cannot make hidden disk empty");
+        return;
+    }
+}
+
+static void reopen_backing_file(BDRVReplicationState *s, bool writable,
+                                Error **errp)
+{
+    BlockReopenQueue *reopen_queue = NULL;
+    int orig_hidden_flags, orig_secondary_flags;
+    int new_hidden_flags, new_secondary_flags;
+    Error *local_err = NULL;
+
+    if (writable) {
+        orig_hidden_flags = s->orig_hidden_flags =
+                                bdrv_get_flags(s->hidden_disk->bs);
+        new_hidden_flags = (orig_hidden_flags | BDRV_O_RDWR) &
+                                                    ~BDRV_O_INACTIVE;
+        orig_secondary_flags = s->orig_secondary_flags =
+                                bdrv_get_flags(s->secondary_disk->bs);
+        new_secondary_flags = (orig_secondary_flags | BDRV_O_RDWR) &
+                                                     ~BDRV_O_INACTIVE;
+    } else {
+        orig_hidden_flags = (s->orig_hidden_flags | BDRV_O_RDWR) &
+                                                    ~BDRV_O_INACTIVE;
+        new_hidden_flags = s->orig_hidden_flags;
+        orig_secondary_flags = (s->orig_secondary_flags | BDRV_O_RDWR) &
+                                                    ~BDRV_O_INACTIVE;
+        new_secondary_flags = s->orig_secondary_flags;
+    }
+
+    if (orig_hidden_flags != new_hidden_flags) {
+        reopen_queue = bdrv_reopen_queue(reopen_queue, s->hidden_disk->bs, NULL,
+                                         new_hidden_flags);
+    }
+
+    if (!(orig_secondary_flags & BDRV_O_RDWR)) {
+        reopen_queue = bdrv_reopen_queue(reopen_queue, s->secondary_disk->bs,
+                                         NULL, new_secondary_flags);
+    }
+
+    if (reopen_queue) {
+        bdrv_reopen_multiple(reopen_queue, &local_err);
+        error_propagate(errp, local_err);
+    }
+}
+
+static void backup_job_cleanup(BDRVReplicationState *s)
+{
+    BlockDriverState *top_bs;
+
+    top_bs = bdrv_lookup_bs(s->top_id, s->top_id, NULL);
+    if (!top_bs) {
+        return;
+    }
+    bdrv_op_unblock_all(top_bs, s->blocker);
+    error_free(s->blocker);
+    reopen_backing_file(s, false, NULL);
+}
+
+static void backup_job_completed(void *opaque, int ret)
+{
+    BDRVReplicationState *s = opaque;
+
+    if (s->replication_state != BLOCK_REPLICATION_FAILOVER) {
+        /* The backup job is cancelled unexpectedly */
+        s->error = -EIO;
+    }
+
+    backup_job_cleanup(s);
+}
+
+static bool check_top_bs(BlockDriverState *top_bs, BlockDriverState *bs)
+{
+    BdrvChild *child;
+
+    /* The bs itself is the top_bs */
+    if (top_bs == bs) {
+        return true;
+    }
+
+    /* Iterate over top_bs's children */
+    QLIST_FOREACH(child, &top_bs->children, next) {
+        if (child->bs == bs || check_top_bs(child->bs, bs)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static void replication_start(ReplicationState *rs, ReplicationMode mode,
+                              Error **errp)
+{
+    BlockDriverState *bs = rs->opaque;
+    BDRVReplicationState *s;
+    BlockDriverState *top_bs;
+    int64_t active_length, hidden_length, disk_length;
+    AioContext *aio_context;
+    Error *local_err = NULL;
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+    s = bs->opaque;
+
+    if (s->replication_state != BLOCK_REPLICATION_NONE) {
+        error_setg(errp, "Block replication is running or done");
+        aio_context_release(aio_context);
+        return;
+    }
+
+    if (s->mode != mode) {
+        error_setg(errp, "The parameter mode's value is invalid, needs %d,"
+                   " but got %d", s->mode, mode);
+        aio_context_release(aio_context);
+        return;
+    }
+
+    switch (s->mode) {
+    case REPLICATION_MODE_PRIMARY:
+        break;
+    case REPLICATION_MODE_SECONDARY:
+        s->active_disk = bs->file;
+        if (!s->active_disk || !s->active_disk->bs ||
+                                    !s->active_disk->bs->backing) {
+            error_setg(errp, "Active disk doesn't have backing file");
+            aio_context_release(aio_context);
+            return;
+        }
+
+        s->hidden_disk = s->active_disk->bs->backing;
+        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
+            error_setg(errp, "Hidden disk doesn't have backing file");
+            aio_context_release(aio_context);
+            return;
+        }
+
+        s->secondary_disk = s->hidden_disk->bs->backing;
+        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
+            error_setg(errp, "The secondary disk doesn't have block backend");
+            aio_context_release(aio_context);
+            return;
+        }
+
+        /* verify the length */
+        active_length = bdrv_getlength(s->active_disk->bs);
+        hidden_length = bdrv_getlength(s->hidden_disk->bs);
+        disk_length = bdrv_getlength(s->secondary_disk->bs);
+        if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
+            active_length != hidden_length || hidden_length != disk_length) {
+            error_setg(errp, "Active disk, hidden disk, secondary disk's length"
+                       " are not the same");
+            aio_context_release(aio_context);
+            return;
+        }
+
+        if (!s->active_disk->bs->drv->bdrv_make_empty ||
+            !s->hidden_disk->bs->drv->bdrv_make_empty) {
+            error_setg(errp,
+                       "Active disk or hidden disk doesn't support make_empty");
+            aio_context_release(aio_context);
+            return;
+        }
+
+        /* reopen the backing file in r/w mode */
+        reopen_backing_file(s, true, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            aio_context_release(aio_context);
+            return;
+        }
+
+        /* start backup job now */
+        error_setg(&s->blocker,
+                   "Block device is in use by internal backup job");
+
+        top_bs = bdrv_lookup_bs(s->top_id, s->top_id, errp);
+        if (!top_bs || !check_top_bs(top_bs, bs)) {
+            error_setg(errp, "No top_bs or it is invalid");
+            reopen_backing_file(s, false, NULL);
+            aio_context_release(aio_context);
+            return;
+        }
+        bdrv_op_block_all(top_bs, s->blocker);
+        bdrv_op_unblock(top_bs, BLOCK_OP_TYPE_DATAPLANE, s->blocker);
+
+        backup_start(s->secondary_disk->bs, s->hidden_disk->bs, 0,
+                     MIRROR_SYNC_MODE_NONE, NULL, BLOCKDEV_ON_ERROR_REPORT,
+                     BLOCKDEV_ON_ERROR_REPORT, backup_job_completed,
+                     s, NULL, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            backup_job_cleanup(s);
+            aio_context_release(aio_context);
+            return;
+        }
+        break;
+    default:
+        aio_context_release(aio_context);
+        abort();
+    }
+
+    s->replication_state = BLOCK_REPLICATION_RUNNING;
+
+    if (s->mode == REPLICATION_MODE_SECONDARY) {
+        secondary_do_checkpoint(s, errp);
+    }
+
+    s->error = 0;
+    aio_context_release(aio_context);
+}
+
+static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
+{
+    BlockDriverState *bs = rs->opaque;
+    BDRVReplicationState *s;
+    AioContext *aio_context;
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+    s = bs->opaque;
+
+    if (s->mode == REPLICATION_MODE_SECONDARY) {
+        secondary_do_checkpoint(s, errp);
+    }
+    aio_context_release(aio_context);
+}
+
+static void replication_get_error(ReplicationState *rs, Error **errp)
+{
+    BlockDriverState *bs = rs->opaque;
+    BDRVReplicationState *s;
+    AioContext *aio_context;
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+    s = bs->opaque;
+
+    if (s->replication_state != BLOCK_REPLICATION_RUNNING) {
+        error_setg(errp, "Block replication is not running");
+        aio_context_release(aio_context);
+        return;
+    }
+
+    if (s->error) {
+        error_setg(errp, "I/O error occurred");
+        aio_context_release(aio_context);
+        return;
+    }
+    aio_context_release(aio_context);
+}
+
+static void replication_done(void *opaque, int ret)
+{
+    BlockDriverState *bs = opaque;
+    BDRVReplicationState *s = bs->opaque;
+
+    if (ret == 0) {
+        s->replication_state = BLOCK_REPLICATION_DONE;
+
+        /* refresh top bs's filename */
+        bdrv_refresh_filename(bs);
+        s->active_disk = NULL;
+        s->secondary_disk = NULL;
+        s->hidden_disk = NULL;
+        s->error = 0;
+    } else {
+        s->replication_state = BLOCK_REPLICATION_FAILOVER_FAILED;
+        s->error = -EIO;
+    }
+}
+
+static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
+{
+    BlockDriverState *bs = rs->opaque;
+    BDRVReplicationState *s;
+    AioContext *aio_context;
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+    s = bs->opaque;
+
+    if (s->replication_state != BLOCK_REPLICATION_RUNNING) {
+        error_setg(errp, "Block replication is not running");
+        aio_context_release(aio_context);
+        return;
+    }
+
+    switch (s->mode) {
+    case REPLICATION_MODE_PRIMARY:
+        s->replication_state = BLOCK_REPLICATION_DONE;
+        s->error = 0;
+        break;
+    case REPLICATION_MODE_SECONDARY:
+        /*
+         * This BDS will be closed, and the job should be completed
+         * before the BDS is closed, because we will access hidden
+         * disk, secondary disk in backup_job_completed().
+         */
+        if (s->secondary_disk->bs->job) {
+            block_job_cancel_sync(s->secondary_disk->bs->job);
+        }
+
+        if (!failover) {
+            secondary_do_checkpoint(s, errp);
+            s->replication_state = BLOCK_REPLICATION_DONE;
+            aio_context_release(aio_context);
+            return;
+        }
+
+        s->replication_state = BLOCK_REPLICATION_FAILOVER;
+        commit_active_start(s->active_disk->bs, s->secondary_disk->bs, 0,
+                            BLOCKDEV_ON_ERROR_REPORT, replication_done,
+                            bs, errp, true);
+        break;
+    default:
+        aio_context_release(aio_context);
+        abort();
+    }
+    aio_context_release(aio_context);
+}
+
+BlockDriver bdrv_replication = {
+    .format_name                = "replication",
+    .protocol_name              = "replication",
+    .instance_size              = sizeof(BDRVReplicationState),
+
+    .bdrv_open                  = replication_open,
+    .bdrv_close                 = replication_close,
+
+    .bdrv_getlength             = replication_getlength,
+    .bdrv_co_readv              = replication_co_readv,
+    .bdrv_co_writev             = replication_co_writev,
+
+    .is_filter                  = true,
+    .bdrv_recurse_is_first_non_filter = replication_recurse_is_first_non_filter,
+
+    .has_variable_length        = true,
+};
+
+static void bdrv_replication_init(void)
+{
+    bdrv_register(&bdrv_replication);
+}
+
+block_init(bdrv_replication_init);
-- 
1.9.3




