Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFVBR-0007r7-Dx
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2011 14:11:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RFVBN-0007de-Jj
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2011 14:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RFVBM-0001sJ-OT
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2011 14:11:33 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:52985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RFVBK-0001rH-G6; Sun, 16 Oct 2011 14:11:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2E8AF72834F3; Sun, 16 Oct 2011 20:11:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mzsGRR97AZcO; Sun, 16 Oct 2011 20:10:47 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A843B72834F5; Sun, 16 Oct 2011 20:10:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 16 Oct 2011 20:10:46 +0200
Message-Id: <1318788646-29069-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target_sparc: Fix use of free() instead of
	g_free()
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
X-List-Received-Date: Sun, 16 Oct 2011 18:11:34 -0000

This error was reported by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-sparc/helper.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-sparc/helper.c b/target-sparc/helper.c
index c80531a..ca9bf6b 100644
--- a/target-sparc/helper.c
+++ b/target-sparc/helper.c
@@ -1200,8 +1200,8 @@ static int cpu_sparc_register(CPUSPARCState *env, const char *cpu_model)
 
 static void cpu_sparc_close(CPUSPARCState *env)
 {
-    free(env->def);
-    free(env);
+    g_free(env->def);
+    g_free(env);
 }
 
 CPUSPARCState *cpu_sparc_init(const char *cpu_model)
-- 
1.7.2.5


