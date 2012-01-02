Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rhmlb-0003B5-Rp
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:37:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC9-000138-Nm
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC7-0001Ai-Rt
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:13 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:55712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmC3-00019i-I4; Mon, 02 Jan 2012 13:01:07 -0500
Received: by ggnk1 with SMTP id k1so11343750ggn.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=A1/d87kCl9OAGnUf8KfZ6Hv9Ob3XkWPqgsIMrPE8qkI=;
	b=BOVT0AQMfpgRT8r+Uce89y0oYYKIG7Ie5X4jDntPHqCl8+ANCW8RxZ+IWY61uJL3kV
	LodxBBA5MmGUEfsh0CrvyRuZZ59z6O2i80fA8jLT+sCPDfONqNXO6Z5uII+1Hjc65x6/
	FHi8UmsPkG9dsQ7Jcvx1RccLy7CRrmcmA5vcM=
Received: by 10.100.199.10 with SMTP id w10mr20124395anf.29.1325527266547;
	Mon, 02 Jan 2012 10:01:06 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:05 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:32 +0100
Message-Id: <1325527237-24146-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/8] qed: switch to QTAILQ
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
X-List-Received-Date: Mon, 02 Jan 2012 18:37:50 -0000

QED needs to insert at tail.  Use a QTAILQ, even though
the double links are strictly not necessary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qed.c |   20 ++++++++++----------
 block/qed.h |    4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index 8da3ebe..d30323b 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -300,7 +300,7 @@ static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 
     s->allocating_write_reqs_plugged = false;
 
-    acb = QSIMPLEQ_FIRST(&s->allocating_write_reqs);
+    acb = QTAILQ_FIRST(&s->allocating_write_reqs);
     if (acb) {
         qed_aio_next_io(acb, 0);
     }
@@ -339,7 +339,7 @@ static void qed_need_check_timer_cb(void *opaque)
     BDRVQEDState *s = opaque;
 
     /* The timer should only fire when allocating writes have drained */
-    assert(!QSIMPLEQ_FIRST(&s->allocating_write_reqs));
+    assert(!QTAILQ_FIRST(&s->allocating_write_reqs));
 
     trace_qed_need_check_timer_cb(s);
 
@@ -375,7 +375,7 @@ static int bdrv_qed_open(BlockDriverState *bs, int flags)
     int ret;
 
     s->bs = bs;
-    QSIMPLEQ_INIT(&s->allocating_write_reqs);
+    QTAILQ_INIT(&s->allocating_write_reqs);
 
     ret = bdrv_pread(bs->file, 0, &le_header, sizeof(le_header));
     if (ret < 0) {
@@ -886,9 +886,9 @@ static void qed_aio_complete(QEDAIOCB *acb, int ret)
      * next request in the queue.  This ensures that we don't cycle through
      * requests multiple times but rather finish one at a time completely.
      */
-    if (acb == QSIMPLEQ_FIRST(&s->allocating_write_reqs)) {
-        QSIMPLEQ_REMOVE_HEAD(&s->allocating_write_reqs, next);
-        acb = QSIMPLEQ_FIRST(&s->allocating_write_reqs);
+    if (acb == QTAILQ_FIRST(&s->allocating_write_reqs)) {
+        QTAILQ_REMOVE(&s->allocating_write_reqs, acb, next);
+        acb = QTAILQ_FIRST(&s->allocating_write_reqs);
         if (acb) {
             qed_aio_next_io(acb, 0);
         } else if (s->header.features & QED_F_NEED_CHECK) {
@@ -1094,15 +1094,15 @@ static void qed_aio_write_alloc(QEDAIOCB *acb, size_t len)
     BDRVQEDState *s = acb_to_s(acb);
 
     /* Cancel timer when the first allocating request comes in */
-    if (QSIMPLEQ_EMPTY(&s->allocating_write_reqs)) {
+    if (QTAILQ_EMPTY(&s->allocating_write_reqs)) {
         qed_cancel_need_check_timer(s);
     }
 
     /* Freeze this request if another allocating write is in progress */
-    if (acb != QSIMPLEQ_FIRST(&s->allocating_write_reqs)) {
-        QSIMPLEQ_INSERT_TAIL(&s->allocating_write_reqs, acb, next);
+    if (acb != QTAILQ_FIRST(&s->allocating_write_reqs)) {
+        QTAILQ_INSERT_TAIL(&s->allocating_write_reqs, acb, next);
     }
-    if (acb != QSIMPLEQ_FIRST(&s->allocating_write_reqs) ||
+    if (acb != QTAILQ_FIRST(&s->allocating_write_reqs) ||
         s->allocating_write_reqs_plugged) {
         return; /* wait for existing request to finish */
     }
diff --git a/block/qed.h b/block/qed.h
index 62cbd3b..f2be4e1 100644
--- a/block/qed.h
+++ b/block/qed.h
@@ -127,7 +127,7 @@ typedef struct QEDAIOCB {
     BlockDriverAIOCB common;
     QEMUBH *bh;
     int bh_ret;                     /* final return status for completion bh */
-    QSIMPLEQ_ENTRY(QEDAIOCB) next;  /* next request */
+    QTAILQ_ENTRY(QEDAIOCB) next;    /* next request */
     bool is_write;                  /* false - read, true - write */
     bool *finished;                 /* signal for cancel completion */
     uint64_t end_pos;               /* request end on block device, in bytes */
@@ -159,7 +159,7 @@ typedef struct {
     uint32_t l2_mask;
 
     /* Allocating write request queue */
-    QSIMPLEQ_HEAD(, QEDAIOCB) allocating_write_reqs;
+    QTAILQ_HEAD(, QEDAIOCB) allocating_write_reqs;
     bool allocating_write_reqs_plugged;
 
     /* Periodic flush and clear need check flag */
-- 
1.7.7.1



