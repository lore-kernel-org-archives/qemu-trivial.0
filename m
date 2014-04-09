Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXwhb-0001gl-Ad
	for mharc-qemu-trivial@gnu.org; Wed, 09 Apr 2014 13:54:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXwhR-0001St-Hr
	for qemu-trivial@nongnu.org; Wed, 09 Apr 2014 13:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangbj@gmail.com>) id 1WXwhI-0006zK-G4
	for qemu-trivial@nongnu.org; Wed, 09 Apr 2014 13:54:13 -0400
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e]:55062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangbj@gmail.com>)
	id 1WXwgz-0006p7-NJ; Wed, 09 Apr 2014 13:53:45 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so2735905pdi.19
	for <multiple recipients>; Wed, 09 Apr 2014 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=76ez8eXthpg3IF8QzvTgxJQ2rJxCjPcOROPMu4h2hz8=;
	b=bqxtW95uouFpRyr15cTrDCAm67VHGWYlV/zbGiBm23YJUGksG2xnkJhW3CalsZqr7l
	ukBwdktXTo0C8+9K2BpVqeG0kgPJa73XvpQCnc+8TG9+Rn0De5PVfiHqLneyaVcB1ncP
	7VQ0+r+QRHCwqvGPVQtmqn0F9wH4kNQIwuGdn/vYZP6ppqUKgBRlKVvp1lfhMGsQ2rP8
	YO7Dp/3kykIkQn+H5kUbI5qnXYJrBMrj9+rJgykM3DSaCqfdEovxja5dTOJ+5eCsT2+4
	n6tkNLJR32F2lNDJg6+WgVkyMApmAbfGJKtmL1g1hT3K+SnicrkoHSI3pPigzZetqd1o
	R/YQ==
X-Received: by 10.66.254.234 with SMTP id al10mr13770158pad.137.1397066024363; 
	Wed, 09 Apr 2014 10:53:44 -0700 (PDT)
Received: from localhost.qualcomm.com (i-global254.qualcomm.com.
	[199.106.103.254])
	by mx.google.com with ESMTPSA id vb7sm3925165pbc.13.2014.04.09.10.53.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 09 Apr 2014 10:53:43 -0700 (PDT)
From: Baojun Wang <wangbj@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  9 Apr 2014 10:49:04 -0700
Message-Id: <1397065744-9561-1-git-send-email-wangbj@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <53457D1A.7000602@redhat.com>
References: <53457D1A.7000602@redhat.com>
In-Reply-To: <53457D1A.7000602@redhat.com>
References: <53457D1A.7000602@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22e
Cc: qemu-trivial@nongnu.org, Baojun Wang <wangbj@gmail.com>, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH V5 1/1] qmp: add pmemload command
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
X-List-Received-Date: Wed, 09 Apr 2014 17:54:22 -0000

I found this could be useful to have qemu-softmmu as a cross debugger (launch
with -s -S command line option), then if we can have a command to load guest
physical memory, we can use cross gdb to do some target debug which gdb cannot
do directly.

Many thanks to Eric Blake for review the patch and suggestions.

Signed-off-by: Baojun Wang <wangbj@gmail.com>
---
 cpus.c           | 29 +++++++++++++++++++++++++++++
 hmp-commands.hx  | 13 +++++++++++++
 hmp.c            | 11 +++++++++++
 hmp.h            |  1 +
 qapi-schema.json | 18 ++++++++++++++++++
 qmp-commands.hx  | 27 +++++++++++++++++++++++++++
 6 files changed, 99 insertions(+)

diff --git a/cpus.c b/cpus.c
index 1104d61..230664f 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1467,6 +1467,35 @@ exit:
     fclose(f);
 }
 
+void qmp_pmemload(const char* filename, int64_t addr, int64_t size,
+                  Error **errp)
+{
+    int fd;
+    ssize_t l;
+    uint8_t buf[4096];
+
+    fd = qemu_open(filename, O_RDONLY | O_BINARY);
+    if (fd < 0) {
+        error_setg_file_open(errp, errno, filename);
+        return;
+    }
+
+    while (size != 0) {
+        l = read(fd, buf, sizeof(buf));
+        if (l != sizeof(buf)) {
+            error_set(errp, QERR_IO_ERROR);
+            goto exit;
+        }
+        if (l > size)
+            l = size;
+        cpu_physical_memory_rw(addr, buf, l, 1);
+        addr += l;
+        size -= l;
+    }
+
+exit:
+    qemu_close(fd);
+}
 void qmp_inject_nmi(Error **errp)
 {
 #if defined(TARGET_I386)
diff --git a/hmp-commands.hx b/hmp-commands.hx
index f3fc514..1eae6e3 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -809,6 +809,19 @@ save to disk physical memory dump starting at @var{addr} of size @var{size}.
 ETEXI
 
     {
+        .name       = "pmemload",
+        .args_type  = "filename:s,val:l,size:i",
+        .params     = "file addr size",
+        .help       = "load from disk physical memory dump starting at 'addr' of size 'size'",
+        .mhandler.cmd = hmp_pmemload,
+    },
+
+STEXI
+@item pmemload @var{file} @var{addr} @var{size}
+@findex pmemload
+load from disk physical memory dump starting at @var{addr} of size @var{size}.
+ETEXI
+    {
         .name       = "boot_set",
         .args_type  = "bootdevice:s",
         .params     = "bootdevice",
diff --git a/hmp.c b/hmp.c
index 2f279c4..745c087 100644
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
+    qmp_pmemload(filename, addr, size, &errp);
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
index 391356f..7198242 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1708,6 +1708,24 @@
   'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
 
 ##
+# @pmemload:
+#
+# Load a portion of guest physical memory from a file.
+#
+# @filename: the file to load the memory from as binary data
+#
+# @val: the physical address of the guest to start from
+#
+# @size: the size of memory region to load
+#
+# Returns: Nothing on success
+#
+# Since: 2.1
+##
+{ 'command': 'pmemload',
+  'data': {'filename': 'str', 'val': 'int', 'size': 'int'} }
+
+##
 # @cont:
 #
 # Resume guest VCPU execution.
diff --git a/qmp-commands.hx b/qmp-commands.hx
index ed3ab92..2831038 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -468,6 +468,33 @@ Example:
 EQMP
 
     {
+        .name       = "pmemload",
+        .args_type  = "filename:s,val:l,size:i",
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
+- "filename": file path (json-string)
+- "val": the starting address (json-int)
+- "size": the memory size, in bytes (json-int)
+
+Example:
+
+-> { "execute": "pmemload",
+             "arguments": { "filename": "/tmp/physical-mem-dump",
+                            "val": 10,
+                            "size": 100 } }
+<- { "return": {} }
+
+EQMP
+    {
         .name       = "inject-nmi",
         .args_type  = "",
         .mhandler.cmd_new = qmp_marshal_input_inject_nmi,
-- 
1.9.1


