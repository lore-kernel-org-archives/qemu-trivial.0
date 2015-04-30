Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhOp-00021W-9A
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:52:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOl-0001qh-5A
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhOk-0008CA-2l
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:52:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhOf-00088k-KG; Thu, 30 Apr 2015 01:52:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E949B42B93;
	Thu, 30 Apr 2015 08:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 05DF496A;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4345 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:39 +0300
Message-Id: <2a1ae7212c9cfdae58e244f545406e3a2d67dc11.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 26/42] microblaze: cpu: Remote unused
	cpu_get_pc
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
X-List-Received-Date: Thu, 30 Apr 2015 05:52:36 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This function is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 7d06227..2c18b49 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -333,11 +333,6 @@ static inline int cpu_interrupts_enabled(CPUMBState *env)
 
 #include "exec/cpu-all.h"
 
-static inline target_ulong cpu_get_pc(CPUMBState *env)
-{
-    return env->sregs[SR_PC];
-}
-
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
                                         target_ulong *cs_base, int *flags)
 {
-- 
2.1.4


