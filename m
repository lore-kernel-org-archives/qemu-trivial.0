Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QdqIJ-0000Gt-M4
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2011 17:03:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QdqIG-0000G3-E6
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2011 17:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QdqIE-0004Jh-RN
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2011 17:02:59 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:51840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QdqIB-0004Ig-Ab; Mon, 04 Jul 2011 17:02:55 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QdqI2-00025N-55; Mon, 04 Jul 2011 22:02:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  4 Jul 2011 22:02:46 +0100
Message-Id: <1309813366-7994-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-alpha,
	target-ppc: Remove unnecessary setjmp.h include
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
X-List-Received-Date: Mon, 04 Jul 2011 21:03:02 -0000

Remove the include of setjmp.h from the cpu.h of target-alpha
and target-ppc. This is unnecessary because cpu-defs.h already
includes this header; this change brings these two targets
into line with all the rest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-alpha/cpu.h |    2 --
 target-ppc/cpu.h   |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index 411bd55..78caa79 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -28,8 +28,6 @@
 
 #include "cpu-defs.h"
 
-#include <setjmp.h>
-
 #include "softfloat.h"
 
 #define TARGET_HAS_ICE 1
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 84f8ff6..d903366 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -75,8 +75,6 @@
 
 #include "cpu-defs.h"
 
-#include <setjmp.h>
-
 #include "softfloat.h"
 
 #define TARGET_HAS_ICE 1
-- 
1.7.4.1


