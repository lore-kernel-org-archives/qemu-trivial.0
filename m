Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4L9-0007Ij-Ua
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:17:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L4-00078C-JB
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L3-0006B3-Co
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:17:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Ky-00067X-TK; Fri, 20 Sep 2013 13:17:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ED040419CF;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 84141505;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32168 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:03 +0400
Message-Id: <1379696296-32105-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/17] *-user: Fix typo in comment (ulocking
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
X-List-Received-Date: Fri, 20 Sep 2013 17:17:58 -0000

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


