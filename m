Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c092Z-0001wc-5q
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:25:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092V-0001sP-U0
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0007uF-6E
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c092P-0007qv-9e; Fri, 28 Oct 2016 11:25:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3798F43733;
	Fri, 28 Oct 2016 18:25:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DC1C5B54;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6071 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Akanksha Srivastava <akanksha.dlf@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:44 +0300
Message-Id: <73f7fd8861ef4abeec0fea775f607d232a56962a.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/23] usb: Change *_exitfn return type from
 int to void
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 15:25:53 -0000

From: Akanksha Srivastava <akanksha.dlf@gmail.com>

The *_exitfn functions cannot fail and should not be
returning int.
This also removes the passthru_exitfn since this callback
does nothing as of now.
This was suggested as a Bite-sized task for code cleanup.
Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/ccid-card-emulated.c   |  3 +--
 hw/usb/ccid-card-passthru.c   |  6 ------
 hw/usb/ccid.h                 |  2 +-
 hw/usb/dev-smartcard-reader.c | 11 +++++------
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 3213f9f..eceb5f3 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -547,7 +547,7 @@ static int emulated_initfn(CCIDCardState *base)
     return 0;
 }
 
-static int emulated_exitfn(CCIDCardState *base)
+static void emulated_exitfn(CCIDCardState *base)
 {
     EmulatedState *card = EMULATED_CCID_CARD(base);
     VEvent *vevent = vevent_new(VEVENT_LAST, NULL, NULL);
@@ -564,7 +564,6 @@ static int emulated_exitfn(CCIDCardState *base)
     qemu_mutex_destroy(&card->handle_apdu_mutex);
     qemu_mutex_destroy(&card->vreader_mutex);
     qemu_mutex_destroy(&card->event_list_mutex);
-    return 0;
 }
 
 static Property emulated_card_properties[] = {
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 325129a..88cb6d8 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -365,11 +365,6 @@ static int passthru_initfn(CCIDCardState *base)
     return 0;
 }
 
-static int passthru_exitfn(CCIDCardState *base)
-{
-    return 0;
-}
-
 static VMStateDescription passthru_vmstate = {
     .name = "ccid-card-passthru",
     .version_id = 1,
@@ -396,7 +391,6 @@ static void passthru_class_initfn(ObjectClass *klass, void *data)
     CCIDCardClass *cc = CCID_CARD_CLASS(klass);
 
     cc->initfn = passthru_initfn;
-    cc->exitfn = passthru_exitfn;
     cc->get_atr = passthru_get_atr;
     cc->apdu_from_guest = passthru_apdu_from_guest;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
diff --git a/hw/usb/ccid.h b/hw/usb/ccid.h
index 9334da8..1f07011 100644
--- a/hw/usb/ccid.h
+++ b/hw/usb/ccid.h
@@ -33,7 +33,7 @@ typedef struct CCIDCardClass {
     void (*apdu_from_guest)(CCIDCardState *card,
                             const uint8_t *apdu,
                             uint32_t len);
-    int (*exitfn)(CCIDCardState *card);
+    void (*exitfn)(CCIDCardState *card);
     int (*initfn)(CCIDCardState *card);
 } CCIDCardClass;
 
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index af4b851..89e11b6 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -508,14 +508,14 @@ static void ccid_card_apdu_from_guest(CCIDCardState *card,
     }
 }
 
-static int ccid_card_exitfn(CCIDCardState *card)
+static void ccid_card_exitfn(CCIDCardState *card)
 {
     CCIDCardClass *cc = CCID_CARD_GET_CLASS(card);
 
     if (cc->exitfn) {
-        return cc->exitfn(card);
+        cc->exitfn(card);
     }
-    return 0;
+
 }
 
 static int ccid_card_initfn(CCIDCardState *card)
@@ -1279,7 +1279,6 @@ void ccid_card_card_inserted(CCIDCardState *card)
 
 static int ccid_card_exit(DeviceState *qdev)
 {
-    int ret = 0;
     CCIDCardState *card = CCID_CARD(qdev);
     USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
@@ -1287,9 +1286,9 @@ static int ccid_card_exit(DeviceState *qdev)
     if (ccid_card_inserted(s)) {
         ccid_card_card_removed(card);
     }
-    ret = ccid_card_exitfn(card);
+    ccid_card_exitfn(card);
     s->card = NULL;
-    return ret;
+    return 0;
 }
 
 static int ccid_card_init(DeviceState *qdev)
-- 
2.1.4


