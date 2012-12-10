Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThxME-0000NG-2g
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 02:00:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM8-0000H7-5f
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM5-0005QG-5o
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:48 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:22427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM5-0005Q8-08; Mon, 10 Dec 2012 02:00:45 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=localhost.localdomain)
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM2-000KiM-SI; Mon, 10 Dec 2012 08:00:44 +0100
From: John Spencer <maillist-qemu@barfooze.de>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Dec 2012 07:59:46 +0100
Message-Id: <1355122786-29243-4-git-send-email-maillist-qemu@barfooze.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 4/4] linux-user/syscall.c: remove wrong
	forward decl of setgroups()
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
X-List-Received-Date: Mon, 10 Dec 2012 07:00:51 -0000

this declaration is wrong:
the correct prototype on linux is:
int setgroups(size_t size, const gid_t *list);

since by default musl libc exposes this symbol in unistd.h
additionally to grp.h, the wrong declaration causes a build error.

the proper fix is to simply include the correct header.

Signed-off-by: John Spencer <maillist-qemu@barfooze.de>

---
 linux-user/syscall.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index fabbcd7..665316e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -28,6 +28,7 @@
 #include <fcntl.h>
 #include <time.h>
 #include <limits.h>
+#include <grp.h>
 #include <sys/types.h>
 #include <sys/ipc.h>
 #include <sys/msg.h>
@@ -585,7 +586,6 @@ extern int personality(int);
 extern int flock(int, int);
 extern int setfsuid(int);
 extern int setfsgid(int);
-extern int setgroups(int, gid_t *);
 
 /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
 #ifdef TARGET_ARM
-- 
1.7.3.4


