Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKw8J-0001OU-Uk
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 16:07:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw8E-0001Dw-KJ
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw8A-0003bu-5x
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKw7w-0003WM-Gw; Sat, 14 Sep 2013 16:07:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 21901411BF;
	Sun, 15 Sep 2013 00:07:31 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1938F50E;
	Sat, 14 Sep 2013 23:47:45 +0400 (MSK)
Received: (nullmailer pid 7724 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:41 +0400
Message-Id: <1379188061-7634-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 15/15] configure: Enable extra compiler
	warnings
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
X-List-Received-Date: Sat, 14 Sep 2013 20:07:55 -0000

From: Stefan Weil <sw@weilnetz.de>

Compiler option -Wextra enables an additional set of compiler warnings.

Some of these warnings were already enabled explicitly in QEMU:
-Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
-Wempty-body are now redundant and can be removed.

Others don't work with the current code and must be disabled to
avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
-Wno-sign-compare and -Wno-unused-parameter.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 21451ba..a17cac7 100755
--- a/configure
+++ b/configure
@@ -310,7 +310,7 @@ sdl_config="${SDL_CONFIG-${cross_prefix}sdl-config}"
 
 # default flags for all hosts
 QEMU_CFLAGS="-fno-strict-aliasing $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wall -Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wall -Wextra -Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
@@ -1236,12 +1236,16 @@ if test -z "$werror" ; then
     fi
 fi
 
-gcc_flags="-Wold-style-declaration -Wold-style-definition -Wtype-limits"
-gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
-gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
+gcc_flags="-Wold-style-definition"
+gcc_flags="-Wformat-security -Wformat-y2k -Winit-self $gcc_flags"
+gcc_flags="-Wmissing-include-dirs -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels $gcc_flags"
 gcc_flags="-Wno-initializer-overrides $gcc_flags"
+gcc_flags="-Wno-missing-field-initializers $gcc_flags"
+gcc_flags="-Wno-override-init $gcc_flags"
+gcc_flags="-Wno-sign-compare $gcc_flags"
 gcc_flags="-Wno-string-plus-int $gcc_flags"
+gcc_flags="-Wno-unused-parameter $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
-- 
1.7.10.4


