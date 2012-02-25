Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1I7u-0000ok-Ez
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 08:57:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1I7o-0000Qe-1m
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1I7j-0007iJ-7R
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 08:57:23 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1I7V-0007gt-N4; Sat, 25 Feb 2012 08:57:05 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C71487280099; Sat, 25 Feb 2012 14:57:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id MlpBwcRKBMP7; Sat, 25 Feb 2012 14:57:04 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 58CE9728009A; Sat, 25 Feb 2012 14:57:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 14:57:03 +0100
Message-Id: <1330178223-31717-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: Add break statement
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
X-List-Received-Date: Sat, 25 Feb 2012 13:57:29 -0000

This was not a bug, but it is not common practice to omit the break statement
from the last case statement before an empty default case.

Any change of the default case would introduce a bug.

This was reported as a warning by splint.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/vnc-enc-hextile-template.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-template.h
index b9f9f5e..a7310e1 100644
--- a/ui/vnc-enc-hextile-template.h
+++ b/ui/vnc-enc-hextile-template.h
@@ -175,6 +175,7 @@ static void CONCAT(send_hextile_tile_, NAME)(VncState *vs,
 	    /* we really don't have to invalidate either the bg or fg
 	       but we've lost the old values.  oh well. */
 	}
+        break;
     default:
 	break;
     }
-- 
1.7.9


