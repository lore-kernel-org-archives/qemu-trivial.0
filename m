Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPxR8-0007qO-DO
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 13:04:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WPxQz-0007e1-VT
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 13:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WPxQt-0007Bb-1G
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 13:04:13 -0400
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e]:47170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WPxQf-00077M-9R; Tue, 18 Mar 2014 13:03:53 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so5519553eei.5
	for <multiple recipients>; Tue, 18 Mar 2014 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=izdJ19JTlrtxWE+NtV+xOsfxn/DpA+4qslX9oev01oU=;
	b=P1vxk0F3Jhkm6r/XDXH7wjwh/a2Xemk4Tz6OIIlEz5+TylbRrUMCK92CXEoGpaXmqG
	D6AckQFb3LNX0c9ZmB1C1CBJjJDGlYxT2XJYxGcJe8QafQrWZOQWouQHkJiByo2UJBGU
	4gdEhceWby6ZcNEfjDsk7JU6fB7aRhoz+BrtTuGSre2V4X/n1IsmUnYRQEBHwJx1meS+
	L+WXwrnCEN295aIHZq8wa4eFcujJTLSaUVGVvzDcJP87/TgfR12RgH+nr1zNK6R+Dp01
	gEve6+K43y4mVumAJdGSsy0kRcanO2scqXZ0qtKKLJLMnltrdjCU8Ya3gqz//fUpH9Km
	FmAA==
X-Received: by 10.14.207.193 with SMTP id n41mr31226210eeo.44.1395162232103;
	Tue, 18 Mar 2014 10:03:52 -0700 (PDT)
Received: from yakj.lan (net-37-117-154-249.cust.vodafonedsl.it.
	[37.117.154.249])
	by mx.google.com with ESMTPSA id 44sm36257321eek.30.2014.03.18.10.03.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 10:03:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Mar 2014 18:03:43 +0100
Message-Id: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.5.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22e
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] scripts: add sample model file for Coverity
	Scan
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
X-List-Received-Date: Tue, 18 Mar 2014 17:04:20 -0000

This is the model file that is being used for the QEMU project's scans
on scan.coverity.com.  It fixed about 30 false positives (10% of the
total) and exposed about 60 new memory leaks.

The file is not automatically used; changes to it must be propagated
to the website manually by an admin (right now Markus, Peter and me
are admins).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-model.c | 170 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 scripts/coverity-model.c

diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
new file mode 100644
index 0000000..1cc0c1b
--- /dev/null
+++ b/scripts/coverity-model.c
@@ -0,0 +1,170 @@
+/* Coverity Scan model
+ *
+ * Copyright (C) 2014 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *  Paolo Bonzini <pbonzini@redhat.com>
+ *
+ * This is a modeling file for Coverity Scan. Modeling helps to avoid false
+ * positives.
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
+/* glib */
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
+    if (n_bytes == 0) {
+        g_free(mem);
+        return NULL;
+    } else {
+        mem = realloc(mem, n_bytes);
+        if (!mem) __coverity_panic__ ();
+        return mem;
+    }
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
+    if (n_bytes == 0) {
+        g_free(mem);
+        return NULL;
+    } else {
+        return realloc(mem, n_bytes);
+    }
+}
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


