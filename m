Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wmu33-0007t1-KT
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 20:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu2s-0007Wh-Ce
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu2j-0004ed-6Y
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:06:10 -0400
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:38786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wmu2Q-0004bv-LO; Tue, 20 May 2014 20:05:42 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so802385pab.38
	for <multiple recipients>; Tue, 20 May 2014 17:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zDnpD+WxAUQhJ6El1Nr1QDEOM1oCmBDtuvN4HhQIboU=;
	b=nL+sFypp2kCwHj2zJGgbZNggl5n8DovGCY8SiiTdWOkDvw4NjGJ53+6r11c9KKhuz1
	UDT2dvmj5jcdAsyrxcq5sOlBiexG4Q4zZIOk83GLmQLadOh8O6ONDBgmaZETx6bdFFr1
	9KH5mexHNEzce8lFb06y/icitahtO4n8AVvs5EF/fGvDh8uWQZrvr3R9NdbNiqSuoBx0
	2D1w+Rh7WaUOBFEs/o4mOvWV+mRCR1Z2HJ7p32GqVoXkmsbOCJ60dELr8A54Lq4djVRH
	2TjD7nagyhhFyqCabToqboM8sPiexWCB4Y39RQxJzQ2Xy0KBqZ8oRRr24FMJc/imVfTB
	J61w==
X-Received: by 10.68.181.165 with SMTP id dx5mr55014032pbc.38.1400630741658;
	Tue, 20 May 2014 17:05:41 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id bz4sm5042881pbb.12.2014.05.20.17.05.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 May 2014 17:05:41 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 May 2014 08:10:38 +0800
Message-Id: <1400631039-7208-2-git-send-email-tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com, jan.kiszka@web.de,
	afaerber@suse.de, Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] arch_init: replace fprintf(stderr,
	...) with error_report()
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
X-List-Received-Date: Wed, 21 May 2014 00:06:20 -0000

Replace fprintf(stderr,...) with error_report() in the file
arch_init.c. The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
---
 arch_init.c |   32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 685ba0e..9f1a174 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -975,12 +975,12 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
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
@@ -989,7 +989,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
     /* decode RLE */
     if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
                              TARGET_PAGE_SIZE) == -1) {
-        fprintf(stderr, "Failed to load XBZRLE page - decode error!\n");
+        error_report("Failed to load XBZRLE page - decode error!");
         return -1;
     }
 
@@ -1006,7 +1006,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
 
     if (flags & RAM_SAVE_FLAG_CONTINUE) {
         if (!block) {
-            fprintf(stderr, "Ack, bad migration stream!\n");
+            error_report("Ack, bad migration stream!");
             return NULL;
         }
 
@@ -1022,7 +1022,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
             return memory_region_get_ram_ptr(block->mr) + offset;
     }
 
-    fprintf(stderr, "Can't find block %s!\n", id);
+    error_report("Can't find block %s!", id);
     return NULL;
 }
 
@@ -1075,10 +1075,9 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                 QTAILQ_FOREACH(block, &ram_list.blocks, next) {
                     if (!strncmp(id, block->idstr, sizeof(id))) {
                         if (block->length != length) {
-                            fprintf(stderr,
-                                    "Length mismatch: %s: " RAM_ADDR_FMT
-                                    " in != " RAM_ADDR_FMT "\n", id, length,
-                                    block->length);
+                            error_report("Length mismatch: %s: " RAM_ADDR_FMT
+                                         " in != " RAM_ADDR_FMT, id, length,
+                                         block->length);
                             ret =  -EINVAL;
                             goto done;
                         }
@@ -1087,8 +1086,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                 }
 
                 if (!block) {
-                    fprintf(stderr, "Unknown ramblock \"%s\", cannot "
-                            "accept migration\n", id);
+                    error_report("Unknown ramblock \"%s\", cannot "
+                                 "accept migration", id);
                     ret = -EINVAL;
                     goto done;
                 }
@@ -1243,12 +1242,11 @@ void select_soundhw(const char *optarg)
 
             if (!c->name) {
                 if (l > 80) {
-                    fprintf(stderr,
-                            "Unknown sound card name (too big to show)\n");
+                    error_report("Unknown sound card name (too big to show)");
                 }
                 else {
-                    fprintf(stderr, "Unknown sound card name `%.*s'\n",
-                            (int) l, p);
+                    error_report("Unknown sound card name `%.*s'",
+                                 (int) l, p);
                 }
                 bad_card = 1;
             }
@@ -1271,13 +1269,13 @@ void audio_init(void)
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


