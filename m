Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhmeA-0001Oc-Ua
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:30:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCD-00014j-JY
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCB-0001Bc-WD
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:17 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:55712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmC7-00019i-ES; Mon, 02 Jan 2012 13:01:11 -0500
Received: by mail-gx0-f173.google.com with SMTP id k1so11343750ggn.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JuzlXjuvP+zgDiTHO7xOYQGzKuaWQZYX/47EOGS0mog=;
	b=oEmPx7oovy/Vc8DKJPDjuhHMfn9W9ZcVUid4EGhWrrUifpTNyQiBUFjrHQCW3SDFBf
	FoovWt/AF23D8AeoyRcfUh+CM/kV3h1ucroovL8qT92q4lO4VK7bGcuzoda9Yip0tY8d
	PAwCjQAYfjSQVmL/B47WC/FltR2CFXrVy0fcg=
Received: by 10.100.206.2 with SMTP id d2mr14113991ang.3.1325527270949;
	Mon, 02 Jan 2012 10:01:10 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:10 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:34 +0100
Message-Id: <1325527237-24146-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 5/8] qemu-queue: really simplify QSIMPLEQ
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
X-List-Received-Date: Mon, 02 Jan 2012 18:30:08 -0000

QSIMPLEQ is still relatively heavyweight when used as a free list,
compared to a simple singly-linked list.  One disadvantage is that
it requires an initializer macro, unlike for example QLIST.

The patch removes the double links so that there is a "really really
simple" queue type.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-queue.h |   57 +++++++++------------------------------------------------
 1 files changed, 9 insertions(+), 48 deletions(-)

diff --git a/qemu-queue.h b/qemu-queue.h
index 2214230..5f5b63a 100644
--- a/qemu-queue.h
+++ b/qemu-queue.h
@@ -51,12 +51,11 @@
  * or after an existing element or at the head of the list. A list
  * may only be traversed in the forward direction.
  *
- * A simple queue is headed by a pair of pointers, one the head of the
- * list and the other to the tail of the list. The elements are singly
- * linked to save space, so elements can only be removed from the
- * head of the list. New elements can be added to the list after
- * an existing element, at the head of the list, or at the end of the
- * list. A simple queue may only be traversed in the forward direction.
+ * A simple queue is headed by a single forward pointer, and the elements
+ * are also singly linked to save space.  Elements can only be removed
+ * from the head of the list. New elements can be added to the list after
+ * an existing element or at the head of the list.   A simple queue may
+ * only be traversed in the forward direction.
  *
  * A tail queue is headed by a pair of pointers, one to the head of the
  * list and the other to the tail of the list. The elements are doubly
@@ -166,11 +165,10 @@ struct {                                                                \
 #define QSIMPLEQ_HEAD(name, type)                                       \
 struct name {                                                           \
     struct type *sqh_first;    /* first element */                      \
-    struct type **sqh_last;    /* addr of last next element */          \
 }
 
 #define QSIMPLEQ_HEAD_INITIALIZER(head)                                 \
-    { NULL, &(head).sqh_first }
+    { NULL }
 
 #define QSIMPLEQ_ENTRY(type)                                            \
 struct {                                                                \
@@ -182,43 +180,20 @@ struct {                                                                \
  */
 #define QSIMPLEQ_INIT(head) do {                                        \
     (head)->sqh_first = NULL;                                           \
-    (head)->sqh_last = &(head)->sqh_first;                              \
 } while (/*CONSTCOND*/0)
 
 #define QSIMPLEQ_INSERT_HEAD(head, elm, field) do {                     \
-    if (((elm)->field.sqe_next = (head)->sqh_first) == NULL)            \
-        (head)->sqh_last = &(elm)->field.sqe_next;                      \
+    (elm)->field.sqe_next = (head)->sqh_first;                          \
     (head)->sqh_first = (elm);                                          \
 } while (/*CONSTCOND*/0)
 
-#define QSIMPLEQ_INSERT_TAIL(head, elm, field) do {                     \
-    (elm)->field.sqe_next = NULL;                                       \
-    *(head)->sqh_last = (elm);                                          \
-    (head)->sqh_last = &(elm)->field.sqe_next;                          \
-} while (/*CONSTCOND*/0)
-
 #define QSIMPLEQ_INSERT_AFTER(head, listelm, elm, field) do {           \
-    if (((elm)->field.sqe_next = (listelm)->field.sqe_next) == NULL)    \
-        (head)->sqh_last = &(elm)->field.sqe_next;                      \
+    (elm)->field.sqe_next = (listelm)->field.sqe_next;                  \
     (listelm)->field.sqe_next = (elm);                                  \
 } while (/*CONSTCOND*/0)
 
 #define QSIMPLEQ_REMOVE_HEAD(head, field) do {                          \
-    if (((head)->sqh_first = (head)->sqh_first->field.sqe_next) == NULL)\
-        (head)->sqh_last = &(head)->sqh_first;                          \
-} while (/*CONSTCOND*/0)
-
-#define QSIMPLEQ_REMOVE(head, elm, type, field) do {                    \
-    if ((head)->sqh_first == (elm)) {                                   \
-        QSIMPLEQ_REMOVE_HEAD((head), field);                            \
-    } else {                                                            \
-        struct type *curelm = (head)->sqh_first;                        \
-        while (curelm->field.sqe_next != (elm))                         \
-            curelm = curelm->field.sqe_next;                            \
-        if ((curelm->field.sqe_next =                                   \
-            curelm->field.sqe_next->field.sqe_next) == NULL)            \
-                (head)->sqh_last = &(curelm)->field.sqe_next;           \
-    }                                                                   \
+     (head)->sqh_first = (head)->sqh_first->field.sqe_next;             \
 } while (/*CONSTCOND*/0)
 
 #define QSIMPLEQ_FOREACH(var, head, field)                              \
@@ -231,20 +206,6 @@ struct {                                                                \
         (var) && ((next = ((var)->field.sqe_next)), 1);                 \
         (var) = (next))
 
-#define QSIMPLEQ_CONCAT(head1, head2) do {                              \
-    if (!QSIMPLEQ_EMPTY((head2))) {                                     \
-        *(head1)->sqh_last = (head2)->sqh_first;                        \
-        (head1)->sqh_last = (head2)->sqh_last;                          \
-        QSIMPLEQ_INIT((head2));                                         \
-    }                                                                   \
-} while (/*CONSTCOND*/0)
-
-#define QSIMPLEQ_LAST(head, type, field)                                \
-    (QSIMPLEQ_EMPTY((head)) ?                                           \
-        NULL :                                                          \
-            ((struct type *)(void *)                                    \
-        ((char *)((head)->sqh_last) - offsetof(struct type, field))))
-
 /*
  * Simple queue access methods.
  */
-- 
1.7.7.1



