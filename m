Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wx2ja-00026W-4q
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jun 2014 19:24:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wx2jS-0001vw-2E
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 19:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wx2jM-0006C6-0a
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 19:24:02 -0400
Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c]:42023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wx2j9-00068b-Oc; Tue, 17 Jun 2014 19:23:43 -0400
Received: by mail-we0-f172.google.com with SMTP id u57so47462wes.17
	for <multiple recipients>; Tue, 17 Jun 2014 16:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=heclesOxSnfXlculim6je1nW9HBekG9FbJEJxM3tONA=;
	b=DwZ/FcxFUCVzKsfagMN59Nn8MD/6Dx+zwnJnjoBRRKe2YvxXdnfFp81F2JInJzVdgK
	PCT43MCQfSEWk2oX7ai5lWKKzNvnX39l4w64twZFHY63HFCfr3J977GCTqKwn0Kh2v6M
	QklFhl49HG4uYfV6mg+oxh3NAlmri+e8i9/iGgaT6q7+VZY1I2v3H4767TZ0AlelASjY
	YMNQ1vUVD4g8wR+5ZLoYSMURuiuUlv0joJQ9VB9z5j61+EppddR5eEwnVApYSm/uZaBg
	yxkCF1TU6whszABS5f9HUJ6KX9lHvRidaPeY5HxAvczbLiZr+ONf/Ps8colzWRHDaNx2
	Nvfg==
X-Received: by 10.180.211.106 with SMTP id nb10mr98818wic.9.1403047422549;
	Tue, 17 Jun 2014 16:23:42 -0700 (PDT)
Received: from localhost.localdomain ([41.109.190.215])
	by mx.google.com with ESMTPSA id y8sm1128813eef.5.2014.06.17.16.23.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Jun 2014 16:23:41 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 18 Jun 2014 00:23:34 +0100
Message-Id: <1403047414-27505-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22c
Cc: pbonzini@redhat.com, kraxel@redhat.com, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCHv2] usb: Fix usb-bt-dongle initialization.
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
X-List-Received-Date: Tue, 17 Jun 2014 23:24:08 -0000

Due to an incomplete initialization, adding a usb-bt-dongle device through HMP
or QMP will cause a segmentation fault.

Signed-off-by: Hani Benhabiles <hani@linux.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---

Compared to v1:
* Remove duplicate code from usb_bt_init() and inline usb_create_simple() call.
* usb_bt_initfn() check for s->hci.

 hw/usb/dev-bluetooth.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/usb/dev-bluetooth.c b/hw/usb/dev-bluetooth.c
index a9661d2..a76e581 100644
--- a/hw/usb/dev-bluetooth.c
+++ b/hw/usb/dev-bluetooth.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu-common.h"
+#include "qemu/error-report.h"
 #include "hw/usb.h"
 #include "hw/usb/desc.h"
 #include "sysemu/bt.h"
@@ -506,6 +507,14 @@ static int usb_bt_initfn(USBDevice *dev)
 
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
+    s->dev.opaque = s;
+    if (!s->hci) {
+        s->hci = bt_new_hci(qemu_find_bt_vlan(0));
+    }
+    s->hci->opaque = s;
+    s->hci->evt_recv = usb_bt_out_hci_packet_event;
+    s->hci->acl_recv = usb_bt_out_hci_packet_acl;
+    usb_bt_handle_reset(&s->dev);
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, USB_EVT_EP);
 
     return 0;
@@ -516,6 +525,7 @@ static USBDevice *usb_bt_init(USBBus *bus, const char *cmdline)
     USBDevice *dev;
     struct USBBtState *s;
     HCIInfo *hci;
+    const char *name = "usb-bt-dongle";
 
     if (*cmdline) {
         hci = hci_init(cmdline);
@@ -525,19 +535,17 @@ static USBDevice *usb_bt_init(USBBus *bus, const char *cmdline)
 
     if (!hci)
         return NULL;
-    dev = usb_create_simple(bus, "usb-bt-dongle");
+    dev = usb_create(bus, name);
     if (!dev) {
+        error_report("Failed to create USB device '%s'", name);
         return NULL;
     }
     s = DO_UPCAST(struct USBBtState, dev, dev);
-    s->dev.opaque = s;
-
     s->hci = hci;
-    s->hci->opaque = s;
-    s->hci->evt_recv = usb_bt_out_hci_packet_event;
-    s->hci->acl_recv = usb_bt_out_hci_packet_acl;
-
-    usb_bt_handle_reset(&s->dev);
+    if (qdev_init(&dev->qdev) < 0) {
+        error_report("Failed to initialize USB device '%s'", name);
+        return NULL;
+    }
 
     return dev;
 }
-- 
1.8.3.2


