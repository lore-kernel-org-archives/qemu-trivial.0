Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYrDF-0004mC-PS
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 03:51:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZYrDD-0004iv-JL
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 03:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZYrDC-0003CO-7Y
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 03:51:35 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:35251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZYrD5-00039o-RW; Mon, 07 Sep 2015 03:51:28 -0400
Received: by wicge5 with SMTP id ge5so73568006wic.0;
	Mon, 07 Sep 2015 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TTHU/Khyep/+nwu88cn87bj5N8wFuI8PVbkEJoDJNQ0=;
	b=FUatUYvRy7Tq+pedgCAo7dhqGtPrvEuCw8Lwl+Wdlt4u2Jx6Xk3PwSsLMECAIdfqCw
	etwdXaej3viyDl4PgjFEH0O6lAQ/oOPPDZ8fKaDV5pmaCDksofeQRaxeQfyDl7E/HS33
	CxPei0343uhR4lB5/BWsdrU2ubJNwIZyk+oXNLO5yt9CnPSU2F00mFuVeIv1N2NEA1pR
	fgpTnoqu3UQk8TT+WPVC9Y6JPmzi224cHXrGHfdB2OOeI+lNTiUIGHM6RcZFCY7Q5MgQ
	KLJwnDo9VK8Q5ZRfuuC44g1Ex9sGYGZrZGHauTbxGKxxZrHIO27UG1VwfePYEsp5CTsi
	xMoA==
X-Received: by 10.180.105.74 with SMTP id gk10mr30549090wib.92.1441612286396; 
	Mon, 07 Sep 2015 00:51:26 -0700 (PDT)
Received: from donizetti.lan ([94.39.138.45]) by smtp.gmail.com with ESMTPSA id
	uc12sm18883229wib.13.2015.09.07.00.51.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2015 00:51:24 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Sep 2015 09:51:32 +0200
Message-Id: <1441612292-14845-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.4.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] add macro file for coccinelle
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
X-List-Received-Date: Mon, 07 Sep 2015 07:51:36 -0000

Coccinelle chokes on some idioms from compiler.h and queue.h.
Extract those in a macro file, to be used with "--macro-file
scripts/cocci-macro-file.h".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/cocci-macro-file.h | 110 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 scripts/cocci-macro-file.h

diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
new file mode 100644
index 0000000..d84932e
--- /dev/null
+++ b/scripts/cocci-macro-file.h
@@ -0,0 +1,110 @@
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


