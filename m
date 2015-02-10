Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fQ-0006Og-90
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fJ-0006BW-3O
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fH-0007pi-Ka
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f2-0007kY-FZ; Tue, 10 Feb 2015 01:51:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2F80A41812;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BA1B7952;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9355 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:00 +0300
Message-Id: <a86b3c64d45f2bf306fd4bf879abb4ac21d761f9.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang S <gang.chen@sunrus.com.cn>, Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 11/46] linux-user/main.c: Use TARGET_SIG*
	instead of SIG*
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:25 -0000

From: Chen Gang S <gang.chen@sunrus.com.cn>

In main.c, all SIG* should be TARGET_SIG*, since the relevant functions
(queue_signal() and gdb_handlesig()) expect TARGET_SIG*.

The corresponding vi command is "1,$ s/\<SIG/TARGET_SIG/g".

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/main.c | 64 +++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index cfa7d07..d92702a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -315,7 +315,7 @@ void cpu_loop(CPUX86State *env)
 #endif
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
-            info.si_signo = SIGBUS;
+            info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
             info.si_code = TARGET_SI_KERNEL;
             info._sifields._sigfault._addr = 0;
@@ -329,7 +329,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 info.si_code = TARGET_SI_KERNEL;
                 info._sifields._sigfault._addr = 0;
