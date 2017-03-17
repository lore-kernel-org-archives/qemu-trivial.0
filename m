Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cohSj-0004W2-Ow
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2017 22:17:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cohSh-0004Uh-Bq
	for qemu-trivial@nongnu.org; Thu, 16 Mar 2017 22:17:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cohSf-0004QN-VC
	for qemu-trivial@nongnu.org; Thu, 16 Mar 2017 22:17:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cohSa-0004O9-R1; Thu, 16 Mar 2017 22:17:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2EDE81247;
	Fri, 17 Mar 2017 02:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B2EDE81247
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B2EDE81247
Received: from lemon.redhat.com (ovpn-8-19.pek2.redhat.com [10.72.8.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E82635DD62;
	Fri, 17 Mar 2017 02:17:42 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 17 Mar 2017 10:17:39 +0800
Message-Id: <20170317021739.16877-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 17 Mar 2017 02:17:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block: Make 'replication_state' an enum
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
X-List-Received-Date: Fri, 17 Mar 2017 02:17:52 -0000

BDRVReplicationState.replication_state is a name with a bit of
duplication, plus it could be an enum like BDRVReplicationState.mode,
which is be more readable and also more straightforward in a debuuger.

Rename it, and improve the type while at it.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block/replication.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index bf3c395..a5475f7 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -22,9 +22,17 @@
 #include "qapi/error.h"
 #include "replication.h"
 
+typedef enum {
+    BLOCK_REPLICATION_NONE,             /* block replication is not started */
+    BLOCK_REPLICATION_RUNNING,          /* block replication is running */
+    BLOCK_REPLICATION_FAILOVER,         /* failover is running in background */
+    BLOCK_REPLICATION_FAILOVER_FAILED,  /* failover failed */
+    BLOCK_REPLICATION_DONE,             /* block replication is done */
+} ReplicationStage;
+
 typedef struct BDRVReplicationState {
     ReplicationMode mode;
-    int replication_state;
+    ReplicationStage stage;
     BdrvChild *active_disk;
     BdrvChild *hidden_disk;
     BdrvChild *secondary_disk;
@@ -36,14 +44,6 @@ typedef struct BDRVReplicationState {
     int error;
 } BDRVReplicationState;
 
-enum {
-    BLOCK_REPLICATION_NONE,             /* block replication is not started */
-    BLOCK_REPLICATION_RUNNING,          /* block replication is running */
-    BLOCK_REPLICATION_FAILOVER,         /* failover is running in background */
-    BLOCK_REPLICATION_FAILOVER_FAILED,  /* failover failed */
-    BLOCK_REPLICATION_DONE,             /* block replication is done */
-};
-
 static void replication_start(ReplicationState *rs, ReplicationMode mode,
                               Error **errp);
 static void replication_do_checkpoint(ReplicationState *rs, Error **errp);
@@ -141,10 +141,10 @@ static void replication_close(BlockDriverState *bs)
 {
     BDRVReplicationState *s = bs->opaque;
 
-    if (s->replication_state == BLOCK_REPLICATION_RUNNING) {
+    if (s->stage == BLOCK_REPLICATION_RUNNING) {
         replication_stop(s->rs, false, NULL);
     }
-    if (s->replication_state == BLOCK_REPLICATION_FAILOVER) {
+    if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         block_job_cancel_sync(s->active_disk->bs->job);
     }
 
@@ -174,7 +174,7 @@ static int64_t replication_getlength(BlockDriverState *bs)
 
 static int replication_get_io_status(BDRVReplicationState *s)
 {
-    switch (s->replication_state) {
+    switch (s->stage) {
     case BLOCK_REPLICATION_NONE:
         return -EIO;
     case BLOCK_REPLICATION_RUNNING:
@@ -403,7 +403,7 @@ static void backup_job_completed(void *opaque, int ret)
     BlockDriverState *bs = opaque;
     BDRVReplicationState *s = bs->opaque;
 
-    if (s->replication_state != BLOCK_REPLICATION_FAILOVER) {
+    if (s->stage != BLOCK_REPLICATION_FAILOVER) {
         /* The backup job is cancelled unexpectedly */
         s->error = -EIO;
     }
@@ -445,7 +445,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     aio_context_acquire(aio_context);
     s = bs->opaque;
 
-    if (s->replication_state != BLOCK_REPLICATION_NONE) {
+    if (s->stage != BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is running or done");
         aio_context_release(aio_context);
         return;
@@ -545,7 +545,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         abort();
     }
 
-    s->replication_state = BLOCK_REPLICATION_RUNNING;
+    s->stage = BLOCK_REPLICATION_RUNNING;
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
         secondary_do_checkpoint(s, errp);
@@ -581,7 +581,7 @@ static void replication_get_error(ReplicationState *rs, Error **errp)
     aio_context_acquire(aio_context);
     s = bs->opaque;
 
-    if (s->replication_state != BLOCK_REPLICATION_RUNNING) {
+    if (s->stage != BLOCK_REPLICATION_RUNNING) {
         error_setg(errp, "Block replication is not running");
         aio_context_release(aio_context);
         return;
@@ -601,7 +601,7 @@ static void replication_done(void *opaque, int ret)
     BDRVReplicationState *s = bs->opaque;
 
     if (ret == 0) {
-        s->replication_state = BLOCK_REPLICATION_DONE;
+        s->stage = BLOCK_REPLICATION_DONE;
 
         /* refresh top bs's filename */
         bdrv_refresh_filename(bs);
@@ -610,7 +610,7 @@ static void replication_done(void *opaque, int ret)
         s->hidden_disk = NULL;
         s->error = 0;
     } else {
-        s->replication_state = BLOCK_REPLICATION_FAILOVER_FAILED;
+        s->stage = BLOCK_REPLICATION_FAILOVER_FAILED;
         s->error = -EIO;
     }
 }
@@ -625,7 +625,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
     aio_context_acquire(aio_context);
     s = bs->opaque;
 
-    if (s->replication_state != BLOCK_REPLICATION_RUNNING) {
+    if (s->stage != BLOCK_REPLICATION_RUNNING) {
         error_setg(errp, "Block replication is not running");
         aio_context_release(aio_context);
         return;
@@ -633,7 +633,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
 
     switch (s->mode) {
     case REPLICATION_MODE_PRIMARY:
-        s->replication_state = BLOCK_REPLICATION_DONE;
+        s->stage = BLOCK_REPLICATION_DONE;
         s->error = 0;
         break;
     case REPLICATION_MODE_SECONDARY:
@@ -648,12 +648,12 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
 
         if (!failover) {
             secondary_do_checkpoint(s, errp);
-            s->replication_state = BLOCK_REPLICATION_DONE;
+            s->stage = BLOCK_REPLICATION_DONE;
             aio_context_release(aio_context);
             return;
         }
 
-        s->replication_state = BLOCK_REPLICATION_FAILOVER;
+        s->stage = BLOCK_REPLICATION_FAILOVER;
         commit_active_start(NULL, s->active_disk->bs, s->secondary_disk->bs,
                             BLOCK_JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
                             NULL, replication_done, bs, errp, true);
-- 
2.9.3


