Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bbrKb-0005f9-Ia
	for mharc-qemu-trivial@gnu.org; Mon, 22 Aug 2016 11:40:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1bbrKW-0005am-9O
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 11:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1bbrKI-0003Mj-Ol
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 11:40:03 -0400
Received: from [72.143.111.78] (port=28090 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1bbrKI-0003MO-HI
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 11:39:50 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cc0e
	by freebsd.org (DragonFly Mail Agent v0.10);
	Mon, 22 Aug 2016 10:57:14 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Ed Maste <emaste@freebsd.org>
Date: Mon, 22 Aug 2016 10:57:13 -0400
Message-Id: <1471877833-52343-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 72.143.111.78
Subject: [Qemu-trivial] [PATCH] Fix bsd-user build after d915b7bb
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 15:40:08 -0000

Must include "qemu-version.h" for the QEMU_PKGVERSION definition.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index b4a0a00..0fb08e4 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu-version.h"
 #include <machine/trap.h>
 
 #include "qapi/error.h"
-- 
2.8.1


