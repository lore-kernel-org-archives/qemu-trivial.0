Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTYSv-0002c0-R9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 11:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYSs-0002Xf-H2
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYSr-0004MF-QY
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:13:02 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSp-0004Kq-Ms; Fri, 28 Mar 2014 11:12:59 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSn-0000Wz-Sc; Fri, 28 Mar 2014 15:12:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 28 Mar 2014 15:12:55 +0000
Message-Id: <1396019577-2013-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 1/3] hw/ide/ahci.c: Avoid shift left into
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
X-List-Received-Date: Fri, 28 Mar 2014 15:13:03 -0000

Add U suffix to avoid shifting left into the sign bit, which
is undefined behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ide/ahci.c | 4 ++--
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
1.9.0


