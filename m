Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZsa-0002Y0-5h
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 16:46:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZsY-0002VD-0S
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZsX-0006j4-6k
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:46:01 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZfZsR-0006bL-45; Fri, 25 Sep 2015 16:45:55 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CB4F217F539; Fri, 25 Sep 2015 22:45:53 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Date: Fri, 25 Sep 2015 22:45:53 +0200
Message-Id: <1443213953-10022-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] disas/cris: Fix typo in comment
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
X-List-Received-Date: Fri, 25 Sep 2015 20:46:03 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/cris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/cris.c b/disas/cris.c
index 1b76a09..4482a41 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -2492,7 +2492,7 @@ print_with_operands (const struct cris_opcode *opcodep,
 	  = spec_reg_info ((insn >> 12) & 15, disdata->distype);
 
 	if (sregp->name == NULL)
-	  /* Should have been caught as a non-match eariler.  */
+	  /* Should have been caught as a non-match earlier.  */
 	  *tp++ = '?';
 	else
 	  {
-- 
2.1.4


