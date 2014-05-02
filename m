Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgK5l-00032S-Sj
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:29:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgK5f-0002u6-Ic
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:29:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgK5a-0008NK-E7
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:29:51 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgK5Q-0008Kn-B2; Fri, 02 May 2014 16:29:36 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0E2BB1800ED; Fri,  2 May 2014 22:29:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:29:33 +0200
Message-Id: <1399062573-2769-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw/mips: Add missing 'static' and 'const'
	attributes
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
X-List-Received-Date: Fri, 02 May 2014 20:29:56 -0000

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/mips/mips_fulong2e.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index e1551aa..30d9f19 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -211,7 +211,7 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-uint8_t eeprom_spd[0x80] = {
+static const uint8_t eeprom_spd[0x80] = {
     0x80,0x08,0x07,0x0d,0x09,0x02,0x40,0x00,0x04,0x70,
     0x70,0x00,0x82,0x10,0x00,0x01,0x0e,0x04,0x0c,0x01,
     0x02,0x20,0x80,0x75,0x70,0x00,0x00,0x50,0x3c,0x50,
-- 
1.7.10.4


