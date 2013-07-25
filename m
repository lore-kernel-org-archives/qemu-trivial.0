Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2Rs3-00059x-CQ
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2013 16:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2Rs0-00054Q-L1
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 16:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2Rrz-0001MG-99
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 16:10:40 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47428
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2Rrv-0001IS-Oc; Thu, 25 Jul 2013 16:10:35 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 6E0471837CF; Thu, 25 Jul 2013 22:10:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu, 25 Jul 2013 22:10:31 +0200
Message-Id: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] target-mips: Remove assignment to a variable
	which is never used
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
X-List-Received-Date: Thu, 25 Jul 2013 20:10:42 -0000

This assignment causes a compiler warning for compilations with the compiler
option -Wunused-but-set-variable (which is included with -Wextra).

Removing it allows using -Wextra for QEMU code without suppressing too many
extra warnings.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-mips/op_helper.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 5cf1c3f..b828375 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -1735,7 +1735,6 @@ target_ulong helper_evpe(CPUMIPSState *env)
 void helper_fork(target_ulong arg1, target_ulong arg2)
 {
     // arg1 = rt, arg2 = rs
-    arg1 = 0;
     // TODO: store to TC register
 }
 
-- 
1.7.10.4


