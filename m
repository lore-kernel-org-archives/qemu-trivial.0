Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RODNT-0003D8-Ny
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 14:00:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RODNR-00039P-13
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:00:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RODNQ-000077-7j
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 14:00:00 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:54356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RODNM-00005r-QM; Wed, 09 Nov 2011 13:59:57 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RODNK-0002YA-Ko; Wed, 09 Nov 2011 18:59:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 Nov 2011 18:59:54 +0000
Message-Id: <1320865194-9779-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/lan9118.c: Add missing 'break' to fix
	buffer overrun
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
X-List-Received-Date: Wed, 09 Nov 2011 19:00:02 -0000

Add a missing 'break' statement to fix a buffer overrun when
executing the EEPROM write-all command. Spotted by Coverity
(see bug 887883).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/lan9118.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/lan9118.c b/hw/lan9118.c
index 634b88e..f8149e6 100644
--- a/hw/lan9118.c
+++ b/hw/lan9118.c
@@ -863,6 +863,7 @@ static void lan9118_eeprom_cmd(lan9118_state *s, int cmd, int addr)
         } else {
             DPRINTF("EEPROM Write All (ignored)\n");
         }
+        break;
     case 5: /* ERASE */
         if (s->eeprom_writable) {
             s->eeprom[addr] = 0xff;
-- 
1.7.1


