Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXd1A-0005R4-QX
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 16:53:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXbkD-0003Ef-9w
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 15:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXbk2-0007n9-Hj
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 15:31:39 -0400
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:57100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>)
	id 1WXbjj-0007XU-Sv; Tue, 08 Apr 2014 15:31:12 -0400
Received: by mail-pd0-f176.google.com with SMTP id r10so1418383pdi.21
	for <multiple recipients>; Tue, 08 Apr 2014 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lJsTqoMk892aXQ8Go7DPhvcRRYZJYDDGlzRJ3e/44UY=;
	b=fecIyQHyiJR8UZfa1hhsnLwG1zxw+uzs+yS1EBN+mSZRkd9kYgYlKx5YwMRt2PVHLb
	HPA3GHlZ4d8k0TzUxwLIo+48zRoDaQTz9/MNVpLhsYxvCUUbGSyQvrpvf6iJktGVZpuV
	wZm1dCcrOhUg3aDCZhKOwil3bQrWf7MJfvX9muXOjYTqPFKgZ7v/ButPxvynJ3LdzSkJ
	eW4zdbdXjBqVugGBHVslItmEPw63vnhqzJvWUj0ppXZxGxB7rCLJ0yDKF/z+a9RZsp8h
	TE5me8LR0lQoBuNWeEPg8YQtcZ4n/xROJFaE2+giCR1W6pnxi2jgzZWLDuP4kqyJRdn6
	Rjeg==
X-Received: by 10.66.102.66 with SMTP id fm2mr6661180pab.51.1396985470854;
	Tue, 08 Apr 2014 12:31:10 -0700 (PDT)
Received: from localhost.qualcomm.com (i-global254.qualcomm.com.
	[199.106.103.254])
	by mx.google.com with ESMTPSA id ja8sm6359051pbd.3.2014.04.08.12.31.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 12:31:10 -0700 (PDT)
From: Baojun Wang <wangbj@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 12:30:38 -0700
Message-Id: <1396985438-19741-1-git-send-email-wangbj@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
X-Mailman-Approved-At: Tue, 08 Apr 2014 16:53:15 -0400
Cc: qemu-trivial@nongnu.org, wangbj@gmail.com, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH V3 1/1] Add pmemsave command for both monitor
	and qmp,
	which could be useful to have qemu-softmmu as a cross debugger to
	load guest physical memory.
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
X-List-Received-Date: Tue, 08 Apr 2014 19:31:50 -0000

I found this could be useful to have qemu-softmmu as a cross debugger (launch
with -s -S command line option), then if we can have a command to load guest
physical memory, we can use cross gdb to do some target debug which gdb cannot
do directly.

Many thanks to Eric Blake for review the patch.

---
 cpus.c           | 24 ++++++++++++++++++++++++
 hmp-commands.hx  | 13 +++++++++++++
 hmp.c            | 11 +++++++++++
 hmp.h            |  1 +
 qapi-schema.json | 20 ++++++++++++++++++++
 qmp-commands.hx  | 27 +++++++++++++++++++++++++++
 6 files changed, 96 insertions(+)

diff --git a/cpus.c b/cpus.c
index 1104d61..03d1277 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1467,6 +1467,30 @@ exit:
     fclose(f);
 }
 
