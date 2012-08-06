Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SyI1Z-0001KJ-5X
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2012 03:46:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterc@PetaLogix-ws2>) id 1SyI1W-0001As-68
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 03:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterc@PetaLogix-ws2>) id 1SyI1V-0007Ma-Aj
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 03:46:46 -0400
Received: from [124.148.20.9] (port=52724 helo=PetaLogix-ws2)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterc@PetaLogix-ws2>)
	id 1SyI1M-0007Kp-SZ; Mon, 06 Aug 2012 03:46:37 -0400
Received: by PetaLogix-ws2 (Postfix, from userid 2005)
	id 35F363482013; Mon,  6 Aug 2012 17:06:08 +1000 (EST)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2012 17:05:56 +1000
Message-Id: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.0.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 124.148.20.9
Cc: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
	peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH] arm: translate: comment typo -
	s/middel/middle/
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
X-List-Received-Date: Mon, 06 Aug 2012 07:46:47 -0000

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
---
 target-arm/translate.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 29008a4..494c682 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -9892,7 +9892,7 @@ static inline void gen_intermediate_code_internal(CPUARMState *env,
     } else {
         /* While branches must always occur at the end of an IT block,
            there are a few other things that can cause us to terminate
-           the TB in the middel of an IT block:
+           the TB in the middle of an IT block:
             - Exception generating instructions (bkpt, swi, undefined).
             - Page boundaries.
             - Hardware watchpoints.
-- 
1.7.0.4


