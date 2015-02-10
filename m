Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8sV-0007es-BN
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 06:21:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sS-0007Ya-6s
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL8sR-0007Oo-A1
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 06:21:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL8sK-0007MD-Vu; Tue, 10 Feb 2015 06:21:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AE118418E4;
	Tue, 10 Feb 2015 14:21:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1193394B;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9363 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:04 +0300
Message-Id: <52851b7e3d816502b8ae4e8353f31fd9ee801509.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/46] cpu-exec: simplify icount code
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
X-List-Received-Date: Tue, 10 Feb 2015 11:21:13 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Use MIN instead of an "if" statement.  Move "tb" assignment where
the value is actually used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpu-exec.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 4ff1b23..6738117 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -499,22 +499,17 @@ int cpu_exec(CPUArchState *env)
                     case TB_EXIT_ICOUNT_EXPIRED:
                     {
                         /* Instruction counter expired.  */
-                        int insns_left;
-                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
-                        insns_left = cpu->icount_decr.u32;
+                        int insns_left = cpu->icount_decr.u32;
                         if (cpu->icount_extra && insns_left >= 0) {
                             /* Refill decrementer and continue execution.  */
                             cpu->icount_extra += insns_left;
-                            if (cpu->icount_extra > 0xffff) {
-                                insns_left = 0xffff;
-                            } else {
-                                insns_left = cpu->icount_extra;
-                            }
+                            insns_left = MIN(0xffff, cpu->icount_extra);
                             cpu->icount_extra -= insns_left;
                             cpu->icount_decr.u16.low = insns_left;
                         } else {
                             if (insns_left > 0) {
                                 /* Execute remaining instructions.  */
+                                tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
                                 cpu_exec_nocache(env, insns_left, tb);
                                 align_clocks(&sc, cpu);
                             }
-- 
2.1.4


