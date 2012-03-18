Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ONZ-0003Om-6s
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 18:15:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONV-0003Ko-P3
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONS-00016n-QL
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:05 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONS-00014m-JY
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:02 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5723A72800A2; Sun, 18 Mar 2012 23:15:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id rLb2Cp+M+X0G; Sun, 18 Mar 2012 23:15:00 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A74D472800A3; Sun, 18 Mar 2012 23:15:00 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 18 Mar 2012 23:14:58 +0100
Message-Id: <1332108898-6377-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
References: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 3/3] target-sparc: Add compiler attribute to
	some functions which don't return
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
X-List-Received-Date: Sun, 18 Mar 2012 22:15:08 -0000

helper_raise_exception does not return, nor does do_unaligned_access.

Cc: Blue Swirl <blauwirbel@gmail.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-sparc/cpu.h    |    5 +++--
 target-sparc/helper.h |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 1025752..885ad45 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -699,8 +699,9 @@ uint64_t cpu_tick_get_count(CPUTimer *timer);
 void cpu_tick_set_limit(CPUTimer *timer, uint64_t limit);
 trap_state* cpu_tsptr(CPUSPARCState* env);
 #endif
-void do_unaligned_access(CPUSPARCState *env, target_ulong addr, int is_write,
-                         int is_user, void *retaddr);
+void QEMU_NORETURN do_unaligned_access(CPUSPARCState *env, target_ulong addr,
+                                       int is_write, int is_user,
+                                       void *retaddr);
 
 #define TB_FLAG_FPU_ENABLED (1 << 4)
 #define TB_FLAG_AM_ENABLED (1 << 5)
diff --git a/target-sparc/helper.h b/target-sparc/helper.h
index c4d6225..e3c7fdd 100644
--- a/target-sparc/helper.h
+++ b/target-sparc/helper.h
@@ -78,7 +78,7 @@ DEF_HELPER_1(fcmpeq_fcc1, void, env)
 DEF_HELPER_1(fcmpeq_fcc2, void, env)
 DEF_HELPER_1(fcmpeq_fcc3, void, env)
 #endif
-DEF_HELPER_2(raise_exception, void, env, int)
+DEF_HELPER_2(raise_exception, noreturn, env, int)
 #define F_HELPER_0_1(name) DEF_HELPER_1(f ## name, void, env)
 
 DEF_HELPER_3(faddd, f64, env, f64, f64)
-- 
1.7.9


