Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyQ-0001In-Di
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyL-0001Bl-Mm
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyI-0007Yf-Rk
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:52 -0400
Received: from [59.151.112.132] (port=52506 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy0-0007IT-UU; Tue, 07 Jun 2016 21:07:35 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473513"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 671AE41C0B9D;
	Wed,  8 Jun 2016 09:07:25 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:25 +0800
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
Date: Wed, 8 Jun 2016 09:11:29 +0800
Message-ID: <1465348292-26750-8-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 671AE41C0B9D.A335B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 07/10] Introduce new APIs to do
 replication operation
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:57 -0000

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 Makefile.objs        |   1 +
 qapi/block-core.json |  13 ++++
 replication.c        | 105 ++++++++++++++++++++++++++++++
 replication.h        | 176 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 295 insertions(+)
 create mode 100644 replication.c
 create mode 100644 replication.h

diff --git a/Makefile.objs b/Makefile.objs
index da49b71..f77f6b0 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -15,6 +15,7 @@ block-obj-$(CONFIG_POSIX) += aio-posix.o
 block-obj-$(CONFIG_WIN32) += aio-win32.o
 block-obj-y += block/
 block-obj-y += qemu-io-cmds.o
+block-obj-y += replication.o
 
 block-obj-m = block/
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 98a20d2..e56cdf4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2032,6 +2032,19 @@
             '*read-pattern': 'QuorumReadPattern' } }
 
 ##
+# @ReplicationMode
+#
+# An enumeration of replication modes.
+#
+# @primary: Primary mode, the vm's state will be sent to secondary QEMU.
+#
+# @secondary: Secondary mode, receive the vm's state from primary QEMU.
+#
+# Since: 2.7
+##
+{ 'enum' : 'ReplicationMode', 'data' : [ 'primary', 'secondary' ] }
+
+##
 # @BlockdevOptions
 #
 # Options for creating a block device.  Many options are available for all
