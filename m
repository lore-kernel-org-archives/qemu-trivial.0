Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btBIv-0003xz-7D
	for mharc-qemu-trivial@gnu.org; Sun, 09 Oct 2016 06:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bt2FO-0004zE-TO
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 20:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bt2FN-0007M6-Py
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 20:45:46 -0400
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243]:34002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>)
	id 1bt2FI-0007Kb-8d; Sat, 08 Oct 2016 20:45:40 -0400
Received: by mail-pa0-x243.google.com with SMTP id r9so4686447paz.1;
	Sat, 08 Oct 2016 17:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bvFpROJ6UKH2tEs0KvqsOaL28xkNEh9JM2dn6RHfuLE=;
	b=OaQv59u9e556cw0viYmrMAu0+MlbHcn3FCNcfQPNZdq0LggCjSMBw+O2rxfvheFhXm
	WDvsQvuylVCzosR+sFoiu7hsi0NH43QvvOaqOw4igDPZAoviTkAEhcULBeqYA7sldjXO
	8RyGx9IptUUqMcaUDPDOtTzE8C+t58ii5DfnnAue3cNNbqQJc9e8TedkAc6wWXsgG3tb
	BZ36RoLTCHWeUGb6WD2x6pUpUmRTcpn/pwXvB8bqbSSYfldp3BkpV2Xkea26iVQOqVND
	9A/I0eTMXCFoSwaexxVleUyWWc/4JzKFE+DXMtJvAmathdcdRigcHNBq6kZDn5+/SeQd
	GL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bvFpROJ6UKH2tEs0KvqsOaL28xkNEh9JM2dn6RHfuLE=;
	b=YVcDl5JU6EzYfukohCvX1Lr3Dw5sRXFri8X4NJ60onlYJy1CRCW9vMQaXavTnH4Pos
	MHz3X8WTfYdZ6CNBGDe61gjoUOLk9Du8+3NGUjZIyT9XZ8TnEjf8k1aWoFOWEil51TvC
	awytd2YyYnrBvrIHkgn6tUD574VRHSNlY1Gt28Hm8u6ZjODOrpztqhkrljhUzheS/DxU
	cJXnO/dBm/XQXybgen0UoVu+0dYH3//AXx8AHLn8SKFPkdoksW8yhYBao4kWQgziGkrU
	QaIelfCI/gSOzZdBIx4QHBNcWu1dG4pwV0niy2kgSo0imX2I+ZY0pEbX3+a9cp3y9Cj1
	WS3Q==
X-Gm-Message-State: AA6/9RmX9OX/7ckR/HHYSpCvmGxUyLrFAEbXQt8UbJPRQ3B8y7fQ1+WTlgaGDpHyrCOPqw==
X-Received: by 10.66.100.225 with SMTP id fb1mr43087379pab.4.1475973938096;
	Sat, 08 Oct 2016 17:45:38 -0700 (PDT)
Received: from akanksha.localdomain ([122.177.65.205])
	by smtp.gmail.com with ESMTPSA id
	g63sm23838912pfk.58.2016.10.08.17.45.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 08 Oct 2016 17:45:37 -0700 (PDT)
From: Akanksha Srivastava <akanksha.dlf@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Akanksha Srivastava <akanksha.dlf@gmail.com>
Date: Sun,  9 Oct 2016 06:08:39 +0530
Message-Id: <1475973519-9591-1-git-send-email-akanksha.dlf@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::243
X-Mailman-Approved-At: Sun, 09 Oct 2016 06:25:59 -0400
Subject: [Qemu-trivial] [PATCH v2] usb: Change *_exitfn return type from int
 to void
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
X-List-Received-Date: Sun, 09 Oct 2016 00:45:48 -0000

The *_exitfn functions cannot fail and should not be
returning int.
This also removes the passthru_exitfn since this callback
does nothing as of now.
This was suggested as a Bite-sized task for code cleanup.
Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
---
 hw/usb/ccid-card-emulated.c   |  3 +--
 hw/usb/ccid-card-passthru.c   |  7 +------
 hw/usb/ccid.h                 |  2 +-
 hw/usb/dev-smartcard-reader.c | 11 +++++------
 4 files changed, 8 insertions(+), 15 deletions(-)

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
index 2eacea7..9d64773 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -364,11 +364,6 @@ static int passthru_initfn(CCIDCardState *base)
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
@@ -395,7 +390,7 @@ static void passthru_class_initfn(ObjectClass *klass, void *data)
     CCIDCardClass *cc = CCID_CARD_CLASS(klass);
 
     cc->initfn = passthru_initfn;
-    cc->exitfn = passthru_exitfn;
+    cc->exitfn = NULL;
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
index af4b851..e1940ad 100644
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
1.9.1


