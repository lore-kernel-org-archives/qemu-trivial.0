Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7BLy-0002Dy-TL
	for mharc-qemu-trivial@gnu.org; Thu, 30 Aug 2012 16:28:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7BLx-000283-7c
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 16:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7BLw-0004dc-A6
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 16:28:37 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7BLu-0004dG-BS; Thu, 30 Aug 2012 16:28:34 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1EE177280027; Thu, 30 Aug 2012 22:28:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gPNXSSR3ci99; Thu, 30 Aug 2012 22:28:31 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id B7557728002A; Thu, 30 Aug 2012 22:28:31 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Thu, 30 Aug 2012 22:28:31 +0200
Message-Id: <1346358511-27720-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH for 1.2] w32: Fix broken build
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
X-List-Received-Date: Thu, 30 Aug 2012 20:28:38 -0000

Commit ef8621b1a3b199c348606c0a11a77d8e8bf135f1 added an include
file which is not available for MinGW compilations.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-i386/cpu.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index f3cac49..423e009 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -33,7 +33,9 @@
 #include "hyperv.h"
 
 #include "hw/hw.h"
+#if defined(CONFIG_KVM)
 #include <linux/kvm_para.h>
+#endif
 
 /* feature flags taken from "Intel Processor Identification and the CPUID
  * Instruction" and AMD's "CPUID Specification".  In cases of disagreement
-- 
1.7.10


