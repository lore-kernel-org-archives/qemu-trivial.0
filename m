Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopTU-00038c-FV
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:37:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTO-0002yF-SI
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTK-0003rU-DI
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopT3-0003mV-Vp; Mon, 26 May 2014 03:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D71F42FAB;
	Mon, 26 May 2014 11:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 934166B6;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23006 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:57 +0400
Message-Id: <1401088811-22923-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PULL 09/23] arch_init: replace fprintf(stderr,
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
X-List-Received-Date: Mon, 26 May 2014 07:37:35 -0000

From: Le Tan <tamlokveer@gmail.com>

Replace fprintf(stderr,...) with error_report() in the file
arch_init.c. The trailing "\n"s of the @fmt argument have been removed
because @fmt of error_report() should not contain newline.

Signed-off-by: Le Tan <tamlokveer@gmail.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 arch_init.c |   32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 685ba0e..9f1a174 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -975,12 +975,12 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr=
, void *host)
     xh_len =3D qemu_get_be16(f);
=20
     if (xh_flags !=3D ENCODING_FLAG_XBZRLE) {
-        fprintf(stderr, "Failed to load XBZRLE page - wrong compression!=
\n");
+        error_report("Failed to load XBZRLE page - wrong compression!");
         return -1;
     }
=20
     if (xh_len > TARGET_PAGE_SIZE) {
-        fprintf(stderr, "Failed to load XBZRLE page - len overflow!\n");
+        error_report("Failed to load XBZRLE page - len overflow!");
         return -1;
     }
     /* load data and decode */
@@ -989,7 +989,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, =
void *host)
     /* decode RLE */
     if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
                              TARGET_PAGE_SIZE) =3D=3D -1) {
-        fprintf(stderr, "Failed to load XBZRLE page - decode error!\n");
+        error_report("Failed to load XBZRLE page - decode error!");
         return -1;
     }
=20
@@ -1006,7 +1006,7 @@ static inline void *host_from_stream_offset(QEMUFil=
e *f,
=20
     if (flags & RAM_SAVE_FLAG_CONTINUE) {
         if (!block) {
-            fprintf(stderr, "Ack, bad migration stream!\n");
+            error_report("Ack, bad migration stream!");
             return NULL;
         }
=20
@@ -1022,7 +1022,7 @@ static inline void *host_from_stream_offset(QEMUFil=
e *f,
             return memory_region_get_ram_ptr(block->mr) + offset;
     }
=20
-    fprintf(stderr, "Can't find block %s!\n", id);
+    error_report("Can't find block %s!", id);
     return NULL;
 }
=20
@@ -1075,10 +1075,9 @@ static int ram_load(QEMUFile *f, void *opaque, int=
 version_id)
                 QTAILQ_FOREACH(block, &ram_list.blocks, next) {
                     if (!strncmp(id, block->idstr, sizeof(id))) {
                         if (block->length !=3D length) {
-                            fprintf(stderr,
-                                    "Length mismatch: %s: " RAM_ADDR_FMT
-                                    " in !=3D " RAM_ADDR_FMT "\n", id, l=
ength,
-                                    block->length);
+                            error_report("Length mismatch: %s: " RAM_ADD=
R_FMT
+                                         " in !=3D " RAM_ADDR_FMT, id, l=
ength,
+                                         block->length);
                             ret =3D  -EINVAL;
                             goto done;
                         }
@@ -1087,8 +1086,8 @@ static int ram_load(QEMUFile *f, void *opaque, int =
version_id)
                 }
=20
                 if (!block) {
-                    fprintf(stderr, "Unknown ramblock \"%s\", cannot "
-                            "accept migration\n", id);
+                    error_report("Unknown ramblock \"%s\", cannot "
+                                 "accept migration", id);
                     ret =3D -EINVAL;
                     goto done;
                 }
@@ -1243,12 +1242,11 @@ void select_soundhw(const char *optarg)
=20
             if (!c->name) {
                 if (l > 80) {
-                    fprintf(stderr,
-                            "Unknown sound card name (too big to show)\n=
");
+                    error_report("Unknown sound card name (too big to sh=
ow)");
                 }
                 else {
-                    fprintf(stderr, "Unknown sound card name `%.*s'\n",
-                            (int) l, p);
+                    error_report("Unknown sound card name `%.*s'",
+                                 (int) l, p);
                 }
                 bad_card =3D 1;
             }
@@ -1271,13 +1269,13 @@ void audio_init(void)
         if (c->enabled) {
             if (c->isa) {
                 if (!isa_bus) {
-                    fprintf(stderr, "ISA bus not available for %s\n", c-=
>name);
+                    error_report("ISA bus not available for %s", c->name=
);
                     exit(1);
                 }
                 c->init.init_isa(isa_bus);
             } else {
                 if (!pci_bus) {
-                    fprintf(stderr, "PCI bus not available for %s\n", c-=
>name);
+                    error_report("PCI bus not available for %s", c->name=
);
                     exit(1);
                 }
                 c->init.init_pci(pci_bus);
--=20
1.7.10.4


