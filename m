Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFLMu-0005W2-3H
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 06:28:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFLMr-0005Sy-6u
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 06:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFLMp-0007Ki-KY
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 06:28:37 -0500
Received: from out1134-195.mail.aliyun.com ([42.120.134.195]:20644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFLMj-0007JW-Rc; Sun, 25 Jan 2015 06:28:30 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07607346|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03006; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.110) by smtp.aliyun-inc.com(10.194.100.114);
	Sun, 25 Jan 2015 19:28:17 +0800
Message-ID: <54C4D51E.4030408@sunrus.com.cn>
Date: Sun, 25 Jan 2015 19:35:58 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 42.120.134.195
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user/main.c: Use TARGET_SIG* instead
	of SIG*
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
X-List-Received-Date: Sun, 25 Jan 2015 11:28:38 -0000

In main.c, all SIG* need be change to TARGET_SIG*, since the related
next call are all for TARGET_SIG*: queue_signal() and gdb_handlesig().

The related vi operation command is "1,$ s/\<SIG/TARGET_SIG/g".


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/main.c | 64 +++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 2d52c1f..bb214b6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -313,7 +313,7 @@ void cpu_loop(CPUX86State *env)
 #endif
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
-            info.si_signo = SIGBUS;
+            info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
             info.si_code = TARGET_SI_KERNEL;
             info._sifields._sigfault._addr = 0;
@@ -327,7 +327,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 info.si_code = TARGET_SI_KERNEL;
                 info._sifields._sigfault._addr = 0;
@@ -335,7 +335,7 @@ void cpu_loop(CPUX86State *env)
             }
             break;
         case EXCP0E_PAGE:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             if (!(env->error_code & 1))
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -352,7 +352,7 @@ void cpu_loop(CPUX86State *env)
 #endif
             {
                 /* division by zero */
-                info.si_signo = SIGFPE;
+                info.si_signo = TARGET_SIGFPE;
                 info.si_errno = 0;
                 info.si_code = TARGET_FPE_INTDIV;
                 info._sifields._sigfault._addr = env->eip;
@@ -367,7 +367,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGTRAP;
+                info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
                 if (trapnr == EXCP01_DB) {
                     info.si_code = TARGET_TRAP_BRKPT;
@@ -387,7 +387,7 @@ void cpu_loop(CPUX86State *env)
             } else
 #endif
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 info.si_code = TARGET_SI_KERNEL;
                 info._sifields._sigfault._addr = 0;
@@ -395,7 +395,7 @@ void cpu_loop(CPUX86State *env)
             }
             break;
         case EXCP06_ILLOP:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->eip;
@@ -517,7 +517,7 @@ segv:
     end_exclusive();
     /* We get the PC of the entry address - which is as good as anything,
        on a real kernel what you get depends on which mode it uses. */
-    info.si_signo = SIGSEGV;
+    info.si_signo = TARGET_SIGSEGV;
     info.si_errno = 0;
     /* XXX: check env->error_code */
     info.si_code = TARGET_SEGV_MAPERR;
@@ -692,7 +692,7 @@ void cpu_loop(CPUARMState *env)
 
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
-                    info.si_signo = SIGILL;
+                    info.si_signo = TARGET_SIGILL;
                     info.si_errno = 0;
                     info.si_code = TARGET_ILL_ILLOPN;
                     info._sifields._sigfault._addr = env->regs[15];
@@ -716,7 +716,7 @@ void cpu_loop(CPUARMState *env)
                     //printf("fpsr 0x%x, arm_fpe 0x%x\n",fpsr,arm_fpe);
 
                     if (fpsr & (arm_fpe << 16)) { /* exception enabled? */
-                      info.si_signo = SIGFPE;
+                      info.si_signo = TARGET_SIGFPE;
                       info.si_errno = 0;
 
                       /* ordered by priority, least first */
@@ -840,7 +840,7 @@ void cpu_loop(CPUARMState *env)
         case EXCP_DATA_ABORT:
             addr = env->exception.vaddress;
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -1026,7 +1026,7 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->pc;
@@ -1039,7 +1039,7 @@ void cpu_loop(CPUARMState *env)
             /* fall through for segv */
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             /* XXX: check env->error_code */
             info.si_code = TARGET_SEGV_MAPERR;
@@ -1119,7 +1119,7 @@ void cpu_loop(CPUUniCore32State *env)
             break;
         case UC32_EXCP_DTRAP:
         case UC32_EXCP_ITRAP:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             /* XXX: check env->error_code */
             info.si_code = TARGET_SEGV_MAPERR;
@@ -2664,7 +2664,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_BUSERR:
             qemu_log("\nBus error, exit, pc is %#x\n", env->pc);
-            gdbsig = SIGBUS;
+            gdbsig = TARGET_SIGBUS;
             break;
         case EXCP_DPF:
         case EXCP_IPF:
@@ -2676,11 +2676,11 @@ void cpu_loop(CPUOpenRISCState *env)
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
@@ -2691,7 +2691,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_RANGE:
             qemu_log("\nRange\n");
-            gdbsig = SIGSEGV;
+            gdbsig = TARGET_SIGSEGV;
             break;
         case EXCP_SYSCALL:
             env->pc += 4;   /* 0xc00; */
@@ -2709,7 +2709,7 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_TRAP:
             qemu_log("\nTrap\n");
-            gdbsig = SIGTRAP;
+            gdbsig = TARGET_SIGTRAP;
             break;
         case EXCP_NR:
             qemu_log("\nNR\n");
@@ -2777,7 +2777,7 @@ void cpu_loop(CPUSH4State *env)
             break;
 	case 0xa0:
 	case 0xc0:
-            info.si_signo = SIGSEGV;
+            info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->tea;
@@ -2806,7 +2806,7 @@ void cpu_loop(CPUCRISState *env)
         switch (trapnr) {
         case 0xaa:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -2865,7 +2865,7 @@ void cpu_loop(CPUMBState *env)
         switch (trapnr) {
         case 0xaa:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -2903,14 +2903,14 @@ void cpu_loop(CPUMBState *env)
 
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
@@ -2987,7 +2987,7 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_LINEF:
         case EXCP_UNSUPPORTED:
         do_sigill:
-            info.si_signo = SIGILL;
+            info.si_signo = TARGET_SIGILL;
             info.si_errno = 0;
             info.si_code = TARGET_ILL_ILLOPN;
             info._sifields._sigfault._addr = env->pc;
@@ -3014,7 +3014,7 @@ void cpu_loop(CPUM68KState *env)
             break;
         case EXCP_ACCESS:
             {
-                info.si_signo = SIGSEGV;
+                info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* XXX: check env->error_code */
                 info.si_code = TARGET_SEGV_MAPERR;
@@ -3317,12 +3317,12 @@ void cpu_loop(CPUS390XState *env)
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
@@ -3332,16 +3332,16 @@ void cpu_loop(CPUS390XState *env)
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
 
@@ -3366,7 +3366,7 @@ void cpu_loop(CPUS390XState *env)
                         /* ??? Quantum exception; BFP, DFP error.  */
                         goto do_sigill_opn;
                     }
-                    sig = SIGFPE;
+                    sig = TARGET_SIGFPE;
                     goto do_signal_pc;
                 }
 
-- 
1.9.3

