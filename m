Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrf-0002Z5-6W
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrY-0002Su-Qb
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrX-0008FX-Mb
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:56 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:34943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrU-0008De-4y; Mon, 25 Jun 2018 08:44:52 -0400
Received: by mail-qk0-x229.google.com with SMTP id u21-v6so1774738qku.2;
	Mon, 25 Jun 2018 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cT4R+V0+fb3Ve2pbM3Q3ZJUYFAn12RDM/rctRSApmKQ=;
	b=i9/+l0bAYdWydMKRlvyfbtGrHmnOyY5vb9mmXV1NGlJ0LdDuLuz5omcuMedeFSk2qN
	LeAUa9Pt2aKd9mYnZQZi6U0X7cELjfn4v1Sfm6FHoaHRzDaGx5GNy4GjVe9mjk5JgMDP
	90AHn7DDjv+7dayOJb1u3W1uAygsokq9tekyVsKbu+SZyourmNiaU3wBP62vVM2Fxs6Q
	T4OpFOXmN65lQ2d8ZGy1qgFiyNTMP+TwQbXUF4ou8hEUHUJD+Z5uk2LlCiVz8rb+YMfm
	cuCkurH7bdvLYrb1RUp9va6DoqmkZC7eO8c4IFB/TBMjs7y/8FK+pLcFyCqhCqNcIr4Z
	mEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cT4R+V0+fb3Ve2pbM3Q3ZJUYFAn12RDM/rctRSApmKQ=;
	b=ObTv4aO12/XOrkJlyc2/ou6w7gTBAHGbx3E2PAPFiyarN2kGJbmfLCmrpcN9pyYNdt
	dwWfdTJDvGupnGQLmLEwVUIwpCjQXT0vp+auR+zyV6a2y0/AohpsrUFh3XyVBQeqGDn8
	35wZET53GZ+TSqFsuvp7nCFPSIFKP4FAv9QGGWH9SlQc9mmYGdPg4ZZCOly4aQuDMifs
	I7R+9S/eT9H1ADtbYozCVZC/KwU3VQbUaVBwHVqFK5xatIwKKd2E/5Y+/6VcrWRvYsz/
	uaGvnl9U3x8PfF4DMYmtCnONxWEBaGzyq5x8bCV6/RWQkM4OumWkwJ++pOoD334qdd6i
	DhAQ==
X-Gm-Message-State: APt69E31tVCePcdid0ewhIbGizuaQyKNf3cZp0/NkgUo2J2ZZbScUCze
	VV8T++0tIx+t76w7wQ/env4=
X-Google-Smtp-Source: AAOMgpc6+eFjLLxryE8CqvMAaTEyuLsr4KPsWuPs2H1ERkXCeZPRp6PERNim/XyplO0mj8Y39GB5/g==
X-Received: by 2002:a37:7886:: with SMTP id
	t128-v6mr10389896qkc.367.1529930691596; 
	Mon, 25 Jun 2018 05:44:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 25 Jun 2018 09:42:27 -0300
Message-Id: <20180625124238.25339-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: [Qemu-trivial] [PATCH v5 35/46] hw/usb: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:58 -0000

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
index 25fb19b0d7..e75d433e56 100644
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
+            "no room for data: pos %u +  size %d > %ld. dropping connection.",
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
index 13d0befd9c..8f716fc165 100644
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
index 58e8f7f5bd..99094a721e 100644
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
2.18.0


