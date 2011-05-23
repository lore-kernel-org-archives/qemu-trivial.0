Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOWgc-0006Ph-V5
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2011 11:04:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QOWga-0006IE-Fc
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 11:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QOWgZ-0006Lr-Ed
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 11:04:48 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:47208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QOWgX-0006LX-1T; Mon, 23 May 2011 11:04:45 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QOWgU-0007sc-UT; Mon, 23 May 2011 16:04:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 23 May 2011 16:04:42 +0100
Message-Id: <1306163082-30267-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-arm/exec.h: Remove unused #define of
	M0
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
X-List-Received-Date: Mon, 23 May 2011 15:04:49 -0000

Remove a preprocessor #define which is never used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/exec.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/target-arm/exec.h b/target-arm/exec.h
index 44e1b55..db6608e 100644
--- a/target-arm/exec.h
+++ b/target-arm/exec.h
@@ -21,8 +21,6 @@
 
 register struct CPUARMState *env asm(AREG0);
 
-#define M0   env->iwmmxt.val
-
 #include "cpu.h"
 #include "exec-all.h"
 
-- 
1.7.1


