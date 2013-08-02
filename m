Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5Mv5-0003jP-S8
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 17:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1V5Mv0-0003aq-0F
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 17:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1V5EqW-00012B-9f
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 08:52:44 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:34786
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1V5En1-00084C-6J; Fri, 02 Aug 2013 08:49:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5CDB02658BBA;
	Fri,  2 Aug 2013 14:48:32 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pieuOLxekvMx; Fri,  2 Aug 2013 14:48:32 +0200 (CEST)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id F3F4E2658B96;
	Fri,  2 Aug 2013 14:48:31 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Fri,  2 Aug 2013 14:48:27 +0200
Message-Id: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] Improve Monitor disas with symbol lookup
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
X-List-Received-Date: Fri, 02 Aug 2013 21:29:54 -0000

Part of M731-018.

Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 disas.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/disas.c b/disas.c
index 71007fb..3ffb3ae 100644
--- a/disas.c
+++ b/disas.c
@@ -480,11 +480,19 @@ void monitor_disas(Monitor *mon, CPUArchState *env,
 #endif
 
     for(i = 0; i < nb_insn; i++) {
-	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
+        const char *sym = lookup_symbol(pc);
+
+        monitor_printf(mon, "0x" TARGET_FMT_lx " ", pc);
+        if (sym[0] != '\0') {
+            monitor_printf(mon, "<%s>:  ", sym);
+        } else {
+            monitor_printf(mon, ":  ");
+        }
         count = print_insn(pc, &s.info);
-	monitor_printf(mon, "\n");
-	if (count < 0)
-	    break;
+        monitor_printf(mon, "\n");
+        if (count < 0) {
+            break;
+        }
         pc += count;
     }
 }
-- 
1.7.9.5


