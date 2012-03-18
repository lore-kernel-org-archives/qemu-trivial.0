Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ONp-0003Sl-A0
	for mharc-qemu-trivial@gnu.org; Sun, 18 Mar 2012 18:15:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONU-0003KK-81
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONS-00016X-AE
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:03 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S9ONS-00013r-37
	for qemu-trivial@nongnu.org; Sun, 18 Mar 2012 18:15:02 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	16F5272800A1; Sun, 18 Mar 2012 23:15:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gOBWWQHN9LI5; Sun, 18 Mar 2012 23:14:59 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9D3E772800A3; Sun, 18 Mar 2012 23:14:59 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 18 Mar 2012 23:14:57 +0100
Message-Id: <1332108898-6377-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
References: <1332108898-6377-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 2/3] target-mips: Add compiler attribute to
	some functions which don't return
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
X-List-Received-Date: Sun, 18 Mar 2012 22:15:23 -0000

helper_raise_exception_err does not return, nor do helper_raise_exception
and do_unaligned_access.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-mips/helper.h    |    4 ++--
 target-mips/op_helper.c |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target-mips/helper.h b/target-mips/helper.h
index 442f684..76fb451 100644
--- a/target-mips/helper.h
+++ b/target-mips/helper.h
@@ -1,7 +1,7 @@
 #include "def-helper.h"
 
-DEF_HELPER_2(raise_exception_err, void, i32, int)
-DEF_HELPER_1(raise_exception, void, i32)
+DEF_HELPER_2(raise_exception_err, noreturn, i32, int)
+DEF_HELPER_1(raise_exception, noreturn, i32)
 
 #ifdef TARGET_MIPS64
 DEF_HELPER_3(ldl, tl, tl, tl, int)
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 584f0ab..a825c94 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2274,7 +2274,8 @@ void helper_wait (void)
 
 #if !defined(CONFIG_USER_ONLY)
 
-static void do_unaligned_access (target_ulong addr, int is_write, int is_user, void *retaddr);
+static void QEMU_NORETURN do_unaligned_access(target_ulong addr, int is_write,
+                                              int is_user, void *retaddr);
 
 #define MMUSUFFIX _mmu
 #define ALIGNED_ONLY
-- 
1.7.9


