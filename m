Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyC-0000y6-1U
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARy9-0000uf-R1
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARy4-0007Lg-Jv
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:40 -0400
Received: from [59.151.112.132] (port=5480 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARxv-0007It-9n; Tue, 07 Jun 2016 21:07:28 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473506"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A1B4841C0B9B;
	Wed,  8 Jun 2016 09:07:19 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:19 +0800
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
Date: Wed, 8 Jun 2016 09:11:24 +0800
Message-ID: <1465348292-26750-3-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: A1B4841C0B9B.A1184
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 02/10] Backup: clear all bitmap when
 doing block checkpoint
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:43 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block/backup.c               | 18 ++++++++++++++++++
 include/block/block_backup.h |  3 +++
 2 files changed, 21 insertions(+)
 create mode 100644 include/block/block_backup.h

diff --git a/block/backup.c b/block/backup.c
index feeb9f8..baf3936 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -17,6 +17,7 @@
 #include "block/block.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/block_backup.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
@@ -246,6 +247,23 @@ static void backup_abort(BlockJob *job)
     }
 }
 
+void backup_do_checkpoint(BlockJob *job, Error **errp)
+{
+    BackupBlockJob *backup_job = container_of(job, BackupBlockJob, common);
+    int64_t len;
+
+    assert(job->driver->job_type == BLOCK_JOB_TYPE_BACKUP);
+
+    if (backup_job->sync_mode != MIRROR_SYNC_MODE_NONE) {
+        error_setg(errp, "The backup job only supports block checkpoint in"
+                   " sync=none mode");
+        return;
+    }
+
+    len = DIV_ROUND_UP(backup_job->common.len, backup_job->cluster_size);
+    bitmap_zero(backup_job->done_bitmap, len);
+}
+
 static const BlockJobDriver backup_job_driver = {
     .instance_size  = sizeof(BackupBlockJob),
     .job_type       = BLOCK_JOB_TYPE_BACKUP,
diff --git a/include/block/block_backup.h b/include/block/block_backup.h
new file mode 100644
index 0000000..3753bcb
--- /dev/null
+++ b/include/block/block_backup.h
@@ -0,0 +1,3 @@
+#include "block/block_int.h"
+
+void backup_do_checkpoint(BlockJob *job, Error **errp);
-- 
1.9.3




