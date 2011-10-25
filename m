Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIZNx-0006ts-JI
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2011 01:17:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIZNu-0006lQ-O7
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 01:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIZNt-0001Jo-Hu
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 01:17:10 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RIZNr-0001JV-7K; Tue, 25 Oct 2011 01:17:07 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E62C07283494; Tue, 25 Oct 2011 07:16:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id oODLhAmMVXML; Tue, 25 Oct 2011 07:16:26 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 966517283495; Tue, 25 Oct 2011 07:16:26 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 25 Oct 2011 07:16:25 +0200
Message-Id: <1319519785-6220-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Blue Swirl <blauwirbel@gmail.com>
Subject: [Qemu-trivial] [PATCH] target-sparc: Fix use of g_new0 / g_free
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
X-List-Received-Date: Tue, 25 Oct 2011 05:17:12 -0000

g_malloc0 needs g_free instead of free.
While fixing this, I also replaced g_malloc0 by g_new0
as was suggested by Stuart Brady.

Cc: Blue Swirl <blauwirbel@gmail.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-sparc/cpu_init.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-sparc/cpu_init.c b/target-sparc/cpu_init.c
index 08b72a9..6954800 100644
--- a/target-sparc/cpu_init.c
+++ b/target-sparc/cpu_init.c
@@ -74,7 +74,7 @@ static int cpu_sparc_register(CPUSPARCState *env, const char *cpu_model)
         return -1;
     }
 
-    env->def = g_malloc0(sizeof(*def));
+    env->def = g_new0(sparc_def_t, 1);
     memcpy(env->def, def, sizeof(*def));
 #if defined(CONFIG_USER_ONLY)
     if ((env->def->features & CPU_FEATURE_FLOAT)) {
@@ -100,15 +100,15 @@ static int cpu_sparc_register(CPUSPARCState *env, const char *cpu_model)
 
 static void cpu_sparc_close(CPUSPARCState *env)
 {
-    free(env->def);
-    free(env);
+    g_free(env->def);
+    g_free(env);
 }
 
 CPUSPARCState *cpu_sparc_init(const char *cpu_model)
 {
     CPUSPARCState *env;
 
-    env = g_malloc0(sizeof(CPUSPARCState));
+    env = g_new0(CPUSPARCState, 1);
     cpu_exec_init(env);
 
     gen_intermediate_code_init(env);
-- 
1.7.2.5


