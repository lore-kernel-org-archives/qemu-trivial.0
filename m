Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfhC-00013t-Qo
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh7-0000rb-0j
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh2-0005rC-Ss
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vwfgq-0005ns-IZ; Fri, 27 Dec 2013 17:15:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D079A438A3;
	Sat, 28 Dec 2013 02:15:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7E15E611;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10359 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:28 +0400
Message-Id: <1388182050-10270-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 15/17] pxa27x: Add 'const' attribute to
	keyboard maps
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
X-List-Received-Date: Fri, 27 Dec 2013 22:15:53 -0000

From: Stefan Weil <sw@weilnetz.de>

The mapping is a hardware feature, so it is relatively constant.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/mainstone.c       |    2 +-
 hw/arm/z2.c              |    2 +-
 hw/input/pxa2xx_keypad.c |    6 +++---
 include/hw/arm/pxa.h     |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 9402c84..276e359 100644
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
index 6db1ff3..7ca330a 100644
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


