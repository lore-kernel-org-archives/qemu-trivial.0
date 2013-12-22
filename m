Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vuk59-0003nk-7F
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 09:32:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuk56-0003j8-Db
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:32:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuk55-00054t-M1
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:32:36 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46810
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vuk53-00053g-TA; Sun, 22 Dec 2013 09:32:34 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id EF0E417FC14; Sun, 22 Dec 2013 15:32:29 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 22 Dec 2013 15:32:29 +0100
Message-Id: <1387722749-29348-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pxa27x: Reduce size of keyboard matrix
	mapping
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
X-List-Received-Date: Sun, 22 Dec 2013 14:32:37 -0000

The row and column values use only a very limited range (-1 ... 7),
so a byte value is sufficient.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/hw/arm/pxa.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index d146c58..7ca330a 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -102,8 +102,8 @@ void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq);
 
 /* pxa2xx_keypad.c */
 struct  keymap {
-    int column;
-    int row;
+    int8_t column;
+    int8_t row;
 };
 typedef struct PXA2xxKeyPadState PXA2xxKeyPadState;
 PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
-- 
1.7.10.4


