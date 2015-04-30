Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqV-0000R3-3a
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqP-0000CM-Cb
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqO-0006EA-IY
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqI-0006CR-H2; Thu, 30 Apr 2015 01:16:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 17A3342B8F;
	Thu, 30 Apr 2015 08:16:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5F704964;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4354 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:43 +0300
Message-Id: <051415a5059015759a03bfa11ff8c0736dba13c6.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 30/42] microblaze: cpu: delete unused
	cpu_interrupts_enabled
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:06 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This function is unused. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index d389597..4ea04ac 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -319,11 +319,6 @@ static inline int cpu_mmu_index (CPUMBState *env)
 int mb_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
                             int mmu_idx);
 
-static inline int cpu_interrupts_enabled(CPUMBState *env)
-{
-    return env->sregs[SR_MSR] & MSR_IE;
-}
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
-- 
2.1.4


