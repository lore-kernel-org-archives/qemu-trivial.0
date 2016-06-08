Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyV-0001PL-St
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:08:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyQ-0001HL-CN
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyM-0007cr-KF
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:57 -0400
Received: from [59.151.112.132] (port=5480 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy7-0007It-QK; Tue, 07 Jun 2016 21:07:41 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473523"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0EDB441C0B98;
	Wed,  8 Jun 2016 09:07:28 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:27 +0800
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
Date: Wed, 8 Jun 2016 09:11:31 +0800
Message-ID: <1465348292-26750-10-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 0EDB441C0B98.A4697
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 09/10] tests: add unit test case for
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
X-List-Received-Date: Wed, 08 Jun 2016 01:08:02 -0000

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 tests/.gitignore         |   1 +
 tests/Makefile           |   4 +
 tests/test-replication.c | 555 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 560 insertions(+)
 create mode 100644 tests/test-replication.c

diff --git a/tests/.gitignore b/tests/.gitignore
index a06a8ba..d22ab06 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -58,6 +58,7 @@ test-qmp-introspect.[ch]
 test-qmp-marshal.c
 test-qmp-output-visitor
 test-rcu-list
+test-replication
 test-rfifolock
 test-string-input-visitor
 test-string-output-visitor
diff --git a/tests/Makefile b/tests/Makefile
index a3e20e3..901b8e4 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -103,6 +103,7 @@ check-unit-y += tests/test-crypto-xts$(EXESUF)
 check-unit-y += tests/test-crypto-block$(EXESUF)
 gcov-files-test-logging-y = tests/test-logging.c
 check-unit-y += tests/test-logging$(EXESUF)
+check-unit-y += tests/test-replication$(EXESUF)
 
 check-block-$(CONFIG_POSIX) += tests/qemu-iotests-quick.sh
 
@@ -451,6 +452,9 @@ tests/test-base64$(EXESUF): tests/test-base64.o \
 
 tests/test-logging$(EXESUF): tests/test-logging.o $(test-util-obj-y)
 
