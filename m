Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRa-0007qX-Fa
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRU-0007f6-LS
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRQ-0001W9-35
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRG-0001Nu-IH; Tue, 24 Jun 2014 12:19:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 129C544087;
	Tue, 24 Jun 2014 20:19:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7A20F6BD;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15638 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:20 +0400
Message-Id: <1403626160-15546-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hunter Laux <hunterlaux@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/14] Add support for the arm breakpoint
	syscall
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:37 -0000

From: Hunter Laux <hunterlaux@gmail.com>

OABI arm used a software interrupt(0xef9f0001) for breakpoints.
Since 2005 gdb has used the break instruction(0xe7f001f0) for EABI.
Apparently Steel Bank Common Lisp still uses the swi instruction.

This is the kernel implementation:
http://lxr.free-electrons.com/source/arch/arm/kernel/traps.c#L598

Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/arm/syscall.h |    1 +
 linux-user/main.c        |    4 ++++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/arm/syscall.h b/linux-user/arm/syscall.h
index ce2c2a8..e0d2cc3 100644
--- a/linux-user/arm/syscall.h
+++ b/linux-user/arm/syscall.h
@@ -29,6 +29,7 @@ struct target_pt_regs {
 #define ARM_THUMB_SYSCALL	0
 
 #define ARM_NR_BASE	  0xf0000
+#define ARM_NR_breakpoint (ARM_NR_BASE + 1)
 #define ARM_NR_cacheflush (ARM_NR_BASE + 2)
 #define ARM_NR_set_tls	  (ARM_NR_BASE + 5)
 
diff --git a/linux-user/main.c b/linux-user/main.c
index df1bb0e..900a17f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -806,6 +806,9 @@ void cpu_loop(CPUARMState *env)
                             cpu_set_tls(env, env->regs[0]);
                             env->regs[0] = 0;
                             break;
+                        case ARM_NR_breakpoint:
+                            env->regs[15] -= env->thumb ? 2 : 4;
+                            goto excp_debug;
                         default:
                             gemu_log("qemu: Unsupported ARM syscall: 0x%x\n",
                                      n);
@@ -849,6 +852,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_DEBUG:
+        excp_debug:
             {
                 int sig;
 
-- 
1.7.10.4


