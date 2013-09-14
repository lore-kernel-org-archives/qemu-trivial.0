Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKw8G-0001HQ-Pc
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 16:07:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw8B-00017X-9X
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw87-0003Ye-6A
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKw7w-0003WJ-H3; Sat, 14 Sep 2013 16:07:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 24143411C0;
	Sun, 15 Sep 2013 00:07:31 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1A2D64DE;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: (nullmailer pid 7697 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:30 +0400
Message-Id: <1379188061-7634-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/15] *-user: Fix typo in comment (ulocking
	-> unlocking)
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
X-List-Received-Date: Sat, 14 Sep 2013 20:07:51 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 bsd-user/qemu.h   |    2 +-
 linux-user/qemu.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 325f564..1f8ec6e 100644
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
index 6ffe5a2..4422dfc 100644
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
1.7.10.4


