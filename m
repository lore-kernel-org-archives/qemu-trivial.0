Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQfGh-0006Gk-HK
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 14:06:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQfGg-0006FF-0z
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 14:06:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQfGf-0003T3-6p
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 14:06:06 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQfGd-0003Rs-68; Mon, 09 Jan 2017 14:06:03 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQfGZ-000205-F2; Mon, 09 Jan 2017 19:05:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon,  9 Jan 2017 19:05:59 +0000
Message-Id: <1483988759-14606-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] disas/cris.c: Fix Coverity warning about
 unchecked NULL
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2017 19:06:07 -0000

Coverity (CID 1005689) warns that we don't check that
spec_reg_info() returned non-NULL before dereferencing.
Add the check, though as the comment notes this is
a can't-really-happen case because the earlier constraint
matching should have ruled out the "unknown reg" case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 disas/cris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/cris.c b/disas/cris.c
index 08161d1..8a1daf9 100644
--- a/disas/cris.c
+++ b/disas/cris.c
@@ -2490,7 +2490,7 @@ print_with_operands (const struct cris_opcode *opcodep,
 	const struct cris_spec_reg *sregp
 	  = spec_reg_info ((insn >> 12) & 15, disdata->distype);
 
-	if (sregp->name == NULL)
+	if (sregp == NULL || sregp->name == NULL)
 	  /* Should have been caught as a non-match earlier.  */
 	  *tp++ = '?';
 	else
-- 
2.7.4


