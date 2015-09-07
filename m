Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYtY9-00058v-D2
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 06:21:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYtY5-00051w-J5
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 06:21:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYtY1-0001uD-KJ
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 06:21:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZYtXw-0001qi-4t; Mon, 07 Sep 2015 06:21:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 8AA2CC0B9872;
	Mon,  7 Sep 2015 10:21:07 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-56.ams2.redhat.com
	[10.36.112.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t87AL5GV017947; Mon, 7 Sep 2015 06:21:05 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Sep 2015 12:21:04 +0200
Message-Id: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2] add macro file for coccinelle
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
X-List-Received-Date: Mon, 07 Sep 2015 10:21:18 -0000

Coccinelle chokes on some idioms from compiler.h and queue.h.
Extract those in a macro file, to be used with "--macro-file
scripts/cocci-macro-file.h".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/cocci-macro-file.h | 119 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 scripts/cocci-macro-file.h

diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
new file mode 100644
index 0000000..eceb4be
--- /dev/null
+++ b/scripts/cocci-macro-file.h
@@ -0,0 +1,119 @@
+/* Macro file for Coccinelle
+ *
+ * Copyright (C) 2015 Red Hat, Inc.
+ *
+ * Authors:
+ *  Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or, at your
+ * option, any later version.  See the COPYING file in the top-level directory.
+ */
+
+/* Coccinelle only does limited parsing of headers, and chokes on some idioms
+ * defined in compiler.h and queue.h.  Macros that Coccinelle must know about
+ * in order to parse .c files must be in a separate macro file---which is
+ * exactly what you're staring at now.
+ *
+ * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
+ * Coccinelle command line.
+ */
+
+/* From qemu/compiler.h */
+#define QEMU_GNUC_PREREQ(maj, min) 1
+#define QEMU_NORETURN __attribute__ ((__noreturn__))
+#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
+#define QEMU_SENTINEL __attribute__((sentinel))
+#define QEMU_ARTIFICIAL __attribute__((always_inline, artificial))
+#define QEMU_PACKED __attribute__((gcc_struct, packed))
+
+#define cat(x,y) x ## y
+#define cat2(x,y) cat(x,y)
+#define QEMU_BUILD_BUG_ON(x) \
+    typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1] __attribute__((unused));
+
+#define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+
+#define xglue(x, y) x ## y
+#define glue(x, y) xglue(x, y)
+#define stringify(s)	tostring(s)
+#define tostring(s)	#s
+
+#define typeof_field(type, field) typeof(((type *)0)->field)
+#define type_check(t1,t2) ((t1*)0 - (t2*)0)
+
+/* From qemu/queue.h */
+
+#define QLIST_HEAD(name, type)                                          \
+struct name {                                                           \
+        struct type *lh_first;  /* first element */                     \
+}
+
+#define QLIST_HEAD_INITIALIZER(head)                                    \
+        { NULL }
+
+#define QLIST_ENTRY(type)                                               \
+struct {                                                                \
+        struct type *le_next;   /* next element */                      \
+        struct type **le_prev;  /* address of previous next element */  \
+}
+
+/*
+ * Singly-linked List definitions.
+ */
+#define QSLIST_HEAD(name, type)                                          \
+struct name {                                                           \
+        struct type *slh_first; /* first element */                     \
+}
+
+#define QSLIST_HEAD_INITIALIZER(head)                                    \
+        { NULL }
+
+#define QSLIST_ENTRY(type)                                               \
+struct {                                                                \
+        struct type *sle_next;  /* next element */                      \
+}
+
+/*
+ * Simple queue definitions.
+ */
+#define QSIMPLEQ_HEAD(name, type)                                       \
+struct name {                                                           \
+    struct type *sqh_first;    /* first element */                      \
+    struct type **sqh_last;    /* addr of last next element */          \
+}
+
+#define QSIMPLEQ_HEAD_INITIALIZER(head)                                 \
+    { NULL, &(head).sqh_first }
+
+#define QSIMPLEQ_ENTRY(type)                                            \
+struct {                                                                \
+    struct type *sqe_next;    /* next element */                        \
+}
+
+/*
+ * Tail queue definitions.
+ */
+#define Q_TAILQ_HEAD(name, type, qual)                                  \
+struct name {                                                           \
+        qual type *tqh_first;           /* first element */             \
+        qual type *qual *tqh_last;      /* addr of last next element */ \
+}
+#define QTAILQ_HEAD(name, type)                                         \
+struct name {                                                           \
+        type *tqh_first;      /* first element */                       \
+        type **tqh_last;      /* addr of last next element */           \
+}
+
+#define QTAILQ_HEAD_INITIALIZER(head)                                   \
+        { NULL, &(head).tqh_first }
+
+#define Q_TAILQ_ENTRY(type, qual)                                       \
+struct {                                                                \
+        qual type *tqe_next;            /* next element */              \
+        qual type *qual *tqe_prev;      /* address of previous next element */\
+}
+#define QTAILQ_ENTRY(type)                                              \
+struct {                                                                \
+        type *tqe_next;       /* next element */                        \
+        type **tqe_prev;      /* address of previous next element */    \
+}
-- 
2.4.3


