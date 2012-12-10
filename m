Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Thwf3-0007Pp-EO
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 01:16:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1Thwf0-0007Mv-1V
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:16:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1Thwev-0002Ra-8G
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:16:13 -0500
Received: from furnace.wzff.de ([176.9.216.40]:55597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1Thwev-0002RH-2N; Mon, 10 Dec 2012 01:16:09 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1Thwes-000Jl8-Gz; Mon, 10 Dec 2012 07:16:08 +0100
Message-ID: <50C57E3D.9010708@barfooze.de>
Date: Mon, 10 Dec 2012 07:16:29 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="------------040903030703060607030500"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 176.9.216.40
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
X-List-Received-Date: Mon, 10 Dec 2012 06:16:16 -0000

This is a multi-part message in MIME format.
--------------040903030703060607030500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


--------------040903030703060607030500
Content-Type: text/x-patch;
 name="0004-linux-user-syscall.c-remove-wrong-forward-decl-of-se.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0004-linux-user-syscall.c-remove-wrong-forward-decl-of-se.pa";
 filename*1="tch"

From 3d9bc5e06ae64806003f8999b4b7ead42bd19c5d Mon Sep 17 00:00:00 2001
From: John Spencer <maillist-qemu@barfooze.de>
Date: Mon, 10 Dec 2012 07:02:49 +0100
Subject: [PATCH 4/4] linux-user/syscall.c: remove wrong forward decl of setgroups()

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


--------------040903030703060607030500--

