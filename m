Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vo5p7-0003e7-FV
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2013 01:20:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vo5oz-0003bG-1y
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 01:20:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1Vo5ou-0004Fx-Ed
	for qemu-trivial@nongnu.org; Wed, 04 Dec 2013 01:20:28 -0500
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233]:58183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1Vo5ol-0004Em-66; Wed, 04 Dec 2013 01:20:15 -0500
Received: by mail-la0-f51.google.com with SMTP id ec20so9479618lab.38
	for <multiple recipients>; Tue, 03 Dec 2013 22:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PbwjO6aCiOv7eHrfw92vz80AbPAPA+X+WYO3mx4Aies=;
	b=FYfIEAeFvJkbwlA9udzvUX0II2cJGOdqpsepofunYOI1D0MqDtbXxnuY3CAzbgrSoj
	4OlqtmMu19oKCNtTZo3v0jqsY0iGqHZdReyNedAQPuGCUBRNnT/nNBmtnW17qEldyEUE
	By1xIAqZTngM+nM5hbHGDzxdo/DCuD2xdniRLOYQ6bjmvRZkqjmFC4u3Nf9EOWoANrkl
	M62pMay+Bu5AKCKxR3vPbsDjtuVunf7z4iJyyUSpcUh8FWI1dUkQPBNqSmUM1K+zzdz0
	ntWNLDA82g/Fcn5qPxq6mZppSCZuBf//pzEgmqfcZllLGOjCZBYNgcdFkQJU/wiMrLJu
	PduA==
X-Received: by 10.112.53.201 with SMTP id d9mr1952904lbp.26.1386138011184;
	Tue, 03 Dec 2013 22:20:11 -0800 (PST)
Received: from localhost.localdomain
	(broadband-95-84-154-9.nationalcablenetworks.ru. [95.84.154.9])
	by mx.google.com with ESMTPSA id c8sm37019085lag.3.2013.12.03.22.20.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 22:20:10 -0800 (PST)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Dec 2013 10:27:29 +0400
Message-Id: <1386138449-1235-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.8.4.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::233
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PATCH] eeprom93xx: fix coding style
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
X-List-Received-Date: Wed, 04 Dec 2013 06:20:33 -0000

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
Cc: qemu-trivial@nongnu.org
---
 hw/nvram/eeprom93xx.c | 62 +++++++++++++++++++++++++--------------------------
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
1.8.4.4


