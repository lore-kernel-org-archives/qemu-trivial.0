Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2Mgm-000545-9L
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2012 09:34:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T2Mgj-0004yl-Oj
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T2Mgi-0003by-Ta
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 09:34:09 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T2Mgg-0003bP-PF; Fri, 17 Aug 2012 09:34:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	926347280027; Fri, 17 Aug 2012 15:34:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id m3kxBVC-jliJ; Fri, 17 Aug 2012 15:34:05 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 28ADC728002D; Fri, 17 Aug 2012 15:34:05 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 17 Aug 2012 15:34:04 +0200
Message-Id: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] monitor: Fix warning from clang
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
X-List-Received-Date: Fri, 17 Aug 2012 13:34:10 -0000

ccc-analyzer reports these warnings:

monitor.c:3532:21: warning: Division by zero
                val %= val2;
                    ^
monitor.c:3530:21: warning: Division by zero
                val /= val2;
                    ^

Rewriting the code fixes this (and also a style issue).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 monitor.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/monitor.c b/monitor.c
index 0c34934..0ea2c14 100644
--- a/monitor.c
+++ b/monitor.c
@@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
             break;
         case '/':
         case '%':
-            if (val2 == 0)
+            if (val2 == 0) {
                 expr_error(mon, "division by zero");
-            if (op == '/')
+            } else if (op == '/') {
                 val /= val2;
-            else
+            } else {
                 val %= val2;
+            }
             break;
         }
     }
-- 
1.7.10


