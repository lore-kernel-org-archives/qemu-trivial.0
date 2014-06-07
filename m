Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJqj-0003K5-Cu
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:52:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJqi-0003JW-0z
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJqh-0001uf-4P
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:52:07 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48533)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJqe-0001ty-OX; Sat, 07 Jun 2014 12:52:04 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJqe-0003bu-5g; Sat, 07 Jun 2014 17:52:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:52:04 +0100
Message-Id: <1402159924-13853-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/net/eepro100: Implement read-only bits in
	MDI registers
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
X-List-Received-Date: Sat, 07 Jun 2014 16:52:09 -0000

Although we defined an eepro100_mdi_mask[] array indicating which bits
in the registers are read-only, we weren't actually doing anything with
it. Make the MDI register-read code use it rather than manually making
registers 2 and 3 totally read-only and the rest totally read-write.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seemed a better fix for the unused variable than just deleting it...

 hw/net/eepro100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 3b891ca..9c70cce 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1217,7 +1217,6 @@ static void eepro100_write_mdi(EEPRO100State *s)
                 break;
             case 1:            /* Status Register */
                 missing("not writable");
-                data = s->mdimem[reg];
                 break;
             case 2:            /* PHY Identification Register (Word 1) */
             case 3:            /* PHY Identification Register (Word 2) */
@@ -1230,7 +1229,8 @@ static void eepro100_write_mdi(EEPRO100State *s)
             default:
                 missing("not implemented");
             }
-            s->mdimem[reg] = data;
+            s->mdimem[reg] &= eepro100_mdi_mask[reg];
+            s->mdimem[reg] |= data & ~eepro100_mdi_mask[reg];
         } else if (opcode == 2) {
             /* MDI read */
             switch (reg) {
-- 
1.8.5.4


