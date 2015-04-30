Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhwN-0005hM-4n
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 02:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwE-0005Ok-K6
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhwD-0002bn-Sa
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 02:27:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynhw7-0002Z7-9C; Thu, 30 Apr 2015 02:27:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D176A42BA3;
	Thu, 30 Apr 2015 09:27:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6158F95A;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4352 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:42 +0300
Message-Id: <c07712e580f1d136bddd367edeb70bf3972d72b7.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 29/42] microblaze: cpu: Renumber EXCP_*
	constants to close gap
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
X-List-Received-Date: Thu, 30 Apr 2015 06:27:12 -0000

After removal of EXCP_NMI there's a gap in EXCP_*
numbering. Let's remove it.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
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


