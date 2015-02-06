Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqI1-00028U-S7
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:18:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqHw-0001xc-D8
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqHq-0007Wo-9n
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:18:08 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:45969 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqHq-0007Wd-3X
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:18:02 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqHp-0007lm-F5; Fri, 06 Feb 2015 22:18:01 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnug.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:17:54 +0100
Message-Id: <1423257474-29830-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] stubs: Fix warning caused by missing
	'static' attribute
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
X-List-Received-Date: Fri, 06 Feb 2015 21:18:13 -0000

Warning from the Sparse static analysis tool:

stubs/qtest.c:14:6:
 warning: symbol 'qtest_allowed' was not declared. Should it be static?

Add the missing include statement which declares qtest_allowed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 stubs/qtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/qtest.c b/stubs/qtest.c
index e671ed8..dc17594 100644
--- a/stubs/qtest.c
+++ b/stubs/qtest.c
@@ -8,7 +8,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "sysemu/qtest.h"
 
 /* Needed for qtest_allowed() */
 bool qtest_allowed;
-- 
2.1.4


