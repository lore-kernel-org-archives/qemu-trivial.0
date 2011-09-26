Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R8DYM-0004o8-Vd
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 11:57:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1R8DYK-0004fY-6T
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 11:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1R8DYI-0002CL-Vw
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 11:57:08 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:43211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1R8DYG-0002BV-UZ; Mon, 26 Sep 2011 11:57:05 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1R8DY7-0005cw-S7; Mon, 26 Sep 2011 16:56:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 26 Sep 2011 16:56:55 +0100
Message-Id: <1317052615-21607-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] softfloat: Reinstate accidentally disabled
	target-specific NaN handling
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
X-List-Received-Date: Mon, 26 Sep 2011 15:57:09 -0000

Include config.h in softfloat.c, so that the target specific ifdefs in
softfloat-specialize.h are evaluated correctly. This was accidentally
broken in commit 789ec7ce2 when config-target.h was removed from
softfloat.h, and means that most targets will have been returning the
wrong results for calculations involving NaNs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 fpu/softfloat.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2b20085..3aafa81 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -35,6 +35,11 @@ these four paragraphs for those parts of this code that are retained.
 
 =============================================================================*/
 
+/* softfloat (and in particular the code in softfloat-specialize.h) is
+ * target-dependent and needs the TARGET_* macros.
+ */
+#include "config.h"
+
 #include "softfloat.h"
 
 /*----------------------------------------------------------------------------
-- 
1.7.1


