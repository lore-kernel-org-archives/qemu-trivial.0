Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1n-0001UF-AI
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1j-0001LB-7V
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1i-0006mS-66
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:11 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:50637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1S-0006dv-OT; Thu, 28 Apr 2011 11:20:55 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MKqqe-1QFT1J1mLo-00066e; Thu, 28 Apr 2011 17:20:46 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1I-0002BG-Kh; Thu, 28 Apr 2011 17:20:44 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:26 +0200
Message-Id: <1304004042-8334-2-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:lvtA2bxNfeiqgwnOcXRdBkv2iMKSQiqR5ta3Hr/jRYL
	zjBSVgZlA0xldt06rNfIvosNrCXxJuuRZjRkMnfGeFjF6igwJk
	7EpHBCoga1piUyKBWvq8kb3iYj6G4OXruXVg6tL9tQEHYVxHxv
	+33fpHX3uwO/mM2a/jCeQc/MozDlVkpQIlDo/TWMlln79y4WsG
	2GDWrlIswcbC8xVYbAses6SiCAdmourOL4vMXgt6cWTZ7NQVB5 fpe6dmIPG8oDV
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 02/18] Fix typos in comments (accross ->
	across)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:12 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 darwin-user/syscall.c      |    2 +-
 target-microblaze/helper.c |    2 +-
 tcg/tcg.h                  |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/darwin-user/syscall.c b/darwin-user/syscall.c
index 060acc8..f3cc1f8 100644
--- a/darwin-user/syscall.c
+++ b/darwin-user/syscall.c
@@ -977,7 +977,7 @@ long do_unix_syscall_indirect(void *cpu_env, int num)
 #elif TARGET_PPC
     {
         int i;
-        /* XXX: not really needed those regs are volatile accross calls */
+        /* XXX: not really needed those regs are volatile across calls */
         uint32_t **regs = ((CPUPPCState*)cpu_env)->gpr;
         for(i = 11; i > 3; i--)
             *regs[i] = *regs[i-1];
diff --git a/target-microblaze/helper.c b/target-microblaze/helper.c
index 5230b52..a623c7b 100644
--- a/target-microblaze/helper.c
+++ b/target-microblaze/helper.c
@@ -117,7 +117,7 @@ void do_interrupt(CPUState *env)
 {
     uint32_t t;
 
-    /* IMM flag cannot propagate accross a branch and into the dslot.  */
+    /* IMM flag cannot propagate across a branch and into the dslot.  */
     assert(!((env->iflags & D_FLAG) && (env->iflags & IMM_FLAG)));
     assert(!(env->iflags & (DRTI_FLAG | DRTE_FLAG | DRTB_FLAG)));
 /*    assert(env->sregs[SR_MSR] & (MSR_EE)); Only for HW exceptions.  */
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 3fab8d6..cecef63 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -252,9 +252,9 @@ typedef struct TCGTemp {
     unsigned int fixed_reg:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
-    unsigned int temp_local:1; /* If true, the temp is saved accross
+    unsigned int temp_local:1; /* If true, the temp is saved across
                                   basic blocks. Otherwise, it is not
-                                  preserved accross basic blocks. */
+                                  preserved across basic blocks. */
     unsigned int temp_allocated:1; /* never used for code gen */
     /* index of next free temp of same base type, -1 if end */
     int next_free_temp;
-- 
1.7.2.5


