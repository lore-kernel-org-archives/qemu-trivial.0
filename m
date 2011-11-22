Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnGO-0005mZ-4T
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:07:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGF-0005JM-Gn
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnG9-00060m-KE
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:31 -0500
Received: from e28smtp06.in.ibm.com ([122.248.162.6]:58936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnG7-0005zX-Th
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:25 -0500
Received: from /spool/local
	by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:14 +0530
Received: from d28relay03.in.ibm.com ([9.184.220.60])
	by e28smtp06.in.ibm.com ([192.168.1.136]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:12 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7CiJ4452480; Tue, 22 Nov 2011 15:37:12 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7BqN027570; Tue, 22 Nov 2011 21:07:12 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0K026400; Tue, 22 Nov 2011 21:07:10 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:17 +0800
Message-Id: <1321956386-12004-2-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-9574-0000-0000-0000004060E6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.6
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 02/11] fix spelling in linux-user sub
	directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:07:37 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 linux-user/elfload.c      |    2 +-
 linux-user/flatload.c     |    2 +-
 linux-user/main.c         |    4 ++--
 linux-user/signal.c       |    2 +-
 linux-user/syscall_defs.h |    6 +++---
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 4635bb2..ea61d0d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2339,7 +2339,7 @@ static void fill_auxv_note(struct memelfnote *note, const TaskState *ts)
      * strictly necessary but we do it here for sake of completeness.
      */
 
-    /* find out lenght of the vector, AT_NULL is terminator */
+    /* find out length of the vector, AT_NULL is terminator */
     i = len = 0;
     do {
         get_user_ual(val, auxv);
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 1062da3..be79496 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -575,7 +575,7 @@ static int load_flat_file(struct linux_binprm * bprm,
      * help simplify all this mumbo jumbo
      *
      * We've got two different sections of relocation entries.
-     * The first is the GOT which resides at the begining of the data segment
+     * The first is the GOT which resides at the beginning of the data segment
      * and is terminated with a -1.  This one can be relocated in place.
      * The second is the extra relocation entries tacked after the image's
      * data segment. These require a little more processing as the entry is
diff --git a/linux-user/main.c b/linux-user/main.c
index d1bbc57..64d2208 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -1638,7 +1638,7 @@ void cpu_loop(CPUPPCState *env)
             queue_signal(env, info.si_signo, &info);
             break;
         case POWERPC_EXCP_PIT:      /* Programmable interval timer IRQ       */
-            cpu_abort(env, "Programable interval timer interrupt "
+            cpu_abort(env, "Programmable interval timer interrupt "
                       "while in user mode. Aborting\n");
             break;
         case POWERPC_EXCP_IO:       /* IO error exception                    */
@@ -2434,7 +2434,7 @@ void cpu_loop (CPUState *env)
             if (env->iflags & D_FLAG) {
                 env->sregs[SR_ESR] |= 1 << 12;
                 env->sregs[SR_PC] -= 4;
-                /* FIXME: if branch was immed, replay the imm aswell.  */
+                /* FIXME: if branch was immed, replay the imm as well.  */
             }
 
             env->iflags &= ~(IMM_FLAG | D_FLAG);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 78e3380..ded12ca 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -80,7 +80,7 @@ static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGSYS] = TARGET_SIGSYS,
     /* next signals stay the same */
     /* Nasty hack: Reverse SIGRTMIN and SIGRTMAX to avoid overlap with
-       host libpthread signals.  This assumes noone actually uses SIGRTMAX :-/
+       host libpthread signals.  This assumes no one actually uses SIGRTMAX :-/
        To fix this properly we need to do manual signal delivery multiplexed
        over a single host signal.  */
     [__SIGRTMIN] = __SIGRTMAX,
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 9dd1b8e..2857805 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1,7 +1,7 @@
 /* common syscall defines for all architectures */
 
 /* Note: although the syscall numbers change between architectures,
-   most of them stay the same, so we handle it by puting ifdefs if
+   most of them stay the same, so we handle it by putting ifdefs if
    necessary */
 
 #include "syscall_nr.h"
@@ -669,7 +669,7 @@ typedef struct target_siginfo {
  * SIGBUS si_codes
  */
 #define TARGET_BUS_ADRALN       (1)	/* invalid address alignment */
-#define TARGET_BUS_ADRERR       (2)	/* non-existant physical address */
+#define TARGET_BUS_ADRERR       (2)	/* non-existent physical address */
 #define TARGET_BUS_OBJERR       (3)	/* object specific hardware error */
 
 /*
@@ -868,7 +868,7 @@ struct target_pollfd {
 #define TARGET_CDROM_GET_MCN		0x5311 /* Obtain the "Universal Product Code"
                                            if available (struct cdrom_mcn) */
 #define TARGET_CDROM_GET_UPC		TARGET_CDROM_GET_MCN  /* This one is depricated,
-                                          but here anyway for compatability */
+                                          but here anyway for compatibility */
 #define TARGET_CDROMRESET		0x5312 /* hard-reset the drive */
 #define TARGET_CDROMVOLREAD		0x5313 /* Get the drive's volume setting
                                           (struct cdrom_volctrl) */
-- 
1.7.5.4


