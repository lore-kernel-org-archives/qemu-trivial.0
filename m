Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RusYg-0004Ym-B6
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2012 16:26:38 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RusYe-0004TR-3z
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 16:26:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RusYd-00008c-Ct
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 16:26:36 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RusYa-00007F-Og; Tue, 07 Feb 2012 16:26:33 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	987DE7280012; Tue,  7 Feb 2012 22:26:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 70bZQGACrQqo; Tue,  7 Feb 2012 22:26:30 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E47447280013; Tue,  7 Feb 2012 22:26:29 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue,  7 Feb 2012 22:26:29 +0100
Message-Id: <1328649989-3096-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.8.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] fmopl: Fix typo in function name
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
X-List-Received-Date: Tue, 07 Feb 2012 21:26:37 -0000

Fix a typo in a local function name.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/fmopl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/fmopl.c b/hw/fmopl.c
index 734d2f4..f0a0234 100644
--- a/hw/fmopl.c
+++ b/hw/fmopl.c
@@ -733,7 +733,7 @@ INLINE void CSMKeyControll(OPL_CH *CH)
 }
 
 /* ---------- opl initialize ---------- */
-static void OPL_initalize(FM_OPL *OPL)
+static void OPL_initialize(FM_OPL *OPL)
 {
 	int fn;
 
@@ -1239,7 +1239,7 @@ FM_OPL *OPLCreate(int type, int clock, int rate)
 	OPL->rate  = rate;
 	OPL->max_ch = max_ch;
 	/* init grobal tables */
-	OPL_initalize(OPL);
+	OPL_initialize(OPL);
 	/* reset chip */
 	OPLResetChip(OPL);
 #ifdef OPL_OUTPUT_LOG
-- 
1.7.8.3


