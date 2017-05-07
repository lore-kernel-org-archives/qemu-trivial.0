Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GUn-0004RW-PD
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:20:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUi-0004Kw-2L
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7GUg-000371-Oj
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:20:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7GUc-00035L-Rz; Sun, 07 May 2017 03:20:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3005240483;
	Sun,  7 May 2017 10:20:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 482E43BB;
	Sun,  7 May 2017 10:02:30 +0300 (MSK)
Received: (nullmailer pid 26558 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:13 +0300
Message-Id: <3c76c606dab4d2298a9877628fe28bf9e6d99e22.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/23] block: Make 'replication_state' an enum
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
X-List-Received-Date: Sun, 07 May 2017 07:20:41 -0000

From: Fam Zheng <famz@redhat.com>

BDRVReplicationState.replication_state is a name with a bit of
duplication, plus it could be an enum like BDRVReplicationState.mode,
which is more readable and also more straightforward in a debugger.

Rename it, and improve the type while at it.

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/replication.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index d300c15475..3885f04c31 100644
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
                             NULL, replication_done, bs, true, errp);
-- 
2.11.0


