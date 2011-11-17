Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RR6cw-0006AV-J9
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2011 13:23:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RR6ct-000609-PJ
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2011 13:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RR6cs-0007uE-Pu
	for qemu-trivial@nongnu.org; Thu, 17 Nov 2011 13:23:55 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RR6cq-0007t9-DQ; Thu, 17 Nov 2011 13:23:52 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	F3A9D72825C8; Thu, 17 Nov 2011 19:23:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id iIpWAu8oDB7j; Thu, 17 Nov 2011 19:23:00 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9494C72825EF; Thu, 17 Nov 2011 19:23:00 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Thu, 17 Nov 2011 19:22:58 +0100
Message-Id: <1321554178-12486-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] gdbstub: Fix GDBRegisterState memory leak
	and use g_new0 to allocate it
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
X-List-Received-Date: Thu, 17 Nov 2011 18:23:57 -0000

cppcheck reported a memory leak which is fixed here.

I also replaced the corresponding g_malloc0 by g_new0 because
that helps reviewers, and it is required by latest recommendations
anyway.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 gdbstub.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a25f404..031a240 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1781,7 +1781,7 @@ void gdb_register_coprocessor(CPUState * env,
     GDBRegisterState **p;
     static int last_reg = NUM_CORE_REGS;
 
-    s = (GDBRegisterState *)g_malloc0(sizeof(GDBRegisterState));
+    s = g_new0(GDBRegisterState, 1);
     s->base_reg = last_reg;
     s->num_regs = num_regs;
     s->get_reg = get_reg;
@@ -1790,8 +1790,10 @@ void gdb_register_coprocessor(CPUState * env,
     p = &env->gdb_regs;
     while (*p) {
         /* Check for duplicates.  */
-        if (strcmp((*p)->xml, xml) == 0)
+        if (strcmp((*p)->xml, xml) == 0) {
+            g_free(s);
             return;
+        }
         p = &(*p)->next;
     }
     /* Add to end of list.  */
-- 
1.7.2.5


