Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8sK2-00083m-FJ
	for mharc-qemu-trivial@gnu.org; Sat, 17 Mar 2012 08:01:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S8sJz-0007ss-0x
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 08:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S8sJx-0002Vt-Bx
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 08:01:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S8sJb-0002TO-5Z; Sat, 17 Mar 2012 08:00:55 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C489272800A0; Sat, 17 Mar 2012 13:00:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id YK0ALLRjy5wx; Sat, 17 Mar 2012 13:00:52 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 51D9572800A1; Sat, 17 Mar 2012 13:00:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org
Date: Sat, 17 Mar 2012 13:00:51 +0100
Message-Id: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-mips: Remove unused inline function
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
X-List-Received-Date: Sat, 17 Mar 2012 12:01:20 -0000

Function set_HILO is not needed anywhere.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-mips/op_helper.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 3a20731..7b77d5a 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -193,12 +193,6 @@ static inline uint64_t get_HILO (void)
     return ((uint64_t)(env->active_tc.HI[0]) << 32) | (uint32_t)env->active_tc.LO[0];
 }
 
-static inline void set_HILO (uint64_t HILO)
-{
-    env->active_tc.LO[0] = (int32_t)HILO;
-    env->active_tc.HI[0] = (int32_t)(HILO >> 32);
-}
-
 static inline void set_HIT0_LO (target_ulong arg1, uint64_t HILO)
 {
     env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
-- 
1.7.9


