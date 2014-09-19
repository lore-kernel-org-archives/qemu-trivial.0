Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XV57W-0006Ry-CO
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 16:49:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1XV57P-0006IQ-SZ
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 16:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1XV57K-0007Bk-Vv
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 16:49:27 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1XV57A-00078F-Nb; Fri, 19 Sep 2014 16:49:12 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 60E1C17F8AE; Fri, 19 Sep 2014 22:49:04 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri, 19 Sep 2014 22:49:03 +0200
Message-Id: <1411159743-28175-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pc: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 19 Sep 2014 20:49:32 -0000

This fixes a warning from smatch (static code analysis).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/pc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c2e9dc..82a7daa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -75,7 +75,7 @@
 /* Leave a chunk of memory at the top of RAM for the BIOS ACPI tables
  * (128K) and other BIOS datastructures (less than 4K reported to be used at
  * the moment, 32K should be enough for a while).  */
-unsigned acpi_data_size = 0x20000 + 0x8000;
+static unsigned acpi_data_size = 0x20000 + 0x8000;
 void pc_set_legacy_acpi_data_size(void)
 {
     acpi_data_size = 0x10000;
-- 
1.7.10.4


