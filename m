Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an6YQ-0007yC-24
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 11:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1an6YN-0007vZ-OP
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1an6YJ-0002Yu-PH
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:36:35 -0400
Received: from [72.143.111.78] (port=35209 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1an6YJ-0002Yd-Ja
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 11:36:31 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9ff0b
	by freebsd.org (DragonFly Mail Agent 1);
	Mon, 04 Apr 2016 10:58:26 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Mon,  4 Apr 2016 10:58:23 -0400
Message-Id: <1459781903-64465-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.4.6
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 72.143.111.78
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] bsd-user: add necessary includes to fix
	warnings
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
X-List-Received-Date: Mon, 04 Apr 2016 15:36:36 -0000

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 35f784c..47cf865 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -17,6 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/path.h"
 #include <sys/mman.h>
 #include <sys/syscall.h>
 #include <sys/param.h>
-- 
2.4.6


