Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQJk3-0004h0-Ef
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 12:53:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQJjw-0004aN-E2
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 12:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQJjq-0001Q5-QD
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 12:53:16 -0400
Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229]:63955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQJje-00014x-6u; Wed, 19 Mar 2014 12:52:58 -0400
Received: by mail-qc0-f169.google.com with SMTP id i17so10163028qcy.14
	for <multiple recipients>; Wed, 19 Mar 2014 09:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VfmxbruNDShH19zbrM30MpfopMHBKXxGzqVyPvsUVic=;
	b=zhIKVDgclb05TAQjUDGYq+kW/Sa/bJ0fZTfJfLm9r+nEWLUUL4fH1ZCDTNKxQxuZ5d
	87OeOYiG1/7fdFjwC+x2oCfSTrCBtn2AGLo2wILSPMp+JiQPXfqrC5zPfhJOpvWIUWAD
	1oe7JCQwkBLTIJbmUStEg5Ick1eo7C/doDIRC7gBw/NQaacBKLXs7Bu0f1ORZaJcEYDq
	WIanrdC+x0LrSoP/KM3mT7r8yoVsKeMPTR4oe7l+tFav+yz2oGhvEarTI5x3XNiKSM0v
	d0jMqMzC6sOGSevf4+w+Yp3He4Uk2y8mu0vlJ+lhH9v/k2IC5CpvNT0jynbnSPEHe4gG
	sfZg==
X-Received: by 10.224.123.137 with SMTP id p9mr44049448qar.39.1395247977157;
	Wed, 19 Mar 2014 09:52:57 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id a10sm64627615qas.6.2014.03.19.09.52.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 09:52:55 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Mar 2014 17:52:45 +0100
Message-Id: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.5.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::229
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2] scripts: add sample model file for
	Coverity Scan
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
X-List-Received-Date: Wed, 19 Mar 2014 16:53:22 -0000

This is the model file that is being used for the QEMU project's scans
on scan.coverity.com.  It fixed about 30 false positives (10% of the
total) and exposed about 60 new memory leaks.

The file is not automatically used; changes to it must be propagated
to the website manually by an admin (right now Markus, Peter and me
are admins).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-model.c | 178 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 scripts/coverity-model.c

diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
new file mode 100644
index 0000000..6a1dd6d
--- /dev/null
+++ b/scripts/coverity-model.c
@@ -0,0 +1,178 @@
+/* Coverity Scan model
+ *
+ * Copyright (C) 2014 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *  Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or, at your
+ * option, any later version.  See the COPYING file in the top-level directory.
+ */
+
+
+/*
+ * This is a modeling file for Coverity Scan. Modeling helps to avoid false
+ * positives and in some cases helps Coverity in reporting more defects,
+ * especially memory leaks.
+ *
+ * - A model file can't import any header files.  Some built-in primitives are
+ *   available but not wchar_t, NULL etc.
+ * - Modeling doesn't need full structs and typedefs. Rudimentary structs
+ *   and similar types are sufficient.
+ * - An uninitialized local variable signifies that the variable could be
+ *   any value.
+ *
+ * The model file must be uploaded by an admin in the analysis settings of
+ * http://scan.coverity.com/projects/378
+ */
+
+#define NULL (void *)0
+#define assert(x) if (!(x)) __coverity_panic__();
+
+typedef unsigned char uint8_t;
+typedef char int8_t;
+typedef unsigned int uint32_t;
+typedef int int32_t;
+typedef long ssize_t;
+typedef unsigned long long uint64_t;
+typedef long long int64_t;
+typedef _Bool bool;
+
+/* exec.c */
+
+typedef struct AddressSpace AddressSpace;
+typedef uint64_t hwaddr;
+
+static void __write(uint8_t *buf, int len)
+{
+    int first, last;
+    __coverity_negative_sink__(len);
+    if (len == 0) return;
+    buf[0] = first;
+    buf[len-1] = last;
+    __coverity_writeall__(buf);
+}
+
+static void __read(uint8_t *buf, int len)
+{
+    __coverity_negative_sink__(len);
+    if (len == 0) return;
+    int first = buf[0];
+    int last = buf[len-1];
+}
+
+bool address_space_rw(AddressSpace *as, hwaddr addr, uint8_t *buf,
+                      int len, bool is_write)
+{
+    bool result;
+
+    // perhaps __coverity_tainted_data_argument__(buf); for read,
+    // and __coverity_tainted_data_sink__(buf); for write?
+    if (is_write) __write(buf, len); else __read(buf, len);
+
+    return result;
+}
+
+/* Tainting */
+
+typedef struct {} name2keysym_t;
+static int get_keysym(const name2keysym_t *table,
+                      const char *name)
+{
+    int result;
+    if (result > 0) {
+        __coverity_tainted_string_sanitize_content__(name);
+        return result;
+    } else {
+        return 0;
+    }
+}
+
+/* glib memory allocation functions.
+ *
+ * Note that we ignore the fact that g_malloc of 0 bytes returns NULL,
+ * and g_realloc of 0 bytes frees the pointer.
+ *
+ * Modeling this would result in Coverity flagging a lot of memory
+ * allocations as potentially returning NULL, and asking us to check
+ * whether the result of the allocation is NULL or not.  However, the
+ * resulting pointer would really never be dereferenced anyway.
+ */
+
+void *malloc (size_t);
+void *calloc (size_t, size_t);
+void *realloc (void *, size_t);
+void free (void *);
+
+void *
+g_malloc (size_t n_bytes)
+{
+    void *mem;
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__ ();
+    return mem;
+}
+
+void *
+g_malloc0 (size_t n_bytes)
+{
+    void *mem;
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__ ();
+    return mem;
+}
+
+void g_free (void *mem)
+{
+    if (mem) {
+        free(mem);
+    }
+}
+
+void *g_realloc (void * mem, size_t n_bytes)
+{
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    mem = realloc(mem, n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__ ();
+    return mem;
+}
+
+void *g_try_malloc (size_t n_bytes)
+{
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    return malloc(n_bytes == 0 ? 1 : n_bytes);
+}
+
+void *g_try_malloc0 (size_t n_bytes)
+{
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    return calloc(1, n_bytes == 0 ? 1 : n_bytes);
+}
+
+void *g_try_realloc (void *mem, size_t n_bytes)
+{
+    __coverity_negative_sink__((ssize_t) n_bytes);
+    return realloc(mem, n_bytes == 0 ? 1 : n_bytes);
+}
+
+/* Other glib functions */
+
+typedef struct _GIOChannel GIOChannel;
+GIOChannel *g_io_channel_unix_new(int fd)
+{
+    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
+    __coverity_escape__(fd);
+    return c;
+}
+
+void g_assertion_message_expr(const char     *domain,
+                              const char     *file,
+                              int             line,
+                              const char     *func,
+                              const char     *expr)
+{
+    __coverity_panic__();
+}
-- 
1.8.5.3


