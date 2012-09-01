Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7lRg-0003sH-04
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 07:00:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7lRd-0003lo-Sh
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 07:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T7lRc-0000Qm-TH
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 07:00:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T7lRa-0000Py-DQ; Sat, 01 Sep 2012 07:00:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A779E7280021; Sat,  1 Sep 2012 13:00:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 9z8iIqvgU7OV; Sat,  1 Sep 2012 13:00:48 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id F136E728002B; Sat,  1 Sep 2012 13:00:48 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat,  1 Sep 2012 13:00:48 +0200
Message-Id: <1346497248-14659-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] pflash_cfi01: Fix warning caused by
	unreachable code
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
X-List-Received-Date: Sat, 01 Sep 2012 11:00:55 -0000

Report from smatch:
hw/pflash_cfi01.c:431 pflash_write(180) info: ignoring unreachable code.

Instead of removing the return statement after the switch statement,
the patch replaces the return statements in the switch statement by
break statements. Other switch statements in the same code do it also
like that.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/pflash_cfi01.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index d1c7423..56ed33f 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -320,7 +320,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
         }
         pfl->wcycle++;
         pfl->cmd = cmd;
-        return;
+        break;
     case 1:
         switch (pfl->cmd) {
         case 0x10: /* Single Byte Program */
@@ -375,7 +375,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
         default:
             goto error_flash;
         }
-        return;
+        break;
     case 2:
         switch (pfl->cmd) {
         case 0xe8: /* Block write */
@@ -406,7 +406,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
         default:
             goto error_flash;
         }
-        return;
+        break;
     case 3: /* Confirm mode */
         switch (pfl->cmd) {
         case 0xe8: /* Block write */
@@ -422,7 +422,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
         default:
             goto error_flash;
         }
-        return;
+        break;
     default:
         /* Should never happen */
         DPRINTF("%s: invalid write state\n",  __func__);
-- 
1.7.10