@@ -337,7 +337,7 @@ void cpu_loop(CPUX86State *env)
             }
             break;
         case EXCP0E_PAGE:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             if (!(env->error_code & 1))
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -354,7 +354,7 @@ void cpu_loop(CPUX86State *env)
 #endif
             {
                 /* division by zero */
-                info.si_signo = SIGFPE;
+                info.si_signo = TARGET_SIGFPE;
                 info.si_errno = 0;
                 info.si_code = TARGET_FPE_INTDIV;
                 info._sifields._sigfault._addr = env->eip;
@@ -369,7 +369,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGTRAP;
+                info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
                 if (trapnr == EXCP01_DB) {
                     info.si_code = TARGET_TRAP_BRKPT;
@@ -389,7 +389,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 info.si_code = TARGET_SI_KERNEL;
                 info._sifields._sigfault._addr = 0;
@@ -397,7 +397,7 @@ void cpu_loop(CPUX86State *env)
             }
             break;
         case EXCP06_ILLOP:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->eip;
@@ -519,7 +519,7 @@ segv:
     end_exclusive();
     /* We get the PC of the entry address - which is as good as anything,
        on a real kernel what you get depends on which mode it uses. */
-    info.si_signo = SIGSEGV;
+    info.si_signo = TARGET_SIGSEGV;
     info.si_errno = 0;
     /* XXX: check env->error_code */
     info.si_code = TARGET_SEGV_MAPERR;
@@ -696,7 +696,7 @@ void cpu_loop(CPUARMState *env)
 
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
-                    info.si_signo = SIGILL;
+                    info.si_signo = TARGET_SIGILL;
                     info.si_errno = 0;
                     info.si_code = TARGET_ILL_ILLOPN;
                     info._sifields._sigfault._addr = env->regs[15];
@@ -720,7 +720,7 @@ void cpu_loop(CPUARMState *env)
                     //printf("fpsr 0x%x, arm_fpe 0x%x\n",fpsr,arm_fpe);
 
                     if (fpsr & (arm_fpe << 16)) { /* exception enabled? */
-                      info.si_signo = SIGFPE;
+                      info.si_signo = TARGET_SIGFPE;
                       info.si_errno = 0;
 
                       /* ordered by priority, least first */
@@ -844,7 +844,7 @@ void cpu_loop(CPUARMState *env)
         case EXCP_DATA_ABORT:
             addr = env->exception.vaddress;
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -1030,7 +1030,7 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->pc;
@@ -1043,7 +1043,7 @@ void cpu_loop(CPUARMState *env)
             /* fall through for segv */
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             /* XXX: check env->error_code */
             info.si_code = TARGET_SEGV_MAPERR;
@@ -1123,7 +1123,7 @@ void cpu_loop(CPUUniCore32State *env)
             break;
         case UC32_EXCP_DTRAP:
         case UC32_EXCP_ITRAP:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             /* XXX: check env->error_code */
             info.si_code = TARGET_SEGV_MAPERR;
@@ -2672,7 +2672,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_BUSERR:
             qemu_log("\nBus error, exit, pc is %#x\n", env->pc);
-            gdbsig = SIGBUS;
+            gdbsig = TARGET_SIGBUS;
             break;
         case EXCP_DPF:
         case EXCP_IPF:
@@ -2684,11 +2684,11 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_ALIGN:
             qemu_log("\nAlignment pc is %#x\n", env->pc);
-            gdbsig = SIGBUS;
+            gdbsig = TARGET_SIGBUS;
             break;
         case EXCP_ILLEGAL:
             qemu_log("\nIllegal instructionpc is %#x\n", env->pc);
-            gdbsig = SIGILL;
+            gdbsig = TARGET_SIGILL;
             break;
         case EXCP_INT:
             qemu_log("\nExternal interruptpc is %#x\n", env->pc);
@@ -2699,7 +2699,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_RANGE:
             qemu_log("\nRange\n");
-            gdbsig = SIGSEGV;
+            gdbsig = TARGET_SIGSEGV;
             break;
         case EXCP_SYSCALL:
             env->pc += 4;   /* 0xc00; */
@@ -2717,7 +2717,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_TRAP:
             qemu_log("\nTrap\n");
-            gdbsig = SIGTRAP;
+            gdbsig = TARGET_SIGTRAP;
             break;
         case EXCP_NR:
             qemu_log("\nNR\n");
@@ -2787,7 +2787,7 @@ void cpu_loop(CPUSH4State *env)
             break;
 	case 0xa0:
 	case 0xc0:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->tea;
@@ -2818,7 +2818,7 @@ void cpu_loop(CPUCRISState *env)
         switch (trapnr) {
         case 0xaa:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -2879,7 +2879,7 @@ void cpu_loop(CPUMBState *env)
         switch (trapnr) {
         case 0xaa:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -2917,14 +2917,14 @@ void cpu_loop(CPUMBState *env)
 
             switch (env->sregs[SR_ESR] & 31) {
                 case ESR_EC_DIVZERO:
-                    info.si_signo = SIGFPE;
+                    info.si_signo = TARGET_SIGFPE;
                     info.si_errno = 0;
                     info.si_code = TARGET_FPE_FLTDIV;
                     info._sifields._sigfault._addr = 0;
                     queue_signal(env, info.si_signo, &info);
                     break;
                 case ESR_EC_FPU:
-                    info.si_signo = SIGFPE;
+                    info.si_signo = TARGET_SIGFPE;
                     info.si_errno = 0;
                     if (env->sregs[SR_FSR] & FSR_IO) {
                         info.si_code = TARGET_FPE_FLTINV;
@@ -3003,7 +3003,7 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_LINEF:
         case EXCP_UNSUPPORTED:
         do_sigill:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->pc;
@@ -3030,7 +3030,7 @@ void cpu_loop(CPUM68KState *env)
             break;
         case EXCP_ACCESS:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -3337,12 +3337,12 @@ void cpu_loop(CPUS390XState *env)
             switch (n) {
             case PGM_OPERATION:
             case PGM_PRIVILEGED:
-                sig = SIGILL;
+                sig = TARGET_SIGILL;
                 n = TARGET_ILL_ILLOPC;
                 goto do_signal_pc;
             case PGM_PROTECTION:
             case PGM_ADDRESSING:
-                sig = SIGSEGV;
+                sig = TARGET_SIGSEGV;
                 /* XXX: check env->error_code */
                 n = TARGET_SEGV_MAPERR;
                 addr = env->__excp_addr;
@@ -3352,16 +3352,16 @@ void cpu_loop(CPUS390XState *env)
             case PGM_SPECIAL_OP:
             case PGM_OPERAND:
             do_sigill_opn:
-                sig = SIGILL;
+                sig = TARGET_SIGILL;
                 n = TARGET_ILL_ILLOPN;
                 goto do_signal_pc;
 
             case PGM_FIXPT_OVERFLOW:
-                sig = SIGFPE;
+                sig = TARGET_SIGFPE;
                 n = TARGET_FPE_INTOVF;
                 goto do_signal_pc;
             case PGM_FIXPT_DIVIDE:
-                sig = SIGFPE;
+                sig = TARGET_SIGFPE;
                 n = TARGET_FPE_INTDIV;
                 goto do_signal_pc;
 
@@ -3386,7 +3386,7 @@ void cpu_loop(CPUS390XState *env)
                         /* ??? Quantum exception; BFP, DFP error.  */
                         goto do_sigill_opn;
                     }
-                    sig = SIGFPE;
+                    sig = TARGET_SIGFPE;
                     goto do_signal_pc;
                 }
 
-- 
2.1.4


