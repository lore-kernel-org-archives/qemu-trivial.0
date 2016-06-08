Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyQ-0001IR-75
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyN-0001EM-Kx
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyH-0007YS-SO
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:54 -0400
Received: from [59.151.112.132] (port=21216 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy5-0007Jd-6t; Tue, 07 Jun 2016 21:07:37 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473512"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C407641C0B97;
	Wed,  8 Jun 2016 09:07:20 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:20 +0800
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
Date: Wed, 8 Jun 2016 09:11:25 +0800
Message-ID: <1465348292-26750-4-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: C407641C0B97.AEF3A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 03/10] Backup: export interfaces for
 extra serialization
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

Normal backup(sync='none') workflow:
step 1. NBD peformance I/O write from client to server
   qcow2_co_writev
    bdrv_co_writev
     ...
       bdrv_aligned_pwritev
        notifier_with_return_list_notify -> backup_do_cow
         bdrv_driver_pwritev // write new contents

step 2. drive-backup sync=none
   backup_do_cow
   {
    wait_for_overlapping_requests
    cow_request_begin
    for(; start < end; start++) {
            bdrv_co_readv_no_serialising //read old contents from Secondary disk
            bdrv_co_writev // write old contents to hidden-disk
    }
    cow_request_end
   }

step 3. Then roll back to "step 1" to write new contents to Secondary disk.

And for replication, we must make sure that we only read the old contents from
Secondary disk in order to keep contents consistent.

1) Replication workflow of Secondary
                                                         virtio-blk
                                                              ^
------->  1 NBD                                               |
   ||     server                                       3 replication
   ||        ^                                                ^
   ||        |           backing                 backing      |
   ||  Secondary disk 6<-------- hidden-disk 5 <-------- active-disk 4
   ||        |                         ^
   ||        '-------------------------'
   ||           drive-backup sync=none 2

Hence, we need these interfaces to implement coarse-grained serialization between
COW of Secondary disk and the read operation of replication.

Example codes about how to use them:

*#include "block/block_backup.h"

static coroutine_fn int xxx_co_readv()
{
        CowRequest req;
        BlockJob *job = secondary_disk->bs->job;

        if (job) {
              backup_wait_for_overlapping_requests(job, start, end);
              backup_cow_request_begin(&req, job, start, end);
              ret = bdrv_co_readv();
              backup_cow_request_end(&req);
              goto out;
        }
        ret = bdrv_co_readv();
out:
        return ret;
}

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
---
 block/backup.c               | 41 ++++++++++++++++++++++++++++++++++-------
 include/block/block_backup.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index baf3936..b8e1c44 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -28,13 +28,6 @@
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 #define SLICE_TIME 100000000ULL /* ns */
 
-typedef struct CowRequest {
-    int64_t start;
-    int64_t end;
-    QLIST_ENTRY(CowRequest) list;
-    CoQueue wait_queue; /* coroutines blocked on this request */
-} CowRequest;
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockBackend *target;
@@ -264,6 +257,40 @@ void backup_do_checkpoint(BlockJob *job, Error **errp)
     bitmap_zero(backup_job->done_bitmap, len);
 }
 
+void backup_wait_for_overlapping_requests(BlockJob *job, int64_t sector_num,
+                                          int nb_sectors)
+{
+    BackupBlockJob *backup_job = container_of(job, BackupBlockJob, common);
+    int64_t sectors_per_cluster = cluster_size_sectors(backup_job);
+    int64_t start, end;
+
+    assert(job->driver->job_type == BLOCK_JOB_TYPE_BACKUP);
+
+    start = sector_num / sectors_per_cluster;
+    end = DIV_ROUND_UP(sector_num + nb_sectors, sectors_per_cluster);
+    wait_for_overlapping_requests(backup_job, start, end);
+}
+
+void backup_cow_request_begin(CowRequest *req, BlockJob *job,
+                              int64_t sector_num,
+                              int nb_sectors)
+{
+    BackupBlockJob *backup_job = container_of(job, BackupBlockJob, common);
+    int64_t sectors_per_cluster = cluster_size_sectors(backup_job);
+    int64_t start, end;
+
+    assert(job->driver->job_type == BLOCK_JOB_TYPE_BACKUP);
+
+    start = sector_num / sectors_per_cluster;
+    end = DIV_ROUND_UP(sector_num + nb_sectors, sectors_per_cluster);
+    cow_request_begin(req, backup_job, start, end);
+}
+
+void backup_cow_request_end(CowRequest *req)
+{
+    cow_request_end(req);
+}
+
 static const BlockJobDriver backup_job_driver = {
     .instance_size  = sizeof(BackupBlockJob),
     .job_type       = BLOCK_JOB_TYPE_BACKUP,
diff --git a/include/block/block_backup.h b/include/block/block_backup.h
index 3753bcb..e0e7ce6 100644
--- a/include/block/block_backup.h
+++ b/include/block/block_backup.h
@@ -1,3 +1,17 @@
 #include "block/block_int.h"
 
+typedef struct CowRequest {
+    int64_t start;
+    int64_t end;
+    QLIST_ENTRY(CowRequest) list;
+    CoQueue wait_queue; /* coroutines blocked on this request */
+} CowRequest;
+
+void backup_wait_for_overlapping_requests(BlockJob *job, int64_t sector_num,
+                                          int nb_sectors);
+void backup_cow_request_begin(CowRequest *req, BlockJob *job,
+                              int64_t sector_num,
+                              int nb_sectors);
+void backup_cow_request_end(CowRequest *req);
+
 void backup_do_checkpoint(BlockJob *job, Error **errp);
-- 
1.9.3




