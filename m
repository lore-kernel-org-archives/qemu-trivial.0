Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SOXcJ-0006Bf-Qp
	for mharc-qemu-trivial@gnu.org; Sun, 29 Apr 2012 13:08:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SOXcF-0005uO-93
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2012 13:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SOXcD-0004ik-EV
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2012 13:08:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SOXcA-0004hz-EJ; Sun, 29 Apr 2012 13:08:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	57A7372800B7; Sun, 29 Apr 2012 19:08:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id s-PF-e6htRGb; Sun, 29 Apr 2012 19:08:48 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 07F0D72800BB; Sun, 29 Apr 2012 19:08:48 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 29 Apr 2012 19:08:46 +0200
Message-Id: <1335719326-31264-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1335719326-31264-1-git-send-email-sw@weilnetz.de>
References: <1335719326-31264-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 2/2] iohandler: Use bool for boolean struct
	member and remove holes
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
X-List-Received-Date: Sun, 29 Apr 2012 17:08:57 -0000

Using bool reduces the size of the structure and improves readability.
Two holes in the structure were removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 iohandler.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/iohandler.c b/iohandler.c
index 5640d49..3c74de6 100644
--- a/iohandler.c
+++ b/iohandler.c
@@ -33,13 +33,13 @@
 #endif
 
 typedef struct IOHandlerRecord {
-    int fd;
     IOCanReadHandler *fd_read_poll;
     IOHandler *fd_read;
     IOHandler *fd_write;
-    int deleted;
     void *opaque;
     QLIST_ENTRY(IOHandlerRecord) next;
+    int fd;
+    bool deleted;
 } IOHandlerRecord;
 
 static QLIST_HEAD(, IOHandlerRecord) io_handlers =
-- 
1.7.9


