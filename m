Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqDb-0001CE-9K
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:19:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqDX-00012u-0R
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:19:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqDR-0006FK-Op
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:19:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqDN-0006CG-Ag; Thu, 11 Feb 2016 07:19:17 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E9AC041456;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0F524A8A;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: (nullmailer pid 11193 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:19:00 +0300
Message-Id: <059db2041954766d2f9fd83f51a732a372076937.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/14] Passthru CCID card: QOMify
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
X-List-Received-Date: Thu, 11 Feb 2016 12:19:29 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/ccid-card-passthru.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 2e4d95f..c0e90e5 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -39,8 +39,6 @@ static const uint8_t DEFAULT_ATR[] = {
  0x13, 0x08
 };
 
-
-#define PASSTHRU_DEV_NAME "ccid-card-passthru"
 #define VSCARD_IN_SIZE 65536
 
 /* maximum size of ATR - from 7816-3 */
@@ -59,6 +57,10 @@ struct PassthruState {
     uint8_t  debug;
 };
 
+#define TYPE_CCID_PASSTHRU "ccid-card-passthru"
+#define PASSTHRU_CCID_CARD(obj) \
+    OBJECT_CHECK(PassthruState, (obj), TYPE_CCID_PASSTHRU)
+
 /*
  * VSCard protocol over chardev
  * This code should not depend on the card type.
@@ -317,7 +319,7 @@ static void ccid_card_vscard_event(void *opaque, int event)
 static void passthru_apdu_from_guest(
     CCIDCardState *base, const uint8_t *apdu, uint32_t len)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     if (!card->cs) {
         printf("ccid-passthru: no chardev, discarding apdu length %d\n", len);
@@ -328,7 +330,7 @@ static void passthru_apdu_from_guest(
 
 static const uint8_t *passthru_get_atr(CCIDCardState *base, uint32_t *len)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     *len = card->atr_length;
     return card->atr;
@@ -336,7 +338,7 @@ static const uint8_t *passthru_get_atr(CCIDCardState *base, uint32_t *len)
 
 static int passthru_initfn(CCIDCardState *base)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     card->vscard_in_pos = 0;
     card->vscard_in_hdr = 0;
@@ -400,7 +402,7 @@ static void passthru_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo passthru_card_info = {
-    .name          = PASSTHRU_DEV_NAME,
+    .name          = TYPE_CCID_PASSTHRU,
     .parent        = TYPE_CCID_CARD,
     .instance_size = sizeof(PassthruState),
     .class_init    = passthru_class_initfn,
-- 
2.1.4


