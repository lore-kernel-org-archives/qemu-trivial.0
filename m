Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnGn-0006tp-9C
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:08:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGb-0006Mv-AP
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGU-00064T-Bx
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:53 -0500
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:38000)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RSnGP-000623-RH
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:07:46 -0500
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Tue, 22 Nov 2011 15:37:31 +0530
Received: from d28relay03.in.ibm.com ([9.184.220.60])
	by e28smtp05.in.ibm.com ([192.168.1.135]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 22 Nov 2011 15:37:29 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAMA7Sql4784276; Tue, 22 Nov 2011 15:37:28 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pAMA7SZn028386; Tue, 22 Nov 2011 21:07:28 +1100
Received: from wdongxu-T410.cn.ibm.com (wdongxu-t410.cn.ibm.com
	[9.115.118.147] (may be forged))
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pAMA6u0T026400; Tue, 22 Nov 2011 21:07:27 +1100
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 18:06:26 +0800
Message-Id: <1321956386-12004-11-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
x-cbid: 11112210-8256-0000-0000-0000003D96C2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.5
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 11/11] fix spelling in main directory
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
X-List-Received-Date: Tue, 22 Nov 2011 10:08:04 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>


Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 arm-dis.c      |    6 +++---
 cpu-all.h      |    2 +-
 cpu-common.h   |    2 +-
 cpus.c         |    2 +-
 exec-memory.h  |    2 +-
 hppa-dis.c     |    2 +-
 m68k-dis.c     |    2 +-
 main-loop.h    |    2 +-
 nbd.c          |    4 ++--
 qemu-io.c      |    2 +-
 qemu-option.c  |    2 +-
 qerror.c       |    2 +-
 savevm.c       |    2 +-
 test-visitor.c |   10 +++++-----
 vl.c           |    2 +-
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arm-dis.c b/arm-dis.c
index 3ece02c..6bc4d71 100644
--- a/arm-dis.c
+++ b/arm-dis.c
@@ -1624,7 +1624,7 @@ arm_decode_shift (long given, fprintf_function func, void *stream,
 }
 
 /* Print one coprocessor instruction on INFO->STREAM.
-   Return true if the instuction matched, false if this is not a
+   Return true if the instruction matched, false if this is not a
    recognised coprocessor instruction.  */
 
 static bfd_boolean
@@ -2214,7 +2214,7 @@ print_arm_address (bfd_vma pc, struct disassemble_info *info, long given)
 }
 
 /* Print one neon instruction on INFO->STREAM.
-   Return true if the instuction matched, false if this is not a
+   Return true if the instruction matched, false if this is not a
    recognised neon instruction.  */
 
 static bfd_boolean
