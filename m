Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sg7Ye-0002Uh-HV
	for mharc-qemu-trivial@gnu.org; Sun, 17 Jun 2012 00:57:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sg7Yb-0002Lu-Ek
	for qemu-trivial@nongnu.org; Sun, 17 Jun 2012 00:57:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Sg7YZ-00024G-VX
	for qemu-trivial@nongnu.org; Sun, 17 Jun 2012 00:57:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Sg7YW-00023Y-Ez; Sun, 17 Jun 2012 00:57:44 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	476177280025; Sun, 17 Jun 2012 06:57:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id D-ou7vVAe7Zi; Sun, 17 Jun 2012 06:57:41 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id AD1F672800C1; Sun, 17 Jun 2012 06:57:41 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sun, 17 Jun 2012 06:57:41 +0200
Message-Id: <1339909061-30971-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] checkpatch: Add QEMU specific rule
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
X-List-Received-Date: Sun, 17 Jun 2012 04:57:50 -0000

The new rule detects two wrong variants of QEMU.
It was tested with commit b5a8fe5e.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/checkpatch.pl |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8850a5f..b98dc6c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2849,6 +2849,11 @@ sub process {
 				ERROR("lockdep_no_validate class is reserved for device->mutex.\n" . $herecurr);
 			}
 		}
+
+# QEMU specific tests
+		if ($rawline =~ /\b(?:Qemu|QEmu)\b/) {
+			WARN("use QEMU instead of Qemu or QEmu\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on
-- 
1.7.0.4


