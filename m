Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0Ca9-0006MM-QW
	for mharc-qemu-trivial@gnu.org; Sun, 04 Sep 2011 09:17:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0Ca6-0006B3-Ts
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 09:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0Ca5-0007CZ-VO
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 09:17:50 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0Ca3-0007C6-R3; Sun, 04 Sep 2011 09:17:47 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9082C7283065; Sun,  4 Sep 2011 15:17:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id h+8wxpPUFxUh; Sun,  4 Sep 2011 15:17:43 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086ED72.dip.t-dialin.net [80.134.237.114])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	CFD6B7283053; Sun,  4 Sep 2011 15:17:43 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0Ca3-0002Ya-9k; Sun, 04 Sep 2011 15:17:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun,  4 Sep 2011 15:17:46 +0200
Message-Id: <1315142266-9800-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] Fix comment (install patch -> install path)
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
X-List-Received-Date: Sun, 04 Sep 2011 13:17:52 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 vl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/vl.c b/vl.c
index 5ba9b35..c9e1975 100644
--- a/vl.c
+++ b/vl.c
@@ -3061,7 +3061,7 @@ int main(int argc, char **argv, char **envp)
     if (!data_dir) {
         data_dir = os_find_datadir(argv[0]);
     }
-    /* If all else fails use the install patch specified when building.  */
+    /* If all else fails use the install path specified when building. */
     if (!data_dir) {
         data_dir = CONFIG_QEMU_DATADIR;
     }
-- 
1.7.2.5


