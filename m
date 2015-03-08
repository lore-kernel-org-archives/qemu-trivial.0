Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfrH-0003TM-7v
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:23:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfrF-0003QT-BF
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:23:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfrE-0007ZM-D3
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:23:21 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:46115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfr9-0007WM-M8; Sun, 08 Mar 2015 14:23:15 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 99EAC17F9E9; Sun,  8 Mar 2015 19:23:13 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:23:13 +0100
Message-Id: <1425838993-28677-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Leon Alrae <leon.alrae@imgtec.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 5/7] target-mips: Fix warning from Sparse
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
X-List-Received-Date: Sun, 08 Mar 2015 18:23:22 -0000

Sparse report:

target-mips/dsp_helper.c:3681:5: warning: returning void-valued expression

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-mips/dsp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
index 349f2a0..46528de 100644
--- a/target-mips/dsp_helper.c
+++ b/target-mips/dsp_helper.c
@@ -3678,7 +3678,7 @@ void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env)
 
 void helper_wrdsp(target_ulong rs, target_ulong mask_num, CPUMIPSState *env)
 {
-    return cpu_wrdsp(rs, mask_num, env);
+    cpu_wrdsp(rs, mask_num, env);
 }
 
 uint32_t cpu_rddsp(uint32_t mask_num, CPUMIPSState *env)
-- 
2.1.4


