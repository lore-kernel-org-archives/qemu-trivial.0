Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWfG-0004jK-92
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWfA-0004Xt-IW
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWf9-00032S-EM
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:22:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWf1-0002ud-3g; Thu, 19 Mar 2015 05:22:39 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7BD0C41E3E;
	Thu, 19 Mar 2015 12:22:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 395A192E;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 335 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:24 +0300
Message-Id: <327e9759f11a001545f2fbbf796a85d3d55f1b15.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Leon Alrae <leon.alrae@imgtec.com>
Subject: [Qemu-trivial] [PULL 06/24] target-mips: Fix warning from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:22:53 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

target-mips/dsp_helper.c:3681:5: warning: returning void-valued expression

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Leon Alrae <leon.alrae@imgtec.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


