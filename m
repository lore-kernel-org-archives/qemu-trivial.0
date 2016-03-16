Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agI3o-0007US-06
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 16:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1agI3k-0007Q7-H2
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1agI3f-000456-Jf
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:28:48 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:60130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1agI3f-00044z-E6
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 16:28:43 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id A535B17F6A3; Wed, 16 Mar 2016 21:28:39 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Wed, 16 Mar 2016 21:28:38 +0100
Message-Id: <1458160118-3230-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] wxx: Add support for ncurses
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
X-List-Received-Date: Wed, 16 Mar 2016 20:28:49 -0000

We used to support only pdcurses for Windows, but recently Cygwin added
mingw64-i686-ncurses and mingw64-x86_64-ncurses packages which are
supported now, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2b32876..fc3067a 100755
--- a/configure
+++ b/configure
@@ -2812,7 +2812,7 @@ fi
 # curses probe
 if test "$curses" != "no" ; then
   if test "$mingw32" = "yes" ; then
-    curses_list="-lpdcurses"
+    curses_list="$($pkg_config --libs ncurses 2>/dev/null):-lpdcurses"
   else
     curses_list="$($pkg_config --libs ncurses 2>/dev/null):-lncurses:-lcurses"
   fi
-- 
2.1.4


