Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbqDr-0006Eg-5X
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 04:06:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpe9-00067T-QU
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpe8-0006Mt-MU
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:33 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpe6-0006MN-Dd; Sat, 17 Dec 2011 03:29:30 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D51417282E5C; Sat, 17 Dec 2011 09:29:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id klSP2BLq7WEW; Sat, 17 Dec 2011 09:28:59 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 059007283284; Sat, 17 Dec 2011 09:27:53 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:34 +0100
Message-Id: <1324110459-3932-7-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 06/11] configure: Fix compiler warning in
	config.log (macro redefined)
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
X-List-Received-Date: Sat, 17 Dec 2011 09:06:26 -0000

warning: "_GNU_SOURCE" redefined

The macro is already defined on the command line.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index efc7b6b..b799212 100755
--- a/configure
+++ b/configure
@@ -2251,7 +2251,6 @@ fi
 # signalfd probe
 signalfd="no"
 cat > $TMPC << EOF
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <signal.h>
-- 
1.7.2.5


