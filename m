Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0FaG-0005qm-C0
	for mharc-qemu-trivial@gnu.org; Sun, 04 Sep 2011 12:30:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0FaD-0005gw-Gs
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 12:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0FaC-0004hZ-EX
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 12:30:09 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0Fa9-0004dW-T4; Sun, 04 Sep 2011 12:30:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A0EE5728306F; Sun,  4 Sep 2011 18:30:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pOf4D53K4etk; Sun,  4 Sep 2011 18:30:03 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086ED72.dip.t-dialin.net [80.134.237.114])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1C6CF728306E; Sun,  4 Sep 2011 18:30:03 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0Fa6-0006LC-Od; Sun, 04 Sep 2011 18:30:02 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun,  4 Sep 2011 18:30:02 +0200
Message-Id: <1315153802-24346-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] configure: Avoid duplicate flags when
	calling compile_prog
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
X-List-Received-Date: Sun, 04 Sep 2011 16:30:10 -0000

This patch removes redundant shell code and cleans it a little bit.

Shell macro compile_prog takes two arguments:
local_cflags and local ldflags.

$QEMU_CFLAGS is added automatically to the cflags, so there is no need
to pass it as an argument.

It is also unnecessary to pass -Werror twice.

$flag is a compiler warning option, so it should be in local_cflags
instead of local_ldflags.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index c3044c7..d261fdd 100755
--- a/configure
+++ b/configure
@@ -1071,7 +1071,7 @@ cat > $TMPC << EOF
 int main(void) { return 0; }
 EOF
 for flag in $gcc_flags; do
-    if compile_prog "-Werror $QEMU_CFLAGS" "-Werror $flag" ; then
+    if compile_prog "$flag -Werror" "" ; then
 	QEMU_CFLAGS="$QEMU_CFLAGS $flag"
     fi
 done
-- 
1.7.0.4


