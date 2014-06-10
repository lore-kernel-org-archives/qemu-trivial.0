Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOke-0002U2-S8
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkX-0002FH-4t
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkR-0003i2-Cy
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41675)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkE-0003fC-JB; Tue, 10 Jun 2014 12:17:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AE43C412C2;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AE8636D5;
	Tue, 10 Jun 2014 20:08:50 +0400 (MSK)
Received: (nullmailer pid 13334 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:39 +0400
Message-Id: <1402416523-13212-22-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 21/25] libcacard: Drop superfluous
	conditionals around g_free()
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:19 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/cac.c            |   14 ++++----------
 libcacard/card_7816.c      |   12 +++---------
 libcacard/vcard.c          |   10 +++-------
 libcacard/vcard_emul_nss.c |    4 +---
 libcacard/vreader.c        |    4 +---
 5 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index 0a0163d..ae8c378 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -100,10 +100,8 @@ cac_applet_pki_reset(VCard *card, int channel)
     pki_applet = &(applet_private->u.pki_data);
 
     pki_applet->cert_buffer = NULL;
-    if (pki_applet->sign_buffer) {
-        g_free(pki_applet->sign_buffer);
-        pki_applet->sign_buffer = NULL;
-    }
+    g_free(pki_applet->sign_buffer);
+    pki_applet->sign_buffer = NULL;
     pki_applet->cert_buffer_len = 0;
     pki_applet->sign_buffer_len = 0;
     return VCARD_DONE;
@@ -285,12 +283,8 @@ cac_delete_pki_applet_private(VCardAppletPrivate *applet_private)
         return;
     }
     pki_applet_data = &(applet_private->u.pki_data);
-    if (pki_applet_data->cert != NULL) {
-        g_free(pki_applet_data->cert);
-    }
-    if (pki_applet_data->sign_buffer != NULL) {
-        g_free(pki_applet_data->sign_buffer);
-    }
+    g_free(pki_applet_data->cert);
+    g_free(pki_applet_data->sign_buffer);
     if (pki_applet_data->key != NULL) {
         vcard_emul_delete_key(pki_applet_data->key);
     }
diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index a54f880..814fa16 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -172,16 +172,12 @@ vcard_response_delete(VCardResponse *response)
     switch (response->b_type) {
     case VCARD_MALLOC:
         /* everything was malloc'ed */
-        if (response->b_data) {
-            g_free(response->b_data);
-        }
+        g_free(response->b_data);
         g_free(response);
         break;
     case VCARD_MALLOC_DATA:
         /* only the data buffer was malloc'ed */
-        if (response->b_data) {
-            g_free(response->b_data);
-        }
+        g_free(response->b_data);
         break;
     case VCARD_MALLOC_STRUCT:
         /* only the structure was malloc'ed */
@@ -358,9 +354,7 @@ vcard_apdu_delete(VCardAPDU *apdu)
     if (apdu == NULL) {
         return;
     }
-    if (apdu->a_data) {
-        g_free(apdu->a_data);
-    }
+    g_free(apdu->a_data);
     g_free(apdu);
 }
 
diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index 6aaf085..bf342aa 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -51,9 +51,7 @@ vcard_buffer_response_delete(VCardBufferResponse *buffer_response)
     if (buffer_response == NULL) {
         return;
     }
-    if (buffer_response->buffer) {
-        g_free(buffer_response->buffer);
-    }
+    g_free(buffer_response->buffer);
     g_free(buffer_response);
 }
 
@@ -121,10 +119,8 @@ vcard_delete_applet(VCardApplet *applet)
         applet->applet_private_free(applet->applet_private);
         applet->applet_private = NULL;
     }
-    if (applet->aid) {
-        g_free(applet->aid);
-        applet->aid = NULL;
-    }
+    g_free(applet->aid);
+    applet->aid = NULL;
     g_free(applet);
 }
 
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index cefc383..f1bba57 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -471,9 +471,7 @@ vreader_emul_delete(VReaderEmul *vreader_emul)
     if (vreader_emul->slot) {
         PK11_FreeSlot(vreader_emul->slot);
     }
-    if (vreader_emul->type_params) {
-        g_free(vreader_emul->type_params);
-    }
+    g_free(vreader_emul->type_params);
     g_free(vreader_emul);
 }
 
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index d2a9b7d..ffa05b6 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -155,9 +155,7 @@ vreader_free(VReader *reader)
     if (reader->card) {
         vcard_free(reader->card);
     }
-    if (reader->name) {
-        g_free(reader->name);
-    }
+    g_free(reader->name);
     if (reader->reader_private_free) {
         reader->reader_private_free(reader->reader_private);
     }
-- 
1.7.10.4


