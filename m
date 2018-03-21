Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eycYM-0004BB-4l
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 08:09:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1eycYJ-00046j-7L
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 08:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1eycYH-0000KB-7w
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 08:09:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1eycYC-0000Gc-CL; Wed, 21 Mar 2018 08:09:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A9CF7CBBA;
	Wed, 21 Mar 2018 12:09:02 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D73F215CDB7;
	Wed, 21 Mar 2018 12:08:53 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Yasmin Beatriz <yasmins@linux.vnet.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>
Date: Wed, 21 Mar 2018 13:08:53 +0100
Message-Id: <20180321120853.14293-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 12:09:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 21 Mar 2018 12:09:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] dump: display cause of write failure
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 12:09:13 -0000

Use error_setg_errno() to display the reason why data write
has failed. For instance, instead of a laconic

  dump: failed to write elf header
or
  dump: failed to save memory

we have now:

  dump: failed to write elf header: No space left on device
or
  dump: failed to save memory: No space left on device

CC: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
CC: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 dump.c | 79 +++++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/dump.c b/dump.c
index 6bdb0dbe23..d04e3f56b0 100644
--- a/dump.c
+++ b/dump.c
@@ -140,7 +140,7 @@ static void write_elf64_header(DumpState *s, Error **errp)
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write elf header");
+        error_setg_errno(errp, errno, "dump: failed to write elf header");
     }
 }
 
@@ -171,7 +171,7 @@ static void write_elf32_header(DumpState *s, Error **errp)
 
     ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write elf header");
+        error_setg_errno(errp, errno, "dump: failed to write elf header");
     }
 }
 
@@ -194,7 +194,8 @@ static void write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
 
     ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }
 
@@ -217,7 +218,8 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
 
     ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }
 
@@ -237,7 +239,8 @@ static void write_elf64_note(DumpState *s, Error **errp)
 
     ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }
 
@@ -254,7 +257,7 @@ static void write_guest_note(WriteCoreDumpFunction f, DumpState *s,
     if (s->guest_note) {
         ret = f(s->guest_note, s->guest_note_size, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to write guest note");
+            error_setg_errno(errp, errno, "dump: failed to write guest note");
         }
     }
 }
@@ -270,7 +273,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
         id = cpu_index(cpu);
         ret = cpu_write_elf64_note(f, cpu, id, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to write elf notes");
+            error_setg_errno(errp, errno, "dump: failed to write elf notes");
             return;
         }
     }
@@ -278,7 +281,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     CPU_FOREACH(cpu) {
         ret = cpu_write_elf64_qemunote(f, cpu, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to write CPU status");
+            error_setg_errno(errp, errno, "dump: failed to write CPU status");
             return;
         }
     }
@@ -302,7 +305,8 @@ static void write_elf32_note(DumpState *s, Error **errp)
 
     ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }
 
@@ -317,7 +321,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
         id = cpu_index(cpu);
         ret = cpu_write_elf32_note(f, cpu, id, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to write elf notes");
+            error_setg_errno(errp, errno, "dump: failed to write elf notes");
             return;
         }
     }
@@ -325,7 +329,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
     CPU_FOREACH(cpu) {
         ret = cpu_write_elf32_qemunote(f, cpu, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to write CPU status");
+            error_setg_errno(errp, errno, "dump: failed to write CPU status");
             return;
         }
     }
@@ -355,7 +359,8 @@ static void write_elf_section(DumpState *s, int type, Error **errp)
 
     ret = fd_write_vmcore(&shdr, shdr_size, s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write section header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write section header table");
     }
 }
 
@@ -365,7 +370,7 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
 
     ret = fd_write_vmcore(buf, length, s);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to save memory");
+        error_setg_errno(errp, errno, "dump: failed to save memory");
     } else {
         s->written_size += length;
     }
@@ -839,7 +844,7 @@ static void create_header32(DumpState *s, Error **errp)
     dh->status = cpu_to_dump32(s, status);
 
     if (write_buffer(s->fd, 0, dh, size) < 0) {
-        error_setg(errp, "dump: failed to write disk dump header");
+        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
         goto out;
     }
 
@@ -870,7 +875,7 @@ static void create_header32(DumpState *s, Error **errp)
 
     if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
                      block_size, kh, size) < 0) {
-        error_setg(errp, "dump: failed to write kdump sub header");
+        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
         goto out;
     }
 
