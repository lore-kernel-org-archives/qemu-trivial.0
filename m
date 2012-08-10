Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzvFJ-0007P9-3J
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 15:51:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvFG-0007FZ-8k
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:51:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SzvFE-000589-3B
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 15:51:42 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SzvF9-000577-UJ; Fri, 10 Aug 2012 15:51:36 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	22CDA7280031; Fri, 10 Aug 2012 21:51:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8FgTEK928VPK; Fri, 10 Aug 2012 21:51:34 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 78D8772800CC; Fri, 10 Aug 2012 21:51:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 10 Aug 2012 21:51:33 +0200
Message-Id: <1344628293-4565-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: Improve comment
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
X-List-Received-Date: Fri, 10 Aug 2012 19:51:43 -0000

It's still not good, but hopefully better than before.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/vnc-enc-zywrle.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
index 188e247..addee55 100644
--- a/ui/vnc-enc-zywrle.h
+++ b/ui/vnc-enc-zywrle.h
@@ -305,8 +305,8 @@ static inline void harr(int8_t *px0, int8_t *px1)
    |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
 
  In this method, H/L and X0/X1 is always same position.
- This lead us to more speed and less memory.
- Of cause, the result of both methods is quite same
+ This leads us to more speed and less memory.
+ Of course, the result of both methods is quite same
  because its only difference is that coefficient position.
 */
 static inline void wavelet_level(int *data, int size, int l, int skip_pixel)
-- 
1.7.10


