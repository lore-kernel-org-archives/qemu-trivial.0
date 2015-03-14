Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWnjj-00012q-T5
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 11:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWnjh-000112-KY
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 11:12:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWnjg-0006HI-Sf
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 11:12:21 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YWnjf-0006G9-0i; Sat, 14 Mar 2015 11:12:19 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0B85917F713; Sat, 14 Mar 2015 16:12:16 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 14 Mar 2015 16:12:15 +0100
Message-Id: <1426345935-7721-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user: Add missing check for return
	value of lock_user
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
X-List-Received-Date: Sat, 14 Mar 2015 15:12:22 -0000

This fixes a warning from Coverity:
"Dereference null return value (NULL_RETURNS)"

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 linux-user/flatload.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 566a7a8..56ac790 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -97,11 +97,13 @@ static int target_pread(int fd, abi_ulong ptr, abi_ulong len,
                         abi_ulong offset)
 {
     void *buf;
-    int ret;
+    int ret = -TARGET_EFAULT;
 
     buf = lock_user(VERIFY_WRITE, ptr, len, 0);
-    ret = pread(fd, buf, len, offset);
-    unlock_user(buf, ptr, len);
+    if (buf) {
+        ret = pread(fd, buf, len, offset);
+        unlock_user(buf, ptr, len);
+    }
     return ret;
 }
 /****************************************************************************/
-- 
1.7.10.4


