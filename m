Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfyGg-0008MP-D7
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 16:07:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UfyGZ-0008LI-Ja
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 16:07:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UfyGV-00075G-24
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 16:07:07 -0400
Received: from [216.171.111.232] (port=52043 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UfyGU-000750-Ru
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 16:07:02 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9ce4d
	by freebsd.org (DragonFly Mail Agent 1);
	Fri, 24 May 2013 16:07:01 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2013 16:07:00 -0400
Message-Id: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: try pkg-config ncurses first
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
X-List-Received-Date: Fri, 24 May 2013 20:07:13 -0000

When probing for ncurses, try pkg-config first rather than after
explicit -lncurses and -lcurses.  This fixes static linking in the case
that ncurses has additional dependencies, such as -ltinfo (as on FreeBSD).

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index cfdb564..7c99ef9 100755
--- a/configure
+++ b/configure
@@ -2157,7 +2157,7 @@ fi
 if test "$mingw32" = "yes" ; then
     curses_list="-lpdcurses"
 else
-    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses 2>/dev/null)"
+    curses_list="$($pkg_config --libs ncurses 2>/dev/null):-lncurses:-lcurses"
 fi
 
 if test "$curses" != "no" ; then
-- 
1.7.11.5


