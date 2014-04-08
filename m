Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQ6A-0008Qu-I9
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:05:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5k-0007gj-R0
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5g-0001ct-Gg
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQ5N-0001M0-4f; Tue, 08 Apr 2014 03:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DBD8640E32;
	Tue,  8 Apr 2014 11:04:43 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 09EFA6AB;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10574 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:05 +0400
Message-Id: <1396940651-10513-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/11] hw/ide/ahci.c: Avoid shift left into
	sign bit
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
X-List-Received-Date: Tue, 08 Apr 2014 07:05:30 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add U suffix to avoid shifting left into the sign bit, which
is undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ide/ahci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index bfe633f..50327ff 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -438,9 +438,9 @@ static void check_cmd(AHCIState *s, int port)
 
     if ((pr->cmd & PORT_CMD_START) && pr->cmd_issue) {
         for (slot = 0; (slot < 32) && pr->cmd_issue; slot++) {
-            if ((pr->cmd_issue & (1 << slot)) &&
+            if ((pr->cmd_issue & (1U << slot)) &&
                 !handle_cmd(s, port, slot)) {
-                pr->cmd_issue &= ~(1 << slot);
+                pr->cmd_issue &= ~(1U << slot);
             }
         }
     }
-- 
1.7.10.4


