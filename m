Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bumVv-0007m3-RE
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 16:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bumVt-0007jR-3n
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 16:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>) id 1bumVr-0006Wd-KP
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 16:22:01 -0400
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:36459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akanksha.dlf@gmail.com>)
	id 1bumVk-0006UB-0v; Thu, 13 Oct 2016 16:21:52 -0400
Received: by mail-pa0-x241.google.com with SMTP id os4so1118092pac.3;
	Thu, 13 Oct 2016 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T7pIJo4yfFL0M0vwzMSJEibHwAWkIYNILwTo1j7hsmc=;
	b=AL4l7N0x1CVKVgEBISp32pk+os6b/9l1xuQAXjcXkCBQXg64q6Bgunf1VXzUtjoZoV
	/VDlLsywmKpgjGDn+xuO+kbuYzsx8pOEpetDOeK7azqNz62lBwifZkmCZ08+sg/NoNDX
	S8//wL8xlcg7pi3bqOYPeOf1cuNtYP4E8fCWXsPQ/6WQs8IYPpcg4/ikfTGuVnsDKpez
	v8hul/kpDgyrih39HZPHftRaE1zrMtKRrptAfYn/lxlzWUrTzihCMogSd90CHbuuJ/Ba
	KfnXh7FZjKvDQx7XcLYTX+jL9tyFVUPSEicQg4ztT39R8l/0A9QhjiffG411SjNcNgYu
	f7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T7pIJo4yfFL0M0vwzMSJEibHwAWkIYNILwTo1j7hsmc=;
	b=R+UKsYfdIcBhDZDTZdXUt5W0GoK+hgFwAEQgs3/nHp3NTWR4rrc5NqJq+FAgG82Qlh
	3tATENuajvlgJwFFJk98pk0fxvTqZVhPNqSu5rgdyjCVo2FRpPGbvZTvyMIhA2bBhhod
	MEVoWCyUkDnh77kYX67kiNGgRh908WcAN3Pg5OpW2oMqWweYvgVo2CoN0eAIVC59uxke
	4M4+ucyRPCyfP68LCXyXolLb8kuYZcKUGiVxnedWd4Rte9fWFyIhkt9B4PTzb4pzViyi
	lTODfRLyDGUD3D/BlOMDMuMMTHA8Hq/XSkmpSRkdr18DS7G0MueTxKQxSjgb1edxIxXa
	EsmA==
X-Gm-Message-State: AA6/9RnRdPerCxEFukerWe+6UyrocD5rxYbyWykeWx9N0ky8XQYEiqv8M5dqtQqxxlugUA==
X-Received: by 10.66.27.230 with SMTP id w6mr10503949pag.199.1476390111059;
	Thu, 13 Oct 2016 13:21:51 -0700 (PDT)
Received: from akanksha.iiit.ac.in ([14.139.82.6])
	by smtp.gmail.com with ESMTPSA id
	bx5sm21716514pad.6.2016.10.13.13.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 13:21:50 -0700 (PDT)
From: Akanksha Srivastava <akanksha.dlf@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Akanksha Srivastava <akanksha.dlf@gmail.com>
Date: Fri, 14 Oct 2016 01:51:31 +0530
Message-Id: <1476390091-6741-1-git-send-email-akanksha.dlf@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
Subject: [Qemu-trivial] [PATCH v3] usb: Change *_exitfn return type from int
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
X-List-Received-Date: Thu, 13 Oct 2016 20:22:02 -0000

The *_exitfn functions cannot fail and should not be
returning int.
This also removes the passthru_exitfn since this callback
does nothing as of now.
This was suggested as a Bite-sized task for code cleanup.
Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
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
index 2eacea7..7209f73 100644
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
@@ -395,7 +390,6 @@ static void passthru_class_initfn(ObjectClass *klass, void *data)
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
1.9.1


