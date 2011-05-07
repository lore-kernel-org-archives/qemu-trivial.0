Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QInz2-0003cA-AB
	for mharc-qemu-trivial@gnu.org; Sat, 07 May 2011 16:20:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QInz0-0003Wo-2v
	for qemu-trivial@nongnu.org; Sat, 07 May 2011 16:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QInyz-0003oO-C2
	for qemu-trivial@nongnu.org; Sat, 07 May 2011 16:20:10 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:58773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QInyx-0003mP-1m; Sat, 07 May 2011 16:20:07 -0400
Received: from flocke.fritz.box (p54ADACCA.dip.t-dialin.net [84.173.172.202])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0LaHLm-1Ptsol0TTq-00m4cY; Sat, 07 May 2011 22:20:06 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QInyu-00053S-95; Sat, 07 May 2011 22:20:04 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sat,  7 May 2011 22:20:03 +0200
Message-Id: <1304799603-19402-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-Provags-ID: V02:K0:jp+dGGemp+X6BFg2RCNEJnjEzrzyGaywlOxfzfNAe86
	YDij+RUZ7ywNyW/9z00I6x2GudPUbF4EeWBGY2hgsLZZ9tuXd0
	2lPGutC642p1l5kqK+7NQIgnTPSoS62Nx5c8UKkP1yUBCoYvSj
	tIAnVloAciQ8xwnZa8HXyoZoR5uFqBiEanuGVgfLwBrtCLCTzg
	fdq+9ATmRE+Ft185eSsKB9apHncM4A1+gYscuN09LurXosDeaw MRfJI9lNqkuDj
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix spelling in comments (intruction ->
	instruction)
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
X-List-Received-Date: Sat, 07 May 2011 20:20:11 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 bsd-user/main.c   |    2 +-
 linux-user/main.c |    2 +-
 tests/test-i386.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6b12f8b..0c3fca1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -237,7 +237,7 @@ void cpu_loop(CPUX86State *env)
             break;
 #ifndef TARGET_ABI32
         case EXCP_SYSCALL:
-            /* syscall from syscall intruction */
+            /* syscall from syscall instruction */
             if (bsd_type == target_freebsd)
                 env->regs[R_EAX] = do_freebsd_syscall(env,
                                                       env->regs[R_EAX],
diff --git a/linux-user/main.c b/linux-user/main.c
index a1e37e4..a4996e7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -323,7 +323,7 @@ void cpu_loop(CPUX86State *env)
             break;
 #ifndef TARGET_ABI32
         case EXCP_SYSCALL:
-            /* linux syscall from syscall intruction */
+            /* linux syscall from syscall instruction */
             env->regs[R_EAX] = do_syscall(env,
                                           env->regs[R_EAX],
                                           env->regs[R_EDI],
diff --git a/tests/test-i386.c b/tests/test-i386.c
index 8f481c7..56ff110 100644
--- a/tests/test-i386.c
+++ b/tests/test-i386.c
@@ -2281,7 +2281,7 @@ void test_sse_comi(double a1, double b1)
 }
 
 /* Force %xmm0 usage to avoid the case where both register index are 0
-   to test intruction decoding more extensively */
+   to test instruction decoding more extensively */
 #define CVT_OP_XMM2MMX(op)\
 {\
     asm volatile (#op " %1, %0" : "=y" (r.q[0]) : "x" (a.dq) \
-- 
1.7.2.5


