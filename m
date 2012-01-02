Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhnEB-0001WH-Qx
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 14:07:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCE-00014q-TN
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCC-0001Bo-Lj
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:18 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmC9-00018K-Lv; Mon, 02 Jan 2012 13:01:13 -0500
Received: by mail-yw0-f45.google.com with SMTP id g71so10819143yhg.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CY1Vp9N3jpjvVkJIzsZ8wej45zmllQGlf2Xh4H+rzFw=;
	b=SZIz/jqxfsT3KY38UcO+xVjMGCvuoXzRh2LEH53CS4lCxGR9IckmBVU/LFdcttEmXg
	fHwIyu1ZT1XW+VLN1TadxzlmNUqXcFkfMn04Saqa99spLRATSgCRQrAg8NHVRxoUJMnq
	3J6y/Edy3qBJtMMINvi6fHMO/IkeCmFNqvobg=
Received: by 10.236.82.74 with SMTP id n50mr34491637yhe.117.1325527273200;
	Mon, 02 Jan 2012 10:01:13 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:12 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:35 +0100
Message-Id: <1325527237-24146-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 6/8] qemu-queue: drop QCIRCLEQ
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
X-List-Received-Date: Mon, 02 Jan 2012 19:07:22 -0000

The main advantage of circular lists (the fact that the head node
has the same memory layout as any other node, so you do not need
conditionals) is completely negated by the implementation in qemu-queue.h.
Not surprisingly, nobody uses QCIRCLEQ.  While this might change if RCU
is ever adopted by QEMU, the QLIST is also RCU-friendly and in fact it
is used in a RCU-like manner by 9pfs already.  So, just kill QCIRCLEQ.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-queue.h |  118 +---------------------------------------------------------
 1 files changed, 1 insertions(+), 117 deletions(-)

diff --git a/qemu-queue.h b/qemu-queue.h
index 5f5b63a..5b82a6d 100644
--- a/qemu-queue.h
+++ b/qemu-queue.h
@@ -42,7 +42,7 @@
 
 /*
  * This file defines four types of data structures:
- * lists, simple queues, tail queues, and circular queues.
+ * lists, simple queues, tail queues.
  *
  * A list is headed by a single forward pointer (or an array of forward
  * pointers for a hash table header). The elements are doubly linked
@@ -64,14 +64,6 @@
  * after an existing element, at the head of the list, or at the end of
  * the list. A tail queue may be traversed in either direction.
  *
- * A circle queue is headed by a pair of pointers, one to the head of the
- * list and the other to the tail of the list. The elements are doubly
- * linked so that an arbitrary element can be removed without a need to
- * traverse the list. New elements can be added to the list before or after
- * an existing element, at the head of the list, or at the end of the list.
- * A circle queue may be traversed in either direction, but has a more
- * complex end of list detection.
- *
  * For details on the use of these macros, see the queue(3) manual page.
  */
 
