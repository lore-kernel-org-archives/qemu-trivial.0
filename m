Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOVlN-0004PB-6p
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 12:47:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVlH-0004Ez-9h
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVlC-00069t-Ph
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:46:55 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:43994
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VOVl0-0005s9-5K; Tue, 24 Sep 2013 12:46:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 8DF392664F5B;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfRSkzULBTeE; Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 750682666376;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Tue, 24 Sep 2013 18:45:59 +0200
Message-Id: <1380041161-13266-2-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, afaerber@suse.de,
	lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 1/3] Fix coding style
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
X-List-Received-Date: Tue, 24 Sep 2013 16:47:00 -0000


Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
---
 disas.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/disas.c b/disas.c
index 0203ef2..32407de 100644
--- a/disas.c
+++ b/disas.c
@@ -506,12 +506,13 @@ void monitor_disas(Monitor *mon, CPUArchState *env,
     return;
 #endif
 
-    for(i = 0; i < nb_insn; i++) {
-	monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
+    for (i = 0; i < nb_insn; i++) {
+        monitor_printf(mon, "0x" TARGET_FMT_lx ":  ", pc);
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


