Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rhmky-000341-OO
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:37:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCJ-00015m-Vd
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCI-0001Ce-KI
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:23 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:55712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmCE-00019i-Ur; Mon, 02 Jan 2012 13:01:19 -0500
Received: by mail-gx0-f173.google.com with SMTP id k1so11343750ggn.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UsD8R6LAD1Bz6IU7OsB4YdZ5KJpyOPO+0g+LwvZI1m8=;
	b=hKgREmFCowKVcjaxJDYbxD5JuFNBH2MVEh1U0aiMcLzp+6hR0eDucdi6uq0MRKmc3E
	ZPdoOI5vglmIiU1Dh87gKxHn7dO05zMfgEOnNPufVgepvkobTmxmw34bLsRzf2Oc2pBH
	0iuVq/jWab5Pn7ZBQNvJAkTjzZF5DD7DMZgo8=
Received: by 10.236.128.138 with SMTP id f10mr65118808yhi.2.1325527278551;
	Mon, 02 Jan 2012 10:01:18 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:17 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:37 +0100
Message-Id: <1325527237-24146-9-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 8/8] block: use QSIMPLEQ for the AIO free list
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
X-List-Received-Date: Mon, 02 Jan 2012 18:37:11 -0000

QSIMPLEQ is equivalent to an open-coded free list, use it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c     |    9 ++++-----
 block_int.h |    4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 3f072f6..10e80d7 100644
--- a/block.c
+++ b/block.c
@@ -3242,9 +3242,9 @@ void *qemu_aio_get(AIOPool *pool, BlockDriverState *bs,
 {
     BlockDriverAIOCB *acb;
 
-    if (pool->free_aiocb) {
-        acb = pool->free_aiocb;
-        pool->free_aiocb = acb->next;
+    if (!QSIMPLEQ_EMPTY(pool->free_aiocb)) {
+        acb = QSIMPLEQ_FIRST(pool->free_aiocb);
+        QSIMPLEQ_REMOVE_HEAD(pool->free_aiocb, next);
     } else {
         acb = g_malloc0(pool->aiocb_size);
         acb->pool = pool;
@@ -3259,8 +3259,7 @@ void qemu_aio_release(void *p)
 {
     BlockDriverAIOCB *acb = (BlockDriverAIOCB *)p;
     AIOPool *pool = acb->pool;
-    acb->next = pool->free_aiocb;
-    pool->free_aiocb = acb;
+    QSIMPLEQ_INSERT_HEAD(pool->free_aiocb, acb, next);
 }
 
 /**************************************************************/
diff --git a/block_int.h b/block_int.h
index 311bd2a..43b2d45 100644
--- a/block_int.h
+++ b/block_int.h
@@ -56,7 +56,7 @@ typedef struct BdrvTrackedRequest BdrvTrackedRequest;
 typedef struct AIOPool {
     void (*cancel)(BlockDriverAIOCB *acb);
     int aiocb_size;
-    BlockDriverAIOCB *free_aiocb;
+    QSIMPLEQ_HEAD(, BlockDriverAIOCB) *free_aiocb;
 } AIOPool;
 
 typedef struct BlockIOLimit {
@@ -268,7 +268,7 @@ struct BlockDriverAIOCB {
     BlockDriverState *bs;
     BlockDriverCompletionFunc *cb;
     void *opaque;
-    BlockDriverAIOCB *next;
+    QSIMPLEQ_ENTRY(BlockDriverAIOCB) next;
 };
 
 void get_tmp_filename(char *filename, int size);
-- 
1.7.7.1