@@ -312,112 +304,4 @@ struct {                                                                \
 #define QTAILQ_PREV(elm, headname, field) \
         (*(((struct headname *)((elm)->field.tqe_prev))->tqh_last))
 
-
-/*
- * Circular queue definitions.
- */
-#define QCIRCLEQ_HEAD(name, type)                                       \
-struct name {                                                           \
-        struct type *cqh_first;         /* first element */             \
-        struct type *cqh_last;          /* last element */              \
-}
-
-#define QCIRCLEQ_HEAD_INITIALIZER(head)                                 \
-        { (void *)&head, (void *)&head }
-
-#define QCIRCLEQ_ENTRY(type)                                            \
-struct {                                                                \
-        struct type *cqe_next;          /* next element */              \
-        struct type *cqe_prev;          /* previous element */          \
-}
-
-/*
- * Circular queue functions.
- */
-#define QCIRCLEQ_INIT(head) do {                                        \
-        (head)->cqh_first = (void *)(head);                             \
-        (head)->cqh_last = (void *)(head);                              \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_INSERT_AFTER(head, listelm, elm, field) do {           \
-        (elm)->field.cqe_next = (listelm)->field.cqe_next;              \
-        (elm)->field.cqe_prev = (listelm);                              \
-        if ((listelm)->field.cqe_next == (void *)(head))                \
-                (head)->cqh_last = (elm);                               \
-        else                                                            \
-                (listelm)->field.cqe_next->field.cqe_prev = (elm);      \
-        (listelm)->field.cqe_next = (elm);                              \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_INSERT_BEFORE(head, listelm, elm, field) do {          \
-        (elm)->field.cqe_next = (listelm);                              \
-        (elm)->field.cqe_prev = (listelm)->field.cqe_prev;              \
-        if ((listelm)->field.cqe_prev == (void *)(head))                \
-                (head)->cqh_first = (elm);                              \
-        else                                                            \
-                (listelm)->field.cqe_prev->field.cqe_next = (elm);      \
-        (listelm)->field.cqe_prev = (elm);                              \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_INSERT_HEAD(head, elm, field) do {                     \
-        (elm)->field.cqe_next = (head)->cqh_first;                      \
-        (elm)->field.cqe_prev = (void *)(head);                         \
-        if ((head)->cqh_last == (void *)(head))                         \
-                (head)->cqh_last = (elm);                               \
-        else                                                            \
-                (head)->cqh_first->field.cqe_prev = (elm);              \
-        (head)->cqh_first = (elm);                                      \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_INSERT_TAIL(head, elm, field) do {                     \
-        (elm)->field.cqe_next = (void *)(head);                         \
-        (elm)->field.cqe_prev = (head)->cqh_last;                       \
-        if ((head)->cqh_first == (void *)(head))                        \
-                (head)->cqh_first = (elm);                              \
-        else                                                            \
-                (head)->cqh_last->field.cqe_next = (elm);               \
-        (head)->cqh_last = (elm);                                       \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_REMOVE(head, elm, field) do {                          \
-        if ((elm)->field.cqe_next == (void *)(head))                    \
-                (head)->cqh_last = (elm)->field.cqe_prev;               \
-        else                                                            \
-                (elm)->field.cqe_next->field.cqe_prev =                 \
-                    (elm)->field.cqe_prev;                              \
-        if ((elm)->field.cqe_prev == (void *)(head))                    \
-                (head)->cqh_first = (elm)->field.cqe_next;              \
-        else                                                            \
-                (elm)->field.cqe_prev->field.cqe_next =                 \
-                    (elm)->field.cqe_next;                              \
-} while (/*CONSTCOND*/0)
-
-#define QCIRCLEQ_FOREACH(var, head, field)                              \
-        for ((var) = ((head)->cqh_first);                               \
-                (var) != (const void *)(head);                          \
-                (var) = ((var)->field.cqe_next))
-
-#define QCIRCLEQ_FOREACH_REVERSE(var, head, field)                      \
-        for ((var) = ((head)->cqh_last);                                \
-                (var) != (const void *)(head);                          \
-                (var) = ((var)->field.cqe_prev))
-
-/*
- * Circular queue access methods.
- */
-#define QCIRCLEQ_EMPTY(head)             ((head)->cqh_first == (void *)(head))
-#define QCIRCLEQ_FIRST(head)             ((head)->cqh_first)
-#define QCIRCLEQ_LAST(head)              ((head)->cqh_last)
-#define QCIRCLEQ_NEXT(elm, field)        ((elm)->field.cqe_next)
-#define QCIRCLEQ_PREV(elm, field)        ((elm)->field.cqe_prev)
-
-#define QCIRCLEQ_LOOP_NEXT(head, elm, field)                            \
-        (((elm)->field.cqe_next == (void *)(head))                      \
-            ? ((head)->cqh_first)                                       \
-            : (elm->field.cqe_next))
-#define QCIRCLEQ_LOOP_PREV(head, elm, field)                            \
-        (((elm)->field.cqe_prev == (void *)(head))                      \
-            ? ((head)->cqh_last)                                        \
-            : (elm->field.cqe_prev))
-
 #endif  /* !QEMU_SYS_QUEUE_H_ */
-- 
1.7.7.1



