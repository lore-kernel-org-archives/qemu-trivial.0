Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WiQeV-0005CN-Bb
	for mharc-qemu-trivial@gnu.org; Thu, 08 May 2014 11:54:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WiQeP-00053c-7j
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 11:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WiQeK-0000dn-6Z
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 11:54:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WiQe9-0000aV-My; Thu, 08 May 2014 11:54:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A76A640BF8;
	Thu,  8 May 2014 19:54:07 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 84040661;
	Thu,  8 May 2014 19:54:07 +0400 (MSK)
Received: (nullmailer pid 19511 invoked by uid 1000);
	Thu, 08 May 2014 15:54:07 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 May 2014 19:54:07 +0400
Message-Id: <1399564447-19473-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alon Levy <alevy@redhat.com>
Subject: [Qemu-trivial] [PATCH] libcacard: g_malloc cleanups
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
X-List-Received-Date: Thu, 08 May 2014 15:54:30 -0000

This patch replaces g_malloc() in libcacard into g_new()
or g_new0() where appropriate (removing some init-to-zero
surrounding code), g_malloc+memcpy into g_memdup() and the
like.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/cac.c            |   11 +++--------
 libcacard/card_7816.c      |   11 +++++------
 libcacard/event.c          |    2 +-
 libcacard/vcard.c          |   22 +++++-----------------
 libcacard/vcard_emul_nss.c |   12 ++++++------
 libcacard/vreader.c        |   11 +++--------
 6 files changed, 23 insertions(+), 46 deletions(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index 74ef3e3..122129e 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -310,16 +310,11 @@ static VCardAppletPrivate *
 cac_new_pki_applet_private(const unsigned char *cert,
                            int cert_len, VCardKey *key)
 {
-    CACPKIAppletData *pki_applet_data = NULL;
-    VCardAppletPrivate *applet_private = NULL;
-    applet_private = (VCardAppletPrivate *)g_malloc(sizeof(VCardAppletPrivate));
+    CACPKIAppletData *pki_applet_data;
+    VCardAppletPrivate *applet_private;
 
+    applet_private = g_new0(VCardAppletPrivate, 1);
     pki_applet_data = &(applet_private->u.pki_data);
-    pki_applet_data->cert_buffer = NULL;
-    pki_applet_data->cert_buffer_len = 0;
-    pki_applet_data->sign_buffer = NULL;
-    pki_applet_data->sign_buffer_len = 0;
-    pki_applet_data->key = NULL;
     pki_applet_data->cert = (unsigned char *)g_malloc(cert_len+1);
     /*
      * if we want to support compression, then we simply change the 0 to a 1
diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index c28bb60..bca8c4a 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -51,7 +51,7 @@ vcard_response_new_data(unsigned char *buf, int len)
 {
     VCardResponse *new_response;
 
-    new_response = (VCardResponse *)g_malloc(sizeof(VCardResponse));
+    new_response = g_new(VCardResponse, 1);
     new_response->b_data = g_malloc(len + 2);
     memcpy(new_response->b_data, buf, len);
     new_response->b_total_len = len+2;
@@ -132,7 +132,7 @@ vcard_response_new_status(vcard_7816_status_t status)
 {
     VCardResponse *new_response;
 
-    new_response = (VCardResponse *)g_malloc(sizeof(VCardResponse));
+    new_response = g_new(VCardResponse, 1);
     new_response->b_data = &new_response->b_sw1;
     new_response->b_len = 0;
     new_response->b_total_len = 2;
@@ -149,7 +149,7 @@ vcard_response_new_status_bytes(unsigned char sw1, unsigned char sw2)
 {
     VCardResponse *new_response;
 
-    new_response = (VCardResponse *)g_malloc(sizeof(VCardResponse));
+    new_response = g_new(VCardResponse, 1);
     new_response->b_data = &new_response->b_sw1;
     new_response->b_len = 0;
     new_response->b_total_len = 2;
@@ -336,9 +336,8 @@ vcard_apdu_new(unsigned char *raw_apdu, int len, vcard_7816_status_t *status)
         return NULL;
     }
 
-    new_apdu = (VCardAPDU *)g_malloc(sizeof(VCardAPDU));
-    new_apdu->a_data = g_malloc(len);
-    memcpy(new_apdu->a_data, raw_apdu, len);
+    new_apdu = g_new(VCardAPDU, 1);
+    new_apdu->a_data = g_memdup(raw_apdu, len);
     new_apdu->a_len = len;
     *status = vcard_apdu_set_class(new_apdu);
     if (*status != VCARD7816_STATUS_SUCCESS) {
diff --git a/libcacard/event.c b/libcacard/event.c
index 2d7500f..a2e6c7d 100644
--- a/libcacard/event.c
+++ b/libcacard/event.c
@@ -17,7 +17,7 @@ vevent_new(VEventType type, VReader *reader, VCard *card)
 {
     VEvent *new_vevent;
 
-    new_vevent = (VEvent *)g_malloc(sizeof(VEvent));
+    new_vevent = g_new(VEvent, 1);
     new_vevent->next = NULL;
     new_vevent->type = type;
     new_vevent->reader = vreader_reference(reader);
diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index 539177b..227e477 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -37,9 +37,8 @@ vcard_buffer_response_new(unsigned char *buffer, int size)
 {
     VCardBufferResponse *new_buffer;
 
-    new_buffer = (VCardBufferResponse *)g_malloc(sizeof(VCardBufferResponse));
-    new_buffer->buffer = (unsigned char *)g_malloc(size);
-    memcpy(new_buffer->buffer, buffer, size);
+    new_buffer = g_new(VCardBufferResponse, 1);
+    new_buffer->buffer = (unsigned char *)g_memdup(buffer, size);
     new_buffer->buffer_len = size;
     new_buffer->current = new_buffer->buffer;
     new_buffer->len = size;
@@ -102,15 +101,11 @@ vcard_new_applet(VCardProcessAPDU applet_process_function,
 {
     VCardApplet *applet;
 
-    applet = (VCardApplet *)g_malloc(sizeof(VCardApplet));
-    applet->next = NULL;
-    applet->applet_private = NULL;
-    applet->applet_private_free = NULL;
+    applet = g_new0(VCardApplet, 1);
     applet->process_apdu = applet_process_function;
     applet->reset_applet = applet_reset_function;
 
-    applet->aid = g_malloc(aid_len);
-    memcpy(applet->aid, aid, aid_len);
+    applet->aid = g_memdup(aid, aid_len);
     applet->aid_len = aid_len;
     return applet;
 }
@@ -149,18 +144,11 @@ VCard *
 vcard_new(VCardEmul *private, VCardEmulFree private_free)
 {
     VCard *new_card;
-    int i;
 
-    new_card = (VCard *)g_malloc(sizeof(VCard));
-    new_card->applet_list = NULL;
-    for (i = 0; i < MAX_CHANNEL; i++) {
-        new_card->current_applet[i] = NULL;
-    }
-    new_card->vcard_buffer_response = NULL;
+    new_card = g_new0(VCard, 1);
     new_card->type = VCARD_VM;
     new_card->vcard_private = private;
     new_card->vcard_private_free = private_free;
-    new_card->vcard_get_atr = NULL;
     new_card->reference_count = 1;
     return new_card;
 }
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index e2b196d..75b9d79 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -94,9 +94,9 @@ static void
 vcard_emul_alloc_arrays(unsigned char ***certsp, int **cert_lenp,
                         VCardKey ***keysp, int cert_count)
 {
-    *certsp = (unsigned char **)g_malloc(sizeof(unsigned char *)*cert_count);
-    *cert_lenp = (int *)g_malloc(sizeof(int)*cert_count);
-    *keysp = (VCardKey **)g_malloc(sizeof(VCardKey *)*cert_count);
+    *certsp = g_new(unsigned char *, cert_count);
+    *cert_lenp = g_new(int, cert_count);
+    *keysp = g_new(VCardKey *, cert_count);
 }
 
 /*
@@ -139,7 +139,7 @@ vcard_emul_make_key(PK11SlotInfo *slot, CERTCertificate *cert)
 {
     VCardKey *key;
 
-    key = (VCardKey *)g_malloc(sizeof(VCardKey));
+    key = g_new(VCardKey, 1);
     key->slot = PK11_ReferenceSlot(slot);
     key->cert = CERT_DupCertificate(cert);
     /* NOTE: if we aren't logged into the token, this could return NULL */
@@ -449,7 +449,7 @@ vreader_emul_new(PK11SlotInfo *slot, VCardEmulType type, const char *params)
 {
     VReaderEmul *new_reader_emul;
 
-    new_reader_emul = (VReaderEmul *)g_malloc(sizeof(VReaderEmul));
+    new_reader_emul = g_new(VReaderEmul, 1);
 
     new_reader_emul->slot = PK11_ReferenceSlot(slot);
     new_reader_emul->default_type = type;
@@ -1189,7 +1189,7 @@ vcard_emul_options(const char *args)
                 g_strndup(type_params, type_params_length);
             count = count_tokens(args, ',', ')') + 1;
             vreaderOpt->cert_count = count;
-            vreaderOpt->cert_name = (char **)g_malloc(count*sizeof(char *));
+            vreaderOpt->cert_name = g_new(char *, count);
             for (i = 0; i < count; i++) {
                 const char *cert = args;
                 args = strpbrk(args, ",)");
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 7720295..9304a28 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -115,7 +115,7 @@ vreader_new(const char *name, VReaderEmul *private,
 {
     VReader *reader;
 
-    reader = (VReader *)g_malloc(sizeof(VReader));
+    reader = g_new(VReader, 1);
     qemu_mutex_init(&reader->lock);
     reader->reference_count = 1;
     reader->name = g_strdup(name);
@@ -312,10 +312,7 @@ vreader_list_entry_new(VReader *reader)
 {
     VReaderListEntry *new_reader_list_entry;
 
-    new_reader_list_entry = (VReaderListEntry *)
-                               g_malloc(sizeof(VReaderListEntry));
-    new_reader_list_entry->next = NULL;
-    new_reader_list_entry->prev = NULL;
+    new_reader_list_entry = g_new0(VReaderListEntry, 1);
     new_reader_list_entry->reader = vreader_reference(reader);
     return new_reader_list_entry;
 }
@@ -336,9 +333,7 @@ vreader_list_new(void)
 {
     VReaderList *new_reader_list;
 
-    new_reader_list = (VReaderList *)g_malloc(sizeof(VReaderList));
-    new_reader_list->head = NULL;
-    new_reader_list->tail = NULL;
+    new_reader_list = g_new0(VReaderList, 1);
     return new_reader_list;
 }
 
-- 
1.7.10.4


