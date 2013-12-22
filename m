Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vujvu-0007s4-Iy
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 09:23:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vujvs-0007oX-5r
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vujvr-0002Z3-EI
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 09:23:04 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46800
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1Vujvp-0002Yl-7I; Sun, 22 Dec 2013 09:23:01 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E78C017FC14; Sun, 22 Dec 2013 15:22:57 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 22 Dec 2013 15:22:57 +0100
Message-Id: <1387722177-28824-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pxa27x: Add 'const' attribute to keyboard
	maps
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
X-List-Received-Date: Sun, 22 Dec 2013 14:23:05 -0000

The mapping is a hardware feature, so it is relatively constant.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/arm/mainstone.c       |    2 +-
 hw/arm/z2.c              |    2 +-
 hw/input/pxa2xx_keypad.c |    6 +++---
 include/hw/arm/pxa.h     |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 223a4b1..082627e 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -45,7 +45,7 @@
 #define S1_STSCHG_IRQ 14
 #define S1_IRQ        15
 
-static struct keymap map[0xE0] = {
+static const struct keymap map[0xE0] = {
     [0 ... 0xDF] = { -1, -1 },
     [0x1e] = {0,0}, /* a */
     [0x30] = {0,1}, /* b */
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index d52c501..97367b1 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -33,7 +33,7 @@
 #define DPRINTF(fmt, ...)
 #endif
 
-static struct keymap map[0x100] = {
+static const struct keymap map[0x100] = {
     [0 ... 0xff] = { -1, -1 },
     [0x3b] = {0, 0}, /* Option = F1 */
     [0xc8] = {0, 1}, /* Up */
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 846d137..b90b0ba 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -85,7 +85,7 @@
 struct PXA2xxKeyPadState {
     MemoryRegion iomem;
     qemu_irq    irq;
-    struct  keymap *map;
+    const struct  keymap *map;
     int         pressed_cnt;
     int         alt_code;
 
@@ -322,8 +322,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
     return s;
 }
 
-void pxa27x_register_keypad(PXA2xxKeyPadState *kp, struct keymap *map,
-        int size)
+void pxa27x_register_keypad(PXA2xxKeyPadState *kp,
+                            const struct keymap *map, int size)
 {
     if(!map || size < 0x80) {
         fprintf(stderr, "%s - No PXA keypad map defined\n", __FUNCTION__);
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index a4e1a66..d146c58 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -109,8 +109,8 @@ typedef struct PXA2xxKeyPadState PXA2xxKeyPadState;
 PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
                                       hwaddr base,
                                       qemu_irq irq);
-void pxa27x_register_keypad(PXA2xxKeyPadState *kp, struct keymap *map,
-                int size);
+void pxa27x_register_keypad(PXA2xxKeyPadState *kp,
+                            const struct keymap *map, int size);
 
 /* pxa2xx.c */
 typedef struct PXA2xxI2CState PXA2xxI2CState;
-- 
1.7.10.4


