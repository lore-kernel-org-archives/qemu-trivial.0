Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbq7V-0003tj-Cp
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:59:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpep-0007Lq-TC
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpeo-0006WK-UB
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:30:15 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpek-0006Ux-Rk; Sat, 17 Dec 2011 03:30:10 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	70E877282E5C; Sat, 17 Dec 2011 09:30:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id txJwOBB0FWp0; Sat, 17 Dec 2011 09:29:40 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 98C37728188A; Sat, 17 Dec 2011 09:27:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:38 +0100
Message-Id: <1324110459-3932-11-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 10/11] configure: Fix compiler warnings in
	config.log (statement without effect)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:59:51 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 0c791b5..1ae380f 100755
--- a/configure
+++ b/configure
@@ -2074,7 +2074,7 @@ cat > $TMPC <<EOF
 #include <sys/types.h>
 #include <sys/uio.h>
 #include <unistd.h>
-int main(void) { preadv; }
+int main(void) { return preadv == preadv; }
 EOF
 preadv=no
 if compile_prog "" "" ; then
@@ -2107,7 +2107,7 @@ if test "$opengl" != "no" ; then
 #include <X11/Xlib.h>
 #include <GL/gl.h>
 #include <GL/glx.h>
-int main(void) { GL_VERSION; return 0; }
+int main(void) { return GL_VERSION != 0; }
 EOF
   if compile_prog "" "-lGL" ; then
     opengl=yes
@@ -2369,8 +2369,7 @@ int main(void)
      * warning but not an error, and will proceed to fail the
      * qemu compile where we compile with -Werror.)
      */
-    epoll_create1;
-    return 0;
+    return epoll_create1 == epoll_create1;
 }
 EOF
 if compile_prog "$ARCH_CFLAGS" "" ; then
-- 
1.7.2.5