+tests/test-replication$(EXESUF): tests/test-replication.o $(test-util-obj-y) \
+	$(test-block-obj-y)
+
 tests/test-qapi-types.c tests/test-qapi-types.h :\
 $(SRC_PATH)/tests/qapi-schema/qapi-schema-test.json $(SRC_PATH)/scripts/qapi-types.py $(qapi-py)
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py \
diff --git a/tests/test-replication.c b/tests/test-replication.c
new file mode 100644
index 0000000..b5bb2eb
--- /dev/null
+++ b/tests/test-replication.c
@@ -0,0 +1,555 @@
+/*
+ * Block replication tests
+ *
+ * Copyright (c) 2016 FUJITSU LIMITED
+ * Author: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "replication.h"
+#include "block/block_int.h"
+#include "sysemu/block-backend.h"
+
+#define IMG_SIZE (64 * 1024 * 1024)
+
+/* primary */
+static char p_local_disk[] = "/tmp/p_local_disk.XXXXXX";
+
+/* secondary */
+#define S_ID "secondary-id"
+#define S_LOCAL_DISK_ID "secondary-local-disk-id"
+static char s_local_disk[] = "/tmp/s_local_disk.XXXXXX";
+static char s_active_disk[] = "/tmp/s_active_disk.XXXXXX";
+static char s_hidden_disk[] = "/tmp/s_hidden_disk.XXXXXX";
+
+/* FIXME: steal from blockdev.c */
+QemuOptsList qemu_drive_opts = {
+    .name = "drive",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_drive_opts.head),
+    .desc = {
+        { /* end of list */ }
+    },
+};
+
+static void io_read(BlockDriverState *bs, long pattern, int64_t pattern_offset,
+                    int64_t pattern_count, int64_t offset, int64_t count,
+                    bool expect_failed)
+{
+    char *buf;
+    void *cmp_buf = NULL;
+    int ret;
+
+    /* alloc pattern buffer */
+    if (pattern) {
+        cmp_buf = g_malloc(pattern_count);
+        memset(cmp_buf, pattern, pattern_count);
+    }
+
+    /* alloc read buffer */
+    buf = qemu_blockalign(bs, count);
+    memset(buf, 0xab, count);
+
+    /* do read */
+    ret = bdrv_read(bs, offset >> 9, (uint8_t *)buf, count >> 9);
+
+    /* assert and compare buf */
+    if (expect_failed) {
+        g_assert(ret < 0);
+    } else {
+        g_assert(ret >= 0);
+        if (pattern) {
+            g_assert(memcmp(buf + pattern_offset, cmp_buf, pattern_count) <= 0);
+        }
+    }
+
+    g_free(cmp_buf);
+    qemu_vfree(buf);
+}
+
+static void io_write(BlockDriverState *bs, long pattern, int64_t offset,
+                     int64_t count, bool expect_failed)
+{
+    void *pattern_buf = NULL;
+    int ret;
+
+    /* alloc pattern buffer */
+    if (pattern) {
+        pattern_buf = qemu_blockalign(bs, count);
+        memset(pattern_buf, pattern, count);
+    }
+
+    /* do write */
+    if (pattern) {
+        ret = bdrv_write(bs, offset >> 9, (uint8_t *)pattern_buf, count >> 9);
+    } else {
+        ret = bdrv_write_zeroes(bs, offset >> 9, count >> 9, 0);
+    }
+
+    /* assert */
+    if (expect_failed) {
+        g_assert(ret < 0);
+    } else {
+        g_assert(ret >= 0);
+    }
+
+    qemu_vfree(pattern_buf);
+}
+
+/*
+ * Create a uniquely-named empty temporary file.
+ */
+static void make_temp(char *template)
+{
+    int fd;
+
+    fd = mkstemp(template);
+    g_assert(fd >= 0);
+    close(fd);
+}
+
+
+static void prepare_imgs(void)
+{
+    Error *local_err = NULL;
+
+    make_temp(p_local_disk);
+    make_temp(s_local_disk);
+    make_temp(s_active_disk);
+    make_temp(s_hidden_disk);
+
+    /* Primary */
+    bdrv_img_create(p_local_disk, "qcow2", NULL, NULL, NULL, IMG_SIZE,
+                    BDRV_O_RDWR, &local_err, true);
+    g_assert(!local_err);
+
+    /* Secondary */
+    bdrv_img_create(s_local_disk, "qcow2", NULL, NULL, NULL, IMG_SIZE,
+                    BDRV_O_RDWR, &local_err, true);
+    g_assert(!local_err);
+    bdrv_img_create(s_active_disk, "qcow2", NULL, NULL, NULL, IMG_SIZE,
+                    BDRV_O_RDWR, &local_err, true);
+    g_assert(!local_err);
+    bdrv_img_create(s_hidden_disk, "qcow2", NULL, NULL, NULL, IMG_SIZE,
+                    BDRV_O_RDWR, &local_err, true);
+    g_assert(!local_err);
+}
+
+static void cleanup_imgs(void)
+{
+    /* Primary */
+    unlink(p_local_disk);
+
+    /* Secondary */
+    unlink(s_local_disk);
+    unlink(s_active_disk);
+    unlink(s_hidden_disk);
+}
+
+static BlockDriverState *start_primary(void)
+{
+    BlockDriverState *bs;
+    QemuOpts *opts;
+    QDict *qdict;
+    Error *local_err = NULL;
+    char *cmdline;
+
+    cmdline = g_strdup_printf("driver=replication,mode=primary,node-name=xxx,"
+                              "file.driver=qcow2,file.file.filename=%s"
+                              , p_local_disk);
+    opts = qemu_opts_parse_noisily(&qemu_drive_opts, cmdline, false);
+    g_free(cmdline);
+
+    qdict = qemu_opts_to_qdict(opts, NULL);
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_DIRECT, "off");
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_NO_FLUSH, "off");
+
+    bs = bdrv_open(NULL, NULL, qdict, BDRV_O_RDWR, &local_err);
+
+    g_assert(bs);
+    g_assert(!local_err);
+
+    qemu_opts_del(opts);
+
+    return bs;
+}
+
+static void teardown_primary(BlockDriverState *bs)
+{
+    /* only destroy BS, since we didn't initialize BB on Primary */
+    bdrv_unref(bs);
+}
+
+static void test_primary_read(void)
+{
+    BlockDriverState *bs;
+
+    bs = start_primary();
+
+    /* read from 0 to IMG_SIZE */
+    io_read(bs, 0, 0, IMG_SIZE, 0, IMG_SIZE, true);
+
+    teardown_primary(bs);
+}
+
+static void test_primary_write(void)
+{
+    BlockDriverState *bs;
+
+    bs = start_primary();
+
+    /* write from 0 to IMG_SIZE */
+    io_write(bs, 0, 0, IMG_SIZE, true);
+
+    teardown_primary(bs);
+}
+
+static void test_primary_start(void)
+{
+    BlockDriverState *bs;
+    Error *local_err = NULL;
+
+    bs = start_primary();
+
+    replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
+    g_assert(!local_err);
+
+    /* read from 0 to IMG_SIZE */
+    io_read(bs, 0, 0, IMG_SIZE, 0, IMG_SIZE, true);
+
+    /* write 0x22 from 0 to IMG_SIZE */
+    io_write(bs, 0x22, 0, IMG_SIZE, false);
+
+    teardown_primary(bs);
+}
+
+static void test_primary_stop(void)
+{
+    BlockDriverState *bs;
+    Error *local_err = NULL;
+    bool failover = true;
+
+    bs = start_primary();
+
+    replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
+    g_assert(!local_err);
+
+    replication_stop_all(failover, &local_err);
+    g_assert(!local_err);
+
+    teardown_primary(bs);
+}
+
+static void test_primary_do_checkpoint(void)
+{
+    BlockDriverState *bs;
+    Error *local_err = NULL;
+
+    bs = start_primary();
+
+    replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
+    g_assert(!local_err);
+
+    replication_do_checkpoint_all(&local_err);
+    g_assert(!local_err);
+
+    teardown_primary(bs);
+}
+
+static void test_primary_get_error(void)
+{
+    BlockDriverState *bs;
+    Error *local_err = NULL;
+
+    bs = start_primary();
+
+    replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
+    g_assert(!local_err);
+
+    replication_get_error_all(&local_err);
+    g_assert(!local_err);
+
+    teardown_primary(bs);
+}
+
+static BlockDriverState *start_secondary(void)
+{
+    QemuOpts *opts;
+    QDict *qdict;
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    char *cmdline;
+    Error *local_err = NULL;
+
+    /* add s_local_disk and forge S_LOCAL_DISK_ID */
+    cmdline = g_strdup_printf("file.filename=%s,driver=qcow2" , s_local_disk);
+    opts = qemu_opts_parse_noisily(&qemu_drive_opts, cmdline, false);
+    g_free(cmdline);
+
+    qdict = qemu_opts_to_qdict(opts, NULL);
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_DIRECT, "off");
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_NO_FLUSH, "off");
+
+    blk = blk_new_open(NULL, NULL, qdict, BDRV_O_RDWR, &local_err);
+    assert(blk);
+    monitor_add_blk(blk, S_LOCAL_DISK_ID, &local_err);
+    g_assert(!local_err);
+
+    /* format s_local_disk with pattern "0x11" */
+    bs = blk_bs(blk);
+    io_write(bs, 0x11, 0, IMG_SIZE, false);
+
+    qemu_opts_del(opts);
+
+    /* add S_(ACTIVE/HIDDEN)_DISK and forge S_ID */
+    cmdline = g_strdup_printf("driver=replication,mode=secondary,top-id=%s,"
+                              "file.driver=qcow2,file.file.filename=%s,"
+                              "file.backing.driver=qcow2,"
+                              "file.backing.file.filename=%s,"
+                              "file.backing.backing=%s"
+                              , S_ID, s_active_disk, s_hidden_disk
+                              , S_LOCAL_DISK_ID);
+    opts = qemu_opts_parse_noisily(&qemu_drive_opts, cmdline, false);
+    g_free(cmdline);
+
+    qdict = qemu_opts_to_qdict(opts, NULL);
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_DIRECT, "off");
+    qdict_set_default_str(qdict, BDRV_OPT_CACHE_NO_FLUSH, "off");
+
+    blk = blk_new_open(NULL, NULL, qdict, BDRV_O_RDWR, &local_err);
+    assert(blk);
+    monitor_add_blk(blk, S_ID, &local_err);
+    g_assert(!local_err);
+
+    qemu_opts_del(opts);
+
+    /* return top bs */
+    return blk_bs(blk);
+}
+
+static void teardown_secondary(void)
+{
+    /* only need to destroy two BBs */
+    BlockBackend *blk;
+
+    /* remove S_LOCAL_DISK_ID */
+    blk = blk_by_name(S_LOCAL_DISK_ID);
+    assert(blk);
+
+    monitor_remove_blk(blk);
+    blk_unref(blk);
+
+    /* remove S_ID */
+    blk = blk_by_name(S_ID);
+    assert(blk);
+
+    monitor_remove_blk(blk);
+    blk_unref(blk);
+}
+
+static void test_secondary_read(void)
+{
+    BlockDriverState *top_bs;
+
+    top_bs = start_secondary();
+
+    /* read from 0 to IMG_SIZE */
+    io_read(top_bs, 0, 0, IMG_SIZE, 0, IMG_SIZE, true);
+
+    teardown_secondary();
+}
+
+static void test_secondary_write(void)
+{
+    BlockDriverState *bs;
+
+    bs = start_secondary();
+
+    /* write from 0 to IMG_SIZE */
+    io_write(bs, 0, 0, IMG_SIZE, true);
+
+    teardown_secondary();
+}
+
+static void test_secondary_start(void)
+{
+    BlockBackend *blk;
+    BlockDriverState *top_bs, *local_bs;
+    Error *local_err = NULL;
+    bool failover = true;
+
+    top_bs = start_secondary();
+    replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
+    g_assert(!local_err);
+
+    /* read from s_local_disk (0, IMG_SIZE) */
+    io_read(top_bs, 0x11, 0, IMG_SIZE, 0, IMG_SIZE, false);
+
+    /* write 0x22 to s_local_disk (IMG_SIZE / 2, IMG_SIZE) */
+    blk = blk_by_name(S_LOCAL_DISK_ID);
+    local_bs = blk_bs(blk);
+
+    io_write(local_bs, 0x22, IMG_SIZE / 2, IMG_SIZE / 2, false);
+
+    /* replication will backup s_local_disk to s_hidden_disk */
+    io_read(top_bs, 0x11, IMG_SIZE / 2, IMG_SIZE / 2, 0, IMG_SIZE, false);
+
+    /* write 0x33 to s_active_disk (0, IMG_SIZE / 2) */
+    io_write(top_bs, 0x33, 0, IMG_SIZE / 2, false);
+
+    /* read from s_active_disk (0, IMG_SIZE/2) */
+    io_read(top_bs, 0x33, 0, IMG_SIZE / 2, 0, IMG_SIZE / 2, false);
+
+    /* unblock top_bs */
+    replication_stop_all(failover, &local_err);
+    g_assert(!local_err);
+
+    teardown_secondary();
+}
+
+static void test_secondary_stop(void)
+{
+    BlockBackend *blk;
+    BlockDriverState *top_bs, *local_bs;
+    Error *local_err = NULL;
+    bool failover = true;
+
+    top_bs = start_secondary();
+    replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
+    g_assert(!local_err);
+
+    /* write 0x22 to s_local_disk (IMG_SIZE / 2, IMG_SIZE) */
+    blk = blk_by_name(S_LOCAL_DISK_ID);
+    local_bs = blk_bs(blk);
+
+    io_write(local_bs, 0x22, IMG_SIZE / 2, IMG_SIZE / 2, false);
+
+    /* replication will backup s_local_disk to s_hidden_disk */
+    io_read(top_bs, 0x11, IMG_SIZE / 2, IMG_SIZE / 2, 0, IMG_SIZE, false);
+
+    /* write 0x33 to s_active_disk (0, IMG_SIZE / 2) */
+    io_write(top_bs, 0x33, 0, IMG_SIZE / 2, false);
+
+    /* do active commit */
+    replication_stop_all(failover, &local_err);
+    g_assert(!local_err);
+
+    /* read from s_local_disk (0, IMG_SIZE / 2) */
+    io_read(top_bs, 0x33, 0, IMG_SIZE / 2, 0, IMG_SIZE / 2, false);
+
+    /* read from s_local_disk (IMG_SIZE / 2, IMG_SIZE) */
+    io_read(top_bs, 0x22, IMG_SIZE / 2, IMG_SIZE / 2, 0, IMG_SIZE, false);
+
+    teardown_secondary();
+}
+
+static void test_secondary_do_checkpoint(void)
+{
+    BlockBackend *blk;
+    BlockDriverState *top_bs, *local_bs;
+    Error *local_err = NULL;
+    bool failover = true;
+
+    top_bs = start_secondary();
+    replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
+    g_assert(!local_err);
+
+    /* write 0x22 to s_local_disk (IMG_SIZE / 2, IMG_SIZE) */
+    blk = blk_by_name(S_LOCAL_DISK_ID);
+    local_bs = blk_bs(blk);
+
+    io_write(local_bs, 0x22, IMG_SIZE / 2, IMG_SIZE / 2, false);
+
+    /* replication will backup s_local_disk to s_hidden_disk */
+    io_read(top_bs, 0x11, IMG_SIZE / 2, IMG_SIZE / 2, 0, IMG_SIZE, false);
+
+    replication_do_checkpoint_all(&local_err);
+    g_assert(!local_err);
+
+    /* after checkpoint, read pattern 0x22 from s_local_disk */
+    io_read(top_bs, 0x22, IMG_SIZE / 2, IMG_SIZE / 2, 0, IMG_SIZE, false);
+
+    /* unblock top_bs */
+    replication_stop_all(failover, &local_err);
+    g_assert(!local_err);
+
+    teardown_secondary();
+}
+
+static void test_secondary_get_error(void)
+{
+    Error *local_err = NULL;
+    bool failover = true;
+
+    start_secondary();
+    replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
+    g_assert(!local_err);
+
+    replication_get_error_all(&local_err);
+    g_assert(!local_err);
+
+    /* unblock top_bs */
+    replication_stop_all(failover, &local_err);
+    g_assert(!local_err);
+
+    teardown_secondary();
+}
+
+static void sigabrt_handler(int signo)
+{
+    cleanup_imgs();
+}
+
+static void setup_sigabrt_handler(void)
+{
+    struct sigaction sigact;
+
+    sigact = (struct sigaction){
+        .sa_handler = sigabrt_handler,
+        .sa_flags = SA_RESETHAND,
+    };
+    sigemptyset(&sigact.sa_mask);
+    sigaction(SIGABRT, &sigact, NULL);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    qemu_init_main_loop(&error_fatal);
+    bdrv_init();
+
+    g_test_init(&argc, &argv, NULL);
+    setup_sigabrt_handler();
+
+    prepare_imgs();
+
+    /* Primary */
+    g_test_add_func("/replication/primary/read",    test_primary_read);
+    g_test_add_func("/replication/primary/write",   test_primary_write);
+    g_test_add_func("/replication/primary/start",   test_primary_start);
+    g_test_add_func("/replication/primary/stop",    test_primary_stop);
+    g_test_add_func("/replication/primary/do_checkpoint",
+                    test_primary_do_checkpoint);
+    g_test_add_func("/replication/primary/get_error",
+                    test_primary_get_error);
+
+    /* Secondary */
+    g_test_add_func("/replication/secondary/read",  test_secondary_read);
+    g_test_add_func("/replication/secondary/write", test_secondary_write);
+    g_test_add_func("/replication/secondary/start", test_secondary_start);
+    g_test_add_func("/replication/secondary/stop",  test_secondary_stop);
+    g_test_add_func("/replication/secondary/do_checkpoint",
+                    test_secondary_do_checkpoint);
+    g_test_add_func("/replication/secondary/get_error",
+                    test_secondary_get_error);
+
+    ret = g_test_run();
+
+    cleanup_imgs();
+
+    return ret;
+}
-- 
1.9.3




