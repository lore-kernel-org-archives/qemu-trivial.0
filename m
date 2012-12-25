Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TneGU-0004G6-Bl
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2012 18:50:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1TneGP-00043K-NH
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2012 18:50:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1TneGM-0002JD-HL
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2012 18:50:25 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:46666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1TneGD-0002CG-C1; Tue, 25 Dec 2012 18:50:13 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=localhost.localdomain)
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1TneFz-0007GL-2i; Wed, 26 Dec 2012 00:50:04 +0100
From: John Spencer <maillist-qemu@barfooze.de>
To: sw@weilnetz.de
Date: Wed, 26 Dec 2012 00:49:49 +0100
Message-Id: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
X-Mailer: git-send-email 1.7.3.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] linux-user/syscall.c: remove forward
	declarations
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
X-List-Received-Date: Tue, 25 Dec 2012 23:50:29 -0000

instead use the correct headers that define these functions.

Requested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
---
 linux-user/syscall.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e99adab..3167a87 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -36,6 +36,9 @@
 #include <sys/time.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#include <sys/file.h>
+#include <sys/fsuid.h>
+#include <sys/personality.h>
 #include <sys/prctl.h>
 #include <sys/resource.h>
 #include <sys/mman.h>
@@ -581,11 +584,6 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
           struct host_rlimit64 *, old_limit)
 #endif
 
-extern int personality(int);
-extern int flock(int, int);
-extern int setfsuid(int);
-extern int setfsgid(int);
-
 /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(void *cpu_env) {
-- 
1.7.3.4


