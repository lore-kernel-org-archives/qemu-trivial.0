Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvGi-0008S4-5R
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 15:53:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvGe-0008Fm-Bq
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvGd-0005Pi-9R
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:53:08 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvGa-0005On-AN; Fri, 10 Aug 2012 15:53:04 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A51CA7280031; Fri, 10 Aug 2012 21:53:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id WkB-w9JJgTmp; Fri, 10 Aug 2012 21:53:03 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6C3C472800CC; Fri, 10 Aug 2012 21:53:03 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 21:53:02 +0200
Message-Id: <1344628382-10125-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] docs: Fix spelling (propery -> property)
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
X-List-Received-Date: Fri, 10 Aug 2012 19:53:10 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/bootindex.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/bootindex.txt b/docs/bootindex.txt
index 16083b3..803ebfc 100644
--- a/docs/bootindex.txt
+++ b/docs/bootindex.txt
@@ -1,4 +1,4 @@
-= Bootindex propery =
+= Bootindex property =
 
 Block and net devices have bootindex property. This property is used to
 determine the order in which firmware will consider devices for booting
-- 
1.7.10


