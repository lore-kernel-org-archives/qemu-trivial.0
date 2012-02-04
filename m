Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RtgmK-0002IV-53
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2012 09:39:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RtgmH-0002HZ-1v
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 09:39:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RtgmG-00069l-74
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 09:39:45 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:30370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1Rtgm9-00068X-Lu; Sat, 04 Feb 2012 09:39:41 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id BC231881;
	Sat,  4 Feb 2012 22:36:12 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=rsa1024; bh=iBJ/gIa+U/pgPTmGiVR/jn
	SeQMI=; b=dHAmiZC4tzEf6/XEo6JAtQ8AyVuZGF538bvHwGXJommGJZBsmdZGGM
	YJiiJ1E+PORSXwPEcYedHjDd4v92h/IpziR1YQdBdSt5CYqOlPovda754S9p1AxL
	vShdqzjWqXyTlM9rKBUMLlgoqYPvp4VAfrTb5gNCJT0MaF0FJaZ9U=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 9C4AB880;
	Sat,  4 Feb 2012 22:36:12 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id q14EdOcq003837;
	Sat, 4 Feb 2012 22:39:24 +0800 (CST) (envelope-from chenwj)
Date: Sat, 4 Feb 2012 22:39:24 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20120204143924.GA554@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] cpu-exec.c: Correct comment about this file
 and indentation cleanup
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
X-List-Received-Date: Sat, 04 Feb 2012 14:39:46 -0000

  Each target use #define marco (in target-xxx/cpu.h) to rename cpu_exec
(cpu-exec.c) to cpu_xxx_exec, then defines its own cpu_loop which calls
cpu_xxx_exec. So basically, cpu-exec.c is not i386 (only) emulator main
execution loop. This patch correctes the comment of this file and does
indentation cleanup.

Signed-off-by: Chen Wei-Ren (=E9=99=B3=E9=9F=8B=E4=BB=BB) <chenwj@iis.sin=
ica.edu.tw>
---
 cpu-exec.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index a9fa608..f7f19f5 100644
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
+			                  } else if (interrupt_request & CPU_INTERRUPT_MCE) {
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
+		                }
 #elif defined(TARGET_ARM)
                     if (interrupt_request & CPU_INTERRUPT_FIQ
                         && !(env->uncached_cpsr & CPSR_F)) {
@@ -429,7 +429,7 @@ int cpu_exec(CPUState *env)
                     {
                         int idx =3D -1;
                         /* ??? This hard-codes the OSF/1 interrupt level=
s.  */
-		        switch (env->pal_mode ? 7 : env->ps & PS_INT_MASK) {
+		                    switch (env->pal_mode ? 7 : env->ps & PS_INT_MASK)=
 {
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

