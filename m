Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopTX-0003Fa-Uv
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:37:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTR-00032d-3D
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopTM-0003s0-4d
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:37:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopT3-0003mc-WA; Mon, 26 May 2014 03:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D5E042FAA;
	Mon, 26 May 2014 11:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0FF0D6BA;
	Mon, 26 May 2014 11:20:16 +0400 (MSK)
Received: (nullmailer pid 23040 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:11 +0400
Message-Id: <1401088811-22923-24-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 23/23] libcacard: remove useless initializers
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
X-List-Received-Date: Mon, 26 May 2014 07:37:38 -0000

libcacard has many functions which initializes local variables
at declaration time, which are always assigned some values later
(often right after declaration).  Clean up these initializers.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/cac.c            |   14 +++++++-------
 libcacard/card_7816.c      |    5 ++---
 libcacard/vcard.c          |    4 ++--
 libcacard/vcard_emul_nss.c |    6 +++---
 libcacard/vreader.c        |   10 +++++-----
 libcacard/vscclient.c      |    4 ++--
 6 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index 3887896..0a0163d 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -93,8 +93,8 @@ cac_common_process_apdu(VCard *card, VCardAPDU *apdu, VCardResponse **response)
 static VCardStatus
 cac_applet_pki_reset(VCard *card, int channel)
 {
-    VCardAppletPrivate *applet_private = NULL;
-    CACPKIAppletData *pki_applet = NULL;
+    VCardAppletPrivate *applet_private;
+    CACPKIAppletData *pki_applet;
     applet_private = vcard_get_current_applet_private(card, channel);
     assert(applet_private);
     pki_applet = &(applet_private->u.pki_data);
@@ -113,8 +113,8 @@ static VCardStatus
 cac_applet_pki_process_apdu(VCard *card, VCardAPDU *apdu,
                             VCardResponse **response)
 {
-    CACPKIAppletData *pki_applet = NULL;
-    VCardAppletPrivate *applet_private = NULL;
+    CACPKIAppletData *pki_applet;
+    VCardAppletPrivate *applet_private;
     int size, next;
     unsigned char *sign_buffer;
     vcard_7816_status_t status;
@@ -279,7 +279,7 @@ cac_applet_container_process_apdu(VCard *card, VCardAPDU *apdu,
 static void
 cac_delete_pki_applet_private(VCardAppletPrivate *applet_private)
 {
-    CACPKIAppletData *pki_applet_data = NULL;
+    CACPKIAppletData *pki_applet_data;
 
     if (applet_private == NULL) {
         return;
@@ -327,8 +327,8 @@ static VCardApplet *
 cac_new_pki_applet(int i, const unsigned char *cert,
                    int cert_len, VCardKey *key)
 {
-    VCardAppletPrivate *applet_private = NULL;
-    VCardApplet *applet = NULL;
+    VCardAppletPrivate *applet_private;
+    VCardApplet *applet;
     unsigned char pki_aid[] = { 0xa0, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00 };
     int pki_aid_len = sizeof(pki_aid);
 
diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index bca8c4a..a54f880 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -416,7 +416,7 @@ VCARD_RESPONSE_NEW_STATIC_STATUS(VCARD7816_STATUS_ERROR_GENERAL)
 VCardResponse *
 vcard_make_response(vcard_7816_status_t status)
 {
-    VCardResponse *response = NULL;
+    VCardResponse *response;
 
     switch (status) {
     /* known 7816 response codes */
@@ -543,9 +543,8 @@ vcard_make_response(vcard_7816_status_t status)
             return VCARD_RESPONSE_GET_STATIC(
                         VCARD7816_STATUS_EXC_ERROR_MEMORY_FAILURE);
         }
+        return response;
     }
-    assert(response);
-    return response;
 }
 
 /*
diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index 227e477..6aaf085 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -166,8 +166,8 @@ vcard_reference(VCard *vcard)
 void
 vcard_free(VCard *vcard)
 {
-    VCardApplet *current_applet = NULL;
-    VCardApplet *next_applet = NULL;
+    VCardApplet *current_applet;
+    VCardApplet *next_applet;
 
     if (vcard == NULL) {
         return;
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 8462aef..cefc383 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -367,7 +367,7 @@ vcard_7816_status_t
 vcard_emul_login(VCard *card, unsigned char *pin, int pin_len)
 {
     PK11SlotInfo *slot;
-    unsigned char *pin_string = NULL;
+    unsigned char *pin_string;
     int i;
     SECStatus rv;
 
@@ -423,7 +423,7 @@ static VReader *
 vcard_emul_find_vreader_from_slot(PK11SlotInfo *slot)
 {
     VReaderList *reader_list = vreader_get_reader_list();
-    VReaderListEntry *current_entry = NULL;
+    VReaderListEntry *current_entry;
 
     if (reader_list == NULL) {
         return NULL;
@@ -1047,7 +1047,7 @@ void
 vcard_emul_replay_insertion_events(void)
 {
     VReaderListEntry *current_entry;
-    VReaderListEntry *next_entry = NULL;
+    VReaderListEntry *next_entry;
     VReaderList *list = vreader_get_reader_list();
 
     for (current_entry = vreader_list_get_first(list); current_entry;
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index f1288d9..d2a9b7d 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -339,7 +339,7 @@ void
 vreader_list_delete(VReaderList *list)
 {
     VReaderListEntry *current_entry;
-    VReaderListEntry *next_entry = NULL;
+    VReaderListEntry *next_entry;
     for (current_entry = vreader_list_get_first(list); current_entry;
          current_entry = next_entry) {
         next_entry = vreader_list_get_next(current_entry);
@@ -430,8 +430,8 @@ vreader_list_unlock(void)
 static VReaderList *
 vreader_copy_list(VReaderList *list)
 {
-    VReaderList *new_list = NULL;
-    VReaderListEntry *current_entry = NULL;
+    VReaderList *new_list;
+    VReaderListEntry *current_entry;
 
     new_list = vreader_list_new();
     if (new_list == NULL) {
@@ -463,7 +463,7 @@ VReader *
 vreader_get_reader_by_id(vreader_id_t id)
 {
     VReader *reader = NULL;
-    VReaderListEntry *current_entry = NULL;
+    VReaderListEntry *current_entry;
 
     if (id == (vreader_id_t) -1) {
         return NULL;
@@ -487,7 +487,7 @@ VReader *
 vreader_get_reader_by_name(const char *name)
 {
     VReader *reader = NULL;
-    VReaderListEntry *current_entry = NULL;
+    VReaderListEntry *current_entry;
 
     vreader_list_lock();
     for (current_entry = vreader_list_get_first(vreader_list); current_entry;
diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index f2a753a..6693900 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -131,8 +131,8 @@ static void *
 event_thread(void *arg)
 {
     unsigned char atr[MAX_ATR_LEN];
-    int atr_len = MAX_ATR_LEN;
-    VEvent *event = NULL;
+    int atr_len;
+    VEvent *event;
     unsigned int reader_id;
 
 
-- 
1.7.10.4


