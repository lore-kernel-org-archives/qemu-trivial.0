Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoFPk-00069e-Jr
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jun 2013 12:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uo8xI-00046t-V3
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 05:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uo8xH-0001bP-Pd
	for qemu-trivial@nongnu.org; Sun, 16 Jun 2013 05:09:00 -0400
Received: from [2a03:4000:2:362::1] (port=44420
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Uo8xF-0001b8-Jz; Sun, 16 Jun 2013 05:08:57 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 87169182F21; Sun, 16 Jun 2013 11:08:53 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 16 Jun 2013 11:08:52 +0200
Message-Id: <1371373732-12003-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
X-Mailman-Approved-At: Sun, 16 Jun 2013 12:02:47 -0400
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] libcacard: Fix cppcheck warning and remove
	unneeded code
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
X-List-Received-Date: Sun, 16 Jun 2013 09:09:02 -0000

The local function vcard_emul_alloc_arrays always returned PR_TRUE.
Therefore cppcheck complained about code which handled the
non-existent PR_FALSE case.

Remove the function's return value and the dead code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 libcacard/vcard_emul_nss.c |   22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 1a3e568..fb429b1 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -90,17 +90,13 @@ static int nss_emul_init;
 /*
  * allocate the set of arrays for certs, cert_len, key
  */
-static PRBool
+static void
 vcard_emul_alloc_arrays(unsigned char ***certsp, int **cert_lenp,
                         VCardKey ***keysp, int cert_count)
 {
-    *certsp = NULL;
-    *cert_lenp = NULL;
-    *keysp = NULL;
     *certsp = (unsigned char **)g_malloc(sizeof(unsigned char *)*cert_count);
     *cert_lenp = (int *)g_malloc(sizeof(int)*cert_count);
     *keysp = (VCardKey **)g_malloc(sizeof(VCardKey *)*cert_count);
-    return PR_TRUE;
 }
 
 /*
@@ -601,7 +597,6 @@ vcard_emul_mirror_card(VReader *vreader)
     int *cert_len;
     VCardKey **keys;
     PK11SlotInfo *slot;
-    PRBool ret;
     VCard *card;
 
     slot = vcard_emul_reader_get_slot(vreader);
@@ -627,10 +622,7 @@ vcard_emul_mirror_card(VReader *vreader)
     }
 
     /* allocate the arrays */
-    ret = vcard_emul_alloc_arrays(&certs, &cert_len, &keys, cert_count);
-    if (ret == PR_FALSE) {
-        return NULL;
-    }
+    vcard_emul_alloc_arrays(&certs, &cert_len, &keys, cert_count);
 
     /* fill in the arrays */
     cert_count = 0;
@@ -878,7 +870,7 @@ VCardEmulError
 vcard_emul_init(const VCardEmulOptions *options)
 {
     SECStatus rv;
-    PRBool ret, has_readers = PR_FALSE;
+    PRBool has_readers = PR_FALSE;
     VReader *vreader;
     VReaderEmul *vreader_emul;
     SECMODListLock *module_lock;
@@ -944,11 +936,9 @@ vcard_emul_init(const VCardEmulOptions *options)
         vreader_add_reader(vreader);
         cert_count = options->vreader[i].cert_count;
 
-        ret = vcard_emul_alloc_arrays(&certs, &cert_len, &keys,
-                                      options->vreader[i].cert_count);
-        if (ret == PR_FALSE) {
-            continue;
-        }
+        vcard_emul_alloc_arrays(&certs, &cert_len, &keys,
+                                options->vreader[i].cert_count);
+
         cert_count = 0;
         for (j = 0; j < options->vreader[i].cert_count; j++) {
             /* we should have a better way of identifying certs than by
-- 
1.7.10.4


