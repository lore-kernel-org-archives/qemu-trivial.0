Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvWyi-0003s0-Si
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 12:40:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvWye-0003dd-68
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TvWyb-0003bE-Sg
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:40:40 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TvWyW-0003aU-ED; Wed, 16 Jan 2013 12:40:32 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E17DE7280056; Wed, 16 Jan 2013 18:40:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id J2sgYdllxpII; Wed, 16 Jan 2013 18:40:31 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9B1DE7280057; Wed, 16 Jan 2013 18:40:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 16 Jan 2013 18:40:29 +0100
Message-Id: <1358358029-14684-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw: Spelling fix in log message
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
X-List-Received-Date: Wed, 16 Jan 2013 17:40:43 -0000

defineition -> definition

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/openrisc_sim.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/openrisc_sim.c b/hw/openrisc_sim.c
index fb47cdc..6c443ba 100644
--- a/hw/openrisc_sim.c
+++ b/hw/openrisc_sim.c
@@ -107,7 +107,7 @@ static void openrisc_sim_init(QEMUMachineInitArgs *args)
     for (n = 0; n < smp_cpus; n++) {
         cpu = cpu_openrisc_init(cpu_model);
         if (cpu == NULL) {
-            qemu_log("Unable to find CPU defineition!\n");
+            qemu_log("Unable to find CPU definition!\n");
             exit(1);
         }
         qemu_register_reset(main_cpu_reset, cpu);
-- 
1.7.10.4


