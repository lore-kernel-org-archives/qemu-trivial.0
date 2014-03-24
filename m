Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS1hx-0004CF-9T
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 06:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WS1hq-00044P-OV
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 06:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WS1hk-0007XC-UQ
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 06:02:10 -0400
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c]:45665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WS1hZ-0007Ut-Dl; Mon, 24 Mar 2014 06:01:53 -0400
Received: by mail-qg0-f44.google.com with SMTP id a108so15915409qge.3
	for <multiple recipients>; Mon, 24 Mar 2014 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=IhMYypczuVmv71X5yAUStYcQoUqgr+xEK1B3aG2LHmU=;
	b=EfHi3KRfspQ0oMXtCTevt7Up7wUVLD/JjocEYm+tsKRJTIvEsGXU8CuQaXnJP7xS9s
	r/8Zmo6+0otFCUBTfZdtjKfpr/f1CpBYt5zYNR0EKWE59bWHYzOzW/yXkZlkjKcB+lwO
	c3WRHF67XJDPcH8u9yp65op39owrGe5TUFslHFNbqGbn+ct27ldKWNX8CJEaBEV2A3YO
	8sJGtZPrgRvGCGCgJnSEFM8S5kG23Vvwp2RKxRywbBs79xllqYFO+pfGaFmh4nVevUs2
	xusp5pJDjnJg7UmP5o/TZJVotxEFmrID4FdxOw327GLTFX7tgDew10rOzrjtlAZIa2jJ
	F+iQ==
X-Received: by 10.140.28.100 with SMTP id 91mr14471852qgy.36.1395655312756;
	Mon, 24 Mar 2014 03:01:52 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-156-129.cust.vodafonedsl.it. [37.117.156.129])
	by mx.google.com with ESMTPSA id g92sm20851552qge.7.2014.03.24.03.01.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 03:01:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Mar 2014 11:01:40 +0100
Message-Id: <1395655300-16866-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.5.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22c
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v3] scripts: add sample model file for
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
X-List-Received-Date: Mon, 24 Mar 2014 10:02:16 -0000

This is the model file that is being used for the QEMU project's scans
on scan.coverity.com.  It fixed about 30 false positives (10% of the
total) and exposed about 60 new memory leaks.

The file is not automatically used; changes to it must be propagated
to the website manually by an admin (right now Markus, Peter and me
are admins).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-model.c | 183 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)
 create mode 100644 scripts/coverity-model.c

diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
new file mode 100644
index 0000000..7c18d2b
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
+#define NULL (void *)0
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
1.8.5.3


