Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMjdz-0007Wm-97
	for mharc-qemu-trivial@gnu.org; Fri, 12 Oct 2012 14:07:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TMjdw-0007Mf-5f
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 14:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TMjdv-0000OX-89
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 14:07:28 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:52811
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TMjdt-0000O8-El; Fri, 12 Oct 2012 14:07:25 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TMjdr-0003QU-LM; Fri, 12 Oct 2012 19:07:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Oct 2012 19:07:23 +0100
Message-Id: <1350065243-13147-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] target-arm/neon_helper: Remove obsolete
	FIXME comment
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
X-List-Received-Date: Fri, 12 Oct 2012 18:07:30 -0000

Commit 33ebc29 fixed the bugs in the implementation of VQRSHL,
but forgot to remove the FIXME comment...

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/neon_helper.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
index 8bb5129..9aa920d 100644
--- a/target-arm/neon_helper.c
+++ b/target-arm/neon_helper.c
@@ -788,7 +788,6 @@ uint64_t HELPER(neon_qshlu_s64)(CPUARMState *env, uint64_t valop, uint64_t shift
     return helper_neon_qshl_u64(env, valop, shiftop);
 }
 
-/* FIXME: This is wrong.  */
 #define NEON_FN(dest, src1, src2) do { \
     int8_t tmp; \
     tmp = (int8_t)src2; \
-- 
1.7.9.5


