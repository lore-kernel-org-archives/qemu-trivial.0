Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QN537-00056X-Qo
	for mharc-qemu-trivial@gnu.org; Thu, 19 May 2011 11:22:05 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QN535-000506-B5
	for qemu-trivial@nongnu.org; Thu, 19 May 2011 11:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QN534-0000HI-8k
	for qemu-trivial@nongnu.org; Thu, 19 May 2011 11:22:03 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QN532-0000GR-71; Thu, 19 May 2011 11:22:00 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QN52z-00065O-Ny; Thu, 19 May 2011 16:21:57 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 19 May 2011 16:21:57 +0100
Message-Id: <1305818517-23371-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/realview.c: Remove duplicate #include line
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
X-List-Received-Date: Thu, 19 May 2011 15:22:04 -0000

Remove a duplicate #include of sysbus.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/realview.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/realview.c b/hw/realview.c
index 96fb9da..82f3d82 100644
--- a/hw/realview.c
+++ b/hw/realview.c
@@ -17,7 +17,6 @@
 #include "sysemu.h"
 #include "boards.h"
 #include "bitbang_i2c.h"
-#include "sysbus.h"
 #include "blockdev.h"
 
 #define SMP_BOOT_ADDR 0xe0000000
-- 
1.7.1