+void qmp_pmemload(int64_t addr, int64_t size, const char *filename,
+                  Error **errp)
+{
+    FILE *f;
+    uint32_t l;
+    uint8_t buf[1024];
+
+    f = fopen(filename, "rb");
+    if (!f) {
+        error_setg_file_open(errp, errno, filename);
+        return;
+    }
+
+    while (size != 0) {
+        l = fread(buf, 1, sizeof(buf), f);
+        if (l > size)
+            l = size;
+        cpu_physical_memory_rw(addr, buf, l, 1);
+        addr += l;
+        size -= l;
+    }
+
+    fclose(f);
+}
 void qmp_inject_nmi(Error **errp)
 {
 #if defined(TARGET_I386)
diff --git a/hmp-commands.hx b/hmp-commands.hx
index f3fc514..18604a6 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -809,6 +809,19 @@ save to disk physical memory dump starting at @var{addr} of size @var{size}.
 ETEXI
 
     {
+        .name       = "pmemload",
+        .args_type  = "val:l,size:i,filename:s",
+        .params     = "addr size file",
+        .help       = "load from disk physical memory dump starting at 'addr' of size 'size'",
+        .mhandler.cmd = hmp_pmemload,
+    },
+
+STEXI
+@item pmemload @var{addr} @var{size} @var{file}
+@findex pmemload
+load from disk physical memory dump starting at @var{addr} of size @var{size}.
+ETEXI
+    {
         .name       = "boot_set",
         .args_type  = "bootdevice:s",
         .params     = "bootdevice",
diff --git a/hmp.c b/hmp.c
index 2f279c4..6e932f9 100644
--- a/hmp.c
+++ b/hmp.c
@@ -767,6 +767,17 @@ void hmp_pmemsave(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, &errp);
 }
 
+void hmp_pmemload(Monitor *mon, const QDict *qdict)
+{
+    uint32_t size = qdict_get_int(qdict, "size");
+    const char *filename = qdict_get_str(qdict, "filename");
+    uint64_t addr = qdict_get_int(qdict, "val");
+    Error *errp = NULL;
+
+    qmp_pmemload(addr, size, filename, &errp);
+    hmp_handle_error(mon, &errp);
+}
+
 void hmp_ringbuf_write(Monitor *mon, const QDict *qdict)
 {
     const char *chardev = qdict_get_str(qdict, "device");
diff --git a/hmp.h b/hmp.h
index ed58f0e..f5f2a16 100644
--- a/hmp.h
+++ b/hmp.h
@@ -44,6 +44,7 @@ void hmp_system_powerdown(Monitor *mon, const QDict *qdict);
 void hmp_cpu(Monitor *mon, const QDict *qdict);
 void hmp_memsave(Monitor *mon, const QDict *qdict);
 void hmp_pmemsave(Monitor *mon, const QDict *qdict);
+void hmp_pmemload(Monitor *mon, const QDict *qdict);
 void hmp_ringbuf_write(Monitor *mon, const QDict *qdict);
 void hmp_ringbuf_read(Monitor *mon, const QDict *qdict);
 void hmp_cont(Monitor *mon, const QDict *qdict);
diff --git a/qapi-schema.json b/qapi-schema.json
index 391356f..f251f5d 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1708,6 +1708,26 @@
   'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
 
 ##
+# @pmemload:
+#
+# Load a portion of guest physical memory from a file.
+#
+# @val: the physical address of the guest to start from
+#
+# @size: the size of memory region to load
+#
+# @filename: the file to load the memory from as binary data
+#
+# Returns: Nothing on success
+#
+# Since: 2.1
+#
+# Notes: Errors were not reliably returned until 2.1
+##
+{ 'command': 'pmemload',
+  'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
+
+##
 # @cont:
 #
 # Resume guest VCPU execution.
diff --git a/qmp-commands.hx b/qmp-commands.hx
index ed3ab92..584d6cf 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -468,6 +468,33 @@ Example:
 EQMP
 
     {
+        .name       = "pmemload",
+        .args_type  = "val:l,size:i,filename:s",
+        .mhandler.cmd_new = qmp_marshal_input_pmemload,
+    },
+
+SQMP
+pmemload
+--------
+
+load from disk physical memory dump starting at 'val' of size 'size'.
+
+Arguments:
+
+- "val": the starting address (json-int)
+- "size": the memory size, in bytes (json-int)
+- "filename": file path (json-string)
+
+Example:
+
+-> { "execute": "pmemload",
+             "arguments": { "val": 10,
+                            "size": 100,
+                            "filename": "/tmp/physical-mem-dump" } }
+<- { "return": {} }
+
+EQMP
+    {
         .name       = "inject-nmi",
         .args_type  = "",
         .mhandler.cmd_new = qmp_marshal_input_inject_nmi,
-- 
1.9.1


