Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQTP-0000mX-Qx
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQTK-0000dC-Fq
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQTG-0001A0-0K
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:29:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQT3-00014H-Fy; Tue, 08 Apr 2014 03:29:13 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32CFC40E3A;
	Tue,  8 Apr 2014 11:29:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 858B26AF;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10581 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:08 +0400
Message-Id: <1396940651-10513-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 08/11] scripts: add sample model file for
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
X-List-Received-Date: Tue, 08 Apr 2014 07:29:35 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

This is the model file that is being used for the QEMU project's scans
on scan.coverity.com.  It fixed about 30 false positives (10% of the
total) and exposed about 60 new memory leaks.

The file is not automatically used; changes to it must be propagated
to the website manually by an admin (right now Markus, Peter and me
are admins).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/coverity-model.c |  183 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)
 create mode 100644 scripts/coverity-model.c

diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
new file mode 100644
index 0000000..4c99a85
--- /dev/null
+++ b/scripts/coverity-model.c
@@ -0,0 +1,183 @@
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
+ * This is the source code for our Coverity user model file.  The
+ * purpose of user models is to increase scanning accuracy by explaining
+ * code Coverity can't see (out of tree libraries) or doesn't
+ * sufficiently understand.  Better accuracy means both fewer false
+ * positives and more true defects.  Memory leaks in particular.
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
+#define NULL ((void *)0)
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
+static void __write(uint8_t *buf, ssize_t len)
+{
+    int first, last;
+    __coverity_negative_sink__(len);
+    if (len == 0) return;
+    buf[0] = first;
+    buf[len-1] = last;
+    __coverity_writeall__(buf);
+}
+
+static void __read(uint8_t *buf, ssize_t len)
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
+    // TODO: investigate impact of treating reads as producing
+    // tainted data, with __coverity_tainted_data_argument__(buf).
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
+ * resulting pointer should never be dereferenced anyway, and in fact
+ * it is not in the vast majority of cases.
+ *
+ * If a dereference did happen, this would suppress a defect report
+ * for an actual null pointer dereference.  But it's too unlikely to
+ * be worth wading through the false positives, and with some luck
+ * we'll get a buffer overflow reported anyway.
+ */
+
+void *malloc(size_t);
+void *calloc(size_t, size_t);
+void *realloc(void *, size_t);
+void free(void *);
+
+void *
+g_malloc(size_t n_bytes)
+{
+    void *mem;
+    __coverity_negative_sink__(n_bytes);
+    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__();
+    return mem;
+}
+
+void *
+g_malloc0(size_t n_bytes)
+{
+    void *mem;
+    __coverity_negative_sink__(n_bytes);
+    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__();
+    return mem;
+}
+
+void g_free(void *mem)
+{
+    free(mem);
+}
+
+void *g_realloc(void * mem, size_t n_bytes)
+{
+    __coverity_negative_sink__(n_bytes);
+    mem = realloc(mem, n_bytes == 0 ? 1 : n_bytes);
+    if (!mem) __coverity_panic__();
+    return mem;
+}
+
+void *g_try_malloc(size_t n_bytes)
+{
+    __coverity_negative_sink__(n_bytes);
+    return malloc(n_bytes == 0 ? 1 : n_bytes);
+}
+
+void *g_try_malloc0(size_t n_bytes)
+{
+    __coverity_negative_sink__(n_bytes);
+    return calloc(1, n_bytes == 0 ? 1 : n_bytes);
+}
+
+void *g_try_realloc(void *mem, size_t n_bytes)
+{
+    __coverity_negative_sink__(n_bytes);
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
1.7.10.4


