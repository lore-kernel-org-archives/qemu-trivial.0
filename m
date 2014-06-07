Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJpt-0002MP-Lt
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:51:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJpr-0002Jb-Sm
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJpr-0001Om-4o
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:51:15 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJpo-0001O4-Gx; Sat, 07 Jun 2014 12:51:12 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJpn-0003bC-Uz; Sat, 07 Jun 2014 17:51:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:51:11 +0100
Message-Id: <1402159871-13809-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/isa/pc87312: Remove unused function
	is_parallel_epp()
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
X-List-Received-Date: Sat, 07 Jun 2014 16:51:16 -0000

The function is_parallel_epp() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/isa/pc87312.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index b352b49..9327c53 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -86,11 +86,6 @@ static inline uint32_t get_parallel_irq(PC87312State *s)
     }
 }
 
-static inline bool is_parallel_epp(PC87312State *s)
-{
-    return s->regs[REG_PTR] & PTR_EPP_MODE;
-}
-
 
 /* UARTs */
 
-- 
1.8.5.4


