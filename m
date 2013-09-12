Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKB9b-0005jl-Bh
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 13:58:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB9U-0005XH-On
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 13:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB9P-0006Yi-S4
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 13:58:00 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38501
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB9E-0006N8-EJ; Thu, 12 Sep 2013 13:57:44 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0DC29180651; Thu, 12 Sep 2013 19:57:42 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 12 Sep 2013 19:57:41 +0200
Message-Id: <1379008661-17878-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] *-user: Fix typo in comment (ulocking ->
	unlocking)
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
X-List-Received-Date: Thu, 12 Sep 2013 17:58:06 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 bsd-user/qemu.h   |    2 +-
 linux-user/qemu.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1998af6..ddc74ed 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -381,7 +381,7 @@ static inline void *lock_user_string(abi_ulong guest_addr)
     return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
 }
 
-/* Helper macros for locking/ulocking a target struct.  */
+/* Helper macros for locking/unlocking a target struct.  */
 #define lock_user_struct(type, host_ptr, guest_addr, copy)      \
     (host_ptr = lock_user(type, guest_addr, sizeof(*host_ptr), copy))
 #define unlock_user_struct(host_ptr, guest_addr, copy)          \
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 974c239..617cac1 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -438,7 +438,7 @@ static inline void *lock_user_string(abi_ulong guest_addr)
     return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
 }
 
-/* Helper macros for locking/ulocking a target struct.  */
+/* Helper macros for locking/unlocking a target struct.  */
 #define lock_user_struct(type, host_ptr, guest_addr, copy)	\
     (host_ptr = lock_user(type, guest_addr, sizeof(*host_ptr), copy))
 #define unlock_user_struct(host_ptr, guest_addr, copy)		\
-- 
1.7.9.5


