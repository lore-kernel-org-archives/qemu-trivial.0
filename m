Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnKjK-0002zR-J3
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 01:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnKjI-0002w4-M4
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 01:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnKjH-0004U5-Rt
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 01:40:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnKjD-0004Ax-K7; Wed, 29 Apr 2015 01:40:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C6EA42A19;
	Wed, 29 Apr 2015 08:40:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 71D1593D;
	Wed, 29 Apr 2015 08:40:02 +0300 (MSK)
Received: (nullmailer pid 2556 invoked by uid 1000);
	Wed, 29 Apr 2015 05:40:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 29 Apr 2015 08:40:01 +0300
Message-Id: <1430286001-2473-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] mb: cpu: Renumber EXCP_* constants to close
	gap
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
X-List-Received-Date: Wed, 29 Apr 2015 05:40:17 -0000

After removal of EXCP_NMI there's a gap in EXCP_*
numbering. Let's remove it.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
Since I applied Peter's series already, without renumbering,
b/c he wanted to make no code changes and that's a good plan,
I send this renumbering as a separate change.  Hopefully this
way it is possible to get Reviewed-by from Edgar for the whole
series including this my change in a separate patch, because
Edgar only gave his R-b for the series with the change :)

 target-microblaze/cpu.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 6522af7..d389597 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -36,11 +36,11 @@ typedef struct CPUMBState CPUMBState;
 
 #define ELF_MACHINE	EM_MICROBLAZE
 
-#define EXCP_MMU        2
-#define EXCP_IRQ        3
-#define EXCP_BREAK      4
-#define EXCP_HW_BREAK   5
-#define EXCP_HW_EXCP    6
+#define EXCP_MMU        1
+#define EXCP_IRQ        2
+#define EXCP_BREAK      3
+#define EXCP_HW_BREAK   4
+#define EXCP_HW_EXCP    5
 
 /* MicroBlaze-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-- 
2.1.4


