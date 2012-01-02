Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhnFe-00028U-21
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 14:08:54 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCG-000159-91
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCF-0001CC-5E
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:20 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:35157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmCC-00018o-2D; Mon, 02 Jan 2012 13:01:16 -0500
Received: by mail-yx0-f173.google.com with SMTP id m6so10102477yen.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PXLf/WUiSjrntlaDwj5GDHEyWZ2yHaFucDoLoe2tSko=;
	b=NaGPwxtLpenFx+vFA2UEQZaS5Q10CKq0beHLPVuKG727o5nIrDGXOn29ijR6lR96E6
	mnSIQSd/h86RNQ8F+9etvR73OOUzr/tvcJ7/hJF3/qxF7K5hhS7i7R1qoU1gL64BGu8L
	NB7zB3QkKlOWelh4+QPhRKTq3ddJ6L6Y8Xb8g=
Received: by 10.236.141.37 with SMTP id f25mr5562375yhj.3.1325527275827;
	Mon, 02 Jan 2012 10:01:15 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:14 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:36 +0100
Message-Id: <1325527237-24146-8-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 7/8] coroutine: switch to QSIMPLEQ
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
X-List-Received-Date: Mon, 02 Jan 2012 19:08:53 -0000

QSIMPLEQ is now the best candidate for a free list, use it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 coroutine-ucontext.c |   10 +++++-----
 qemu-coroutine-int.h |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/coroutine-ucontext.c b/coroutine-ucontext.c
index 3d01075..65b0bb7 100644
--- a/coroutine-ucontext.c
+++ b/coroutine-ucontext.c
@@ -36,7 +36,7 @@ enum {
 };
 
 /** Free list to speed up creation */
-static QLIST_HEAD(, Coroutine) pool = QLIST_HEAD_INITIALIZER(pool);
+static QSIMPLEQ_HEAD(, Coroutine) pool = QSIMPLEQ_HEAD_INITIALIZER(pool);
 static unsigned int pool_size;
 
 typedef struct {
@@ -92,7 +92,7 @@ static void __attribute__((destructor)) coroutine_cleanup(void)
     Coroutine *co;
     Coroutine *tmp;
 
-    QLIST_FOREACH_SAFE(co, &pool, pool_next, tmp) {
+    QSIMPLEQ_FOREACH_SAFE(co, &pool, pool_next, tmp) {
         g_free(DO_UPCAST(CoroutineUContext, base, co)->stack);
         g_free(co);
     }
@@ -175,9 +175,9 @@ Coroutine *qemu_coroutine_new(void)
 {
     Coroutine *co;
 
-    co = QLIST_FIRST(&pool);
+    co = QSIMPLEQ_FIRST(&pool);
     if (co) {
-        QLIST_REMOVE(co, pool_next);
+        QSIMPLEQ_REMOVE_HEAD(&pool, pool_next);
         pool_size--;
     } else {
         co = coroutine_new();
@@ -190,7 +190,7 @@ void qemu_coroutine_delete(Coroutine *co_)
     CoroutineUContext *co = DO_UPCAST(CoroutineUContext, base, co_);
 
     if (pool_size < POOL_MAX_SIZE) {
-        QLIST_INSERT_HEAD(&pool, &co->base, pool_next);
+        QSIMPLEQ_INSERT_HEAD(&pool, &co->base, pool_next);
         co->base.caller = NULL;
         pool_size++;
         return;
diff --git a/qemu-coroutine-int.h b/qemu-coroutine-int.h
index d495615..72b3f3a 100644
--- a/qemu-coroutine-int.h
+++ b/qemu-coroutine-int.h
@@ -37,7 +37,7 @@ struct Coroutine {
     CoroutineEntry *entry;
     void *entry_arg;
     Coroutine *caller;
-    QLIST_ENTRY(Coroutine) pool_next;
+    QSIMPLEQ_ENTRY(Coroutine) pool_next;
     QTAILQ_ENTRY(Coroutine) co_queue_next;
 };
 
-- 
1.7.7.1



