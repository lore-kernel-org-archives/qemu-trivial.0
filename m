Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEjXl-0004UO-3Q
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 13:28:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEjXe-0003uF-TX
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 13:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEjXa-0005mz-0l
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 13:28:26 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:36063
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VEjXQ-0005ZZ-2r; Wed, 28 Aug 2013 13:28:12 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 82870180117; Wed, 28 Aug 2013 19:28:07 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Date: Wed, 28 Aug 2013 19:28:06 +0200
Message-Id: <1377710886-25198-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tci: Remove function tcg_out64 (fix broken
	build)
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
X-List-Received-Date: Wed, 28 Aug 2013 17:28:32 -0000

Commit ac26eb69a311396668809eadbf7ff4e623447d4c added tcg_out64 to tcg/tcg.c.
tcg/tci/tcg-target.c already had a nearly identical implementation which is
now removed to fix a compiler error.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tci/tcg-target.c |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
index e118bc7..eb23832 100644
--- a/tcg/tci/tcg-target.c
+++ b/tcg/tci/tcg-target.c
@@ -415,13 +415,6 @@ static void tcg_out_i(TCGContext *s, tcg_target_ulong v)
     s->code_ptr += sizeof(tcg_target_ulong);
 }
 
-/* Write 64 bit value. */
-static void tcg_out64(TCGContext *s, uint64_t v)
-{
-    *(uint64_t *)s->code_ptr = v;
-    s->code_ptr += sizeof(v);
-}
-
 /* Write opcode. */
 static void tcg_out_op_t(TCGContext *s, TCGOpcode op)
 {
-- 
1.7.10.4