@@ -3927,7 +3927,7 @@ print_insn_arm (bfd_vma pc, struct disassemble_info *info)
 	    n = last_mapping_sym - 1;
 
 	  /* No mapping symbol found at this address.  Look backwards
-	     for a preceeding one.  */
+	     for a preceding one.  */
 	  for (; n >= 0; n--)
 	    {
 	      if (get_sym_code_type (info, n, &type))
diff --git a/cpu-all.h b/cpu-all.h
index 5f47ab8..7246a67 100644
--- a/cpu-all.h
+++ b/cpu-all.h
@@ -368,7 +368,7 @@ DECLARE_TLS(CPUState *,cpu_single_env);
 #define CPU_INTERRUPT_TGT_EXT_4   0x1000
 
 /* Several target-specific internal interrupts.  These differ from the
-   preceeding target-specific interrupts in that they are intended to
+   preceding target-specific interrupts in that they are intended to
    originate from within the cpu itself, typically in response to some
    instruction being executed.  These, therefore, are not masked while
    single-stepping within the debugger.  */
diff --git a/cpu-common.h b/cpu-common.h
index c9878ba..7c9cef8 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -1,7 +1,7 @@
 #ifndef CPU_COMMON_H
 #define CPU_COMMON_H 1
 
-/* CPU interfaces that are target indpendent.  */
+/* CPU interfaces that are target independent.  */
 
 #ifdef TARGET_PHYS_ADDR_BITS
 #include "targphys.h"
diff --git a/cpus.c b/cpus.c
index 82530c4..9d2a2cb 100644
--- a/cpus.c
+++ b/cpus.c
@@ -281,7 +281,7 @@ void qemu_clock_warp(QEMUClock *clock)
          * (related to the time left until the next event) has passed.  This
          * rt_clock timer will do this.  This avoids that the warps are too
          * visible externally---for example, you will not be sending network
-         * packets continously instead of every 100ms.
+         * packets continuously instead of every 100ms.
          */
         qemu_mod_timer(icount_warp_timer, vm_clock_warp_start + deadline);
     } else {
diff --git a/exec-memory.h b/exec-memory.h
index 334219f..1cd92ee 100644
--- a/exec-memory.h
+++ b/exec-memory.h
@@ -1,5 +1,5 @@
 /*
- * Internal memory managment interfaces
+ * Internal memory management interfaces
  *
  * Copyright 2011 Red Hat, Inc. and/or its affiliates
  *
diff --git a/hppa-dis.c b/hppa-dis.c
index 435da73..420a7d2 100644
--- a/hppa-dis.c
+++ b/hppa-dis.c
@@ -564,7 +564,7 @@ If not, see <http://www.gnu.org/licenses/>. */
  */
 
 /* There are two kinds of delay slot nullification: normal which is
- * controled by the nullification bit, and conditional, which depends
+ * controlled by the nullification bit, and conditional, which depends
  * on the direction of the branch and its success or failure.
  *
  * NONE is unfortunately #defined in the hiux system include files.
diff --git a/m68k-dis.c b/m68k-dis.c
index 04f837a..2b155de 100644
--- a/m68k-dis.c
+++ b/m68k-dis.c
@@ -3518,7 +3518,7 @@ const struct m68k_opcode m68k_opcodes[] =
 
 /* NOTE: The mcf5200 family programmer's reference manual does not
    indicate the byte form of the movea instruction is invalid (as it
-   is on 68000 family cpus).  However, experiments on the 5202 yeild
+   is on 68000 family cpus).  However, experiments on the 5202 yield
    unexpected results.  The value is copied, but it is not sign extended
    (as is done with movea.w) and the top three bytes in the address
    register are not disturbed.  I don't know if this is the intended
diff --git a/main-loop.h b/main-loop.h
index 8a716b1..876092d 100644
--- a/main-loop.h
+++ b/main-loop.h
@@ -111,7 +111,7 @@ typedef int PollingFunc(void *opaque);
  * qemu_add_wait_object.
  *
  * Polling callbacks really have nothing Windows specific in them, but
- * as they are a hack and are currenly not necessary under POSIX systems,
+ * as they are a hack and are currently not necessary under POSIX systems,
  * they are only available when QEMU is running under Windows.
  *
  * @func: The function that does the polling, and returns 1 to force
diff --git a/nbd.c b/nbd.c
index e6c931c..de880fe 100644
--- a/nbd.c
+++ b/nbd.c
@@ -203,7 +203,7 @@ int nbd_negotiate(int csock, off_t size, uint32_t flags)
         return -1;
     }
 
-    TRACE("Negotation succeeded.");
+    TRACE("Negotiation succeeded.");
 
     return 0;
 }
@@ -215,7 +215,7 @@ int nbd_receive_negotiate(int csock, const char *name, uint32_t *flags,
     uint64_t magic, s;
     uint16_t tmp;
 
-    TRACE("Receiving negotation.");
+    TRACE("Receiving negotiation.");
 
     if (read_sync(csock, buf, 8) != 8) {
         LOG("read failed");
diff --git a/qemu-io.c b/qemu-io.c
index de26422..f70de0b 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -445,7 +445,7 @@ static int read_f(int argc, char **argv)
     }
 
     if ((pattern_count < 0) || (pattern_count + pattern_offset > count))  {
-        printf("pattern verfication range exceeds end of read data\n");
+        printf("pattern verification range exceeds end of read data\n");
         return 0;
     }
 
diff --git a/qemu-option.c b/qemu-option.c
index f97a758..6b23c31 100644
--- a/qemu-option.c
+++ b/qemu-option.c
@@ -480,7 +480,7 @@ void print_option_parameters(QEMUOptionParameter *list)
                 printf("%s=%" PRId64 " ", list->name, list->value.n);
                 break;
             default:
-                printf("%s=(unkown type) ", list->name);
+                printf("%s=(unknown type) ", list->name);
                 break;
         }
         list++;
diff --git a/qerror.c b/qerror.c
index fdf62b9..b12c85c 100644
--- a/qerror.c
+++ b/qerror.c
@@ -223,7 +223,7 @@ static const QErrorStringTable qerror_table[] = {
     },
     {
         .error_fmt = QERR_UNDEFINED_ERROR,
-        .desc      = "An undefined error has ocurred",
+        .desc      = "An undefined error has occurred",
     },
     {
         .error_fmt = QERR_UNSUPPORTED,
diff --git a/savevm.c b/savevm.c
index f53cd4c..a827ca2 100644
--- a/savevm.c
+++ b/savevm.c
@@ -1552,7 +1552,7 @@ int qemu_savevm_state_begin(Monitor *mon, QEMUFile *f, int blk_enable,
 }
 
 /*
- * this funtion has three return values:
+ * this function has three return values:
  *   negative: there was one error, and we have -errno.
  *   0 : We haven't finished, caller have to go again
  *   1 : We have finished, we can go to complete phase
diff --git a/test-visitor.c b/test-visitor.c
index 847ce14..f90b711 100644
--- a/test-visitor.c
+++ b/test-visitor.c
@@ -166,7 +166,7 @@ static void test_nested_structs(void)
     QString *str;
 
     ud1.integer = 42;
-    ud1.string = strdup("fourty two");
+    ud1.string = strdup("forty two");
 
     /* sanity check */
     mo = qmp_output_visitor_new();
@@ -179,13 +179,13 @@ static void test_nested_structs(void)
     g_assert(obj);
     qobject_decref(obj);
 
-    ud2.string = strdup("fourty three");
-    ud2.dict.string = strdup("fourty four");
+    ud2.string = strdup("forty three");
+    ud2.dict.string = strdup("forty four");
     ud2.dict.dict.userdef = ud1_p;
-    ud2.dict.dict.string = strdup("fourty five");
+    ud2.dict.dict.string = strdup("forty five");
     ud2.dict.has_dict2 = true;
     ud2.dict.dict2.userdef = ud1_p;
-    ud2.dict.dict2.string = strdup("fourty six");
+    ud2.dict.dict2.string = strdup("forty six");
 
     /* c type -> qobject */
     mo = qmp_output_visitor_new();
diff --git a/vl.c b/vl.c
index f5afed4..029e523 100644
--- a/vl.c
+++ b/vl.c
@@ -820,7 +820,7 @@ static void validate_bootdevices(char *devices)
         /* Allowed boot devices are:
          * a-b: floppy disk drives
          * c-f: IDE disk drives
-         * g-m: machine implementation dependant drives
+         * g-m: machine implementation dependent drives
          * n-p: network devices
          * It's up to each machine implementation to check if the given boot
          * devices match the actual hardware implementation and firmware
-- 
1.7.5.4


