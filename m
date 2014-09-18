Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUizC-0006fP-Bx
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 17:11:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@distanz.ch>) id 1XUfSt-0004Qb-2U
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 13:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tklauser@distanz.ch>) id 1XUfSo-0007jM-15
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 13:25:55 -0400
Received: from mail.zhinst.com ([212.126.164.98]:35257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@distanz.ch>)
	id 1XUfSa-0007hL-7m; Thu, 18 Sep 2014 13:25:36 -0400
Received: from ziws06.zhinst.com ([10.42.0.71])
	by mail.zhinst.com (Kerio Connect 8.3.2);
	Thu, 18 Sep 2014 19:25:25 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: qemu-devel@nongnu.org
Date: Thu, 18 Sep 2014 19:25:24 +0200
Message-Id: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
X-Mailer: git-send-email 2.0.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 212.126.164.98
X-Mailman-Approved-At: Thu, 18 Sep 2014 17:11:28 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] disas/arm: Remove redefinition of
	ATTRIBUTE_UNUSED
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
X-List-Received-Date: Thu, 18 Sep 2014 17:26:00 -0000

ATTRIBUTE_UNUSED is already defined in disas/bfd.h, which is included.
Thus, there is no need to redefine it.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 disas/arm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/disas/arm.c b/disas/arm.c
index 76e97a8..6f63406 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -23,7 +23,6 @@
    for things we don't care about.  */
 
 #include "disas/bfd.h"
-#define ATTRIBUTE_UNUSED __attribute__((unused))
 #define ISSPACE(x) ((x) == ' ' || (x) == '\t' || (x) == '\n')
 
 #define ARM_EXT_V1	 0
-- 
2.0.1



