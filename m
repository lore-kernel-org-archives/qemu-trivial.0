Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0zY-0008HF-01
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:23:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zR-00083T-U7
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zO-0008HH-AY
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0zB-0008Ak-9K; Fri, 06 Dec 2013 14:22:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C6B8740DD2;
	Fri,  6 Dec 2013 23:22:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3D140602;
	Fri,  6 Dec 2013 23:15:45 +0400 (MSK)
Received: (nullmailer pid 19239 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:41 +0400
Message-Id: <1386357341-19147-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Antony Pavlov <antonynpavlov@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/14] eeprom93xx: fix coding style
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
X-List-Received-Date: Fri, 06 Dec 2013 19:23:10 -0000

From: Antony Pavlov <antonynpavlov@gmail.com>

scripts/checkpatch.pl reports about some style problems,
this commit fixes some of them:

ERROR: space prohibited before open square bracket '['
+    .fields      = (VMStateField []) {

ERROR: space prohibited after that '!' (ctx:BxW)
+    if (! eeprom->eecs && eecs) {
         ^

ERROR: space prohibited after that '!' (ctx:WxW)
+    } else if (eeprom->eecs && ! eecs) {
                                ^

ERROR: space prohibited after that '!' (ctx:WxW)
+    } else if (eecs && ! eeprom->eesk && eesk) {
                        ^

ERROR: switch and case should be at the same indent
                     switch (address >> (eeprom->addrbits - 2)) {
+                        case 0:
[...]
+                        case 1:
[...]
+                        case 2:
[...]
+                        case 3:

ERROR: return is not a function, parentheses are not required
+    return (eeprom->eedo);

ERROR: switch and case should be at the same indent
     switch (nwords) {
+        case 16:
+        case 64:
[...]
+        case 128:
+        case 256:
[...]
+        default:

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/nvram/eeprom93xx.c |   62 ++++++++++++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index 08f4df5..a98f924 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -126,7 +126,7 @@ static const VMStateDescription vmstate_eeprom = {
     .version_id = EEPROM_VERSION,
     .minimum_version_id = OLD_EEPROM_VERSION,
     .minimum_version_id_old = OLD_EEPROM_VERSION,
-    .fields      = (VMStateField []) {
+    .fields      = (VMStateField[]) {
         VMSTATE_UINT8(tick, eeprom_t),
         VMSTATE_UINT8(address, eeprom_t),
         VMSTATE_UINT8(command, eeprom_t),
@@ -157,13 +157,13 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
     logout("CS=%u SK=%u DI=%u DO=%u, tick = %u\n",
            eecs, eesk, eedi, eedo, tick);
 
-    if (! eeprom->eecs && eecs) {
+    if (!eeprom->eecs && eecs) {
         /* Start chip select cycle. */
         logout("Cycle start, waiting for 1st start bit (0)\n");
         tick = 0;
         command = 0x0;
         address = 0x0;
-    } else if (eeprom->eecs && ! eecs) {
+    } else if (eeprom->eecs && !eecs) {
         /* End chip select cycle. This triggers write / erase. */
         if (eeprom->writable) {
             uint8_t subcommand = address >> (eeprom->addrbits - 2);
@@ -189,7 +189,7 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
         }
         /* Output DO is tristate, read results in 1. */
         eedo = 1;
-    } else if (eecs && ! eeprom->eesk && eesk) {
+    } else if (eecs && !eeprom->eesk && eesk) {
         /* Raising edge of clock shifts data in. */
         if (tick == 0) {
             /* Wait for 1st start bit. */
@@ -230,20 +230,20 @@ void eeprom93xx_write(eeprom_t *eeprom, int eecs, int eesk, int eedi)
                 if (command == 0) {
                     /* Command code in upper 2 bits of address. */
                     switch (address >> (eeprom->addrbits - 2)) {
-                        case 0:
-                            logout("write disable command\n");
-                            eeprom->writable = 0;
-                            break;
-                        case 1:
-                            logout("write all command\n");
-                            break;
-                        case 2:
-                            logout("erase all command\n");
-                            break;
-                        case 3:
-                            logout("write enable command\n");
-                            eeprom->writable = 1;
-                            break;
+                    case 0:
+                        logout("write disable command\n");
+                        eeprom->writable = 0;
+                        break;
+                    case 1:
+                        logout("write all command\n");
+                        break;
+                    case 2:
+                        logout("erase all command\n");
+                        break;
+                    case 3:
+                        logout("write enable command\n");
+                        eeprom->writable = 1;
+                        break;
                     }
                 } else {
                     /* Read, write or erase word. */
@@ -276,7 +276,7 @@ uint16_t eeprom93xx_read(eeprom_t *eeprom)
 {
     /* Return status of pin DO (0 or 1). */
     logout("CS=%u DO=%u\n", eeprom->eecs, eeprom->eedo);
-    return (eeprom->eedo);
+    return eeprom->eedo;
 }
 
 #if 0
@@ -296,18 +296,18 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
     uint8_t addrbits;
 
     switch (nwords) {
-        case 16:
-        case 64:
-            addrbits = 6;
-            break;
-        case 128:
-        case 256:
-            addrbits = 8;
-            break;
-        default:
-            assert(!"Unsupported EEPROM size, fallback to 64 words!");
-            nwords = 64;
-            addrbits = 6;
+    case 16:
+    case 64:
+        addrbits = 6;
+        break;
+    case 128:
+    case 256:
+        addrbits = 8;
+        break;
+    default:
+        assert(!"Unsupported EEPROM size, fallback to 64 words!");
+        nwords = 64;
+        addrbits = 6;
     }
 
     eeprom = (eeprom_t *)g_malloc0(sizeof(*eeprom) + nwords * 2);
-- 
1.7.10.4


