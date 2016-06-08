Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyR-0001Jw-FJ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyN-0001DU-2r
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyK-0007aW-SC
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:53 -0400
Received: from [59.151.112.132] (port=5480 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy3-0007It-LN; Tue, 07 Jun 2016 21:07:36 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 46A2D41C0B9A;
	Wed,  8 Jun 2016 09:07:24 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:23 +0800
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
Date: Wed, 8 Jun 2016 09:11:28 +0800
Message-ID: <1465348292-26750-7-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 46A2D41C0B9A.A05C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 06/10] auto complete active commit
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:56 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Auto complete mirror job in background to prevent from
blocking synchronously

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 block/mirror.c            | 13 +++++++++----
 blockdev.c                |  2 +-
 include/block/block_int.h |  3 ++-
 qemu-img.c                |  2 +-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 80fd3c7..40fad19 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -805,7 +805,8 @@ static void mirror_start_job(BlockDriverState *bs, BlockDriverState *target,
                              BlockCompletionFunc *cb,
                              void *opaque, Error **errp,
                              const BlockJobDriver *driver,
-                             bool is_none_mode, BlockDriverState *base)
+                             bool is_none_mode, BlockDriverState *base,
+                             bool auto_complete)
 {
     MirrorBlockJob *s;
 
@@ -840,6 +841,9 @@ static void mirror_start_job(BlockDriverState *bs, BlockDriverState *target,
     s->granularity = granularity;
     s->buf_size = ROUND_UP(buf_size, granularity);
     s->unmap = unmap;
+    if (auto_complete) {
+        s->should_complete = true;
+    }
 
     s->dirty_bitmap = bdrv_create_dirty_bitmap(bs, granularity, NULL, errp);
     if (!s->dirty_bitmap) {
@@ -877,14 +881,15 @@ void mirror_start(BlockDriverState *bs, BlockDriverState *target,
     mirror_start_job(bs, target, replaces,
                      speed, granularity, buf_size,
                      on_source_error, on_target_error, unmap, cb, opaque, errp,
-                     &mirror_job_driver, is_none_mode, base);
+                     &mirror_job_driver, is_none_mode, base, false);
 }
 
 void commit_active_start(BlockDriverState *bs, BlockDriverState *base,
                          int64_t speed,
                          BlockdevOnError on_error,
                          BlockCompletionFunc *cb,
-                         void *opaque, Error **errp)
+                         void *opaque, Error **errp,
+                         bool auto_complete)
 {
     int64_t length, base_length;
     int orig_base_flags;
@@ -924,7 +929,7 @@ void commit_active_start(BlockDriverState *bs, BlockDriverState *base,
 
     mirror_start_job(bs, base, NULL, speed, 0, 0,
                      on_error, on_error, false, cb, opaque, &local_err,
-                     &commit_active_job_driver, false, base);
+                     &commit_active_job_driver, false, base, auto_complete);
     if (local_err) {
         error_propagate(errp, local_err);
         goto error_restore_flags;
diff --git a/blockdev.c b/blockdev.c
index 717785e..734bfb0 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3155,7 +3155,7 @@ void qmp_block_commit(const char *device,
             goto out;
         }
         commit_active_start(bs, base_bs, speed, on_error, block_job_cb,
-                            bs, &local_err);
+                            bs, &local_err, false);
     } else {
         commit_start(bs, base_bs, top_bs, speed, on_error, block_job_cb, bs,
                      has_backing_file ? backing_file : NULL, &local_err);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 30a9717..89b66e8 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -653,13 +653,14 @@ void commit_start(BlockDriverState *bs, BlockDriverState *base,
  * @cb: Completion function for the job.
  * @opaque: Opaque pointer value passed to @cb.
  * @errp: Error object.
+ * @auto_complete: Auto complete the job.
  *
  */
 void commit_active_start(BlockDriverState *bs, BlockDriverState *base,
                          int64_t speed,
                          BlockdevOnError on_error,
                          BlockCompletionFunc *cb,
-                         void *opaque, Error **errp);
+                         void *opaque, Error **errp, bool auto_complete);
 /*
  * mirror_start:
  * @bs: Block device to operate on.
diff --git a/qemu-img.c b/qemu-img.c
index 4b56ad3..e6a480f 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -911,7 +911,7 @@ static int img_commit(int argc, char **argv)
     };
 
     commit_active_start(bs, base_bs, 0, BLOCKDEV_ON_ERROR_REPORT,
-                        common_block_job_cb, &cbi, &local_err);
+                        common_block_job_cb, &cbi, &local_err, false);
     if (local_err) {
         goto done;
     }
-- 
1.9.3




