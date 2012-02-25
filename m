Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1HQ4-0001kk-Nb
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 08:12:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1HPx-0001UV-LE
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:12:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1HPp-0000er-Mx
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:12:02 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1HPf-0000dn-J3; Sat, 25 Feb 2012 08:11:47 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	DDBEE7280099; Sat, 25 Feb 2012 14:11:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id XoF7BU5ht7sn; Sat, 25 Feb 2012 14:11:46 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6915B728009A; Sat, 25 Feb 2012 14:11:46 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 14:11:46 +0100
Message-Id: <1330175506-19167-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Fix sign of sscanf format specifiers
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
X-List-Received-Date: Sat, 25 Feb 2012 13:12:10 -0000

All values read by sscanf are unsigned, so replace %d by %u.

This signed / unsigned mismatch was detected by splint.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 cursor.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/cursor.c b/cursor.c
index efc5917..76e262c 100644
--- a/cursor.c
+++ b/cursor.c
@@ -15,7 +15,8 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
     uint8_t idx;
 
     /* parse header line: width, height, #colors, #chars */
-    if (sscanf(xpm[line], "%d %d %d %d", &width, &height, &colors, &chars) != 4) {
+    if (sscanf(xpm[line], "%u %u %u %u",
+               &width, &height, &colors, &chars) != 4) {
         fprintf(stderr, "%s: header parse error: \"%s\"\n",
                 __FUNCTION__, xpm[line]);
         return NULL;
-- 
1.7.9


