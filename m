Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOYS9-0001uZ-KJ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 16:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYS3-0001pD-Ss
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 16:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYRy-0000ER-U7
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 16:11:31 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:55616
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WOYRo-0000BP-78; Fri, 14 Mar 2014 16:11:16 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id C252817F973; Fri, 14 Mar 2014 21:11:13 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 14 Mar 2014 21:11:13 +0100
Message-Id: <1394827873-28729-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Remove redundant message for
	-Werror
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
X-List-Received-Date: Fri, 14 Mar 2014 20:11:36 -0000

The compiler flag -Werror is printed (or not printed) as any other
compiler flag which is part of QEMU_CFLAGS.

Therefore an extra output line for -Werror is redundant and can be removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 8c2838e..1efb438 100755
--- a/configure
+++ b/configure
@@ -4041,7 +4041,6 @@ echo "sparse enabled    $sparse"
 echo "strip binaries    $strip_opt"
 echo "profiler          $profiler"
 echo "static build      $static"
-echo "-Werror enabled   $werror"
 if test "$darwin" = "yes" ; then
     echo "Cocoa support     $cocoa"
 fi
-- 
1.7.10.4


