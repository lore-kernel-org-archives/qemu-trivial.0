Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uxjyc-0002uR-6x
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jul 2013 16:30:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UxjyZ-0002sA-6Z
	for qemu-trivial@nongnu.org; Fri, 12 Jul 2013 16:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UxjyX-0005Ve-OL
	for qemu-trivial@nongnu.org; Fri, 12 Jul 2013 16:29:59 -0400
Received: from [216.171.111.232] (port=28999 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UxjyX-0005V4-HX
	for qemu-trivial@nongnu.org; Fri, 12 Jul 2013 16:29:57 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9d34a
	by freebsd.org (DragonFly Mail Agent 1);
	Fri, 12 Jul 2013 16:29:55 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2013 16:29:52 -0400
Message-Id: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] slirp: reorder include to fix FreeBSD build
	failure
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
X-List-Received-Date: Fri, 12 Jul 2013 20:30:01 -0000


Signed-off-by: Ed Maste <emaste@freebsd.org>
---
The issue comes from slirp/mbuf.h #defining m_flags, which conflicts with
a header included via <semaphore.h> on FreeBSD.

I'm not sure exactly when this broke; I assume that it used to work because
something previously caused the conflicting header to be included earlier,
and that has now been removed.

 slirp/slirp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 80b28ea..231afc8 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -24,8 +24,8 @@
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "sysemu/char.h"
-#include "slirp.h"
 #include "hw/hw.h"
+#include "slirp.h"
 
 /* host loopback address */
 struct in_addr loopback_addr;
-- 
1.7.11.5


