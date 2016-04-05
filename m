Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anRXs-0004tL-Sr
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 10:01:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anRXr-0004tF-A5
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anRXp-0002Ul-5o
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:01:27 -0400
Received: from [72.143.111.78] (port=61029 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anRXo-0002UA-VF
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:01:25 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id a005d
	by freebsd.org (DragonFly Mail Agent 1);
	Tue, 05 Apr 2016 10:01:23 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Tue,  5 Apr 2016 10:01:21 -0400
Message-Id: <1459864881-71319-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.4.6
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 72.143.111.78
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] bsd-user: add qemu/cutils.h include after
	f348b6d
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
X-List-Received-Date: Tue, 05 Apr 2016 14:01:28 -0000

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/uaccess.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 7cb6d17..b7b3a06 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -1,5 +1,6 @@
 /* User memory access */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 
 #include "qemu.h"
 
-- 
2.4.6


