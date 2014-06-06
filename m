Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wsx4N-0004kT-Hg
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 12:32:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wsx4E-0004Zt-8G
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Wsx46-0002dO-IU
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 12:32:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Wsx3r-0002YV-B9; Fri, 06 Jun 2014 12:32:11 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56GWAC6002786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 6 Jun 2014 12:32:10 -0400
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s56GW8w7002888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 Jun 2014 12:32:10 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 22A4330403AF; Fri,  6 Jun 2014 18:32:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Jun 2014 18:32:08 +0200
Message-Id: <1402072328-6871-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, alevy@redhat.com
Subject: [Qemu-trivial] [PATCH] libcacard: Drop superfluous conditionals
	around g_free()
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
X-List-Received-Date: Fri, 06 Jun 2014 16:32:41 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 libcacard/cac.c            | 14 ++++----------
 libcacard/card_7816.c      | 12 +++---------
 libcacard/vcard.c          | 10 +++-------
 libcacard/vcard_emul_nss.c |  4 +---
 libcacard/vreader.c        |  4 +---
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
1.9.3


