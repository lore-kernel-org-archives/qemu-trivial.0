Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIQO4-0003fQ-B6
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2011 15:40:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIQO1-0003Yu-4r
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 15:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RIQO0-0002Rn-3p
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 15:40:41 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RIQNx-0002Ou-RN; Mon, 24 Oct 2011 15:40:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C07B87283494; Mon, 24 Oct 2011 21:40:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id DzfJAQKblHZh; Mon, 24 Oct 2011 21:39:45 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2ED3F7283495; Mon, 24 Oct 2011 21:39:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon, 24 Oct 2011 21:39:43 +0200
Message-Id: <1319485183-9492-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] main-loop: Add missing include file
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
X-List-Received-Date: Mon, 24 Oct 2011 19:40:42 -0000

stdint.h defines the POSIX data types and is needed
for MinGW-w64 (and maybe other hosts).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 main-loop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/main-loop.c b/main-loop.c
index bfecdb7..d9585f8 100644
--- a/main-loop.c
+++ b/main-loop.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "config-host.h"
+#include <stdint.h>     /* uint8_t, ... */
 #include <unistd.h>
 #include <signal.h>
 #include <time.h>
-- 
1.7.2.5


