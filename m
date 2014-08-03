Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XDxjJ-000497-Q2
	for mharc-qemu-trivial@gnu.org; Sun, 03 Aug 2014 11:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XDxj9-0003w6-4p
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 11:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XDxj0-00047e-3l
	for qemu-trivial@nongnu.org; Sun, 03 Aug 2014 11:29:39 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:44765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XDxig-00045V-Bw; Sun, 03 Aug 2014 11:29:10 -0400
Received: by mail-pa0-f45.google.com with SMTP id eu11so8517992pac.18
	for <multiple recipients>; Sun, 03 Aug 2014 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=vhxe0PxyqSxM72/U9mFpChrJ+KsQ4nAKVMcAy1KUoyM=;
	b=AxGMKRlC9Za7KOJQwuouSzDyYbjovXxcnJSm7C4tqqbkXJR1iU8pVSIbf3oRXeN4kn
	KhjQ9r4K6bqNzkJOXDKS46wRYHzMShKQtGYSBVM773uHxtRqVWU9ROyc/inYzoLP3GC/
	vBM1yHjMx/VqE3L6hGJ7NasAIO20/dI3HWmhjiDmmj4cmt7mXcGnvhtMdQbsagmdg3CW
	cpDOQBN+f4iZtLi4xZM7wYa0jR0mvyKljrz25sm2t7guE5ZXedH0xaOj19Ma2JN6kK0+
	qYullN1i9RWBoG0z/HlTjt7YrHkWASSh2up3Arh9BEEWz4mV25r/Ah0sCBkEgKzk3xty
	SBEw==
X-Received: by 10.70.92.49 with SMTP id cj17mr18613814pdb.53.1407079748925;
	Sun, 03 Aug 2014 08:29:08 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.106])
	by mx.google.com with ESMTPSA id
	wp3sm14703834pbc.67.2014.08.03.08.29.06 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Aug 2014 08:29:08 -0700 (PDT)
Message-ID: <53DE5538.1020701@gmail.com>
Date: Sun, 03 Aug 2014 23:28:56 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: lcapitulino@redhat.com, lersek@redhat.com, qiaonuohan@cn.fujitsu.com, 
	pbonzini@redhat.com, agraf@suse.de, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] dump.c: Fix memory leak issue in cleanup
	processing for dump_init()
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
X-List-Received-Date: Sun, 03 Aug 2014 15:29:48 -0000

In dump_init(), when failure occurs, need notice about 'fd' and memory
mapping. So call dump_cleanup() for it (need let all initializations at
front).

Also simplify dump_cleanup(): remove redundant 'ret' and redundant 'fd'
checking.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 dump.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/dump.c b/dump.c
index ce646bc..71d3e94 100644
--- a/dump.c
+++ b/dump.c
@@ -71,18 +71,14 @@ uint64_t cpu_to_dump64(DumpState *s, uint64_t val)
 
 static int dump_cleanup(DumpState *s)
 {
-    int ret = 0;
-
     guest_phys_blocks_free(&s->guest_phys_blocks);
     memory_mapping_list_free(&s->list);
-    if (s->fd != -1) {
-        close(s->fd);
-    }
+    close(s->fd);
     if (s->resume) {
         vm_start();
     }
 
-    return ret;
+    return 0;
 }
 
 static void dump_error(DumpState *s, const char *reason)
@@ -1499,6 +1495,8 @@ static int dump_init(DumpState *s, int fd, bool has_format,
     s->begin = begin;
     s->length = length;
 
+    memory_mapping_list_init(&s->list);
+
     guest_phys_blocks_init(&s->guest_phys_blocks);
     guest_phys_blocks_append(&s->guest_phys_blocks);
 
@@ -1526,7 +1524,6 @@ static int dump_init(DumpState *s, int fd, bool has_format,
     }
 
     /* get memory mapping */
-    memory_mapping_list_init(&s->list);
     if (paging) {
         qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks, &err);
         if (err != NULL) {
@@ -1622,12 +1619,7 @@ static int dump_init(DumpState *s, int fd, bool has_format,
     return 0;
 
 cleanup:
-    guest_phys_blocks_free(&s->guest_phys_blocks);
-
-    if (s->resume) {
-        vm_start();
-    }
-
+    dump_cleanup(s);
     return -1;
 }
 
-- 
1.7.11.7

