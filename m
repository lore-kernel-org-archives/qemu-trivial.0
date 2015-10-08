Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOQ-0005Dt-1v
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEdR-0007zs-CS
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEcL-0000sn-NX
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZt-00038Q-8U; Thu, 08 Oct 2015 13:02:01 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9ADF540A60;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6A2E0A96;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12013 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:27 +0300
Message-Id: <d1c002b6ae2dc81d97bbe23fe65e1960abdba9a4.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 18/19] linux-user: Remove type casts to union
	type
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
X-List-Received-Date: Thu, 08 Oct 2015 17:19:19 -0000

From: Stefan Weil <sw@weilnetz.de>

Casting to a union type is a gcc (and clang) extension. Other compilers
might not support it. This is not a problem today, but the type casts
can be removed easily. Smatch now no longer complains like before:

linux-user/syscall.c:3190:18: warning: cast to non-scalar
linux-user/syscall.c:7348:44: warning: cast to non-scalar

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b8ce208..8bfb24f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2728,8 +2728,9 @@ static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
 }
 
 static inline abi_long do_semctl(int semid, int semnum, int cmd,
-                                 union target_semun target_su)
+                                 abi_ulong target_arg)
 {
+    union target_semun target_su = { .buf = target_arg };
     union semun arg;
     struct semid_ds dsarg;
     unsigned short *array = NULL;
@@ -3251,8 +3252,7 @@ static abi_long do_ipc(unsigned int call, abi_long first,
          * ptr argument. */
         abi_ulong atptr;
         get_user_ual(atptr, ptr);
-        ret = do_semctl(first, second, third,
-                (union target_semun) atptr);
+        ret = do_semctl(first, second, third, atptr);
         break;
     }
 
@@ -7550,7 +7550,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_semctl
     case TARGET_NR_semctl:
-        ret = do_semctl(arg1, arg2, arg3, (union target_semun)(abi_ulong)arg4);
+        ret = do_semctl(arg1, arg2, arg3, arg4);
         break;
 #endif
 #ifdef TARGET_NR_msgctl
-- 
2.1.4


