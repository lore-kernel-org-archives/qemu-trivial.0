Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKCPK-0004gU-Ur
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:41:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKCPC-0004GL-Gb
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:41:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKCP8-0006rL-5O
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:41:30 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:42420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SKCOx-0006oW-Id; Tue, 17 Apr 2012 13:41:15 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	899AD72800B3; Tue, 17 Apr 2012 19:41:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id U84024vNfNLZ; Tue, 17 Apr 2012 19:41:08 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id CB96672800B5; Tue, 17 Apr 2012 19:41:08 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Apr 2012 19:41:08 +0200
Message-Id: <1334684468-2522-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] block: Fix spelling in comment (ineffcient
	-> inefficient)
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
X-List-Received-Date: Tue, 17 Apr 2012 17:41:37 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block/cow.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/block/cow.c b/block/cow.c
index 8d3c9f8..a5a00eb 100644
--- a/block/cow.c
+++ b/block/cow.c
@@ -103,7 +103,7 @@ static int cow_open(BlockDriverState *bs, int flags)
 }
 
 /*
- * XXX(hch): right now these functions are extremely ineffcient.
+ * XXX(hch): right now these functions are extremely inefficient.
  * We should just read the whole bitmap we'll need in one go instead.
  */
 static inline int cow_set_bit(BlockDriverState *bs, int64_t bitnum)
-- 
1.7.9


