Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQnIy-0001cj-Kf
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 21:36:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIw-0001Ym-Ea
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQnIv-00049x-II
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 21:36:26 -0500
Received: from [59.151.112.132] (port=16963 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQnIr-00047e-Jx; Tue, 02 Feb 2016 21:36:21 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3256823"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2016 10:36:18 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 06143418AD4D;
	Wed,  3 Feb 2016 10:35:27 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Feb 2016 10:36:17 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 3 Feb 2016 10:36:35 +0800
Message-ID: <1454466995-14906-3-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1454466995-14906-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1454466995-14906-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 06143418AD4D.AA9FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 2/2] Passthru CCID card: QOMify
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
X-List-Received-Date: Wed, 03 Feb 2016 02:36:27 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/usb/ccid-card-passthru.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 9f49c05..858e78e 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -38,8 +38,6 @@ static const uint8_t DEFAULT_ATR[] = {
  0x13, 0x08
 };
 
-
-#define PASSTHRU_DEV_NAME "ccid-card-passthru"
 #define VSCARD_IN_SIZE 65536
 
 /* maximum size of ATR - from 7816-3 */
@@ -58,6 +56,10 @@ struct PassthruState {
     uint8_t  debug;
 };
 
+#define TYPE_CCID_PASSTHRU "ccid-card-passthru"
+#define PASSTHRU_CCID_CARD(obj) \
+    OBJECT_CHECK(PassthruState, (obj), TYPE_CCID_PASSTHRU)
+
 /*
  * VSCard protocol over chardev
  * This code should not depend on the card type.
@@ -316,7 +318,7 @@ static void ccid_card_vscard_event(void *opaque, int event)
 static void passthru_apdu_from_guest(
     CCIDCardState *base, const uint8_t *apdu, uint32_t len)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     if (!card->cs) {
         printf("ccid-passthru: no chardev, discarding apdu length %d\n", len);
@@ -327,7 +329,7 @@ static void passthru_apdu_from_guest(
 
 static const uint8_t *passthru_get_atr(CCIDCardState *base, uint32_t *len)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     *len = card->atr_length;
     return card->atr;
@@ -335,7 +337,7 @@ static const uint8_t *passthru_get_atr(CCIDCardState *base, uint32_t *len)
 
 static int passthru_initfn(CCIDCardState *base)
 {
-    PassthruState *card = DO_UPCAST(PassthruState, base, base);
+    PassthruState *card = PASSTHRU_CCID_CARD(base);
 
     card->vscard_in_pos = 0;
     card->vscard_in_hdr = 0;
@@ -399,7 +401,7 @@ static void passthru_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo passthru_card_info = {
-    .name          = PASSTHRU_DEV_NAME,
+    .name          = TYPE_CCID_PASSTHRU,
     .parent        = TYPE_CCID_CARD,
     .instance_size = sizeof(PassthruState),
     .class_init    = passthru_class_initfn,
-- 
2.1.0