diff --git a/replication.c b/replication.c
new file mode 100644
index 0000000..03f4a2b
--- /dev/null
+++ b/replication.c
@@ -0,0 +1,105 @@
+/*
+ * Replication filter
+ *
+ * Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
+ * Copyright (c) 2016 Intel Corporation
+ * Copyright (c) 2016 FUJITSU LIMITED
+ *
+ * Author:
+ *   Changlong Xie <xiecl.fnst@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "replication.h"
+
+static QLIST_HEAD(, ReplicationState) replication_states;
+
+ReplicationState *replication_new(void *opaque, ReplicationOps *ops)
+{
+    ReplicationState *rs;
+
+    assert(ops != NULL);
+    rs = g_new0(ReplicationState, 1);
+    rs->opaque = opaque;
+    rs->ops = ops;
+    QLIST_INSERT_HEAD(&replication_states, rs, node);
+
+    return rs;
+}
+
+void replication_remove(ReplicationState *rs)
+{
+    if (rs) {
+        QLIST_REMOVE(rs, node);
+        g_free(rs);
+    }
+}
+
+/*
+ * The caller of the function MUST make sure vm stopped
+ */
+void replication_start_all(ReplicationMode mode, Error **errp)
+{
+    ReplicationState *rs, *next;
+    Error *local_err = NULL;
+
+    QLIST_FOREACH_SAFE(rs, &replication_states, node, next) {
+        if (rs->ops && rs->ops->start) {
+            rs->ops->start(rs, mode, &local_err);
+        }
+        if (local_err) {
+           error_propagate(errp, local_err);
+           return;
+        }
+    }
+}
+
+void replication_do_checkpoint_all(Error **errp)
+{
+    ReplicationState *rs, *next;
+    Error *local_err = NULL;
+
+    QLIST_FOREACH_SAFE(rs, &replication_states, node, next) {
+        if (rs->ops && rs->ops->checkpoint) {
+            rs->ops->checkpoint(rs, &local_err);
+        }
+        if (local_err) {
+           error_propagate(errp, local_err);
+           return;
+        }
+    }
+}
+
+void replication_get_error_all(Error **errp)
+{
+    ReplicationState *rs, *next;
+    Error *local_err = NULL;
+
+    QLIST_FOREACH_SAFE(rs, &replication_states, node, next) {
+        if (rs->ops && rs->ops->get_error) {
+            rs->ops->get_error(rs, &local_err);
+        }
+        if (local_err) {
+           error_propagate(errp, local_err);
+           return;
+        }
+    }
+}
+
+void replication_stop_all(bool failover, Error **errp)
+{
+    ReplicationState *rs, *next;
+    Error *local_err = NULL;
+
+    QLIST_FOREACH_SAFE(rs, &replication_states, node, next) {
+        if (rs->ops && rs->ops->stop) {
+            rs->ops->stop(rs, failover, &local_err);
+        }
+        if (local_err) {
+           error_propagate(errp, local_err);
+           return;
+        }
+    }
+}
diff --git a/replication.h b/replication.h
new file mode 100644
index 0000000..d9db696
--- /dev/null
+++ b/replication.h
@@ -0,0 +1,176 @@
+/*
+ * Replication filter
+ *
+ * Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
+ * Copyright (c) 2016 Intel Corporation
+ * Copyright (c) 2016 FUJITSU LIMITED
+ *
+ * Author:
+ *   Changlong Xie <xiecl.fnst@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef REPLICATION_H
+#define REPLICATION_H
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+
+typedef struct ReplicationOps ReplicationOps;
+typedef struct ReplicationState ReplicationState;
+
+/**
+ * SECTION:replication.h
+ * @title:Base Replication System
+ * @short_description: interfaces for handling replication
+ *
+ * The Replication Model provides a framework for handling Replication
+ *
+ * <example>
+ *   <title>How to use replication interfaces</title>
+ *   <programlisting>
+ * #include "replication.h"
+ *
+ * typedef struct BDRVReplicationState {
+ *     ReplicationState *rs;
+ * } BDRVReplicationState;
+ *
+ * static void replication_start(ReplicationState *rs, ReplicationMode mode,
+ *                               Error **errp);
+ * static void replication_do_checkpoint(ReplicationState *rs, Error **errp);
+ * static void replication_get_error(ReplicationState *rs, Error **errp);
+ * static void replication_stop(ReplicationState *rs, bool failover,
+ *                              Error **errp);
+ *
+ * static ReplicationOps replication_ops = {
+ *     .start = replication_start,
+ *     .checkpoint = replication_do_checkpoint,
+ *     .get_error = replication_get_error,
+ *     .stop = replication_stop,
+ * }
+ *
+ * static int replication_open(BlockDriverState *bs, QDict *options,
+ *                             int flags, Error **errp)
+ * {
+ *     BDRVReplicationState *s = bs->opaque;
+ *     s->rs = replication_new(bs, &replication_ops);
+ *     return 0;
+ * }
+ *
+ * static void replication_close(BlockDriverState *bs)
+ * {
+ *     BDRVReplicationState *s = bs->opaque;
+ *     replication_remove(s->rs);
+ * }
+ *
+ * BlockDriver bdrv_replication = {
+ *     .format_name                = "replication",
+ *     .protocol_name              = "replication",
+ *     .instance_size              = sizeof(BDRVReplicationState),
+ *
+ *     .bdrv_open                  = replication_open,
+ *     .bdrv_close                 = replication_close,
+ * };
+ *
+ * static void bdrv_replication_init(void)
+ * {
+ *     bdrv_register(&bdrv_replication);
+ * }
+ *
+ * block_init(bdrv_replication_init);
+ *   </programlisting>
+ * </example>
+ *
+ * We create an example about how to use replication interface in above.
+ * Then in migration, we can use replication_(start/stop/do_checkpoint/
+ * get_error)_all to handle all replication operations.
+ */
+
+/**
+ * ReplicationState:
+ * @opaque: opaque pointer value passed to this ReplicationState
+ * @ops: replication operation of this ReplicationState
+ * @node: node that we will insert into @replication_states QLIST
+ */
+struct ReplicationState {
+    void *opaque;
+    ReplicationOps *ops;
+    QLIST_ENTRY(ReplicationState) node;
+};
+
+/**
+ * ReplicationOps:
+ * @start: callback to start replication
+ * @stop: callback to stop replication
+ * @checkpoint: callback to do checkpoint
+ * @get_error: callback to check if error occurred during replication
+ */
+struct ReplicationOps {
+    void (*start)(ReplicationState *rs, ReplicationMode mode, Error **errp);
+    void (*stop)(ReplicationState *rs, bool failover, Error **errp);
+    void (*checkpoint)(ReplicationState *rs, Error **errp);
+    void (*get_error)(ReplicationState *rs, Error **errp);
+};
+
+/**
+ * replication_new:
+ * @opaque: opaque pointer value passed to ReplicationState
+ * @ops: replication operation of the new relevant ReplicationState
+ *
+ * Called to create a new ReplicationState instance, and then insert it
+ * into @replication_states QLIST
+ *
+ * Returns: the new ReplicationState instance
+ */
+ReplicationState *replication_new(void *opaque, ReplicationOps *ops);
+
+/**
+ * replication_remove:
+ * @rs: the ReplicationState instance to remove
+ *
+ * Called to remove a ReplicationState instance, and then delete it from
+ * @replication_states QLIST
+ */
+void replication_remove(ReplicationState *rs);
+
+/**
+ * replication_start_all:
+ * @mode: replication mode that could be "primary" or "secondary"
+ * @errp: returns an error if this function fails
+ *
+ * Start replication, called in migration/checkpoint thread
+ *
+ * Note: the caller of the function MUST make sure vm stopped
+ */
+void replication_start_all(ReplicationMode mode, Error **errp);
+
+/**
+ * replication_do_checkpoint_all:
+ * @errp: returns an error if this function fails
+ *
+ * This interface is called after all VM state is transferred to Secondary QEMU
+ */
+void replication_do_checkpoint_all(Error **errp);
+
+/**
+ * replication_get_error_all:
+ * @errp: returns an error if this function fails
+ *
+ * This interface is called to check if error occurred during replication
+ */
+void replication_get_error_all(Error **errp);
+
+/**
+ * replication_stop_all:
+ * @failover: boolean value that indicates if we need do failover or not
+ * @errp: returns an error if this function fails
+ *
+ * It is called on failover. The vm should be stopped before calling it, if you
+ * use this API to shutdown the guest, or other things except failover
+ */
+void replication_stop_all(bool failover, Error **errp);
+
+#endif /* REPLICATION_H */
-- 
1.9.3




