Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si25O-0004vI-Et
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 07:31:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si25G-0004Vk-FD
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Si25B-0005Qv-Sy
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:31:26 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:53418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si251-0005L6-8e; Fri, 22 Jun 2012 07:31:11 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Si24p-0005GH-VK; Fri, 22 Jun 2012 12:30:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2012 12:30:58 +0100
Message-Id: <1340364659-20200-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
References: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 1/2] cpu-common.h: Remove unnecessary guard
	on including targphys.h
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
X-List-Received-Date: Fri, 22 Jun 2012 11:31:32 -0000

There's no need to make the include of targphys.h conditional
on whether TARGET_PHYS_ADDR_BITS is defined, because targphys.h
itself checks that and does nothing if it isn't.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cpu-common.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/cpu-common.h b/cpu-common.h
index 1fe3280..321037f 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -3,9 +3,7 @@
 
 /* CPU interfaces that are target independent.  */
 
-#ifdef TARGET_PHYS_ADDR_BITS
 #include "targphys.h"
-#endif
 
 #ifndef NEED_CPU_H
 #include "poison.h"
-- 
1.7.1


