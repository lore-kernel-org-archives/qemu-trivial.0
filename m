Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSj-0006H9-7I
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSg-0006Dq-8V
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSe-0003g5-1q
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:34 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:42493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSb-0003eE-7q; Sun, 10 Jun 2018 21:17:29 -0400
Received: by mail-qt0-x229.google.com with SMTP id y31-v6so18839372qty.9;
	Sun, 10 Jun 2018 18:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C93wPRZfIOKCvkEaWbg0ZzCj5aiezhkzFf+gQ4uRENA=;
	b=ceLqD+tSKzNxFN4nqzRNrmTuiIbLDRlKdLxVjdd5kb8/+EoY9k9O0iX9j3xyAbz+rh
	9JOtwF7ACe2cjbaOxX5ovQCSW57evUji98DGtd0h+Sl7QLfoO3SXCjvgEzYhW7IXLtld
	zSLolaLwSU0NBVUVY6V3OTtSOz6Gb5h/G0YJ4K9v4bLTixnplyx4YOypxK4luAMl7g6m
	0v/aNe9Wa1BN4m2VbXBqZL9r6Yw3FfZQr4VMyfvfUbfgPEenn7YaC8l5CQ8qWCCTlgvK
	P8D1e4jpkGtrZoHGVyJjRJzNSFU9nxUZu/AmbZ42Hgc/gVINEaQpdTfKvWkwH2iuMLIH
	vByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=C93wPRZfIOKCvkEaWbg0ZzCj5aiezhkzFf+gQ4uRENA=;
	b=Vy6vka4l1zet4qsAygCwyr8UMVirlQgLGxQKYUHhKTbHkjD9JIQzstP1jq407IRrnI
	AYiWECR1K20FxN/cnQR574lk3lbEA/BKn7OI3n7FqoYEoH0YT6CtmKeeNqh5mSyW88Dl
	M1j+LpuoX+2pWbwnGxEzJdVLwzhVDnXXserr63XvphJRYOEwuq2B03ybqYxquL6soWuE
	A1lZmcWMJqo/Od7ctJxIGKb7P7tC8lgaG7Uy0XXDFH7tC3VWAxa2LBw5hrRvmUIQ3akO
	bXxJkpX9br8s38sNhUhbCCvpjXNre7Abeq/Z8D57F31Hdi8oHlm1wWFPLa7drVN7SwXt
	dCpw==
X-Gm-Message-State: APt69E0uUphW0CLDdAkN1snA6TU0wbOY6OrpSzh3eXbiUjEOni3zKwek
	RPRsq1oH8IKvMFr4CzaKLNudsPuaTLo=
X-Google-Smtp-Source: ADUXVKJCdgcOosW+vVzgP1iW+DhmN/oRTu1z27NM0KSYsDMLs7BpwgsTCVoYToN4Sa2pixba1GLAaA==
X-Received: by 2002:ac8:2b18:: with SMTP id
	24-v6mr14426694qtu.73.1528679848815; 
	Sun, 10 Jun 2018 18:17:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Sun, 10 Jun 2018 22:14:56 -0300
Message-Id: <20180611011501.10235-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH v4 35/40] hw/usb: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:35 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/ccid-card-passthru.c   | 5 +++--
 hw/usb/combined-packet.c      | 3 ++-
 hw/usb/dev-smartcard-reader.c | 3 ++-
 hw/usb/redirect.c             | 3 ++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 25fb19b0d7..e6c73116cc 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <libcacard.h>
 #include "chardev/char-fe.h"
 #include "qemu/error-report.h"
@@ -40,7 +41,7 @@ static const uint8_t DEFAULT_ATR[] = {
  0x13, 0x08
 };
 
-#define VSCARD_IN_SIZE 65536
+#define VSCARD_IN_SIZE      (64 * KiB)
 
 /* maximum size of ATR - from 7816-3 */
 #define MAX_ATR_SIZE        40
@@ -276,7 +277,7 @@ static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
 
     if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
         error_report(
-            "no room for data: pos %d +  size %d > %d. dropping connection.",
+            "no room for data: pos %d +  size %d > %llu. dropping connection.",
             card->vscard_in_pos, size, VSCARD_IN_SIZE);
         ccid_card_vscard_drop_connection(card);
         return;
diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
index 48cac87f6a..01a7ed0848 100644
--- a/hw/usb/combined-packet.c
+++ b/hw/usb/combined-packet.c
@@ -20,6 +20,7 @@
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 #include "hw/usb.h"
 #include "qemu/iov.h"
@@ -171,7 +172,7 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
         if ((p->iov.size % ep->max_packet_size) != 0 || !p->short_not_ok ||
                 next == NULL ||
                 /* Work around for Linux usbfs bulk splitting + migration */
-                (totalsize == 16348 && p->int_req)) {
+                (totalsize == (16 * KiB - 36) && p->int_req)) {
             usb_device_handle_data(ep->dev, first);
             assert(first->status == USB_RET_ASYNC);
             if (first->combined) {
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 2131e33d27..ec862c2082 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -35,6 +35,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "qemu/error-report.h"
@@ -63,7 +64,7 @@ do { \
  * or handle the migration complexity - VMState doesn't handle this case.
  * sizes are expected never to be exceeded, unless guest misbehaves.
  */
-#define BULK_OUT_DATA_SIZE 65536
+#define BULK_OUT_DATA_SIZE  (64 * KiB)
 #define PENDING_ANSWERS_NUM 128
 
 #define BULK_IN_BUF_SIZE 384
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 65a9196c1a..8580c08dbd 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
@@ -1298,7 +1299,7 @@ static int usbredir_chardev_can_read(void *opaque)
     }
 
     /* usbredir_parser_do_read will consume *all* data we give it */
-    return 1024 * 1024;
+    return 1 * MiB;
 }
 
 static void usbredir_chardev_read(void *opaque, const uint8_t *buf, int size)
-- 
2.17.1


