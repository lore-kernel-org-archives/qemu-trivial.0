Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SOXcK-0006D2-6w
	for mharc-qemu-trivial@gnu.org; Sun, 29 Apr 2012 13:09:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SOXcE-0005sz-TA
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2012 13:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SOXcD-0004ie-85
	for qemu-trivial@nongnu.org; Sun, 29 Apr 2012 13:08:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SOXcA-0004hs-8P; Sun, 29 Apr 2012 13:08:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	86A1772800B5; Sun, 29 Apr 2012 19:08:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id sHJAQewqHvDu; Sun, 29 Apr 2012 19:08:47 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 1C21F72800B7; Sun, 29 Apr 2012 19:08:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sun, 29 Apr 2012 19:08:45 +0200
Message-Id: <1335719326-31264-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 1/2] async: Use bool for boolean struct
	members and remove a hole
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
X-List-Received-Date: Sun, 29 Apr 2012 17:08:58 -0000

Using bool reduces the size of the structure and improves readability.
A hole in the structure was removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 async.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/async.c b/async.c
index ecdaf15..85cc641 100644
--- a/async.c
+++ b/async.c
@@ -35,10 +35,10 @@ static struct QEMUBH *first_bh;
 struct QEMUBH {
     QEMUBHFunc *cb;
     void *opaque;
-    int scheduled;
-    int idle;
-    int deleted;
     QEMUBH *next;
+    bool scheduled;
+    bool idle;
+    bool deleted;
 };
 
 QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque)
-- 
1.7.9


