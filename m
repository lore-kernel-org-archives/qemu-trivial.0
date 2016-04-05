Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anSFj-0000iF-Vx
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 10:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anSFd-0000hq-Gq
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anSFa-0000SX-8Q
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:46:41 -0400
Received: from [72.143.111.78] (port=10680 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1anSFa-0000S0-1S
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 10:46:38 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id a005d
	by freebsd.org (DragonFly Mail Agent 1);
	Tue, 05 Apr 2016 10:46:37 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Tue,  5 Apr 2016 10:46:33 -0400
Message-Id: <1459867593-72017-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.4.6
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 72.143.111.78
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] bsd-user: Suppress gcc 4.x -Wpointer-sign
	(included in -Wall) warning
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
X-List-Received-Date: Tue, 05 Apr 2016 14:46:46 -0000

This is the same change as b55266b5 in linux-user.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/uaccess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index b7b3a06..91e2067 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -51,7 +51,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
         ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
         if (!ptr)
             return -TARGET_EFAULT;
-        len = qemu_strnlen((char *)ptr, max_len);
+        len = qemu_strnlen((const char *)ptr, max_len);
         unlock_user(ptr, guest_addr, 0);
         guest_addr += len;
         /* we don't allow wrapping or integer overflow */
-- 
2.4.6


