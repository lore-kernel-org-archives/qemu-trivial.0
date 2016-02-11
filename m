Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqLR-0006QU-1M
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:27:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLM-0006IO-TZ
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLL-000075-Qf
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqLG-00005L-7J; Thu, 11 Feb 2016 07:27:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6DE3B41458;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 878E1A98;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: (nullmailer pid 11191 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:59 +0300
Message-Id: <35997599aa3b772db9b2f38e3aa137e6f27f25f1.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/14] Emulated CCID card: QOMify
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
X-List-Received-Date: Thu, 11 Feb 2016 12:27:34 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/ccid-card-emulated.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 6893028..9ddd5ad 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -43,7 +43,10 @@ do {\
     } \
 } while (0)
 
-#define EMULATED_DEV_NAME "ccid-card-emulated"
+
+#define TYPE_EMULATED_CCID "ccid-card-emulated"
+#define EMULATED_CCID_CARD(obj) \
+    OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)
 
 #define BACKEND_NSS_EMULATED_NAME "nss-emulated"
 #define BACKEND_CERTIFICATES_NAME "certificates"
@@ -134,7 +137,7 @@ struct EmulatedState {
 static void emulated_apdu_from_guest(CCIDCardState *base,
     const uint8_t *apdu, uint32_t len)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent) + len);
 
     assert(event);
@@ -151,7 +154,7 @@ static void emulated_apdu_from_guest(CCIDCardState *base,
 
 static const uint8_t *emulated_get_atr(CCIDCardState *base, uint32_t *len)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
 
     *len = card->atr_length;
     return card->atr;
@@ -479,7 +482,7 @@ static uint32_t parse_enumeration(char *str,
 
 static int emulated_initfn(CCIDCardState *base)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     VCardEmulError ret;
     const EnumTable *ptable;
 
@@ -515,26 +518,26 @@ static int emulated_initfn(CCIDCardState *base)
             ret = emulated_initialize_vcard_from_certificates(card);
         } else {
             printf("%s: you must provide all three certs for"
-                   " certificates backend\n", EMULATED_DEV_NAME);
+                   " certificates backend\n", TYPE_EMULATED_CCID);
             return -1;
         }
     } else {
         if (card->backend != BACKEND_NSS_EMULATED) {
             printf("%s: bad backend specified. The options are:\n%s (default),"
-                " %s.\n", EMULATED_DEV_NAME, BACKEND_NSS_EMULATED_NAME,
+                " %s.\n", TYPE_EMULATED_CCID, BACKEND_NSS_EMULATED_NAME,
                 BACKEND_CERTIFICATES_NAME);
             return -1;
         }
         if (card->cert1 != NULL || card->cert2 != NULL || card->cert3 != NULL) {
             printf("%s: unexpected cert parameters to nss emulated backend\n",
-                   EMULATED_DEV_NAME);
+                   TYPE_EMULATED_CCID);
             return -1;
         }
         /* default to mirroring the local hardware readers */
         ret = wrap_vcard_emul_init(NULL);
     }
     if (ret != VCARD_EMUL_OK) {
-        printf("%s: failed to initialize vcard\n", EMULATED_DEV_NAME);
+        printf("%s: failed to initialize vcard\n", TYPE_EMULATED_CCID);
         return -1;
     }
     qemu_thread_create(&card->event_thread_id, "ccid/event", event_thread,
@@ -546,7 +549,7 @@ static int emulated_initfn(CCIDCardState *base)
 
 static int emulated_exitfn(CCIDCardState *base)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     VEvent *vevent = vevent_new(VEVENT_LAST, NULL, NULL);
 
     vevent_queue_vevent(vevent); /* stop vevent thread */
@@ -589,7 +592,7 @@ static void emulated_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo emulated_card_info = {
-    .name          = EMULATED_DEV_NAME,
+    .name          = TYPE_EMULATED_CCID,
     .parent        = TYPE_CCID_CARD,
     .instance_size = sizeof(EmulatedState),
     .class_init    = emulated_class_initfn,
-- 
2.1.4


