Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqU-0000PN-AS
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqO-00009Y-DI
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqN-0006DP-Jm
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqH-0006Bg-Qa; Thu, 30 Apr 2015 01:16:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 09FFD42B8C;
	Thu, 30 Apr 2015 08:16:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D220E95F;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4347 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:40 +0300
Message-Id: <2713b04266354ec063a7de89a54b194b544b38ea.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 27/42] microblaze: cpu: Remove unused CC_OP
	enum
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:05 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This enum is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/cpu.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 2c18b49..f21da2f 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -284,12 +284,6 @@ int cpu_mb_exec(CPUMBState *s);
 int cpu_mb_signal_handler(int host_signum, void *pinfo,
                           void *puc);
 
-enum {
-    CC_OP_DYNAMIC, /* Use env->cc_op  */
-    CC_OP_FLAGS,
-    CC_OP_CMP,
-};
-
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
 #define MMAP_SHIFT TARGET_PAGE_BITS
-- 
2.1.4


