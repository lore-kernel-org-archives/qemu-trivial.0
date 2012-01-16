Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rmg1g-0007JL-4t
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2012 01:26:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rmg1d-00079W-4U
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2012 01:26:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rmg1c-00036N-2R
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2012 01:26:36 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rmg1Z-00035r-PR; Mon, 16 Jan 2012 01:26:33 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0F5D37280005; Mon, 16 Jan 2012 07:26:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6q+S1ZYridWA; Mon, 16 Jan 2012 07:26:30 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 34B217280006; Mon, 16 Jan 2012 07:26:30 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 16 Jan 2012 07:26:27 +0100
Message-Id: <1326695187-14008-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] tests: Silence gtester in Makefile
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
X-List-Received-Date: Mon, 16 Jan 2012 06:26:38 -0000

This prettifies make output a little by avoiding a very long line.
As gtester prints the checks when they are run, no information is lost.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tests/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index efde63a..55e8eb0 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -36,4 +36,4 @@ test-qmp-commands: test-qmp-commands.o $(qobject-obj-y) $(qapi-obj-y) $(tools-ob
 
 .PHONY: check
 check: $(CHECKS)
-	gtester $(CHECKS)
+	$(call quiet-command, gtester $(CHECKS), "  CHECK")
-- 
1.7.2.5


