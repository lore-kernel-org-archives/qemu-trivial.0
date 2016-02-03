Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQnJ0-0001h5-Gf
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 21:36:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIw-0001Zb-Un
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIv-0004A9-Lz
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:26 -0500
Received: from [59.151.112.132] (port=7995 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQnIs-00048b-DL; Tue, 02 Feb 2016 21:36:23 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3256824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2016 10:36:18 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 51FE541896FB;
	Wed,  3 Feb 2016 10:35:26 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Feb 2016 10:36:17 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 3 Feb 2016 10:36:34 +0800
Message-ID: <1454466995-14906-2-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1454466995-14906-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1454466995-14906-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 51FE541896FB.ABC74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/2] Emulated CCID card: QOMify
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
X-List-Received-Date: Wed, 03 Feb 2016 02:36:28 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/usb/ccid-card-emulated.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 869a63c..fe9ec5c 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -42,7 +42,10 @@ do {\
     } \
 } while (0)
 
-#define EMULATED_DEV_NAME "ccid-card-emulated"
+
+#define TYPE_EMULATED_CCID "ccid-card-emulated"
+#define EMULATED_CCID_CARD(obj) \
+    OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)
 
 #define BACKEND_NSS_EMULATED_NAME "nss-emulated"
 #define BACKEND_CERTIFICATES_NAME "certificates"
@@ -133,7 +136,7 @@ struct EmulatedState {
 static void emulated_apdu_from_guest(CCIDCardState *base,
     const uint8_t *apdu, uint32_t len)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent) + len);
 
     assert(event);
@@ -150,7 +153,7 @@ static void emulated_apdu_from_guest(CCIDCardState *base,
 
 static const uint8_t *emulated_get_atr(CCIDCardState *base, uint32_t *len)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
 
     *len = card->atr_length;
     return card->atr;
@@ -478,7 +481,7 @@ static uint32_t parse_enumeration(char *str,
 
 static int emulated_initfn(CCIDCardState *base)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     VCardEmulError ret;
     const EnumTable *ptable;
 
@@ -514,26 +517,26 @@ static int emulated_initfn(CCIDCardState *base)
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
@@ -545,7 +548,7 @@ static int emulated_initfn(CCIDCardState *base)
 
 static int emulated_exitfn(CCIDCardState *base)
 {
-    EmulatedState *card = DO_UPCAST(EmulatedState, base, base);
+    EmulatedState *card = EMULATED_CCID_CARD(base);
     VEvent *vevent = vevent_new(VEVENT_LAST, NULL, NULL);
 
     vevent_queue_vevent(vevent); /* stop vevent thread */
@@ -588,7 +591,7 @@ static void emulated_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo emulated_card_info = {
-    .name          = EMULATED_DEV_NAME,
+    .name          = TYPE_EMULATED_CCID,
     .parent        = TYPE_CCID_CARD,
     .instance_size = sizeof(EmulatedState),
     .class_init    = emulated_class_initfn,
-- 
2.1.0