@@ -886,7 +891,7 @@ static void create_header32(DumpState *s, Error **errp)
     }
     if (write_buffer(s->fd, offset_note, s->note_buf,
                      s->note_size) < 0) {
-        error_setg(errp, "dump: failed to write notes");
+        error_setg_errno(errp, errno, "dump: failed to write notes");
         goto out;
     }
 
@@ -951,7 +956,7 @@ static void create_header64(DumpState *s, Error **errp)
     dh->status = cpu_to_dump32(s, status);
 
     if (write_buffer(s->fd, 0, dh, size) < 0) {
-        error_setg(errp, "dump: failed to write disk dump header");
+        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
         goto out;
     }
 
@@ -982,7 +987,7 @@ static void create_header64(DumpState *s, Error **errp)
 
     if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
                      block_size, kh, size) < 0) {
-        error_setg(errp, "dump: failed to write kdump sub header");
+        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
         goto out;
     }
 
@@ -999,7 +1004,7 @@ static void create_header64(DumpState *s, Error **errp)
 
     if (write_buffer(s->fd, offset_note, s->note_buf,
                      s->note_size) < 0) {
-        error_setg(errp, "dump: failed to write notes");
+        error_setg_errno(errp, errno, "dump: failed to write notes");
         goto out;
     }
 
@@ -1183,7 +1188,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
     while (get_next_page(&block_iter, &pfn, NULL, s)) {
         ret = set_dump_bitmap(last_pfn, pfn, true, dump_bitmap_buf, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to set dump_bitmap");
+            error_setg_errno(errp, errno, "dump: failed to set dump_bitmap");
             goto out;
         }
 
@@ -1200,7 +1205,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
         ret = set_dump_bitmap(last_pfn, last_pfn + bits_per_buf, false,
                               dump_bitmap_buf, s);
         if (ret < 0) {
-            error_setg(errp, "dump: failed to sync dump_bitmap");
+            error_setg_errno(errp, errno, "dump: failed to sync dump_bitmap");
             goto out;
         }
     }
@@ -1333,7 +1338,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
     ret = write_cache(&page_data, buf, s->dump_info.page_size, false);
     g_free(buf);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write page data (zero page)");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write page data (zero page)");
         goto out;
     }
 
@@ -1349,7 +1355,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
                               false);
             if (ret < 0) {
-                error_setg(errp, "dump: failed to write page desc");
+                error_setg_errno(errp, errno,
+                                 "dump: failed to write page desc");
                 goto out;
             }
         } else {
@@ -1374,7 +1381,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
 
                 ret = write_cache(&page_data, buf_out, size_out, false);
                 if (ret < 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #ifdef CONFIG_LZO
@@ -1387,7 +1395,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
 
                 ret = write_cache(&page_data, buf_out, size_out, false);
                 if (ret < 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #endif
@@ -1401,7 +1410,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
 
                 ret = write_cache(&page_data, buf_out, size_out, false);
                 if (ret < 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #endif
@@ -1417,7 +1427,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
                 ret = write_cache(&page_data, buf,
                                   s->dump_info.page_size, false);
                 if (ret < 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
             }
@@ -1429,7 +1440,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
 
             ret = write_cache(&page_desc, &pd, sizeof(PageDescriptor), false);
             if (ret < 0) {
-                error_setg(errp, "dump: failed to write page desc");
+                error_setg_errno(errp, errno,
+                                 "dump: failed to write page desc");
                 goto out;
             }
         }
@@ -1438,12 +1450,14 @@ static void write_dump_pages(DumpState *s, Error **errp)
 
     ret = write_cache(&page_desc, NULL, 0, true);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to sync cache for page_desc");
+        error_setg_errno(errp, errno,
+                         "dump: failed to sync cache for page_desc");
         goto out;
     }
     ret = write_cache(&page_data, NULL, 0, true);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to sync cache for page_data");
+        error_setg_errno(errp, errno,
+                         "dump: failed to sync cache for page_data");
         goto out;
     }
 
@@ -1487,7 +1501,8 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
 
     ret = write_start_flat_header(s->fd);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write start flat header");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write start flat header");
         return;
     }
 
@@ -1511,7 +1526,7 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
 
     ret = write_end_flat_header(s->fd);
     if (ret < 0) {
-        error_setg(errp, "dump: failed to write end flat header");
+        error_setg_errno(errp, errno, "dump: failed to write end flat header");
         return;
     }
 }
-- 
2.14.3


