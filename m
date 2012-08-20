Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3ReB-0004GB-R0
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 09:03:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T3Re5-0003vr-44
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 09:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1T3Rdz-0004tH-Dp
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 09:03:53 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:43863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T3Rds-0004sX-G1; Mon, 20 Aug 2012 09:03:40 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1T3Rdo-0002q8-QG; Mon, 20 Aug 2012 14:03:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 20 Aug 2012 14:03:36 +0100
Message-Id: <1345467816-10893-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] linux-user: Remove #if 0'd
	cpu_get_real_ticks() definition
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
X-List-Received-Date: Mon, 20 Aug 2012 13:03:58 -0000

Remove the cpu_get_real_ticks() definition from linux-user/main.c.
This has been disabled via #if 0 and unused since commit 1dce7c3c22
in 2006; the definitions we actually use are in qemu-timer.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/main.c |   13 -------------
 1 file changed, 13 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 7dea084..0659ae8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -89,19 +89,6 @@ int cpu_get_pic_interrupt(CPUX86State *env)
 }
 #endif
 
-/* timers for rdtsc */
-
-#if 0
-
-static uint64_t emu_time;
-
-int64_t cpu_get_real_ticks(void)
-{
-    return emu_time++;
-}
-
-#endif
-
 #if defined(CONFIG_USE_NPTL)
 /***********************************************************/
 /* Helper routines for implementing atomic operations.  */
-- 
1.7.9.5


