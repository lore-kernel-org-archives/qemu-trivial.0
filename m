Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RuHfa-0004Xw-Av
	for mharc-qemu-trivial@gnu.org; Mon, 06 Feb 2012 01:03:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RuHfX-0004Xl-TW
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2012 01:03:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RuHfW-0005Sv-PP
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2012 01:03:15 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:37453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1RuHfR-0005Oq-ER; Mon, 06 Feb 2012 01:03:11 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 4D17319A;
	Mon,  6 Feb 2012 13:59:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=rsa1024; bh=VGcR63OI2vl7ODhi3A5Si0
	THkaY=; b=V7/6SEp33ALtvQbMzzkYDcz8buWFtW8ht0KIQ6yfwesHQXSzT3c5su
	cmOClTYGIqNhPugg147wD9Yaolehxu6JCrkzlWBNDCDMzsceg0aWwjhboh9s9Ezf
	dsiGiILce9pVU7HOvSoPm7+eE6AhxY4qcpN6p7BhecFzM82FzzbWg=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 2FC2C199;
	Mon,  6 Feb 2012 13:59:42 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q1662trk056580;
	Mon, 6 Feb 2012 14:02:55 +0800 (CST) (envelope-from chenwj)
Date: Mon, 6 Feb 2012 14:02:55 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20120206060255.GA55374@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] cpu-exec.c: Correct comment about this
 file and indentation cleanup
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
X-List-Received-Date: Mon, 06 Feb 2012 06:03:16 -0000

  Each target use #define marco (in target-xxx/cpu.h) to rename cpu_exec
(cpu-exec.c) to cpu_xxx_exec, then defines its own cpu_loop which calls
cpu_xxx_exec. So basically, cpu-exec.c is not i386 (only) emulator main
execution loop. This patch correctes the comment of this file and does
indentation cleanup.

Signed-off-by: Chen Wei-Ren (=E9=99=B3=E9=9F=8B=E4=BB=BB) <chenwj@iis.sin=
ica.edu.tw>
---
v1 -> v2:

 Didn't notice tab in previous patch, please use this patch instead.=20
 Sorry about that.

 cpu-exec.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index a9fa608..2c2d24e 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -1,5 +1,5 @@
 /*
- *  i386 emulator main execution loop
+ *  emulator main execution loop
  *
  *  Copyright (c) 2003-2005 Fabrice Bellard
  *
@@ -304,7 +304,7 @@ int cpu_exec(CPUState *env)
                             env->hflags2 |=3D HF2_NMI_MASK;
                             do_interrupt_x86_hardirq(env, EXCP02_NMI, 1)=
;
                             next_tb =3D 0;
-			} else if (interrupt_request & CPU_INTERRUPT_MCE) {
+                        } else if (interrupt_request & CPU_INTERRUPT_MCE=
) {
                             env->interrupt_request &=3D ~CPU_INTERRUPT_M=
CE;
                             do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0=
);
                             next_tb =3D 0;
@@ -390,7 +390,7 @@ int cpu_exec(CPUState *env)
                                 next_tb =3D 0;
                             }
                         }
-		    }
+                    }
 #elif defined(TARGET_ARM)
                     if (interrupt_request & CPU_INTERRUPT_FIQ
                         && !(env->uncached_cpsr & CPSR_F)) {
@@ -429,7 +429,7 @@ int cpu_exec(CPUState *env)
                     {
                         int idx =3D -1;
                         /* ??? This hard-codes the OSF/1 interrupt level=
s.  */
-		        switch (env->pal_mode ? 7 : env->ps & PS_INT_MASK) {
+                        switch (env->pal_mode ? 7 : env->ps & PS_INT_MAS=
K) {
                         case 0 ... 3:
                             if (interrupt_request & CPU_INTERRUPT_HARD) =
{
                                 idx =3D EXCP_DEV_INTERRUPT;
@@ -562,7 +562,7 @@ int cpu_exec(CPUState *env)
                 barrier();
                 if (likely(!env->exit_request)) {
                     tc_ptr =3D tb->tc_ptr;
-                /* execute the generated code */
+                    /* execute the generated code */
                     next_tb =3D tcg_qemu_tb_exec(env, tc_ptr);
                     if ((next_tb & 3) =3D=3D 2) {
                         /* Instruction counter expired.  */
--=20
1.7.3.5

