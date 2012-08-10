Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvBv-0006NV-Pj
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 15:48:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvBs-0006F7-L9
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvBr-0003RU-TD
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:48:12 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvBo-0003R3-Og; Fri, 10 Aug 2012 15:48:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	F05ED7280031; Fri, 10 Aug 2012 21:48:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id FjnQY+DVm2hG; Fri, 10 Aug 2012 21:48:07 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9E82872800CC; Fri, 10 Aug 2012 21:48:07 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 21:48:07 +0200
Message-Id: <1344628087-22672-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix QEMU
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
X-List-Received-Date: Fri, 10 Aug 2012 19:48:13 -0000

One more...

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/simpletrace.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 1e74e75..9fce4bb 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -71,7 +71,7 @@ def read_trace_file(edict, fobj):
 
     log_version = header[2]
     if log_version == 0:
-        raise ValueError('Older log format, not supported with this Qemu release!')
+        raise ValueError('Older log format, not supported with this QEMU release!')
 
     while True:
         rec = read_record(edict, fobj)
-- 
1.7.10


