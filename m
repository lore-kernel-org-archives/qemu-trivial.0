Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rKh-0006FL-5m
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:45:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKd-00069q-Jy
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKc-0001X5-3A
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:45:15 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:39892)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKb-0001WT-UC; Sun, 15 Apr 2018 19:45:13 -0400
Received: by mail-qk0-x241.google.com with SMTP id j73so14799216qke.6;
	Sun, 15 Apr 2018 16:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hAiTWt/cLNCWV6HpjmnXBCyzuKWByOAdZsKK5v2xBQY=;
	b=C+lvTEzTOVnYwiBqs2z7qmEUthkRcNoRImkOA2Odxcblln5VeDwJDyE94/P3PbYo6Z
	0wB+d8p5bflmdwjn89SlZtJwZ7tEHO3zpyU48ZJqbDqWwd2K6wJat20WptSEMvaKtZQM
	3MyNWSIn0Crqac1/yNpkNCiKhDjkX6X9VIme/5Wa7PB/EdPO/pwdSyNTquDFQ87UMyHO
	WRd5NSqLwagXASxSk0SWBoUciT8ouIiMld0jC9z+NzWk1Ue8nejpCnzfMmCSk7lgtZJv
	7H5uSuboNPkddZypoJw3852i+cRC4mfa5nxPYEPhZebMhmQkE1JMIzuKvoSvsjOVd2ov
	KOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hAiTWt/cLNCWV6HpjmnXBCyzuKWByOAdZsKK5v2xBQY=;
	b=dgLtUMpMUXT5uJI6PpZvmmuCSY1BqwDLeZahPt4p8v1lM33LpVYSYq7//VBgArJ1ct
	1IPx7Lx01KtGSymUJ6cQwlmS9t1sc/B9VlmBgrIidcKoXToDrlVbtjt/gA2uphcPpFQ0
	buOhw7ol6etfyB9QbjUIq+KLnVf10ZfRRFKkPpmrSscxggy03qLNub9EtZgymd9CCoLK
	wnJff339uF2LRz6tiSWgivh6KFHpkN6QD0jvvc50qCL3h3/N29EUUXRvA/xwyAqaVmU2
	ZEl//4dvJQdwRdKml2glqPGh3OvdybMOzXLrg7cRYnKbz4CE4uhDrJDqZvHUQyM+dw5o
	TjEg==
X-Gm-Message-State: ALQs6tCG8y32GK311aJIvEWiC22tbUZelfhT++uSao4PzUWH0a/22G43
	q5YU7t9uFdz/3NLRnPJyxsF0S4paOMk=
X-Google-Smtp-Source: AIpwx4925sLUvO9YNNUjA9sM89YrD+uCPcIpyTp3KVHzvhYLt+7lWh+Wc36qwd/lGEsJk9EMwQA8Pg==
X-Received: by 10.55.182.70 with SMTP id g67mr14246593qkf.314.1523835913273;
	Sun, 15 Apr 2018 16:45:13 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Date: Sun, 15 Apr 2018 20:43:00 -0300
Message-Id: <20180415234307.28132-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 34/41] hw/usb: Use the BYTE-based
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
X-List-Received-Date: Sun, 15 Apr 2018 23:45:17 -0000

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
index b7dd3602dc..4bd1e2232e 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <cacard/vscard_common.h>
 #include "chardev/char-fe.h"
 #include "qemu/error-report.h"
@@ -40,7 +41,7 @@ static const uint8_t DEFAULT_ATR[] = {
  0x13, 0x08
 };
 
-#define VSCARD_IN_SIZE 65536
+#define VSCARD_IN_SIZE      (64 * K_BYTE)
 
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
index 48cac87f6a..2f068af927 100644
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
+                (totalsize == (16 * K_BYTE - 36) && p->int_req)) {
             usb_device_handle_data(ep->dev, first);
             assert(first->status == USB_RET_ASYNC);
             if (first->combined) {
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index e6468057a0..0cdee70f82 100644
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
+#define BULK_OUT_DATA_SIZE  (64 * K_BYTE)
 #define PENDING_ANSWERS_NUM 128
 
 #define BULK_IN_BUF_SIZE 384
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 65a9196c1a..3ed4a39be1 100644
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
+    return 1 * M_BYTE;
 }
 
 static void usbredir_chardev_read(void *opaque, const uint8_t *buf, int size)
-- 
2.17.0


