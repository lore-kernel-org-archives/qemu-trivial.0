Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKT2u-0004wC-Lk
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 09:41:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YKT2p-0004mo-Ih
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 09:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YKT2o-0003rc-PV
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 09:41:07 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:32908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YKT2m-0003r9-Rr; Sun, 08 Feb 2015 09:41:04 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id B2A61180166; Sun,  8 Feb 2015 15:41:02 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Feb 2015 15:40:58 +0100
Message-Id: <1423406458-31957-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user: Remove type casts to union type
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
X-List-Received-Date: Sun, 08 Feb 2015 14:41:12 -0000

Casting to a union type is a gcc (and clang) extension. Other compilers
might not support it. This is not a problem today, but the type casts
can be removed easily. Smatch now no longer complains like before:

linux-user/syscall.c:3190:18: warning: cast to non-scalar
linux-user/syscall.c:7348:44: warning: cast to non-scalar

Cc: Riku Voipio <riku.voipio@iki.fi>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 linux-user/syscall.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 852308e..ec137db 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2663,8 +2663,9 @@ static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
 }
 
 static inline abi_long do_semctl(int semid, int semnum, int cmd,
-                                 union target_semun target_su)
+                                 abi_ulong target_arg)
 {
+    union target_semun target_su;
     union semun arg;
     struct semid_ds dsarg;
     unsigned short *array = NULL;
@@ -2673,6 +2674,8 @@ static inline abi_long do_semctl(int semid, int semnum, int cmd,
     abi_long err;
     cmd &= 0xff;
 
+    target_su.buf = target_arg;
+
     switch( cmd ) {
 	case GETVAL:
 	case SETVAL:
@@ -3186,8 +3189,7 @@ static abi_long do_ipc(unsigned int call, abi_long first,
          * ptr argument. */
         abi_ulong atptr;
         get_user_ual(atptr, ptr);
-        ret = do_semctl(first, second, third,
-                (union target_semun) atptr);
+        ret = do_semctl(first, second, third, atptr);
         break;
     }
 
@@ -7345,7 +7347,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_semctl
     case TARGET_NR_semctl:
-        ret = do_semctl(arg1, arg2, arg3, (union target_semun)(abi_ulong)arg4);
+        ret = do_semctl(arg1, arg2, arg3, arg4);
         break;
 #endif
 #ifdef TARGET_NR_msgctl
-- 
1.7.10.4


