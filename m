Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4RK3-0007uR-61
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 01:23:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S4RJz-0007jp-IL
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 01:23:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S4RJx-0007tf-NQ
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 01:22:59 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S4RJb-0007rV-Up; Mon, 05 Mar 2012 01:22:36 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2F0B27280009; Mon,  5 Mar 2012 07:22:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3WqmyucpCmSl; Mon,  5 Mar 2012 07:22:32 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 03C4D7280099; Mon,  5 Mar 2012 07:22:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  5 Mar 2012 07:22:31 +0100
Message-Id: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] osdep: Remove local definition of macro
	offsetof
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
X-List-Received-Date: Mon, 05 Mar 2012 06:23:01 -0000

The macro offsetof is defined in stddef.h. It is conforming to
the standards C89, C99 and POSIX.1-2001 (see man page), so it
is a sufficiently old standard.

Therefore chances are very high that QEMU never needs a local
definition of this macro.

osdep.h already includes stddef.h, so this patch simply removes
the unneeded code from the files configure and osdep.h.

If we ever need the local definition again, it should be added
to compiler.h (the macro is usually provided with the compiler,
it is not OS specific).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   14 --------------
 osdep.h   |    3 ---
 2 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index b607795..a260fab 100755
--- a/configure
+++ b/configure
@@ -2525,17 +2525,6 @@ if test "$darwin" != "yes" -a "$mingw32" != "yes" -a "$solaris" != yes -a \
 fi
 
 ##########################################
-# check if the compiler defines offsetof
-
-need_offsetof=yes
-cat > $TMPC << EOF
-#include <stddef.h>
-int main(void) { struct s { int f; }; return offsetof(struct s, f); }
-EOF
-if compile_prog "" "" ; then
-    need_offsetof=no
-fi
-
 # spice probe
 if test "$spice" != "no" ; then
   cat > $TMPC << EOF
@@ -3200,9 +3189,6 @@ fi
 if test "$tcg_interpreter" = "yes" ; then
   echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
 fi
-if test "$need_offsetof" = "yes" ; then
-  echo "CONFIG_NEED_OFFSETOF=y" >> $config_host_mak
-fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/osdep.h b/osdep.h
index 432b91e..0350383 100644
--- a/osdep.h
+++ b/osdep.h
@@ -26,9 +26,6 @@
 #define unlikely(x)   __builtin_expect(!!(x), 0)
 #endif
 
-#ifdef CONFIG_NEED_OFFSETOF
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *) 0)->MEMBER)
-#endif
 #ifndef container_of
 #define container_of(ptr, type, member) ({                      \
         const typeof(((type *) 0)->member) *__mptr = (ptr);     \
-- 
1.7.9


