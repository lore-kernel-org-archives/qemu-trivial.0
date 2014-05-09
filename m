Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WizjM-0002qh-8t
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 01:21:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuaF-0002tx-CJ
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wiua6-0001H8-Af
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:52:07 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:48041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WiuZn-0001EX-T4; Fri, 09 May 2014 19:51:40 -0400
Received: by mail-pd0-f172.google.com with SMTP id g10so4239891pdj.31
	for <multiple recipients>; Fri, 09 May 2014 16:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4pBDA76h/ylkqJFLy1v3rcQLjA9j0Fcr0zFJ2o98Iis=;
	b=A3pobVogV/IlYTX7hcksz4MxXgAtz6gD0mPzpXwuafxP0kpx2Lk6Gz4ETrMcaUGsME
	8Jmq6O3Kdx8902FaWVtBK/v5TvIUuuilwjwqbKJ9cjWNJIYB6izZ5h/x2UHe3S5pX9wg
	4QFhufQjrfUZcWQ43bfenRbSLQ5vS2TY8BlXdEQRpTfvQ8Dlmdl+BDdqEpw8L4pHRnRB
	LIgHz9phFuoNLHFtzOgvlytnnP3hD+/9B80ANU9bq/ef8XkxywWQcAmluU2adSL9KsJd
	lJ/VWEaZsND7vveSg+By3VCcet+3Yr/pcpO1n+QnjK1uGXC3B8WCOwOuBOiN01TnABZd
	43kw==
X-Received: by 10.66.136.103 with SMTP id pz7mr26246562pab.140.1399679498791; 
	Fri, 09 May 2014 16:51:38 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id op3sm9623456pbc.40.2014.05.09.16.51.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 16:51:38 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 May 2014 07:55:19 +0800
Message-Id: <148ba95b4d26522056d25fea8312b24760fe8289.1399641611.git.tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <y>
 <cover.1399641611.git.tamlokveer@gmail.com>
In-Reply-To: <cover.1399641611.git.tamlokveer@gmail.com>
References: <cover.1399641611.git.tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
X-Mailman-Approved-At: Sat, 10 May 2014 01:21:51 -0400
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/4] arch_init: replace fprintf(stderr,
	...) with error_report() in arch_init.c
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
X-List-Received-Date: Fri, 09 May 2014 23:52:16 -0000

Replace fprintf(stderr,...) with error_report() in the file
arch_init.c. The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 arch_init.c |   36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 60c975d..0b41475 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -921,12 +921,12 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
     xh_len = qemu_get_be16(f);
 
     if (xh_flags != ENCODING_FLAG_XBZRLE) {
-        fprintf(stderr, "Failed to load XBZRLE page - wrong compression!\n");
+        error_report("Failed to load XBZRLE page - wrong compression!");
         return -1;
     }
 
     if (xh_len > TARGET_PAGE_SIZE) {
-        fprintf(stderr, "Failed to load XBZRLE page - len overflow!\n");
+        error_report("Failed to load XBZRLE page - len overflow!");
         return -1;
     }
     /* load data and decode */
@@ -936,11 +936,11 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
     ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
                                TARGET_PAGE_SIZE);
     if (ret == -1) {
-        fprintf(stderr, "Failed to load XBZRLE page - decode error!\n");
+        error_report("Failed to load XBZRLE page - decode error!");
         rc = -1;
     } else  if (ret > TARGET_PAGE_SIZE) {
-        fprintf(stderr, "Failed to load XBZRLE page - size %d exceeds %d!\n",
-                ret, TARGET_PAGE_SIZE);
+        error_report("Failed to load XBZRLE page - size %d exceeds %d!",
+                     ret, TARGET_PAGE_SIZE);
         abort();
     }
 
@@ -957,7 +957,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
 
     if (flags & RAM_SAVE_FLAG_CONTINUE) {
         if (!block) {
-            fprintf(stderr, "Ack, bad migration stream!\n");
+            error_report("Ack, bad migration stream!");
             return NULL;
         }
 
@@ -973,7 +973,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
             return memory_region_get_ram_ptr(block->mr) + offset;
     }
 
-    fprintf(stderr, "Can't find block %s!\n", id);
+    error_report("Can't find block %s!", id);
     return NULL;
 }
 
@@ -1026,10 +1026,10 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                     QTAILQ_FOREACH(block, &ram_list.blocks, next) {
                         if (!strncmp(id, block->idstr, sizeof(id))) {
                             if (block->length != length) {
-                                fprintf(stderr,
-                                        "Length mismatch: %s: " RAM_ADDR_FMT
-                                        " in != " RAM_ADDR_FMT "\n", id, length,
-                                        block->length);
+                                error_report(
+                                             "Length mismatch: %s: " RAM_ADDR_FMT
+                                             " in != " RAM_ADDR_FMT, id, length,
+                                             block->length);
                                 ret =  -EINVAL;
                                 goto done;
                             }
@@ -1038,8 +1038,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                     }
 
                     if (!block) {
-                        fprintf(stderr, "Unknown ramblock \"%s\", cannot "
-                                "accept migration\n", id);
+                        error_report("Unknown ramblock \"%s\", cannot "
+                                     "accept migration", id);
                         ret = -EINVAL;
                         goto done;
                     }
@@ -1186,12 +1186,10 @@ void select_soundhw(const char *optarg)
 
             if (!c->name) {
                 if (l > 80) {
-                    fprintf(stderr,
-                            "Unknown sound card name (too big to show)\n");
+                    error_report("Unknown sound card name (too big to show)");
                 }
                 else {
-                    fprintf(stderr, "Unknown sound card name `%.*s'\n",
-                            (int) l, p);
+                    error_report("Unknown sound card name `%.*s'", (int) l, p);
                 }
                 bad_card = 1;
             }
@@ -1214,13 +1212,13 @@ void audio_init(void)
         if (c->enabled) {
             if (c->isa) {
                 if (!isa_bus) {
-                    fprintf(stderr, "ISA bus not available for %s\n", c->name);
+                    error_report("ISA bus not available for %s", c->name);
                     exit(1);
                 }
                 c->init.init_isa(isa_bus);
             } else {
                 if (!pci_bus) {
-                    fprintf(stderr, "PCI bus not available for %s\n", c->name);
+                    error_report("PCI bus not available for %s", c->name);
                     exit(1);
                 }
                 c->init.init_pci(pci_bus);
-- 
1.7.9.5


